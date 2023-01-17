<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:40:07
  - Description:
-->
<head>
<title>机构查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	机构查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="ctOrg._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap">机构代码：</td>
			 	<td >
			 		<input class="nui-textbox" name="ctOrg._expr[0]._value" style="width: 70px;"onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[0]._property" value="orgcode"/>
                    <input class="nui-hidden" name="ctOrg._expr[0]._op" value="like"/>
			    </td>
				<td align="right" >机构层级：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrg._expr[4]._value" style="width: 70px;"  onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[4]._property" value="orglevel"/>
                    <input class="nui-hidden" name="ctOrg._expr[4]._op" value="="/>
				</td>
				<td align="right" >机构名称：</td>
            	<td align="left">
				    <input class="nui-textbox" name="ctOrg._expr[1]._value" style="width: 70px;" dictTypeId="ABF_APPTYPE" id="dyassetnum1" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[1]._property" value="orgname"/>
                    <input class="nui-hidden" name="ctOrg._expr[1]._op" value="like"/>
				</td>
				<td align="right" >机构类型：</td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="ctOrg._expr[2]._value" style="width: 70px;" dictTypeId="ABF_ORGTYPE" showNullItem="true" nullItemText="全部" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[2]._property" value="orgtype"/>
                    <input class="nui-hidden" name="ctOrg._expr[2]._op" value="="/>
				</td>
				<td align="right" >机构状态：</td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="ctOrg._expr[3]._value" shownullItem="true" nullItemText="全部"  style="width: 70px;" dictTypeId="ABF_ORGSTATUS" onenter="onKeyEnter" id="dyassetnum1"/>
		 		 	<input class="nui-hidden" name="ctOrg._expr[3]._property" value="status"/>
                    <input class="nui-hidden" name="ctOrg._expr[3]._op" value="="/>
				</td>
    		</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div style="width:100%;">

</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;"
    dataField="oaOrg" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.organization.OrgManager.queryOrgByCriteria.biz.ext' onrowclick="jumpA" onrowdblclick="jumpB">
    <div property="columns">
        <div field="orgcode" width="50" headerAlign="center" align="center">机构代码</div>
        <div field="orglevel" width="50" headerAlign="center" align="center" >机构层级</div>     
    	<div field="orgname" width="100" headerAlign="center" align="center" >机构名称</div>     
        <div field="orgtype" width="70" headerAlign="center" align="center" renderer="orgtype">机构类型</div>
        <div field="status" width="50" headerAlign="center"  align="center" renderer="status">机构状态</div> 
         <div field="orgdegree" width="50" headerAlign="center" align="center" renderer="orgdegree">机构等级</div> 
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	var appid = '<%=request.getParameter("appid") %>';
	search();
	//查询功能列表
	function search(){
		var form = new nui.Form("#form1");
        var data = form.getData();
		grid.load(data);
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApps.jsp?status=0&appid="+appid;
        nui.open({
            url: addUrl,
            title: "新增功能组", 
            width:400,
            height:200,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//点击该行，树节点展开
	function jumpA(e){
		if(e.row.status != "cancel"){
			top["win"].returnMsg2(e);
		}
	}
	
	function jumpB(e){
		if(e.row.status != "cancel"){
			top["win"].returnMsgB2(e);
		}else{
			nui.alert("该机构已经注销，无法查看该机构信息。");
		}
	}
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
        var data = form.getData();
		grid.load(data);
	}
	
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
	//结构类型
	function orgtype(e){
		return nui.getDictText('ABF_ORGTYPE',e.value);
	}
	//机构状态
	function status(e){
		return nui.getDictText('ABF_ORGSTATUS',e.value);
	}
	
	//机构等级
	function orgdegree(e){
		return nui.getDictText('ABF_ORGDEGREE',e.value);
	}
	
	
</script>
</html>