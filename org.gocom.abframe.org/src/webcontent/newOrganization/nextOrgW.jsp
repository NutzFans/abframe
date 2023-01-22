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
                       	下级岗位列表
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
    dataField="data" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.tools.CommonUtil.queryEntitiesByCriteriaEntityWithPage.biz.ext',>
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="posiname" width="130" headerAlign="center" allowSort="true" align="center">岗位名称</div>
    	<div field="posicode" width="75" headerAlign="center" align="center" allowSort="true">岗位代码</div>     
        <div field="omOrganization.orgname" width="100" headerAlign="center" align="center"  renderer="orgtype">所属机构</div>
        <div field="omDuty.dutyname" width="50" headerAlign="center" allowSort="true" align="center" renderer="status">所属职务</div> 
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	var orgid = '<%=request.getParameter("orgid") %>';
	var parentorgid = '<%=request.getParameter("parentorgid") %>'
	search();
	//查询功能列表
	function search(){
		var json =  {criteria:{_entity:"org.gocom.abframe.dataset.organization.OmPosition","_expr[0]":{
			"omPosition.positionid":orgid
		},"_expr[1]":{
			"omOrganization.orgid":parentorgid
		}}};
		grid.load(json);
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/orgWinfo.jsp?status=0&positionid="+parentorgid;
        nui.open({
            url: addUrl,
            title: "新增下级岗位", 
            width:750,
            height:280,
            onload: function () {
            	
            },
            ondestroy: function (action) {
            	if (action == "save") {
            		nui.alert("新增成功。")
                	search();
	            }
            }
        });
	}
	
	//修改
	function　edit(){
		var orgWinfo = grid.getSelecteds();
		if(orgWinfo.length!=1){
			nui.alert("请选中所要修改的岗位进行操作。");
			return;
		}
		var positionid = orgWinfo[0].positionid;
		var editUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/orgWinfo.jsp?status=1&positionid="+positionid;
        nui.open({
            url: editUrl,
            title: "修改下级岗位", 
            width:750,
            height:280,
            onload: function () {
            },
            ondestroy: function (action) {
            	if (action == "edit") {
            		nui.alert("修改成功。")
                	search();
	            }
            }
        });
	}
	
	//删除
	function remove(){
		var pos = grid.getSelecteds();
		if(pos.length<1){
			nui.alert("请选中所要删除的岗位。");
			return;
		}
		nui.confirm("确定删除该岗位？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = {pos:pos};
					nui.ajax({
						url:'org.gocom.abframe.org.position.PositionManager.deletePositions.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.retCode){
								nui.alert("删除成功。");
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