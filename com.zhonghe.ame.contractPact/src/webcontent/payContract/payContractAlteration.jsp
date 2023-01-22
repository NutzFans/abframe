<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>付费合同协议变更 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 97%;">
		<legend>付费合同信息</legend>
		<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden"/>
				<input class="nui-hidden" name="id"/>
			<input name="relateCont" id="relateCont" class="nui-hidden"/>
			<input name="contractType" id="contractType" class="nui-hidden"/>
			<input name="endTime" id="endTime" class="nui-hidden" />
			<input name="purchasePlan" id="purchasePlan" class="nui-hidden" />
			<input name="contractSubject" id="contractSubject" class="nui-hidden" />
			<div style="padding: 5px;">
				<table style="table-layout: fixed;">
					<tr>
						<td class="form_label" align="right">申请人</td>
							<td><input name="createUserid" id="createUserid"
								class="nui-hidden" style="width: 200px" /> <input
								id="createUsername" name="createUsername" class="nui-textbox"
								enabled="false" style="width: 200px" required="true" /></td>
							<td align="right" >合同实施部门：</td>
							<td style="width: 20%;"><input name="implementOrg"
								id="implementOrg" class="nui-combobox" valueField="orgid"
								textField="orgname" style="width: 200px" shownullitem="false"
								allowinput="true" required="true" enabled="false" /> <input
								name="implementOrgname" id="implementOrgname" class="nui-hidden"
								readonly="readonly" /></td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td><input id="createTime" name="createTime" enabled="false"
								class="nui-textbox" style="width: 200px" /></td>	
					</tr>
					<tr>
						<td align="right" style="width: 130px">合同编号：</td>
						<td><input id="originalContractNo" enabled="false"
							class="nui-textbox" style="width: 200px" required="true" /></td>
						<td align="right" style="width: 130px">合同名称：</td>
							<td><input id="originalContractName" name="originalContractName"  enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
						<td align="right" style="width: 130px">补充协议名称：</td>
							<td><input id="contractName" name="contractName"  class="nui-textbox" style="width: 200px" required="true"/></td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">合同金额(元)：</td>
							<td><input id="contractSum" name="contractSum" class="nui-textbox"  style="width: 200px" required="true" enabled="false"/></td>
						<td align="right" style="width: 130px">本次增加金额(元)(减少用负数表示)：</td>
							<td><input id="increaseDecreaseSum" name="increaseDecreaseSum" class="nui-textbox" style="width: 200px" required="true" onvaluechanged="onvaluechanged"/></td>
						<td align="right" style="width: 120px">合同最终金额(元):</td>
							<td><input name="finalSum" id="finalSum"
								class="nui-textbox" vtype="float" style="width: 100%"
								required="true" enabled="false" /></td>
					</tr>
				</table>	
			</div>	
		</form>
	</fieldset>
	<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
			<legend>未来年度付款计划</legend>
			<div style="width: 95%;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;"><a class="nui-button"
								iconCls="icon-add" onclick="addRow()" plain="true">增加</a> <a
								class="nui-button" iconCls="icon-remove" onclick="removeRow()"
								plain="true">删除</a> <span class="separator" style="color: red">(总计应与合同金额一致)</span></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="datagrid2" class="nui-datagrid"
				style="width: 100%; height: 200px;" allowResize="true" showSummaryRow="true" datafield="data"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" allowSortColumn = "false"
				showPager="false">
				<div property="columns">
					<div field="years" width="80" headerAlign="center"
						allowSort="true">
						年份<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jan" width="80" headerAlign="center"
						allowSort="true">
						一月<input property="editor" class="nui-textbox" id = "jan"
							style="width: 100%;" />
					</div>
					<div field="feb" width="80" headerAlign="center"
						allowSort="true" >
						二月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="mar" width="80" headerAlign="center"
						allowSort="true">
						三月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="apr" width="80" headerAlign="center"
						allowSort="true">
						四月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="may" width="80" headerAlign="center"
						allowSort="true">
						五月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jun" width="80" headerAlign="center"
						allowSort="true">
						六月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jul" width="80" headerAlign="center"
						allowSort="true">
						七月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="aug" width="80" headerAlign="center"
						allowSort="true">
						八月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="sep" width="80" headerAlign="center"
						allowSort="true">
						九月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="oct" width="80" headerAlign="center"
						allowSort="true">
						十月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="nov" width="80" headerAlign="center"
						allowSort="true">
						十一月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="dec" width="80" headerAlign="center"
						allowSort="true">
						十二月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="sum" width="120" headerAlign="center"
						allowSort="true" summaryType="sum">
						总计<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					
				</div>
			</div>
		</fieldset>
	<jsp:include page="/ame_common/inputFile.jsp"/>
</div>
	<div style="text-align: center;padding: 8px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save"  style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close"  style="width: 80px;margin-right:0px;">关闭</a>
	</div>
