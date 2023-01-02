<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-12-15 10:30:30
  - Description:
-->
<head>
	<title>资产采购申请流程查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	</style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="资产采购申请查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
		    	    <tr>
		    	    	<td align="right"><span>资产父类型：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[1].type" dictTypeId="MIS_MA_TYPE" multiSelect="true" onvaluechanged="onTypeFilterChanged"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					    </td>
					    <td align="right"><span>资产原值：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[2]._min" width="80px"/>-<input class="nui-textbox" name="criteria._expr[2]._max" width="80px"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="price"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
					    </td>
					    <td align="right"><span>负责人：</span></td>
		            	<td align="left">
					        <input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="fzr"/>
		            		<input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="usingemp"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="in" id="tempcond31"/>
					        <input class="nui-hidden" name="criteria._or[0]._expr[1]._ref" value="3" id="tempcond32"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="userid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="empname">
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
						    <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="applyemp"/>
						    <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in"  id="tempcond33"/>
						    <input class="nui-hidden" name="criteria._or[0]._expr[0]._ref" value="3"  id="tempcond34"/>
					    </td>
					    <td align="right"><span>所属部门：</span></td>
		            	<td align="left">
					        <input class="nui-combobox" name="criteria._ref[0]._expr[0]._value" id="ssbm"
					               textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="dept"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._expr[4]._ref" value="2" id="tempcond22"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._property" value="dept"/> 
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[5]._value" id="orgids"/>
					    </td>
		      		</tr>
		      		<tr>
		      			<td align="right"><span>资产子类型：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[6].sectype" dictTypeId="MIS_MA_SECTYPE" multiSelect="true" id="sectype"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
					    </td>
					    <td align="right"><span>管理方式：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[7]._value" dictTypeId="MIS_MA_STORAGE" multiSelect="true" width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="storagetype"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
					    </td>
					    <td align="right"><span>流程状态：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[8]._value" dictTypeId="MIS_MACHINEAPPLY_STATE" multiSelect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="state"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
					    </td>
					    <td align="right"><span>区域：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" name="criteria._expr[9]._value" showNullItem="true" dictTypeId="EXP_REGION" width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="area"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
					    </td>
		      		</tr>
		      		<tr>
					    <td align="right"><span>资产编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[10]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[10]._property" value="assetnum"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>资产申请ID：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[11].id"  width="165px"/>
					    </td>
				    	<td align="right"><span>项目编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[12].projectno"/>
					        <input class="nui-hidden" name="criteria._expr[12]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[12]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>项目名称：</span></td>
		            	<td align="left">
					        <input class="nui-textbox" name="criteria._ref[2]._expr[0]._value" id="projectno"   width="165px"/>
		            		<input class="nui-hidden" name="criteria._expr[13]._property" value="projectno"/>
					        <input class="nui-hidden" name="criteria._expr[13]._op" value="in" id="tempcond35"/>
					        <input class="nui-hidden" name="criteria._expr[13]._ref" value="4" id="tempcond36"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="4"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="projectno"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="projectName">
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="like" >
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._likeRule" value="all">
					    </td>	
		      		</tr>
				  	<tr>
				        <td colspan="8" align="center">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
				    </tr>
	  			</table>
		  	</div>
		</div>
		<div style="width:100%;">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		        	<tr>
		                <td style="width:20%;">
				            <a class="nui-button" id="checkview" iconCls="icon-download" onclick="checkview()">发起资产采购申请</a>
				        </td>
		            </tr>
		        </table>           
		    </div>
	        <div id="datagrid1" dataField="machinedata" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="3" style="width:100%;height:340px;" showSummaryRow="true" allowCellWrap="true"
		    	url="com.primeton.eos.machine.machineProcess.queryMachineApply.biz.ext" idField="id" allowResize="true"
		    	sizeList="[10,15,20,30,50,100,200,500]" pageSize="10"  ondrawsummarycell="doCountNowPage" allowAlternating="true" multiSelect="true">
			    <div property="columns">
		        	<div field="id" width="80" headerAlign="center" align="center" renderer="getdetail">资产申请ID</div>
		        	<div field="assetnum" width="150" headerAlign="center" renderer="onActionRenderer" allowSort="true">资产编号</div>
		        	<div field="price" width="100" headerAlign="center" align="right" dataType="currency" currencyUnit="￥" allowSort="true" summaryType="sum">价格(元)</div>
		        	<div field="num" width="60" headerAlign="center" align="right" summaryType="sum">购买数量</div>
		        	<div field="type"width="80" renderer="dictType" headerAlign="center" allowSort="true">资产父类型</div>
		        	<div field="sectype"width="80" renderer="dictSecType" headerAlign="center" allowSort="true">资产子类型</div>
		        	<div field="state"width="60" renderer="dictStatus" headerAlign="center" allowSort="true">流程状态</div>
		        	<div field="area" renderer="dictArea" width="50" headerAlign="center" allowSort="true">区域</div>
		        	<div field="storagetype"width="50" renderer="dictStorageType" headerAlign="center" allowSort="true">管理类型</div>
		        	<div field="applyemp"width="60" headerAlign="center">申请人</div>
		        	<div field="emp"width="60" headerAlign="center">负责人</div>
		        	<div field="deptname" width="120" headerAlign="center">所属部门</div>
		        	<div field="projectno" width="100" headerAlign="center">所属项目编号</div>
		        	<div field="projectName" renderer="getProjectNameDetail" width="100" headerAlign="center">项目名称</div>
		        	<div field="configuration"width="300" headerAlign="center" allowSort="true">配置</div>
			    </div>
			</div>
		</div>	
	</div>
