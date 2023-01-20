<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-21 17:51:37
  - Description:
-->
<head>
<title>待签署合同查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="待签署合同查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
		    	    <tr>
		    	    	<td class="form_label" align="right">合同类型：</td>
			          	<td colspan="1">
				           	<input class="nui-dictcombobox" name="criteria._expr[0]._value" dictTypeId="MIS_CONTRACTTYPE" multiSelect="true" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._property" value="contracttype"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
			          	</td>
			          	<td class="form_label" align="right">项目名称：</td>
		         	 	<td colspan="1">
				            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:200px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          	</td>
			          	<td class = "form_label" align="right">项目编号：</td>
				      	<td colspan="1">
						 	<input class="nui-textbox" name="criteria._expr[2]._value" style="width:150px"/>
						 	<input class="nui-hidden" name="criteria._expr[2]._property" value="projectno"/>
						 	<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					  	</td>
					  	<td class = "form_label" align="right">合同金额：</td>
				      	<td colspan="1">
						 	<input class="nui-textbox" name="criteria._expr[3]._min" style="width:98px"/>-<input class="nui-textbox" name="criteria._expr[3]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="contsum"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					  	</td>
		      		</tr>
			        <tr>
			        	<td class="form_label" align="right">销售姓名：</td>
			            <td colspan="1" align="left">
				            <input name="criteria._expr[4]._value" class="nui-textbox" id="salename" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="salename" />
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
			          	</td>
			          	<td class="form_label" align="right">签署单位：</td>
			           	<td colspan="1">
			          		<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="custname" style="width: 200px;"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._property" value="misCustinfo.custid"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="in" id="tempCond51"/>
					        <input class="nui-hidden" name="criteria._expr[5]._ref" value="5" id="tempCond52"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="5"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.MisCustinfo"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="custid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="custname"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
			            </td>
			          	<td class="form_label" align="right">所属事业部：</td>
			           	<td colspan="1">
			          		<input class="nui-dictcombobox" id="org" name="criteria._expr[6]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="org"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
			         	</td>
			         	<td class="form_label" align="right">客户类型：</td>
			          	<td colspan="1">
							<input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="CS_SIGNTARGET" style="width:200px;" showNullItem="true" multiSelect="true" />
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="signtarget"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
			            </td>
				  	</tr>
				  	<tr>
				  		<td class="form_label" align="right">合同号：</td>
			          	<td colspan="1">
							<input name="criteria._expr[11]._value" class="nui-textbox"  style="width:150px;"  />
						    <input class="nui-hidden" name="criteria._expr[11]._property" value="contid"/>
						    <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
			            </td>
			            <td align="right"><span>产品名称：</span></td>
		            	<td colspan="1">
					        <input url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" id = "prodname" style="width:200px;" class="nui-treeselect" name="criteria._ref[1]._expr[0]._value"
                    		textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true" multiSelect="true" expandOnLoad="true" showFolderCheckBox="false" allowInput="true"/>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="in" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._expr[9]._ref" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.mis.contract.contractApproval.AmeCsContractProduct"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="prodname"/>
					    </td>
					    <td class="form_label" align="right">审批状态：</td>
			          	<td colspan="1">
							<input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="AME_CONTRACTSTATUS" style="width:150px;" showNullItem="true" multiSelect="true" />
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
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
	                    <td style="width:100%;">
	                    	<a class="nui-button" onclick="updateAmeContract" iconCls="icon-edit" id="queryContractFlow_editButton">编辑</a>
	                    	<a class="nui-button" onclick="saveAmeContract" iconCls="icon-jcs" id="queryContractFlow_saveAmeContract">合同编号及存档</a>
	                        <a class="nui-button" onclick="exportCsReves" iconCls="icon-download" id="queryContractFlow_exportButton">导出Excel</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
	        <div id="datagrid1" dataField="ameContracts" class="nui-datagrid" style="width:100%;height:auto;" showSummaryRow="true" allowCellWrap="true"
		    	url="com.primeton.mis.contract.decontract.queryDeCsContractNew.biz.ext" idField="id" allowResize="true"  ondrawsummarycell="doCountNowPage"
		    	sizeList="[10,15,20,30,50,100,200,500,1000,5000,10000]" pageSize="15" allowAlternating="true" multiSelect="true">
			    <div property="columns">
			    	<div type="checkcolumn"></div>
			    	<div field="insertdate"  width="100" headerAlign="center" allowSort="true" align="center">审批日期</div>
			        <div field="contracttype" renderer="dictContapptype" width="100" headerAlign="center" allowSort="true" align="center">合同类型</div>
			        <div field="contid"  width="120" headerAlign="center" allowSort="true" align="center">合同号</div>
			        <div field="misCustinfo.custname" width="200"  headerAlign="center" allowSort="true" align="left">签署单位</div>
			        <div field="projectname" width="200" headerAlign="center" align="left">项目名称</div>
			        <div field="contnum" width="73" headerAlign="center" allowSort="true" align="center">合同编号</div>
			        <div field="salename" width="50" headerAlign="center" allowSort="true" align="center">销售姓名</div>
			        <div field="org" renderer="onGenderRenderer" width="120" headerAlign="center" allowSort="true" align="center">所属事业部</div>
			        <div field="status" renderer="onGender2Renderer" width="60" headerAlign="center" allowSort="true" align="center">审批状态</div>
			        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="90" headerAlign="center" allowSort="true">合同金额（元）</div>
			        <div field="servsubmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">采购1（元）</div>
			        <div field="remark" align="left"width="150" headerAlign="center" allowSort="true">备注</div>
			    </div>
			</div>
		</div>	
	</div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var isCommerce = false;//是否商务
	    <l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "commerce"){
				isCommerce = true;
			}
		</l:iterate>
		/*  if(isCommerce == false){//非商务，不能增删改
			document.getElementById("exportButton1").style.display="none";
			document.getElementById("saveAmeContract").style.display="none";
		}  */
		
    	init();
    	function init(){
    		if(nui.get("prodname").getValue() == "" ){
        		nui.get("tempCond1").setValue("=");
        		nui.get("tempCond2").setValue("");
        	}else{
        		nui.get("tempCond1").setValue("in");
        		nui.get("tempCond2").setValue("1");
        	}
        	if(nui.get("custname").getValue() == ""){
        		nui.get("tempCond51").setValue("=");
        		nui.get("tempCond52").setValue("");
        	}else{
        		nui.get("tempCond51").setValue("in");
        		nui.get("tempCond52").setValue("5");
        	}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
    		grid.sortBy("contractid", "desc");
    		
	    	 //按钮权限的控制
	    	getOpeatorButtonAuth("queryContractFlow_saveAmeContract,queryContractFlow_editButton,queryContractFlow_exportButton");//操作按钮权限初始化
		
		}
		
		
		//对该页的总金额做合计
        function doCountNowPage(e){        	
            //客户端汇总计算
            if (e.field == "contsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "servsubmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		
		function dictContapptype(e){
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + nui.getDictText('MIS_CONTRACTTYPE',e.value) + "</a>";
		}
		
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条合同数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/contract/contractApproval/newCsContractDetail.jsp?processInstID=" + selectRow.processinstid+"&&stat=1";
			window.open(executeUrl);
		}
		
		function onGender2Renderer(e){
			return "<a  href='javascript:void(0)' onclick='feeView();' title='查看流程'>" + nui.getDictText('AME_CONTRACTSTATUS',e.value) + "</a>";
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
	
		function onGenderRenderer(e) {
            return nui.getDictText('CONT_ORG',e.value);
        }
        
		function search() {
			if(nui.get("prodname").getValue() == "" ){
        		nui.get("tempCond1").setValue("=");
        		nui.get("tempCond2").setValue("");
        	}else{
        		nui.get("tempCond1").setValue("in");
        		nui.get("tempCond2").setValue("1");
        	}
        	if(nui.get("custname").getValue() == ""){
        		nui.get("tempCond51").setValue("=");
        		nui.get("tempCond52").setValue("");
        	}else{
        		nui.get("tempCond51").setValue("in");
        		nui.get("tempCond52").setValue("5");
        	}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		function onOk(){
			search();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function updateAmeContract(){
			var rows = grid.getSelecteds();
        	if (rows.length > 1) {
        		alert("只能选中一条记录进行编辑");
        	}else{
	            var row = grid.getSelected();
	            if (row) {
	            	var processInstID = row.processinstid;
	                nui.open({
	                    url: "<%=request.getContextPath() %>/contract/contractApproval/contractFlowModfiy.jsp?processInstID=" + processInstID,
	                    title: "编辑待签署合同", width: 1100, height: 495,
	                    ondestroy: function (action) {
	                    	if(action == "ok"){
		                        grid.reload();
	                    	}
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
            }
		}
		function saveAmeContract(){
			var rows = grid.getSelecteds();
			if (rows.length > 1) {
        		alert("只能选中一条记录进行编辑");
        	}else{
        		var row = grid.getSelected();
        		if(row){
        			if(row.status == "5"){
        				var processInstID = row.processinstid;
		                nui.open({
		                    url: "<%=request.getContextPath() %>/contract/contractApproval/saveContractApprProcess.jsp?processInstID=" + processInstID+"&&stat=1",
		                    title: "合同编号及存档", width: 1100, height: 495,
		                    ondestroy: function (action) {
		                    	if(action == "ok"){
			                        grid.reload();
		                    	}
		                    }
		                });
        			}else{
        				alert("请选择暂不签署的合同进行操作");
        			}
        		} else {
	                alert("请选中一条记录");
	            }
        	}
		}
		
		function exportCsReves(){
        	nui.confirm("是否确认导出待签署合同记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var json = form.getData();
					nui.ajax({
		    			url: "com.primeton.mis.contract.productReve.importProdReve.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "待签署合同记录";
				        	var myDate = new Date();
				        	var year = myDate.getFullYear();
				        	var month = myDate.getMonth()+1;
				        	var day = myDate.getDate();
				        	var hours = myDate.getHours();
				        	var minutes = myDate.getMinutes();
				        	var seconds = myDate.getSeconds();
				        	var curDateTime = year;
				        	if(month>9){
								curDateTime = curDateTime + "" + month;
							}else{
								curDateTime = curDateTime + "0" + month;
								}
				        	if(day>9){
								curDateTime = curDateTime + day;
							}else{
								curDateTime = curDateTime + "0" + day;
								}
							if(hours>9){
								curDateTime = curDateTime + hours;
							}else{
								curDateTime = curDateTime + "0" + hours;
								}
							if(minutes>9){
								curDateTime = curDateTime + minutes;
							}else{
								curDateTime = curDateTime + "0" + minutes;
								}
							if(seconds>9){
								curDateTime = curDateTime + seconds;
							}else{
								curDateTime = curDateTime + "0" + seconds;
							}
							fileName = fileName + "_" + curDateTime + ".xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				        	alert("error");
				        }
					});
            	}
            });       
        }
</script>
</body>
</html>