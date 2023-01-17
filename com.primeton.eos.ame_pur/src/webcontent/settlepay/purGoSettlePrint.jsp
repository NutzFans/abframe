<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.foundation.eoscommon.ConfigurationUtil"%>
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-08-11 11:55:13
  - Description:
-->
<head>
	<title>打印结算流程业务信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"	type="text/javascript"></script>
</head>
<body style="width: 635px; height: 100%;overflow: auto">
	<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
	<div style="height: auto;">
		<div class="mini-panel" title="外包结算基本信息" style="width: 635px;height: auto" >
			<form id="formSettle">
				<input class="nui-hidden" name="processInstID" id="processInstID" value="<%=processInstID %>"/>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids1" class="nui-hidden"/>
				<input name="misOpinion.fileids" class="nui-hidden"/>
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden"/>
				<input name="purSettle.processinstid" id="processinstidSettle" class="nui-hidden" />
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:110px;">项目：</td>
						<td id="projectno"></td>
						<td align="right" style="width:110px;">客户：</td>
						<td id="custno"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">供应商：</td>
						<td id="custid"></td>
						<td align="right" style="width:110px;">受益部门：</td>
						<td id="benefitid"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">开始日期：</td>
						<td id="startdate"></td>
						<td align="right" style="width:110px;">截止日期：</td>
						<td id="enddate"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">工作量单位：</td>
						<td id="workunit"></td>
						<td align="right" style="width:110px;">工作量数量：</td>
						<td id="workamount"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">工作量技术确认人：</td>
						<td colspan="3" id="confper"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">备注：</td>
						<td colspan="3" id="comment"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="mini-panel" title="外包人员信息" style="width: 635px;height: auto;" >
			<div id="datagridOutperson" class="nui-datagrid" style="width: 622px;height: auto;" multiSelect="true" 
		    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
		    	onselect="onSelect" ondeselect="onDeselect" onlyCheckSelection="true">
				<div property="columns">
					<div field="outpername"width="50" align="center" headerAlign="center" allowSort="true" >姓名</div>	
					<div field="setstartdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="left" allowSort="true">
						结算开始日期
					</div>
					<div field="setenddate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="left" allowSort="true">
						结算截止日期
					</div>
					<div field="days" width="70" align="center" headerAlign="center" allowSort="true">
						工作日统计
					</div>
					<div field="months" width="50" align="center" headerAlign="center" allowSort="true">
						人月数
					</div>
					<div field="price" width="75" dataType="currency" align="right" headerAlign="center" allowSort="true">人月单价</div>
					<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
						工时结算费用
					</div>
					<div field="othfee" width="55" dataType="currency" align="right" headerAlign="center" allowSort="true">
						其他费用
					</div>
					<div field="totalfee" width="auto" summaryType="sum" dataType="currency" dataType="currency" align="right" headerAlign="left" allowSort="true">
						结算费用小计
					</div>
					<!-- 
					<div field="score" width="120" align="center" headerAlign="center" allowSort="true">
						打分
					</div>
					<div field="evaluate" width="30px" align="center" headerAlign="center" allowSort="true">
						评价
					</div>
					<div field="purordernum" width="135px" align="center" headerAlign="center" allowSort="true">订单编号</div>
					<div field="purstatus" width="auto" renderer="dictGetOrderStatus" align="center" headerAlign="center" allowSort="true">订单状态</div>
					 -->
				</div>
			</div>
			<div style="width: 490px;height:55px;margin-left:130px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 75px;">总计：</td>
						<td id="daystotal" style="width: 66px;" align="center" ></td>
						<td id="monthstotal" style="width: 46px;" align="center" ></td>
						<td align="right" style="width: 205px;">结算费用总计：</td>
						<td id="sumtotal" style="width: 76px;" align="right" ></td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td align="right" style="width: 205px;">结算最终总金额：</td>
						<td id="setamount" style="width: 76px" align="right" ></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="mini-panel" title="计提核销信息" style="width: 635px;height: auto" >
			<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width: 622px;height:auto;" 
		    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
		    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
		    	onselect="onSelectPre" ondeselect="onDeselectPre" 
		    	onlyCheckSelection="true" allowSortColumn="false">
				<div property="columns">
					<div field="accruedid" headerAlign="center" allowSort="true" visible="true" width="53">计提编号</div>
	                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
	                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
	                <div field="suppliersname" width="70" headerAlign="center" allowSort="true">供应商简称</div>
	                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
	                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
	                <div field="salesid" headerAlign="center" allowSort="true" visible="false">所属销售ID</div>
	                <div field="orgname" width="50" headerAlign="center" allowSort="true" align="center">所属销售</div>
	                <div field="syb" width="80" headerAlign="center" allowSort="true" renderer="dictGetContOrg">所属事业部</div>
	                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
	                <div field="startdate" width="60" headerAlign="center" allowSort="true" align="center">开始日期</div>
	                <div field="enddate" width="60" headerAlign="center" allowSort="true" align="center">结束日期</div>
	                <div field="accrueddate" width="65" headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd">计提时间</div>
	                <div field="accruedmoney" width="60" headerAlign="center" allowSort="true" align="right" dataType="currency">计提金额</div>
	                <div field="outper" width="65" headerAlign="center" allowSort="true">相关外包人员</div>
	                <div field="accruedstatus" width="56" headerAlign="center" allowSort="true" renderer="dictGetStatus" align="center">状态</div>
	                <div field="settlementid" headerAlign="center" allowSort="true" visible="false">结算单编号</div>
				</div>
			</div>
			<div style="width:300px;height:25px;margin-left:250px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 143px;">总计：</td>
						<td id="sumtotalpre" style="width: 60px;" align="right" ></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="mini-panel" title="成本结转信息" style="width: 635px;height: auto">
			<table style="table-layout:fixed;" id="table_file2">
				<tr>
					<td align="right" style="width: 120px;">成本结转金额(含税)：</td>
					<td id="purOutcostTaxmon"></td>
					<td align="right" style="width: 40px;">税率：</td>
					<td id="purOutcostTax"></td>
					<td align="right" style="width: 130px;">成本结转金额(不含税)：</td>
					<td id="purOutcostNotaxmon"></td>
				</tr>
			</table>
		</div>
		<div class="mini-panel" title="报销单" style="width: 635px;height: auto" >
			<div style="padding:5px;">
				<!-- 报销单编号 -->
				<input name="expReiList.expno" id="pettyexpno" readOnly="readOnly" class="nui-hidden" style="width:150px"/>
				<!-- 销售合同编号 -->
				<input name="purSettle.cscontractid" id="cscontractid" class="nui-hidden" />
				<!-- 项目ID -->
				<input name="expReiList.projectid" id="projectid" readOnly="readOnly" class="nui-hidden" style="width:100px" />
				<!-- 报销记录id -->
				<input name="expReiList.expRei.reiid" id="reiid" class="nui-hidden" />
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:110px;">受益部门：</td>
						<td id="benefitid2"></td>
						<td align="right" style="width:110px;">付款方式：</td>
						<td id="appmode"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">收款单位：</td>
						<td id="companyname"></td>
						<td align="right" style="width:110px;">银行名称：</td>
						<td id="bankname"/></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">银行账号：</td>
						<td id="bankacct"></td>
						<td align="right" style="width:110px;">单位电话：</td>
						<td id="companytel"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">对应客户：</td>
						<td id="custno2"></td>
						<td align="right" style="width:110px;">对应项目：</td>
						<td id="projectno2"/></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">外包服务金额(元)：</td>
						<td id="setamount2"></td>
						<td align="right" style="width:110px;">对应项目编号：</td>
						<td id="projectno3"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">解释说明：</td>
						<td colspan="3" id="explain"></td>
					</tr>
					<tr>
						<td align="right" style="width:110px;">查看报销单：</td>
						<td id="projectid2"></td>
						<td align="right" style="width:110px;">查看商务合同：</td>
						<td id="cscontnum"></td>
						
					</tr>
				</table>
			</div>
		</div>
		<div class="mini-panel" title="外包结算附件" style="width: 635px;height: auto" >
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
		<!-- 审核意见  -->
		<div style="width: 643px;height: auto">
			<jsp:include page="/ame_common/misOpinion.jsp"/>
		</div>
	</div>
		
	<script type="text/javascript">
        nui.parse();
        var fromSettle = new nui.Form("#formSettle");
	  	var opioionform = new nui.Form("#opioionform");
	  	var datagridOutperson = nui.get("datagridOutperson");
	  	var grid2 = nui.get("datagrid2");
	  	var dosuminit = 0;
		init();
		
		function init(){
			document.getElementById("opinionHide").style.display="none";
    		var data = {processInstID: <%=processInstID %>,workItemID: "0",goSettleStep: "leaderApprove"};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.settlePay.getGoSettlePay.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					o = nui.clone(o);
					//加载结算附件设置参数
            		nui.get("grid_0").load({"groupid":"purSettle","relationid":o.purSettle.settlementid});
					//结算单表单赋值
					document.getElementById("startdate").innerHTML = o.purSettle.startdate == null ? "" : o.purSettle.startdate;
					document.getElementById("enddate").innerHTML = o.purSettle.enddate == null ? "" : o.purSettle.enddate;
					document.getElementById("workunit").innerHTML = o.purSettle.workunit == null ? "" : nui.getDictText('SERV_NUM_TYPE',o.purSettle.workunit);
					document.getElementById("workamount").innerHTML = o.purSettle.workamount == null ? "" : o.purSettle.workamount;
					document.getElementById("setamount").innerHTML = o.purSettle.setamount == null ? "" : o.purSettle.setamount;
					document.getElementById("confper").innerHTML = o.purSettle.confper == null ? "" : o.purSettle.confper;
					document.getElementById("comment").innerHTML = o.purSettle.comment == null ? "" : o.purSettle.comment;
					nui.get("settlementid").setValue(o.purSettle.settlementid);
					nui.get("fileids1").setValue(o.purSettle.fileids);
					nui.get("suppliersname").setValue(o.purSettle.suppliersname);
					nui.get("processinstidSettle").setValue(o.purSettle.processinstidSettle);
					document.getElementById("custid").innerHTML = o.purSettle.custname == null ? "" : o.purSettle.custname;
					document.getElementById("custno").innerHTML = o.purSettle.miscustname == null ? "" : o.purSettle.miscustname;
					document.getElementById("projectno").innerHTML = o.purSettle.projectname == null ? "" : o.purSettle.projectname;
					document.getElementById("benefitid").innerHTML = o.purSettle.orgname == null ? "" : o.purSettle.orgname;
					if(o.purOutcost != null){
						//结转金额	结转税率		结转不含税金额
			    		document.getElementById("purOutcostTaxmon").innerHTML = o.purOutcost.taxmon == null ? "" : toThousands(o.purOutcost.taxmon);
			    		document.getElementById("purOutcostTax").innerHTML = o.purOutcost.tax == null ? "" : parseFloat(o.purOutcost.tax * 100).toFixed(2) + " %";
			    		document.getElementById("purOutcostNotaxmon").innerHTML = o.purOutcost.notaxmon == null ? "" : toThousands(o.purOutcost.notaxmon);
					}
					//报销单表单赋值
					if(o.purSettle.pettyexpno){
						document.getElementById("setamount2").innerHTML = o.purSettle.setamount == null ? "" : o.purSettle.setamount;
						document.getElementById("projectno2").innerHTML = o.purSettle.projectname == null ? "" : o.purSettle.projectname;
						document.getElementById("custno2").innerHTML = o.purSettle.custname == null ? "" : o.purSettle.custname;
						document.getElementById("benefitid2").innerHTML = o.purSettle.orgname == null ? "" : o.purSettle.orgname;
						document.getElementById("bankname").innerHTML = o.expReiList.expRei.bankname == null ? "" : o.expReiList.expRei.bankname;
						document.getElementById("bankacct").innerHTML = o.expReiList.expRei.bankacct == null ? "" : o.expReiList.expRei.bankacct;
						document.getElementById("companyname").innerHTML = o.expReiList.expRei.companyname == null ? "" : o.expReiList.expRei.companyname;
						document.getElementById("appmode").innerHTML = o.expReiList.expRei.paymode == null ? "" : nui.getDictText("EXP_PAYMODE",o.expReiList.expRei.paymode);
						document.getElementById("companytel").innerHTML = o.expReiList.expRei.companytel == null ? "" : o.expReiList.expRei.companytel;
						document.getElementById("explain").innerHTML = o.expReiList.explain == null ? "" : o.expReiList.explain;
						nui.get("pettyexpno").setValue(o.expReiList.expno);
						nui.get("projectid").setValue(o.purSettle.projectid);//项目id
						nui.get("reiid").setValue(o.expReiList.expRei.reiid);//报销记录id
						document.getElementById("projectno3").innerHTML = o.purSettle.projectno == null ? "" : o.purSettle.projectno;
						document.getElementById("projectid2").innerHTML = o.purSettle.pettyexpno == null ? "" : "<a href='#' onclick='javascript: doView();' >" + o.purSettle.pettyexpno + "</a>";
						if(o.purSettle.cscontractid){
							nui.get("cscontractid").setValue(o.purSettle.cscontractid);
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontnum + "</a>";
						}else{
							document.getElementById("cscontnum").innerHTML = "无销售合同";
						}
					}
					
					var custid = o.purSettle.custid;
					var orgid = o.purSettle.orgid;
					
					//结算单编号 
					var settlementid = o.purSettle.settlementid;
					//与订单相关外包人员信息
                    var projectno = o.purSettle.projectno;
					var custno = o.purSettle.custno;
					var jsonnew = nui.encode({purSettle: 
						{settlementid: settlementid,projectno: projectno,custid: custid,custno: custno}
					});
                	nui.ajax({
		        		url: "com.primeton.eos.ame_pur.outperson.queryOutSettleLook.biz.ext",
		                data: jsonnew,
		                type: 'POST',
		                cache: false,
		                showModal: false,
		                contentType: 'text/json',
		                success: function (onew) {
		                	datagridOutperson.setData(onew.purSettle.purSettleList);
                			datagridOutperson.selectAll(false);
                			dosuminit = 1;
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		        	});
                    //与订单相关的计提信息
                    var jsonPresettle = nui.decode({purPresettle: {projectno: o.purSettle.projectno,settlementid: settlementid,iden: 3}});
                	grid2.load(jsonPresettle,function(){
                		grid2.selectAll(false);
                		var rowsPresettle = grid2.getSelecteds();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(!rowsPresettle[i].settlementid){
                				grid2.deselect(rowsPresettle[i]);
                			}
                		}
                	});
                    //流程回退路径赋值 
                    //查询审核意见
					var grid = nui.get("datagrid1");
					grid.load({processInstID: <%=processInstID %>});
					grid.sortBy("time", "desc");
				},
				error:function(){}
			});
		}
		
		//选择行
		var allSum = 0;
		//选择行
		var allSum = 0;
        function onSelect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumdays = parseFloat(sumdays);
			summonths = parseFloat(summonths);
            allSum = sumFee;
            allSum = parseFloat(allSum).toFixed(2);
            if(dosuminit == 1){
        		nui.get("setamount").setValue(allSum);
            }
            document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        }
        
        //取消选中行
        function onDeselect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			allSum = sumFee;
			allSum = parseFloat(allSum).toFixed(2);
			if(dosuminit == 1){
        		nui.get("setamount").setValue(allSum);
			}
			document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        }
        //选择行计提
        var allSumPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
            allSumPre = sumFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
        }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			allSumPre = sumFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
        }
    	//设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//设置业务字典值-性别
		function dictGetGender(e) {
			return nui.getDictText('ABF_GENDER',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-采购订单状态
	    function dictGetOrderStatus(e){
	    	return nui.getDictText('AME_ORDERSTATUS',e.value);
	    }
	    
	  	//标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
		function onOk(){
			if(form.validate()){
				nui.confirm("确认提交吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
				    	document.getElementById("fileCatalog1").value="purSettle";
						form4.submit();
					}else{
						return;
					}
				});
			}else{
				return;
			}
	    }
    
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
		//查看报销单信息
		function doView(){
			var reiid = nui.get("reiid").getValue();
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
		}
		
		//查看销售合同信息
		function doViewCsContract(){
			<%	
				String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","ipaddress");
				String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","port");
				String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","appName");
			 %>
			var cscontractid = nui.get("cscontractid").getValue();
			var newBXPort = "<%=newBXPort %>"
			if(newBXPort == ""){
				window.open("http://<%=newBXAdd %>/<%=newBXAppName %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
			}else{
				window.open("http://<%=newBXAdd %>:<%=newBXPort %>/<%=newBXAppName %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
			}
		}
		
		function SaveData1(){
        	document.getElementById("fileCatalog").value="MIS_OPINION";
            form2.submit();
    	}
    	
    	//金额千分位
	    function toThousands(num) {
			var num = (num || 0).toString(), result = '';
			if(num){
				if(num != 0){
					var s = num.substring(0,1);
					if(s=="-"){
						var num3 = num.split("-");
						var num4 = num3[1];
						var num2 = num4.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = "-"+num + result + "." + num2[1]; 
							}else{
								result = "-"+num + result; 
							}
						}
					}else{
						var num2 = num.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = num + result + "." + num2[1]; 
							}else{
								result = num + result; 
							}
						}
					}
				}else{
					result = 0;
				}
			}else{
				result = 0;
			}
			return result;
		}
	</script>
</body>
</html>