<%-- 	<%@include file="/contractPact/common/userLookup1.jsp"%> --%>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		var type ;//暂存还是发起
		function init(){
		  	nui.get("createUserid").setValue(userId);
		  	nui.get("createUsername").setValue(userName);
		  /* 	nui.get("implementOrg").setValue(userOrgId);
		  	nui.get("implementOrgname").setValue(userOrgName); */
			nui.get("createTime").setValue(new Date());
			
			//初始化审核意见
			nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
			document.getElementById("salesEdit").style.display="none";
        }
    	function onOk(e){
    		type=e;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
			if(form.isValid()==false){
				nui.alert("请检查必填项");
				return;
			}
			var data = form.getData();
		  	document.getElementById("fileCatalog").value="feameAgreementinfo";
  			 var filePaths = document.getElementsByName("uploadfile").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList")[j].value;
		      if(a==null||a==""){
		       alert("新增附件不可以为空");
		       return;
		      }
		     }
			form2.submit();
	    }
	    
        function getOrgs(){
			var a2=[];
		  	for(var p in orglist){
		  		a2[p] = orglist[p];
		  	}
		  	clog(a2)
		  	nui.get("implementOrg").setData(a2);
        }
	    
    	function SaveData(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			var info="";
			data.type = type;
			if(type==1){
				info="是否提交？"
			}else{
				info="是否暂时保存？"
			}
			data.files = nui.get("fileids").getValue();
			var grid2 = nui.get("datagrid2");
			var payPlans = grid2.getData();
			var json = nui.encode({'cpData':data,"payPlans" : payPlans});
			if(!confirm(info)){
				nui.get("saveReimb").enable();
       		 	nui.get("creatReimbProcess").enable();
				return;
			}else{
				ajaxCommon({
					"url": "com.zhonghe.ame.payContract.payContract.addAlterationInfo.biz.ext",
					"data": json,
					"success": function(data) {
						 if(data.result == "1"){
	                     	if(type==1){		                     
								showTips("补充协议提交成功")
	           				 	closeOk();	               		
			                }else{
			                	showTips("补充协议暂时保存成功")
		               		 	closeOk();
		               	    }
						}else{
							showTips("提交失败")
							nui.get("saveReimb").enable();
	               		 	nui.get("creatReimbProcess").enable();
						}
					}
				});	
            }
    	}
    	
    	
    	function getNowFormatDate() {
		        var date = new Date();
		        var seperator1 = "-";
		        var year = date.getFullYear();
		        var month = date.getMonth() + 1;
		        var strDate = date.getDate();
		        if (month >= 1 && month <= 9) {
		            month = "0" + month;
		        }
		        if (strDate >= 0 && strDate <= 9) {
		            strDate = "0" + strDate;
		        }
		        var currentdate = year + seperator1 + month + seperator1 + strDate;
		        nui.get("createTime").setValue(currentdate);
		    }
		
		function setEditData(data){
			clog(data)
			// getOrgs();
			var form = new nui.Form("form1");
			form.setData(data);
			getNowFormatDate();
			nui.get("implementOrg").setText(data.implementOrgname);
		/* 	nui.get("userLookup_multiple1").setText(data.zDeptCountersignName); */
			if(null != data.contractName){
				nui.get("originalContractName").setValue(data.contractName);
			}
			if(null != data.contractNo){
				nui.get("originalContractNo").setValue(data.contractNo);
			}
			if(null != data.id){
				nui.get("relateCont").setValue(data.id);
			}
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"PAY_CONTRACT","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
		}
		
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        
        function onFgshqbm(e){
        	nui.get("fDeptCountersignName").setValue(e.source.text)
        	clog(e.source.text)
        }
        
        function onZbhqbm(e){
        	nui.get("zDeptCountersignName").setValue(e.source.text)
        }
        
        
		//多选lookup返回选中行，用户可以根据需要设置相关自定义值
		function userSetDataMultiple(rows) {
			//nui.get("fDeptCountersignName").setValue(nui.get("userLookup_multiple").getText());
		}
		function addRow() {
			var newRow = {
				name : "New Row"
			};
			var jan = 0;
			var feb = 0;
			var mar = 0;
			var apr = 0;
			var may = 0;
			var jun = 0;
			var jul = 0;
			var aug = 0;
			var sep = 0;
			var oct = 0;
			var nov = 0;
			var dec = 0;
			var sum = 0;
			newRow = {jan:jan,feb:feb,mar:mar,apr:apr,may:may,jun:jun,jul:jul,aug:aug,sep:sep,oct:oct,nov:nov,dec:dec,sum:sum};
	  		var l = grid2.getData().length;
			grid2.addRow(newRow, l+1);
		}
		function removeRow() {
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, true);
			}
		}
		grid2.on("cellendedit",function(e){
			var row = e.row;
			var jan = row.jan*1;
			var feb = row.feb*1;
			var mar = row.mar*1;
			var apr = row.apr*1;
			var may = row.may*1;
			var jun = row.jun*1;
			var jul = row.jul*1;
			var aug = row.aug*1;
			var sep = row.sep*1;
			var oct = row.oct*1;
			var nov = row.nov*1;
			var dec = row.dec*1;
			var sum = jan + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec;
			grid2.updateRow(row,{sum:sum});
			console.log(row);
		});
		grid2.on("cellbeginedit",function(e){
			if(e.field=="sum"){
				e.cancel="true";
			}
			console.log(e);
		});
		
		
		function onvaluechanged() {
			var contractSum = nui.get("contractSum").getValue() *1;
			var increaseDecreaseSum = nui.get("increaseDecreaseSum").getValue() *1 ;
			var finalSum = contractSum + increaseDecreaseSum;
			nui.get("finalSum").setValue(finalSum);
		}
	</script></body>
</html>
