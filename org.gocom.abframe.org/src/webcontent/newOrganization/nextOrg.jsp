<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-30 14:40:39
  - Description:
-->
<head>
<title>下级机构</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	下级机构列表
                    </td>
                </tr>
             </table>           
        </div>
    </div>
</div>
<div style="width:100%;">
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:10%;">
                    <a class="nui-button" iconCls="icon-add" onclick="insert()">新增</a>
                    <a class="nui-button" iconCls="icon-edit" onclick="edit()">修改</a>
                    <a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>   
                </td>
            </tr>
        </table>           
    </div>
</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;"
    dataField="oaOrg" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.organization.OrgManager.queryOrgByCriteria.biz.ext',>
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="orgname" width="130" headerAlign="center" allowSort="true" align="center">机构名称</div>
    	<div field="orgcode" width="75" headerAlign="center" align="center" allowSort="true">机构代码</div>     
        <div field="orgtype" width="100" headerAlign="center" align="center"  renderer="orgtype">机构类型</div>
        <div field="status" width="50" headerAlign="center" allowSort="true" align="center" renderer="status">机构状态</div> 
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	var orgid = '<%=request.getParameter("orgid") %>';
	search();
	//查询功能列表
	function search(){
	
		var json = {ctOrg:{_entity:"org.gocom.abframe.dataset.organization.OmOrganization",_expr:{
			_value: orgid, _property: "omOrganization.orgid", _op: "="
		}}};
		grid.load(json);
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/thisOrg.jsp?orgid="+orgid+"&status=0";
        nui.open({
            url: addUrl,
            title: "新增下级机构", 
            width:800,
            height:500,
            onload: function () {
        		<%--var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);--%>
            },
            ondestroy: function (action) {
            	if (action == "save") {
            		nui.alert("新增成功。");
                	search();
	            }
            }
        });
	}
	//修改
	function edit(){
		var orgInfo = grid.getSelecteds();
		if(orgInfo.length!=1){
			nui.alert("请选中所要修改的机构。");
			return;
		}
		var o = orgInfo[0].orgid;
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/thisOrg.jsp?orgid="+orgid+"&status=1&o="+o;
        nui.open({
            url: addUrl,
            title: "修改下级机构", 
            width:800,
            height:500,
            onload: function () {
            	
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	nui.alert("修改成功。");
                	search();
	            }
            }
        });
	}
	
	//删除
	function remove(){
		var oaRmvOrg = grid.getSelecteds();
		if(oaRmvOrg.length<1){
			nui.alert("请选中所要删除的机构。");
			return;
		}
		nui.confirm("确定删除该机构？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = {oaRmvOrg:oaRmvOrg};
					nui.ajax({
						url:'org.gocom.abframe.org.organization.OrgManager.removeOrgs.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.iRtn=="0"){
								nui.alert("删除成功。");
								search();
							}else{
								nui.alert("删除失败。")
								search();
							}
						},
					})
                } else {
                    return;
                }
            }
        );
	}
	
	//是否叶子节点
	function orgtype(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	//应用类型
	function status(e){
		return nui.getDictText('ABF_ORGSTATUS',e.value);
	}
	
	
	
	
</script>
</html>