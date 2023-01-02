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
  - Author(s): zyl
  - Date: 2016-07-27 17:44:01
  - Description:
-->
<head>
	<title>计提查看</title>
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
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包计提基本信息</legend>
				<div style="padding:5px;">
					<input name="purpresettle.accruedid" id="accruedid"  class="nui-hidden"/>
					<input name="purpresettle.accrueddate" id="accrueddate" class="nui-hidden" required="false" format="yyyy-MM-dd"/>
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">所属事业部：</td>
							<td id="syb" style="width:180px"></td>
							<td align="right" style="width:120px;">供应商：</td>
							<td id="custid" style="width:180px"></td>
							<td align="right" style="width:120px;">项目：</td>
							<td id="projectno" style="width:180px;"></td>
							<td align="right" style="width:120px;">所属客户：</td>
							<td id="miscustid" style="width:220px"></td>	
						</tr>
						<tr> 
							<td align="right" style="width:120px;">计提开始日期：</td>
							<td id="startdate" style="width:100px"></td>
							<td align="right" style="width:120px;">计提结束日期：</td>
							<td id="enddate" style="width:100px"></td>
							<td align="right" style="width:120px;">计提人员：</td>
							<td id="opername" style="width:100px"></td>
							<td align="right" style="width:120px;">计提状态：</td>
							<td id="accruedstatus" style="width:90px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td id="workunit" style="width:100px"></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td id="workamount" style="width:100px"></td>
							<td align="right" style="width:120px;">所属销售：</td>
							<td id="salesid" style="width:100px"></td>
							<td align="right" style="width:120px;">销售合同：</td>
							<td id="contnum" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本类型：</td>
							<td id="costtype" style="width:100px"></td>
							<td align="right" style="width:120px;">计提金额(元)：</td>
							<td id="accruedmoney"  style="width:150px"></td>
							<td align="right" style="width:120px;">计提税率：</td>
							<td id="taxrate" style="width:50px"></td>
							<td align="right" style="width:120px;">计提不含税金额(元)：</td>
							<td id="notaxmoney" style="width:90px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本确认日期：</td>
							<td colspan="7" id="confirmdate"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">采购合同：</td>
							<td colspan="7" id="purcontnum" style="width:310px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">采购订单：</td>
							<td colspan="7" id="purorderid" style="width:650px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">相关外包人员：</td>
							<td colspan="7" id="outper" style="height:40px;width:650px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="7" id="comment" style="height:40px;width:650px"></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<jsp:include page="/ame_common/detailFile.jsp" />
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
	  	var form = new nui.Form("form1");
	  	
	  	function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
		var accruedid = getUrlParam("accruedid");
		
		init();
		function init(){
    		var json = nui.encode({purpresettle: {accruedid: accruedid}});  
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.outaccrued.getPurPresettle.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                    /* syb custid projectno miscustid salesid contnum purcontnum costtype
					 startdate enddate purorderid outper accruedmoney accruedstatus comment 
					 */
					 //附件查询
					var grid_0 = nui.get("grid_0");
					grid_0.load({"groupid":"PUR_PRESETTLE","relationid":o.purpresettle.accruedid});
					grid_0.sortBy("fileTime","desc");
					document.getElementById("syb").innerHTML = o.purpresettle.syb == null ? "" : nui.getDictText('CONT_ORG', o.purpresettle.syb);
                    document.getElementById("custid").innerHTML = o.purpresettle.custname == null ? "" : o.purpresettle.custname;
                    document.getElementById("projectno").innerHTML = o.purpresettle.projectname == null ? "" : o.purpresettle.projectname;
                    document.getElementById("miscustid").innerHTML = o.purpresettle.miscustname == null ? "" : o.purpresettle.miscustname;
                    document.getElementById("salesid").innerHTML = o.purpresettle.empname == null ? "" : o.purpresettle.empname;
                    document.getElementById("contnum").innerHTML = o.purpresettle.contnum == null ? "" : o.purpresettle.contnum;
                    document.getElementById("costtype").innerHTML = o.purpresettle.costtype == null ? "" : nui.getDictText('AME_CONTCOSTTYPE', o.purpresettle.costtype);
                    document.getElementById("startdate").innerHTML = o.purpresettle.startdate == null ? "" : o.purpresettle.startdate;
                    document.getElementById("enddate").innerHTML = o.purpresettle.enddate == null ? "" : o.purpresettle.enddate;
                    document.getElementById("confirmdate").innerHTML = o.purpresettle.confirmdate == null ? "" : o.purpresettle.confirmdate;
                    document.getElementById("workunit").innerHTML = o.purpresettle.workunit == null ? "" : nui.getDictText('SERV_NUM_TYPE', o.purpresettle.workunit);
                    document.getElementById("workamount").innerHTML = o.purpresettle.workamount == null ? "" : o.purpresettle.workamount;
                    var purordernums = [];
                    if(o.purpresettle.purorderid){
                    	purordernums = o.purpresettle.purorderid.split(",");
                    }
                    var setordernums = [];
                    for(var i = 0;i < o.purpresettle.purOrders.length;i ++){
                    	for(var j = 0;j < purordernums.length;j ++){
	                    	if(o.purpresettle.purOrders[i].purorderid == purordernums[j]){
	                    		setordernums[j] = o.purpresettle.purOrders[i].purContract.purcontname;
	                    	}
                    	}
                    }
                    document.getElementById("purcontnum").innerHTML = setordernums.length == 0 ? "" : setordernums;
                    
                    //o.purpresettle.purOrders
                    var purorderids = [];
                    for(var i = 0;i < o.purpresettle.purOrders.length;i ++){
                    	if(o.purpresettle.purOrders[i].purordernum){
                    		for(var j = 0;j < purordernums.length;j ++){
	                    		if(o.purpresettle.purOrders[i].purorderid == purordernums[j]){
			                    	purorderids[j] = o.purpresettle.purOrders[i].purordernum;
	                    		}
	                    	}
                    	}
                    }
                    document.getElementById("purorderid").innerHTML = purorderids.length == 0 ? "" : purorderids;
                    document.getElementById("outper").innerHTML = o.purpresettle.outper == null ? "" : o.purpresettle.outper;
                    document.getElementById("accruedmoney").innerHTML = o.purpresettle.accruedmoney == null ? "" : o.purpresettle.accruedmoney;
                    document.getElementById("accruedstatus").innerHTML = o.purpresettle.accruedstatus == null ? "" : nui.getDictText("AME_ACCRUEDSTATUS", o.purpresettle.accruedstatus);
                    document.getElementById("comment").innerHTML = o.purpresettle.comment == null ? "" : o.purpresettle.comment;
                    document.getElementById("taxrate").innerHTML = o.purpresettle.taxrate == null ? "" : o.purpresettle.taxrate;
                    document.getElementById("notaxmoney").innerHTML = o.purpresettle.notaxmoney == null ? "" : o.purpresettle.notaxmoney;
                    document.getElementById("opername").innerHTML = o.purpresettle.opername == null ? "" : o.purpresettle.opername;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
		}
		
	  	//赋值
	  	function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){
	    		/**
	    		 * 允许修改的信息：计提周期、备注、计提金额、相关外包人员，计提状态，合同编号，项目编号，关联结算记录等
	    		**/
	    		//采购订单编号、供应商编号、所属销售、所属事业部不允许修改
	    		nui.get("purorderid").setReadOnly(true);
	    		nui.get("purorderid").setShowButton(false);
	    		nui.get("salesid").setReadOnly(true);
	    		nui.get("salesid").setShowButton(false);
	    		var json = nui.encode({purpresettle:data});  
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.outaccrued.getPurPresettle.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                    form.setData(o);
	                    form.isChanged(false);
	                    //采购合同编号
	                    nui.get("purcontnum").setValue(o.purpresettle.purcontnum);
	                    nui.get("purcontnum").setText(o.purpresettle.purcontnum);
	                    var json = nui.decode({purSupplier:{custid: o.purpresettle.custid}});
                        nui.ajax({
			        		url: "com.primeton.eos.ame_pur.order.queryOrderList.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	nui.parse();
			                	var purContracts = o.purSupplier.purContracts;
			                	var purcontnums = [];
			                	for(var i = 0;i < o.purSupplier.purContracts.length;i ++){
			                		if(o.purSupplier.purContracts[i].purcontnum){
			                			purcontnums[i] = {"purcontnum": o.purSupplier.purContracts[i].purcontnum};
			                		}
			                	}
			                	nui.get("purcontnum").setData(nui.encode(purcontnums));
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                }
			            });
	                    
	                    //赋值供应商名称值
	                    nui.get("custid").setText(o.purpresettle.custname);
	                    nui.get("custid").setReadOnly(true);
	                    nui.get("custid").setShowButton(false);
	                    //所属销售	
	                    nui.get("salesid").setText(o.purpresettle.empname); 
	                    //采购订单
	                	nui.get("purorderid").setData(o.purpresettle.purOrders);
	                    
	                    //项目
	                    nui.get("projectno").setValue(o.purpresettle.projectno);
	                    nui.get("projectno").setText(o.purpresettle.projectname);
	                    //销售合同编号
	                    nui.get("contnum").setValue(o.purpresettle.contnum);
	                    //客户
	                    nui.get("miscustid").setText(o.purpresettle.miscustname);
	                    nui.get("miscustid").setShowButton(false);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}else if(data.action == "addpre"){	//供应商tab页中的计提新增
    			nui.get("custid").setValue(data.custid);
    			nui.get("custid").setText(data.custname);
    			nui.get("custid").setReadOnly(true);
    			nui.get("custid").setShowButton(false);
    			nui.get("salesid").setReadOnly(true);
    			nui.get("salesid").setShowButton(false);
				nui.get("miscustid").setReadOnly(true);
				nui.get("miscustid").setShowButton(false);
    			nui.get("purorderid").setReadOnly(false);
    			nui.get("purorderid").setShowButton(true);
    			
    			var json = nui.decode({purSupplier: {custid: data.custid}});
                nui.ajax({
	        		url: "com.primeton.eos.ame_pur.order.queryOrderList.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	nui.parse();
	                	var purorderids;
	                	var purordernums;
	                	for(var i = 0;i < o.purSupplier.purOrders.length;i ++){
	                		if(i == 0){
	                			purorderids = o.purSupplier.purOrders[i].purorderid;
	                			purordernums = o.purSupplier.purOrders[i].purordernum;
	                		}else{
		                		purorderids += "," + o.purSupplier.purOrders[i].purorderid;
		                		purordernums += "," + o.purSupplier.purOrders[i].purordernum;
	                		}
	                	}
	                	nui.get("purorderid").setData(o.purSupplier.purOrders);
	                	var json = nui.decode({orderid: purorderids});
	                	nui.ajax({
	                		url: "com.primeton.eos.ame_pur.outperson.queryPurOutpersonByOrderIds.biz.ext",
	                		data: json,
	                		type: 'post',
	                		cache: false,
	                		contentType: 'text/json',
	                		success: function (o){
	                			var outpernames = null;
	                			for(var i = 0;i < o.orderOutpers.length;i ++){
	                				if(i == 0){
	                					outpernames = o.orderOutpers[i].purOutperson.outpername;
	                				}else{
		                				outpernames += "," + o.orderOutpers[i].purOutperson.outpername;
	                				}
	                			}
	                			nui.get("outper").setValue();
	                		},
	                		error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
	                	});
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
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
        
        function onCancel(e) {
        	/* var data = form.getData();
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
			} */
				CloseWindow("cancel");
        }
        
	</script>
</body>
</html>