</div>
</body>
<script type="text/javascript">
	var form = new nui.Form("#form1");
	nui.parse();
	var grid=nui.get("datagrid1");
	init();
	
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"queryMachineApply","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("fzr").setValue('<%=nowusername %>');
						nui.get("fzr").setReadOnly(true);
					}
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
					
					}else{
						nui.get("orgids").setValue(text.orgids);
					}
					nui.get("ssbm").setData(text.orgs);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("fzr").setValue('<%=nowusername %>');
						nui.get("fzr").setReadOnly(true);
				}
				search();
			}
		});	
	}
	
	function search(){
		if(nui.get("ssbm").getValue()==""){
			nui.get("tempcond21").setValue("=");
			nui.get("tempcond22").setValue("");
		} else {
			nui.get("tempcond21").setValue("in");
			nui.get("tempcond22").setValue("2");
		}
		if(nui.get("fzr").getValue()==""){
			nui.get("tempcond31").setValue("=");
			nui.get("tempcond32").setValue("");
			nui.get("tempcond33").setValue("=");
			nui.get("tempcond34").setValue("");
		}else{
			nui.get("tempcond31").setValue("in");
			nui.get("tempcond32").setValue("3");
			nui.get("tempcond33").setValue("in");
			nui.get("tempcond34").setValue("3");
		}
		if(nui.get("projectno").getValue()==""){
			nui.get("tempcond35").setValue("=");
			nui.get("tempcond36").setValue("");
		} else {
			nui.get("tempcond35").setValue("in");
			nui.get("tempcond36").setValue("4");
		}
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.sortBy("id","desc");
        grid.load(data);
	}
	
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		init();
	}
	
	//对该页的总金额做合计
    function doCountNowPage(e){        	
        //客户端汇总计算
        if (e.field == "price" || e.field == "num") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
	
	function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	
	function dictSecType(e){
		return nui.getDictText("MIS_MA_SECTYPE",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	
	function getdetail(e){
		return "<a href='javascript:void(0)' onclick='detailView();' title='点击查看'>" +e.value + "</a>";
	}
	function detailView(){
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条资产申请数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/machine/machineProcess/machineDetail.jsp?processInstID=" + selectRow.processinstid+"&&stat=1";
		window.open(executeUrl);
	}
	
	function dictStatus(e){
		return "<a  href='javascript:void(0)' onclick='feeView();' title='查看流程'>" + nui.getDictText("MIS_MACHINEAPPLY_STATE",e.value) + "</a>";
	}
	
	function feeView(){
        var selectRow = grid.getSelected();
        var processInstID=selectRow.processinstid;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
		var title = "流程图查看";
		var width=1000;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
    }
    function onActionRenderer(e){
    	var row = e.value;
    	var url="";
    	if(row){
	    	var assetnums = row.split(",");
	    	if(assetnums.length>0){
	    		for(var i=0;i<assetnums.length;i++){
	    		    if(i==assetnums.length-1){
	    		    	url=url+"<a href='javascript:void(0)' onclick='doView(" + JSON.stringify(assetnums[i])+ ")'>"+assetnums[i]+"</a>"
	    		    }else{
	    				url=url+"<a href='javascript:void(0)' onclick='doView(" + JSON.stringify(assetnums[i]) + ")'>"+assetnums[i]+"</a>"+","
	    			}
	    		}
	    	}
    	}
    	return url;
    }
    function doView(e){
		var executeUrl = "/default/machine/machineDetail.jsp?assetnum=" + e;
		window.open(executeUrl, "机器详细信息", "fullscreen=1");
    }
    
	function getProjectNameDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkProjectName(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
		window.open(executeUrl);
    }
    function checkview(){
		nui.open({
			url: "<%=request.getContextPath() %>/machine/machineProcess/createMachineApply.jsp",
			width: 900,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			}
		})
	}
    
</script>
</html>