<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>收费合同协议变更 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>收费合同信息</legend>
				<form id="form1" method="post">
						<input name="files" id="fileids" class="nui-hidden"/>
						<input class="nui-hidden" name="id"/>
					<input name="relateCont" id="relateCont" class="nui-hidden"/>
					<input name="endTime" id="endTime" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align = "right"> 申请人</td>
								<td colspan="1">
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%"/>
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true"/>
								</td>
								<td align="right" style="width: 110px">合同实施部门:</td>
								<td colspan="1">
									<input name="implementOrg" id="implementOrg" class="nui-combobox" valueField="orgid" textField="orgname" 
									style="width: 100%" shownullitem="false" allowinput="true" required="true" enabled="false"/>
									<input name="implementOrgname" id="implementOrgname" class="nui-hidden">
						     	</td>
						     	<td align="right" style="width:110px">申请日期:</td>
								<td colspan="1">
									<input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">合同编号:</td>
									<td colspan="1"><input id="originalContractNo" name="originalContractNo" enabled="false" class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">合同名称:</td>
								<td colspan="1">
									<input id="originalContractName" name="originalContractName"  class="nui-textbox" style="width: 100%"  enabled="false"/>
								</td>
								<td align="right" style="width: 110px">补充协议名称:</td>
								<td colspan="1">
									<input id="contractName" name="contractName"  class="nui-textbox" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">合同金额(元):</td>
									<td colspan="1"><input id="contractSum" name="contractSum" class="nui-textbox"  style="width: 100%" required="true" enabled="false"/></td>
								<td align="right" style="width: 110px">本次增加金额(元)(减少用负数表示):</td>
									<td colspan="1"><input id="increaseDecreaseSum" name="increaseDecreaseSum" class="nui-textbox"  style="width: 100%" required="true"  onvaluechanged="onvaluechanged"/></td>
								<td align="right" style="width: 110px">合同最终金额(元):</td>
									<td colspan="1"><input id="finContractSum" name="finContractSum" class="nui-textbox"  style="width: 100%" required="true" enabled="false"/></td>
							</tr>
							<tr>
								<td align="right" >补充/变更情况说明:</td>
									<td colspan="7">
										<input id="remark" name="remark"  class="nui-textarea" style="width:100%;height: 50px" required="true"/>
									</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
			<legend>未来年度收款计划</legend>
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
				style="width: 100%; height: 200px;" allowResize="true"
				showSummaryRow="true" allowCellEdit="true" allowCellSelect="true"
				multiSelect="true" allowSortColumn="false" showPager="false">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="years" width="80" headerAlign="center" allowSort="true">
						年份<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jan" width="120" headerAlign="center" allowSort="true">
						一月<input property="editor" class="nui-textbox" id="jan"
							style="width: 100%;" />
					</div>
					<div field="feb" width="120" headerAlign="center" allowSort="true">
						二月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="mar" width="120" headerAlign="center" allowSort="true">
						三月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="apr" width="120" headerAlign="center" allowSort="true">
						四月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="may" width="120" headerAlign="center" allowSort="true">
						五月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jun" width="120" headerAlign="center" allowSort="true">
						六月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jul" width="120" headerAlign="center" allowSort="true">
						七月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="aug" width="120" headerAlign="center" allowSort="true">
						八月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="sep" width="120" headerAlign="center" allowSort="true">
						九月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="oct" width="120" headerAlign="center" allowSort="true">
						十月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="nov" width="120" headerAlign="center" allowSort="true">
						十一月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="dec" width="120" headerAlign="center" allowSort="true">
						十二月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="sum" width="120" headerAlign="center" allowSort="true"
						summaryType="sum">
						总计<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>

				</div>
			</div>
		</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>

		
		</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		 <a class="nui-button" onclick="onOk(0)" id="creatReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 0px;">关闭</a>
	</div>
	<%-- <%@include file="/contractPact/common/userLookup1.jsp"%> --%>
	<script type="text/javascript">
        nui.parse();
		var type ;//暂存还是发起
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
    	function onOk(e){
    		type = e;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			if(type==1){
				form.validate();
    			if(form.isValid()==false){
    				showTips("请检查必填项");
    				return;
    			}
			}
	
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="chargeContractinfo";
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
			  	nui.get("implementOrg").setData(a2);
        }
	    
    	function SaveData(){
				var form = new nui.Form("#form1");
    			var data = form.getData();
    			var info = "";
    			data.type = type;
    			if(type==1){
    				info="是否提交？"
    			}else{
    				info="是否暂时保存？"
    			}
    			data.files = nui.get("fileids").getValue();
    			var chargePlans = grid2.getData();
    			var json = nui.encode({'cpData':data,
				"chargePlans" : chargePlans});
				if(!confirm(info)){
    				nui.get("saveReimb").enable();
           		 	nui.get("creatReimbProcess").enable();
    				return;
        		}else{
		    	ajaxCommon({
		                url: "com.zhonghe.ame.chargeContract.chargeContract.addAlterationInfo.biz.ext",
		                data: json,
		                success: function (text) {
		               		 if(text.result=="1"){
			               		 if(type==1){
				               		 showTips("补充协议提交成功")
				               		 closeOk();
			               		 }else{
			               			 showTips("补充协议暂时保存成功");
			               			  closeOk();
			               		 }
		               		 }else{
		               		 	showTips("提交失败！");
		               		 	nui.get("saveReimb").enable();
		               		 	nui.get("creatReimbProcess").enable();
		               		 }
		                
		                }
		            }); 
		            }
    	}
    	
		
		function setEditData(data){
			form.setData(data)
				nui.get("implementOrg").setText(data.implementOrgname);
				nui.get("originalContractName").setValue(data.contractName);
				nui.get("originalContractNo").setValue(data.contractNo);
				nui.get("fDeptCountersignId").setText(data.fDeptCountersignName);
				nui.get("createUserid").setValue(userId);
		  		nui.get("createUsername").setValue(userName);
		  		nui.get("createTime").setValue(new Date());
			if(null != data.id){
				nui.get("relateCont").setValue(data.id);
			}
			
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
		}
		
        
	//多选lookup返回选中行，用户可以根据需要设置相关自定义值
		function userSetDataMultiple(rows) {
			//nui.get("fDeptCountersignName").setValue(nui.get("userLookup_multiple").getText());
		}
		
		//值改变的时候
		function onFUseridsValueChanged() {
			nui.get("fDeptCountersignName").setValue(nui.get("fDeptCountersignId").getText());
		}
		//值改变的时候
		function onZUseridsValueChanged() {
			nui.get("zDeptCountersignName").setValue(nui.get("userLookup_multiple1").getText());
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
			newRow = {
				jan : jan,
				feb : feb,
				mar : mar,
				apr : apr,
				may : may,
				jun : jun,
				jul : jul,
				aug : aug,
				sep : sep,
				oct : oct,
				nov : nov,
				dec : dec,
				sum : sum
			};
			var l = grid2.getData().length;
			grid2.addRow(newRow, l + 1);
		}
		function removeRow() {
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, true);
			}
		}
		grid2.on("cellendedit", function(e) {
			var row = e.row;
			var jan = row.jan * 1;
			var feb = row.feb * 1;
			var mar = row.mar * 1;
			var apr = row.apr * 1;
			var may = row.may * 1;
			var jun = row.jun * 1;
			var jul = row.jul * 1;
			var aug = row.aug * 1;
			var sep = row.sep * 1;
			var oct = row.oct * 1;
			var nov = row.nov * 1;
			var dec = row.dec * 1;
			var sum = jan + feb + mar + apr + may + jun + jul + aug + sep + oct
					+ nov + dec;
			grid2.updateRow(row, {
				sum : sum
			});
			console.log(row);
		});
		grid2.on("cellbeginedit", function(e) {
			if (e.field == "sum") {
				e.cancel = "true";
			}
			console.log(e);
		});
		
		function onvaluechanged() {
			var contractSum = nui.get("contractSum").getValue() *1;
			var increaseDecreaseSum = nui.get("increaseDecreaseSum").getValue() *1 ;
			var finContractSum = contractSum + increaseDecreaseSum;
			nui.get("finContractSum").setValue(finContractSum);
		}
    </script></body>
</html>
