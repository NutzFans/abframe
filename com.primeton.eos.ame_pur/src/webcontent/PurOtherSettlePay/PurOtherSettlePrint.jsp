<%@page import="com.eos.foundation.eoscommon.ConfigurationUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2016-11-05 15:52:20
  - Description:
-->
<head>
    <title>打印流程业务信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body style="width: 635px; height: 100%;overflow: auto">
    <%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
    <div style="height: auto;">
		<div class="mini-panel" title="本次采购结算信息" style="width: 635px;height: auto" >
			<input name="expReiList.expno" id="pettyexpno" class="nui-hidden" style="width:150px"/>
			<!-- 报销单ID -->
			<input name="expReiList.expid" id="expid" class="nui-hidden" style="width:100px" />
			<!-- 报销记录id -->
			<input name="expReiList.expRei.reiid" id="reiid" class="nui-hidden" />
			<input id="custid" class="nui-hidden" />
			<table style="table-layout:fixed;" id="table_file">
			    <tr>
					<td align="right" style="width:100px;">供应商：</td>
					<td id="custname" style="width:215px"></td>
					<td align="right" style="width:100px;">本次结算金额：</td>
					<td id="setamount2" style="width:160px;">&nbsp  (元)</td>
				</tr>
				<tr>
					<td align="right" style="width:100px;">付款方式：</td>
					<td id="appmode" style="width:215px;"></td>
					<td align="right" style="width:100px;">收款单位：</td>
					<td id="companyname" style="width:160px;"></td>
				</tr>
				<tr>
					<td align="right" style="width:100px;">银行名称：</td>
					<td id="bankname"  style="width:215px;"></td>
					<td align="right" style="width:100px;">银行账号：</td>
					<td id="bankacct" style="width:160px;"></td>
				</tr>
				<tr>
					<td align="right" style="width:100px;">联系人：</td>
					<td id="linkman" style="width:215px;"></td>
				    <td align="right" style="width:100px;">联系电话：</td>
					<td id="companytel" style="width:160px;"></td>
				</tr>
				<tr >
					<td align="right" style="width:100px;">解释说明：</td>
					<td colspan="3" id="explain" style="width:330px;height:40px;"></td>
				</tr>
				<tr>
					<td style="width:100px;height:auto;" align="right">纸质凭证送递人：</td>
                    <td colspan="3" id="checkid" style="width:160px;">
                    </td>
				</tr>
				<span>
				<tr>
					<td align="right" style="width:100px;">报销单：</td>
					<td id="projectid2" style="width:160px" colspan="3"></td>
				</tr>
				</span>
			</table>
		</div>
		<div class="mini-panel" title="采购合同信息" style="width: 635px;height: auto;" >
			<div id="datagrid" class="nui-datagrid" dataField="purContracts" style="width: 622px;height:auto;"
	            url="com.primeton.eos.ame_pur.PurOtherSettlePay.queryPurContract.biz.ext" multiSelect="false"
	            showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" idField="custid"
			    onselectionchanged="onSelectCont" >
			    <div property="columns">
			       <div type="checkcolumn" width="30" visible="false">#</div>
			       <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
			       <div field="purcontid" headerAlign="center" allowSort="true" visible="false">采购合同编号</div>
			       <div field="purcontnum" headerAlign="center" allowSort="true" visible="true" width="70">合同编号</div>
			       <div field="purcontname" headerAlign="center" allowSort="true" visible="true">合同名称</div>
			       <div field="signdate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">签订日期</div>
			       <div field="purtype" headerAlign="center" allowSort="true"  renderer="purcontracttype" width="70" visible="false">合同类型</div>
			       <div field="purstatus" headerAlign="center" allowSort="true"  renderer="contype" width="70" visible="false">合同状态</div>
			       <div field="contmoney" headerAlign="center" allowSort="true" visible="true" width="70">合同金额</div>
			       <div field="payMoney" headerAlign="center" allowSort="true" visible="true" width="70">已付款合同额</div>
			       <div field="payCount" headerAlign="center" allowSort="true" visible="true" width="70" numberFormat="p">付款比例</div>
			       <%--<div field="purstatus" headerAlign="center" allowSort="true" visible="true" dictTypeId="CS_CONTRACTTYPE">合同状态</div>--%>
			       <div field="contnum" headerAlign="center" allowSort="true" visible="true">销售合同编号</div>
			       <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">有效开始日期</div>
		           <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">有效截止日期</div>
			       <div field="liankman" headerAlign="center" allowSort="true" visible="false">合同联系人</div>
			       <div field="ouroper" headerAlign="center" allowSort="true" visible="false">我方联系人</div>
			       <div field="comment" headerAlign="center" allowSort="true" visible="false">说明</div>
			    </div>
	       </div>
		</div>
		<div class="mini-panel" title="项目信息" style="width: 635px;height: auto;" >
	     	<div id="datagrid10" class="nui-datagrid" dataField="purProjCont" style="width:100%;height:auto;" 
		    	url="com.primeton.eos.ame_pur.PurOtherSettlePay.queryRdProject.biz.ext" multiSelect="true" 
		    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
		    	oncellendedit="doSumfee" onselect="onSelectPrj" ondeselect="onSelectPrj" 
		    	onlyCheckSelection="true">
				<div property="columns">
					<div type="checkcolumn" width="30" visible="false"></div>
					<div field="purcontid" align="center" headerAlign="center" allowSort="true" visible="false">采购合同id</div>
					<div field="projectId" align="center" headerAlign="center" allowSort="true" visible="false">项目id</div>
					<div field="settlementid" align="center" headerAlign="center" allowSort="true" visible="false">结算单编号</div>
					<div field="purcontnum" align="center" headerAlign="center" allowSort="true" visible="false">采购合同编号</div>
					<div field="projectno" width="120" align="center" headerAlign="center" allowSort="true" >项目编号</div>	
					<div field="projectName" width="auto" align="center" headerAlign="center" allowSort="true" >项目名称</div>
					<div field="contnum" width="100" align="center" headerAlign="center" allowSort="true"  visible="false">销售合同编号</div>
					<div field="contract.projectname" width="150" align="center" headerAlign="center" allowSort="true"  visible="false">合同名称</div>	
					<div field="contract.contsum" headerAlign="center" allowSort="true"  width="56" align="right" visible="false">合同金额</div>
					<div field="contract.pay" headerAlign="center" allowSort="true"  width="90" align="right" visible="false">已收款合同额</div>
					<div field="contract.paycount" headerAlign="center" allowSort="true"  width="90" numberFormat="p" align="right" visible="false">收款比例</div>
					<div field="prjfee" width="150" dataType="currency" align="right" headerAlign="center" allowSort="true">
						项目结算费用
					</div>
					<div field="settlementno" width="105" align="right" headerAlign="center" allowSort="true">
						结算单编号
					</div>
				</div>
			</div>
			<div style="width: 100%;height:24px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 400px;">结算费用总计：</td>
						<td id="sumtotal" style="width: 65px;" align="right" ></td>
					</tr>
				</table>
			</div>
	     </div>
		<div class="mini-panel" title="计提核销信息" style="width: 635px;height: auto;" > 
	        <div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width: 622px;height:auto;" 
			     url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			     showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			     onselect="onSelectPre" ondeselect="onDeselectPre" 
			     onlyCheckSelection="true" allowSortColumn="false">
			     <div property="columns" visible="false">
					 <div field="accruedid" headerAlign="center" allowSort="true" align="center" visible="true" width="70">计提编号</div>
		             <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		             <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		             <div field="suppliersname" width="65" headerAlign="center" allowSort="true" >供应商简称</div>
		             <div field="projectno" width="80" headerAlign="center" allowSort="true" visible="true">项目代码</div>
		             <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		             <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		             <div field="orgname" headerAlign="center" allowSort="true" width="50" align="center" >受益部门</div>
		             <div field="syb" headerAlign="center" allowSort="true" width="90" renderer="dictGetContOrg" >所属事业部</div>
		             <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		             <div field="startdate" headerAlign="center" allowSort="true" align="center" visible="false">开始日期</div>
		             <div field="enddate" headerAlign="center" allowSort="true" align="center" visible="false">结束日期</div>
		             <div field="accrueddate" headerAlign="center" allowSort="true" width="60" align="center"  dateFormat="yyyy-MM-dd">计提时间</div>
		             <div field="accruedmoney" headerAlign="center" allowSort="true" width="60" align="right" dataType="currency" >计提金额</div>
		             <%--<div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>--%>
		             <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		             <div field="settlementid" headerAlign="center" allowSort="true" visible="fales" >结算单编号</div>
		             <div field="comment" headerAlign="center" allowSort="true" visible="false">备注</div>
			     </div>
	        </div>
	        <div style="width:300px;height:25px;margin-left:250px;float:left;">
			    <table style="table-layout:fixed;">
				   <tr>
					  <td align="right" style="width:145px;">计提核销总计：</td>
					  <td id="sumtotalpre" style="width:60px;" align="right" ></td>
				   </tr>
			    </table>
			</div>
	    </div>
	    <div class="mini-panel" title="送递信息" style="width: 635px;height: auto;" >
			<table>
			    <tr>
					<td align="right" style="width:120px">送递人：</td>
					<td id="postorname" style="width:250px"></td>
					<td align="right" style="width:225px">送递方式：</td>
					<td id="postway" style="width:210px"></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">收件人：</td>
					<td colspan="3" id="receivername" style="width:250px"></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">送递内容：</td>
					<td colspan="3" id="postcontent" style="width:250px">
					</td>
				</tr>
			</table>
		</div>
		<div class="mini-panel" title="其他结算附件" style="width: 635px;height: auto" >
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
		<!-- 审核意见  -->
		<div style="width: 643px;">
			<jsp:include page="/ame_common/misOpinion.jsp"/>
		</div>
    </div>
    <script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid");
    var grid2 = nui.get("datagrid2");var grid10 = nui.get("datagrid10");
	var historypay=0;
    var purSettles;
    var projectidlist="";
	var settlementidList="";
    
    init();
	function init(){
	    document.getElementById("opinionHide").style.display="none";
	    var data = {processInstID: <%=processInstID %>,workItemID: "0",goSettleStep: "leaderApprove"};
		
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_pur.PurOtherSettlePay.getOtherGoSettlePay1.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				o = nui.clone(o);
				purSettles = o.purSettles;
				var html = "";
				for(var i=0;i<o.purSettles.length;++i){
					if(settlementidList==""){
						settlementidList=o.purSettles[i].settlementid;
					}else{
						settlementidList=settlementidList+','+o.purSettles[i].settlementid;
					}
					if(projectidlist==""){
						projectidlist=o.purSettles[i].projectid;
					}else{
						projectidlist=projectidlist+','+o.purSettles[i].projectid;
					}
					/* //报销单号
					if(html==""){
						html="<a href='#' onclick='javascript: doView(" + o.purSettles[i].pettyexpno + ");' >" + o.purSettles[i].pettyexpno + "</a>";
					}else{
						html=html+","+"<a href='#' onclick='javascript: doView(" + o.purSettles[i].pettyexpno + ");' >" + o.purSettles[i].pettyexpno + "</a>";
					} */
					//金额
					historypay=historypay+o.purSettles[i].setamount;
				}
				//加载结算附件设置参数
            	nui.get("grid_0").load({"groupid":"purSettle","relationid":settlementidList});
	    		document.getElementById("setamount2").innerHTML = historypay;
	    		nui.get("custid").setValue(o.purSettles[0].custid);
				document.getElementById("custname").innerHTML = o.purSettles[0].custname == null ?"":o.purSettles[0].custname;
				//document.getElementById("projectno").innerHTML = o.purSettle.projectno == null ?"":o.purSettle.projectname;
				document.getElementById("checkid").innerHTML = o.purSettles[0].user.name == null ?"":o.purSettles[0].user.name;
				
				nui.get("reiid").setValue(o.purSettles[0].expReiList.expRei.reiid);
				nui.get("expid").setValue(o.purSettles[0].expReiList.expid);
				document.getElementById("appmode").innerHTML = o.purSettles[0].expReiList.expRei.paymode == null ?
					"":nui.getDictText("EXP_PAYMODE",o.purSettles[0].expReiList.expRei.paymode);
				document.getElementById("companyname").innerHTML = o.purSettles[0].expReiList.expRei.companyname == null ?"":o.purSettles[0].expReiList.expRei.companyname;
				document.getElementById("bankname").innerHTML = o.purSettles[0].expReiList.expRei.bankname == null ?"":o.purSettles[0].expReiList.expRei.bankname;
				document.getElementById("bankacct").innerHTML = o.purSettles[0].expReiList.expRei.bankacct == null ?"":o.purSettles[0].expReiList.expRei.bankacct;
				document.getElementById("linkman").innerHTML = o.purSettles[0].purSupplier.linkman == null ?"":o.purSettles[0].purSupplier.linkman;
				document.getElementById("companytel").innerHTML = o.purSettles[0].expReiList.expRei.companytel == null ?"":o.purSettles[0].expReiList.expRei.companytel;
				document.getElementById("explain").innerHTML = o.purSettles[0].expReiList.explain == null ?"":o.purSettles[0].expReiList.explain;
				document.getElementById("projectid2").innerHTML = html;
				nui.get("pettyexpno").setValue(o.purSettles[0].expReiList.expno);
				
				var custid = o.purSettles[0].custid;
				var purcontid = o.purSettles[0].purcontid;
				var orgid = o.purSettles[0].orgid;
				var projectno = o.purSettles[0].projectno;
				//结算单编号 
				var settlementid = o.purSettles[0].settlementid;
				
				//采购合同信息
	        	if(settlementid){
		    		var json2 = nui.decode({"criteria": 
				                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": custid}
				                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}
				                		  ,"_expr[2]": {"_property": "purcontid","_op": "=","_value": purcontid}}});
		        	grid.sortBy("purcontid","asc");
		        	grid.load(json2,function(){
						grid.selectAll(false);
						var rowsPresettle = grid.getData();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(rowsPresettle[i].purcontid != purcontid){
                				grid.deselect(rowsPresettle[i]);
                			}
                			else{
                			   grid.select(rowsPresettle[i]);
                			}
                		}
					});
		    	}else{
		        	var json2 = nui.decode({"criteria": 
				                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": custid}
				                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}}});
		        	grid.sortBy("purcontid","asc");
		        	grid.load(json2);
		    	}
	        	
	        	//送递人信息
	        	document.getElementById("postorname").innerHTML = o.amePostservice.postorname == null ?"":o.amePostservice.postorname;
	        	document.getElementById("postway").innerHTML = o.amePostservice.postway == null ?"":nui.getDictText("AME_POSTWAY",o.amePostservice.postway);
	        	document.getElementById("postcontent").innerHTML = o.amePostservice.postcontent == null ?"":o.amePostservice.postcontent;
	        	document.getElementById("receivername").innerHTML = o.amePostservice.receivername == null ?"":o.amePostservice.receivername;

	            //查询审核意见
				var grid1 = nui.get("datagrid1");
				grid1.load({processInstID: <%=processInstID %>});
				grid1.sortBy("time", "desc");
			},
			error:function(){
			}
		});
	}
	
	//点击采购合同展示对应的项目和销售合同
	function onSelectCont(e){ 
		var a = e.sender;
	    var rows=a.getSelected();
	    var sum=0;
        //项目信息
			
        if(rows.purcontid == null || rows.purcontid == 0){
        	grid10.load(json_p);
        }else{
        	var json_p = nui.decode({"criteria": 
				                {"_expr[0]": {"_property": "purcontid","_op": "=","_value": rows.purcontid},
				                "_expr[1]": {"_property": "projectId","_op": "in","_value": projectidlist}}});	
            
            grid10.sortBy("projectno","asc");
            grid10.load(json_p,function(){
            	//选择项目
            	if(purSettles.length >= 1) {
            		grid10.selectAll(false);
	        		var rowsPrj = grid10.getData();
	        		for(var i=0;i<purSettles.length;++i){
	        			for(var j=0;j<rowsPrj.length;j++){
	        				if(rowsPrj[j].projectno != purSettles[i].projectno){
	        					if(i==0){
	        						grid10.deselect(rowsPrj[j]);
	        					}
	        				}else{
	        					grid10.select(rowsPrj[j]);
	        					var rowData={prjfee:purSettles[i].setamount,settlementid:purSettles[i].settlementid,settlementno:purSettles[i].settlementno};
	        					grid10.updateRow(rowsPrj[j],rowData);
	        					sum = sum+purSettles[i].setamount;
	        				}
	        			}
	        		}
	        		document.getElementById("sumtotal").innerHTML = sum;
    				document.getElementById("setamount2").innerHTML = sum;
            	}
            });
    		grid2.clearRows();
        } 
    }
    
    //查看报销单信息
	function doView(){
		var reiid = nui.get("reiid").getValue();
		var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
		window.open(executeUrl);
	}
	
	//项目输入置计算合计
    	function doSumfee(e)
    	{	
	    	var rows = grid10.getSelecteds();
	    	var sumFee = 0;
	    	
        	//供应商ID
        	var custid = nui.get("custid").getValue();
        	for(var i = 0;i < rows.length;i ++){
        		if(rows[i].prjfee){
					sumFee += parseFloat(rows[i].prjfee);
				}
        	}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("setamount").setValue(sumFee);
			nui.get("setamount2").setValue(sumFee);
			
			var row =e.record;;
    		//结算单编码
        	var settlementno = row.settlementno;
        	var settlementid = row.settlementid;
        	if(settlementno){
        		var json = {purSettle: {settlementno: settlementno,settlementid: settlementid}};
	            form.loading("检查结算单编码是否重复...");
	            nui.ajax({
	                url: "com.primeton.eos.ame_pur.settle.checkSettlementno.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
	                	text = nui.clone(text);
	                	if(text.result == "chongfu"){
	                		nui.alert(settlementno+"结算单编号已存在");	
	                		settlementnohave = true;
	                	}else{
	                		settlementnohave = false;
	                	}
	         
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
        	}
    	}
    	
    	//已选项目计算结算总计，已选项目筛选出计提
	    function onSelectPrj(e){
	    	var rows = grid10.getSelecteds();
	    	var sumFee = 0;
	    	
			//计提核销信息 根据项目(projectno)筛选计提信息
        	var projectnos = "";
        	//供应商ID
        	var custid = nui.get("custid").getValue();
        	for(var i = 0;i < rows.length;i ++){
        		if(!projectnos){
					projectnos = rows[i].projectno;
					if(rows[i].prjfee){
						sumFee += parseFloat(rows[i].prjfee);
					}
        		}else{
        			projectnos += "," + rows[i].projectno; 
					if(rows[i].prjfee){
						sumFee += parseFloat(rows[i].prjfee);
					}
        		}
        	}
        	
        	if(rows.length == 0){
        		grid2.clearRows();
        	}else{
        		var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectnos},settlementid: settlementidList});
        		grid2.load(jsonPresettle,function(){
	            	//选择计提
	            	if(purSettles.length >= 1) {
	            		grid2.selectAll(false);
		        		var rowsPresettle = grid2.getData();
		        		for(var i=0;i<purSettles.length;++i){
		        			for(var j=0;j<rowsPresettle.length;j++){
		        				if(rowsPresettle[j].settlementid != purSettles[i].settlementid){
		        					if(i==0){
		        						grid2.deselect(rowsPresettle[j]);
		        					}
		        				}else{
		        					grid2.select(rowsPresettle[j]);
		        				}
		        			}
		        		}
	            	}
	            });
        	}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			document.getElementById("setamount2").innerHTML = sumFee;
	    }
	    
	    //合同状态业务字典
		function contype(e){
			return nui.getDictText('AME_ORDERSTATUS',e.value);
		}
		
		//合同类型业务字典
		function contracttype(e){
			return nui.getDictText('MIS_CONTRACTTYPE',e.value);
		}
		
		//采购合同类型业务字典
		function purcontracttype(e){
			return nui.getDictText('AME_CONTYPE',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		} 
		
		//设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
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
    </script>
</body>
</html>