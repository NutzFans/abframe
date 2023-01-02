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
<title>人员信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	人员信息列表
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
    dataField="oaOrgEmpQry" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.employee.EmpManager.queryOrgEmpByCriteria.biz.ext',>
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="empcode" width="40" headerAlign="center" allowSort="true" align="center">工号</div>
    	<div field="userid" width="40" headerAlign="center" align="center" allowSort="true">登录名</div>     
        <div field="empname" width="70" headerAlign="center" align="center">人员姓名</div>
        <div field="gender" width="50" headerAlign="center" allowSort="true" align="center" renderer="gender">性别</div>
        <div field="empstatus" width="50" headerAlign="center" allowSort="true" align="center" renderer="empstatus">人员状态</div> 
        <div field="indate" width="70" headerAlign="center" allowSort="true" align="center"  >入职日期</div> 
        <div field="outdate" width="70" headerAlign="center" allowSort="true" align="center" >离职日期</div> 
        <div field="status" width="50" headerAlign="center" allowSort="true" align="center" renderer="status" >操作员状态</div> 
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
		var json =  {ctOrgEmpQry:{_entity:"org.gocom.abframe.dataset.organization.OmOrgEmpOprQuery",_expr:{
			inorgid: orgid
		}}};
		grid.load(json);
		grid.sortBy("empname","asc");
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp?orgid="+orgid+"&empid=";
        nui.open({
            url: addUrl,
            title: "新增人员信息", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//修改
	function　edit(){
		var peopleInfo = grid.getSelecteds();
		if(peopleInfo.length!=1){
			nui.alert("请选中所要修改的人员进行操作。");
			return;
		}
		var empid = peopleInfo[0].empid;
		var addUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/addOrgPerson_zh.jsp?orgid="+orgid+"&empid="+empid;
        nui.open({
            url: addUrl,
            title: "修改人员信息", 
            width:800,
            height:500,
            onload: function () {
        		//var iframe = this.getIFrameEl();
             	//iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "edit") {
                	search();
	            }
            }
        });
	}
	
	//删除
	function remove(){
		var oaOrgEmpQry = grid.getSelecteds();
		if(oaOrgEmpQry.length<1){
			nui.alert("请选中所要删除的人员。");
			return;
		}
		nui.confirm("确定删除该人员？", "确定？",
            function (action) {
                if (action == "ok") {
                	for(var i = 0 ; i < oaOrgEmpQry.length ; i++){
                		oaOrgEmpQry[i].orgid = oaOrgEmpQry[i].inorgid;
                	}
                    var json = {oaOrgEmpQry:oaOrgEmpQry};
					nui.ajax({
						url:'org.gocom.abframe.org.employee.EmpManager.removeEmpOprOrg.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.iRtn){
								nui.alert("删除成功。");
								search();
							}else{
								nui.alert("删除失败，请联系信息技术部。")
							}
						},
					})
                } else {
                    return;
                }
            }
        );
	}
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	//人员状态
	function empstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	
	//操作员状态
	function status(e){
		return nui.getDictText('ABF_OPERSTATUS',e.value);
	}
	
	
	
</script>
</html>