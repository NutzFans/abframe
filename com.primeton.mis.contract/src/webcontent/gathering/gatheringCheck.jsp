<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收款确认审核</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
    <style type="text/css">
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<!-- 提示信息展示 -->
<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
<div class="nui-fit">
  <form id="form1" method="post" >
        <input name="csGather.gatherid" id="gatherid" class="nui-hidden" />
        <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
        <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
        <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
        <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
        <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
        <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
        <input name="misOpinion.auditstatus" id="auditstatus" class="nui-hidden" />
        
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款确认</legend>
            <div style="padding:5px;">
	            <table style="table-layout:fixed;">
	            	 <tr>
	                    <td style="width:110px;" align="right">支付单位：</td>
	                    <td style="width:300px;" align="left"> 
	                    	<input name="csGather.misCustinfo.custname" id="custname" style="width:300px" class="nui-textbox" allowInput="false"/>
	                        <input name="csGather.misCustinfo.custid" id="custid" class="nui-hidden" />
	                    </td>
	                    <td align="right" nowrap="nowrap">收款方式：</td>
	                    <td align="left" nowrap="nowrap">    
	                        <input name="csGather.gathertype" id="gathertype" class="nui-dictcombobox" dictTypeId="AME_CSGATHERTYPE" required="false"  readOnly="true" vtype="float" onvaluechanged="watchgathertype"/>
	                    </td>
	                </tr>
	                <tr>
	                	 <td style="width:110px;" align="right">实际收款日期：</td>
	                    <td style="width:150px;" align="left">    
	                        <input name="csGather.gatherdate" id="gatherdate" class="nui-datepicker" readOnly="true" />
	                    </td>
	                    <td align="right" nowrap="nowrap">财报收款日期：</td>
		                <td align="left" nowrap="nowrap">    
		                 	<input class="nui-datepicker" name="csGather.confirmday" id="confirmday" required="true" readOnly="true" />
		                </td>
	                </tr>
	                <tr>
	                    <td style="width:110px;" align="right">收款金额：</td>
	                    <td style="width:150px;" align="left">    
	                        <input name="csGather.summon" id="summon" class="nui-textbox" required="true" vtype="float" allowInput="false"/>
	                    </td>
	                    <td align="right" nowrap="nowrap">总账科目：</td>
	                    <td align="left" nowrap="nowrap">    
	                    	<input property="editor" name="csGather.kmbm" id="kmbm" style="width:300px" readOnly="true" class="nui-textboxlist" required="true" allowInput="false" textField="kmbmname" valueField="kmbm" searchField="name"  
							url="com.primeton.ame.ledger.equivalent.queryKMBMisleaf.biz.ext"/>
						</td>
	                </tr>
	                <tr>
	                    <td style="width:110px;" align="right">是否发送邮件：</td>
	                    <td style="width:150px;" align="left">    
	                        <input class="nui-dictcombobox" name="misOpinion.issendmail" dictTypeId="ABF_YESORNO" required="true"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
        </fieldset>        
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1360px;">
            <legend>收款对应合同</legend>
            <div style="padding:5px;">
            	<div style="width: 1295px;">
			        <div class="nui-toolbar" style="width: 1292.5px;border-bottom:0;padding:0px;">
			            <table style="width:860px;">
			                <tr>
			                    <td style="width: 200px;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('cont_grid')" plain="true">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('cont_grid')" plain="true">删除</a>
			                    </td>
			                    <td align="right" style="width: 290px;" >合计：</td>
			                    <td align="left" style="width: 102px;"><input id="summonTemp" class="nui-textbox" vtype="float" allowInput="false" style="width: 100px;" >
			                    </td>
			                    <td align="left" style="width: auto;"><input id="summonGather" class="nui-textbox" vtype="float" allowInput="false" style="width: 120px;">
			                    </td>
			                    <td align="left" style="width: 102px;"><input id="summonOrder" class="nui-textbox" vtype="float" allowInput="false" style="width: 100px;">
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	        	<div id="cont_grid" class="nui-datagrid" style="width: 1350px;height:auto;" allowResize="true" idField="contractid"
			        onshowrowdetail="onShowRowDetail1" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">
			            <div type="expandcolumn">#</div>
			            <div field="csContract.contractid" width="0" headerAlign="center" >合同ID</div>
			            <div field="csContract.contnum" width="80" headerAlign="center" >合同存档编号
			            	<input property="editor" class="nui-buttonedit" style="width:100%;" onbuttonclick="onButtonEdit1" required="true" allowInput="false"/> 
			            </div>
			            <div field="csContract.projectname" width="280" headerAlign="center" >合同名称（项目）</div>
			            <div field="csContract.contsum" width="80" headerAlign="center" >合同总金额</div>
			            <div field="summon" width="105" headerAlign="center" >本次销售收款金额</div>
			            <div field="summong" width="125" headerAlign="center" >本次实际收款额(含税)</div>
			            <div field="summono" width="105" headerAlign="center" >本次订单收款金额</div>
			            <div width="auto"></div>
			        </div>
			    </div>
			    <div id="detailGrid_Form1" style="display:none;">
			    	<div property="toolbar"><span>合同对应的销售</span></div>
				    <div id="sale_grid" class="nui-datagrid" style="width: 850px;height:auto;" allowResize="true" oncellendedit="doCal" idField="contsaleid"
				        onshowrowdetail="onShowRowDetail2" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div type="expandcolumn">#</div>
				            <div field="saleid" width="70" headerAlign="center" >销售ID</div>
				            <div field="salename" width="70" headerAlign="center" >销售姓名</div>
				            <div field="org" width="100" headerAlign="center" renderer="onSYBRenderer">销售所属事业部</div>
				            <div field="contsum" dataType="currency" width="90" headerAlign="center" >合同总金额</div>
				            <div field="prodmon" dataType="currency" width="90" headerAlign="center" >产品金额</div>
				            <div field="servmon" dataType="currency" width="90" headerAlign="center" >服务金额</div>
				            <div field="thisservmon" dataType="currency" width="110" headerAlign="center" cellCls="myIndex">本次服务收款金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div width="auto"></div>
				        </div>
				    </div>
				   
				    <div id="detailGrid_Form2" style="display:none;">
				        <div id="prod_grid" class="nui-datagrid" style="width: 825px;height:auto;" oncellendedit="doSubCal" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
				            <div property="columns">
				                <div field="prod_name" width="210" headerAlign="center">产品名称</div>
				                <div field="price" dataType="currency" width="100" align="center" headerAlign="center">产品单价</div>
				                <div field="prodmon" dataType="currency" width="100" align="center" headerAlign="center">产品金额</div>
				                <div field="prodsubmon" dataType="currency" width="100" align="center" headerAlign="center">产品分包金额</div>
				                <div field="othmon" dataType="currency" width="100" align="center" headerAlign="center">产品服务费</div>
				                <div field="netprodmon" dataType="currency" width="100" align="center" headerAlign="center">产品净额</div>
					            <div field="thisprodmon" dataType="currency" width="110" headerAlign="center" cellCls="myIndex">本次产品收款金额
					            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
					            </div>
					            <div width="auto"></div>
				            </div>
				        </div>    
				    </div>
				    
				    <!-- 合同收款纪录 -->
				    <div property="toolbar"><span>合同对应的收款确认记录</span></div>
				    <div id="gatherfc_grid" class="nui-datagrid" style="width: 1314px;height:auto;" oncellendedit="doCal2" idField="gatherid"
				        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
				        editNextOnEnterKey="true" onrowclick="onrowclick" >			        
				        <div property="columns">            
				            <div field="gatherno" width="40" headerAlign="center" >次数</div>
				            <div field="newyearmonth" width="63" headerAlign="center" >最新年月</div>
				            <div field="status" width="45" headerAlign="center" renderer="dictGetGatherType">收款状态</div>
				            <div field="billstatus" width="45" headerAlign="center" renderer="dictGetGatherBillType">收款开票状态</div>
				            <div field="billdate" width="82" headerAlign="center" dateFormat="yyyy-MM-dd">开票日期</div>
				            <div field="productsum" dataType="currency" width="70" headerAlign="center" >预计产品额</div>
				            <div field="servicesum" dataType="currency" width="70" headerAlign="center" >预计服务额</div>
				            <div field="fcsum" dataType="currency" width="70" headerAlign="center" >预计金额</div>
				            <div field="actproductsum" dataType="currency" width="100" headerAlign="center" cellCls="myIndex">实际产品额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actservicesum" dataType="currency" width="100" headerAlign="center" cellCls="myIndex">实际服务额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actsum" dataType="currency" width="90" headerAlign="center" >实际金额(含税)</div>
				            <div field="productrate" dataType="currency" width="55" headerAlign="center" numberFormat="p" cellCls="myIndex">产品税率
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="servicerate" dataType="currency" width="55" headerAlign="center" numberFormat="p" cellCls="myIndex">服务税率
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				             <div field="actproductsum2" dataType="currency" width="112" headerAlign="center" >实际产品额(不含税)</div>
				            <div field="actservicesum2" dataType="currency" width="112" headerAlign="center" >实际服务额(不含税)</div>
				            <div field="actsum2" dataType="currency" width="105" headerAlign="center" >实际金额(不含税)</div>
				            <div field="confirmday" width="97" headerAlign="center" dateFormat="yyyy-MM-dd" >财报收款日期</div>
				            <div field="maconfirmday" width="97" headerAlign="center" dateFormat="yyyy-MM-dd" >实际收款日期</div>
				            <div field="fcreverate"  dataType="currency" headerAlign="center" width="auto" visible="false"></div>
				            <div field="actsum3"  dataType="currency" headerAlign="center" width="auto"></div> 
				        </div>
				    </div>
				    
				    <div property="toolbar"><span>合同对应的订单</span></div>
				    <div id="order_grid" class="nui-datagrid" style="width: 900px;height:auto;" allowResize="true" oncellendedit="doCal1" idField="contorderid"
				        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div field="contorderno" width="70" headerAlign="center" >订单编号</div>
				            <div field="memo" width="100" headerAlign="center" >订单备注说明</div>
				            <div field="orderreg" width="80" headerAlign="center" dateFormat="yyyy-MM-dd">订单登记日期</div>
				            <div field="orderdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd">订单签订日期</div>
				            <div field="orderprodmon" dataType="currency" width="90" headerAlign="center" >订单产品金额</div>
				            <div field="orderservmon" dataType="currency" width="90" headerAlign="center" >订单服务金额</div>
				            <div field="ordermon" dataType="currency" width="100" headerAlign="center" >合同订单金额</div>
				            <div field="thisprodmon" dataType="currency" width="90" headerAlign="center" cellCls="myIndex">本次产品收款金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="thisservmon" dataType="currency" width="90" headerAlign="center" cellCls="myIndex">本次服务收款金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="thismon" dataType="currency" width="105" headerAlign="center" >本次金额总和</div>
				        </div>
				    </div>
			    </div>
            </div>
        </fieldset>
    </form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk" id="okbutton" style="width:60px;margin-right:20px;">提交</a>
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
    var updateURL = "com.primeton.mis.contract.gathering.submitGathering.biz.ext";
	var saveURL = "";
    nui.parse();
    var processinstid = "<b:write property='workitem/processInstID'/>";
    var processinstname = "<b:write property='workitem/processInstName'/>";
    var activitydefid = "<b:write property='workitem/activityDefID'/>";
    var workitemid = "<b:write property='workitem/workItemID'/>";
    var workitemname = "<b:write property='workitem/workItemName'/>";
    SetData();
    function startUpload(succ){
		sf.startUpload(function(){
			if(succ){
				succ();
			}
		},function(){
			alert('文件上传失败！');
		});
	}
	function onGenderRenderer(e) {
        return nui.getDictText('MIS_AUDITSTATUS',e.value);
    }
	function onSYBRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    //设置业务字典值-当前收款状态类型
	function dictGetGatherType(e){
		return nui.getDictText('AME_GATHERSTATUS',e.value);
	}
	function dictGetGatherBillType(e){
		return nui.getDictText('MIS_GATHERBILL',e.value);
	}
	function onFileRenderer(e) {
        var tempSrc = "";
        for(var i=0;i<e.record.files.length;i++){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
        }
       	return tempSrc;
    }
	
	var cont_grid = nui.get("cont_grid");
	var sale_grid = nui.get("sale_grid");
	var prod_grid = nui.get("prod_grid");
	var order_grid = nui.get("order_grid");
	var gatherfc_grid = nui.get("gatherfc_grid");
	function addRow(gridid) {          
        var newRow = { name: "New Row" };
        var grid = nui.get(gridid);
        grid.addRow(newRow, 0);
    }
    function removeRow(gridid) {;
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
            grid.removeRows(rows, true);
        }
        if(gridid == "cont_grid"){
        	doCal();
        	doCal1();
        	doCal2();
        }
    }
    
    function doSubCal(e){
    	//var row = prod_grid.getSelected();
    	var row=e.record;
    	if(row){
    		if(row.thisprodmon != null && isNaN(row.thisprodmon)){
				alert("请输入实数！");
				var rowData = {thisprodmon: 0};
				prod_grid.updateRow(row,rowData);
				return;
			}
			var prodmon = 0;
			if(row.prodmon != null){
				prodmon = row.prodmon;
			}
			if(row.thisprodmon > prodmon){
				alert("本次产品收款金额不得大于产品金额！");
				var rowData = {thisprodmon: 0};
				prod_grid.updateRow(row,rowData);
				return;
			}
    	}
    	var datas = prod_grid.getData();
    	var sumprodmon = 0;//合同销售的本次收款产品金额之和
    	for(var i=0;i<datas.length;i++){
    		var thisprodmon = datas[i].thisprodmon;
			if(thisprodmon && !isNaN(thisprodmon)){
				sumprodmon += parseFloat(thisprodmon);
			}
    	}
    	var row = sale_grid.getSelected();
		var rowData = {thisprodmon: sumprodmon.toFixed(2)};
		sale_grid.updateRow(row,rowData);
		doCal();
    }
    
    function doCal(e){
		var row = sale_grid.getSelected();
		if(row){
			if(row.thisservmon != null && isNaN(row.thisservmon)){
				alert("请输入实数！");
				var rowData = {thisservmon: 0};
				sale_grid.updateRow(row,rowData);
				return;
			}
			var servmon = 0;
			if(row.servmon != null){
				servmon = row.servmon;
			}
			if(row.thisservmon > servmon){
				alert("本次服务收款金额不得大于服务金额！");
				var rowData = {thisservmon: 0};
				sale_grid.updateRow(row,rowData);
				return;
			}
		}
		var datas = sale_grid.getData();
		var sumprodmon = 0;//合同销售的本次收款产品金额之和
		var sumservmon = 0;//合同销售的本次收款服务金额之和
		var summon = 0;//合同的本次收款之和
		for(var i=0;i<datas.length;i++){
			var thisservmon = datas[i].thisservmon;
			var thisprodmon = datas[i].thisprodmon;			
			if(thisservmon && !isNaN(thisservmon)){
				summon += parseFloat(thisservmon);
			}		
			if(thisprodmon && !isNaN(thisprodmon)){
				summon += parseFloat(thisprodmon);
			}
		}
		var row = cont_grid.getSelected();
		var rowData = {summon: summon.toFixed(2)};
		cont_grid.updateRow(row,rowData);
		var datas=cont_grid.getData();
		var sumsummon = 0;
		for(var i=0;i<datas.length;i++){
			//本次收款金额总和
			var summon = datas[i].summon;
			if(summon){
				if(!isNaN(summon)){
					sumsummon += parseFloat(summon);
				}
			}
		}
		nui.get("summonTemp").setValue(sumsummon.toFixed(2));
	}
	
	function doCal1(e){
		var row = order_grid.getSelected();
		if(row){
			if(row.thisprodmon != null && isNaN(row.thisprodmon)){
				alert("本次产品收款金额请输入实数！");
				var rowData = {thisprodmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			if(row.thisservmon != null && isNaN(row.thisservmon)){
				alert("本次服务收款金额请输入实数！");
				var rowData = {thisservmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			var servmon = 0;
			var prodmon = 0;
			if(row.orderservmon != null){
				servmon = row.orderservmon;
			}
			if(row.orderprodmon != null){
				prodmon = row.orderprodmon;
			}
			if(row.thisservmon > servmon ){
				alert("本次服务收款金额不得大于服务金额！");
				var rowData = {thisservmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			if(row.thisprodmon > prodmon){
				alert("本次产品收款金额不得大于产品金额！");
				var rowData = {thisprodmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			var Thisservmon=0;
			var Thisprodmon=0;
			if(row.thisservmon){Thisservmon=parseFloat(row.thisservmon)}
			if(row.thisprodmon){Thisprodmon=parseFloat(row.thisprodmon)}
			var thismon=Thisservmon+Thisprodmon;
			var rowData = {thismon: parseFloat(thismon)};
			order_grid.updateRow(row,rowData);
		}
		var datas = order_grid.getData();
		var sumprodmon = 0;//合同订单的本次收款产品金额之和
		var sumservmon = 0;//合同订单的本次收款服务金额之和
		var summon = 0;//合同订单的本次收款之和
		for(var i=0;i<datas.length;i++){
			var thisservmon = datas[i].thisservmon;
			var thisprodmon = datas[i].thisprodmon;			
			if(thisservmon && !isNaN(thisservmon)){
				summon += parseFloat(thisservmon);
			}		
			if(thisprodmon && !isNaN(thisprodmon)){
				summon += parseFloat(thisprodmon);
			}
		}
		var row = cont_grid.getSelected();
		var rowData = {summono: summon.toFixed(2)};
		cont_grid.updateRow(row,rowData);
		var datas=cont_grid.getData();
		var sumsummon = 0;
		for(var i=0;i<datas.length;i++){
			//本次收款金额总和
			var summono = datas[i].summono;
			if(summono){
				if(!isNaN(summono)){
					sumsummon += parseFloat(summono);
				}
			}
		}
		nui.get("summonOrder").setValue(sumsummon.toFixed(2));
	}
	
	//收款确认记录调用的方法
	function doCal2(e){
		var row = e.record;
		if(row){
			if(row.actproductsum != null && isNaN(row.actproductsum)){
				alert("本次实际产品额（含税）请输入实数！");
				var rowData = {actproductsum: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			if(row.actservicesum != null && isNaN(row.actservicesum)){
				alert("本次实际服务额（含税）请输入实数！");
				var rowData = {actservicesum: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			if(row.confirmday == null || row.confirmday ==""){
				var myDate = nui.get("confirmday").getValue();
				var rowData = {confirmday: myDate};
				gatherfc_grid.updateRow(row,rowData);
			}
			if(row.maconfirmday == null || row.maconfirmday ==""){
				var myDate = nui.get("gatherdate").getValue();
				var rowData = {maconfirmday: myDate};
				gatherfc_grid.updateRow(row,rowData);
			}
			if(row.productrate != null && isNaN(row.productrate)){
				alert("本次产品税率请输入实数！");
				var rowData = {productrate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.productrate<=0){
				alert("本次产品税率请大于 0 ！");
				var rowData = {productrate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.productrate>=1){
				alert("本次产品税率请小于 1 ！");
				var rowData = {productrate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			if(row.servicerate != null && isNaN(row.servicerate)){
				alert("本次服务税率请输入实数！");
				var rowData = {servicerate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.servicerate<=0){
				alert("本次服务税率请大于 0 ！");
				var rowData = {servicerate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.servicerate>=1){
				alert("本次服务税率请小于 1 ！");
				var rowData = {servicerate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			
			var actproductsum = 0;
			var actservicesum = 0;
			var productrate = 0;
			var servicerate = 0;
			if(row.actproductsum){actproductsum=parseFloat(row.actproductsum)}
			if(row.actservicesum){actservicesum=parseFloat(row.actservicesum)}
			if(row.productrate){productrate=parseFloat(row.productrate)}
			if(row.servicerate){servicerate=parseFloat(row.servicerate)}
			var actsum=actproductsum+actservicesum;
			var actproductsum2=actproductsum/(1+productrate);
			var actservicesum2=actservicesum/(1+servicerate);
			var actsum2=actproductsum2+actservicesum2;
			var rowc = cont_grid.getSelected();
			var fcreverate = actsum/rowc.csContract.contsum;
			var rowData = {actsum: parseFloat(actsum),
			               actproductsum2: parseFloat(actproductsum2),
			               actservicesum2:parseFloat(actservicesum2),
			               actsum2:parseFloat(actsum2),
			               actsum3:parseFloat(actsum2),
			               fcreverate:parseFloat(fcreverate)};
			gatherfc_grid.updateRow(row,rowData);
		}
		
		var datas = gatherfc_grid.getData();
		var actproductsums = 0;//收款明细本次收款实际产品金额之和
		var actservicesums = 0;//收款明细本次收款实际服务金额之和
		var actsums = 0;//收款明细本次实际收款之和
		for(var i=0;i<datas.length;i++){
			var actservicesums = datas[i].actservicesum;
			var actproductsums = datas[i].actproductsum;	
			var status = datas[i].status;
			if(actservicesums && !isNaN(actservicesums) && (status=='0')){
				actsums += parseFloat(actservicesums);
			}		
			if(actproductsums && !isNaN(actproductsums) && (status=='0')){
				actsums += parseFloat(actproductsums);
			}
		}
		var row = cont_grid.getSelected();
		var rowData = {summong: actsums.toFixed(2)};
		cont_grid.updateRow(row,rowData);
		var datas=cont_grid.getData();
		var sumsummon = 0;
		for(var i=0;i<datas.length;i++){
			//本次收款金额总和
			var summong = datas[i].summong;
			if(summong ){
				if(!isNaN(summong)){
					sumsummon += parseFloat(summong);
				}
			}
		}
		nui.get("summonGather").setValue(sumsummon.toFixed(2));
	}
	
	//点击保存时调用的方法
	var form = new nui.Form("form1");
	function SaveData() {
		var datas = cont_grid.getData(); 
		
		if(datas.length == 0){
			nui.alert("收款至少对应一条合同数据！","对应合同");
        	return;
		}
		var isHaveContNum = true;
		var isHaveMon = true;
		var isHaveMonno=true;
		var isHaveMonga=true;
		var isEqual=true;
		
		for(var i=0;i<datas.length;i++){
			var temp111 = datas[i].csContract;
			if(temp111 == null || temp111 == ""){
				isHaveContNum = false;
			}else{
				var contnum = datas[i].csContract.contnum;
				if(contnum == null || contnum == ""){
					isHaveContNum = false;
				}
			}
			var summon = datas[i].summon;
			if(summon ==null || summon == ""){
				isHaveMon = false;
			}
			var summono = datas[i].summono;
			if(summono ==null || summono == ""){
				isHaveMonno = false;
			}
			var summong = datas[i].summong;
			if(summong ==null || summong == ""){
				isHaveMonga = false;
			}
			if(parseFloat(summon) != parseFloat(summono) || parseFloat(summon) != parseFloat(summong) || parseFloat(summono) != parseFloat(summong)){
			    isEqual = false;
		   }
		}
		
    	if(isHaveContNum == false){
    		nui.alert("收款对应的合同必选！","请选择合同");
    		return;
    	}
    	if(isHaveMon == false){
    		nui.alert("本次销售收款金额必填！","请输入本次销售收款金额");
    		return;
    	}
    	if(isHaveMonno == false){
    		nui.alert("本次订单收款金额必填！","请输本次订单收款金额");
    		return;
    	}
    	if(isHaveMonga == false){
    		nui.alert("本次收款确认记录实际收款金额(含税)必填！","请输入本次收款确认记录实际收款金额(含税)");
    		return;
    	}
    	if(isEqual == false){
    		nui.alert("合同的'本次销售收款金额'、'本次订单收款金额'与'本次实际收款额(含税)'的值不等！","请检查");
		    return;
    	}
    	
    	var summon = nui.get("summon").getValue();
    	var summonTemp = nui.get("summonTemp").getValue();
    	var summonOrder = nui.get("summonOrder").getValue();
    	var summonGather = nui.get("summonGather").getValue();
    	if(parseFloat(summon) != parseFloat(summonTemp)){
    		nui.alert("收款金额与本次销售收款金额之和不等！","请检查本次销售收款金额");
    		return;
    	}
    	if(parseFloat(summon) != parseFloat(summonOrder)){
    		nui.alert("收款金额与本次订单收款金额之和不等！","请检查本次订单收款金额");
    		return;
    	}
    	if(parseFloat(summon) != parseFloat(summonGather)){
    		nui.alert("收款金额与本次收款确认记录实际收款金额(含税)之和不等！","请检查本次收款确认记录实际收款金额(含税)");
    		return;
    	}
        var o = form.getData();        
        var row = sale_grid.getSelected();
        if(row){
        	var datas = prod_grid.getData();
        	row.saleProds = datas;
        }
        //补上
		var row2 = cont_grid.getSelected();
        if(row2){
        	var datas = sale_grid.getData();
        	var datao = order_grid.getData();
        	var datag = gatherfc_grid.getData();
        	row2.csContract.sales = datas;
        	row2.csContract.order = datao;
        	row2.csContract.gatherfc = datag;
        }
        
        o.csGather.csGatherConts = cont_grid.getData();
        if(!form.validate()){
        	nui.alert("信息录入不完整！");
        	return;
        }
		saveURL = updateURL;
        var json = nui.encode(o);
        nui.get("okbutton").disable();
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var actionJson = nui.decode(text);
				if(text.exception == null){
					if(text.result == null || text.result == "")
	            	{
		            	 nui.alert("提交成功,已短信通知对应的销售。",null,function(){
		                	CloseWindow("ok");
	                });
	            	}
	            	else
	            	{
		            	nui.alert("提交成功,但"+text.result+"请提醒对应的销售。",null,function(){
		                	CloseWindow("ok");
	                });
	            	}
	                //CloseWindow("ok");
				}
				else{
					nui.alert("保存失败，请联系信息技术部人员！",null,function(){
		                	//CloseWindow("ok");
		                	nui.get("okbutton").enable();
	                });
				}
            	
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
	//页面进入时调用的方法
    function SetData(data) {
        promptInit({"workItemID": workitemid,"processDefName":"com.primeton.mis.contract.gatheringConfirm","activityDefID":"manualActivity1"});
        var json = nui.encode({csGather:{processinstid:processinstid}});
        nui.ajax({
            url: "com.primeton.mis.contract.gathering.getGathering.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                form.setChanged(false);
                cont_grid.setData(o.csGather.csGathConts);
           		nui.get("processinstid").setValue(processinstid);
               	nui.get("processinstname").setValue(processinstname);
               	nui.get("activitydefid").setValue(activitydefid);
               	nui.get("workitemid").setValue(workitemid);
               	nui.get("workitemname").setValue(workitemname);               	
               	nui.get("isshow").setValue("1");             	
               	nui.get("auditstatus").setValue("1");
               	nui.get("kmbm").setValue(o.csGather.kmbm);
               	nui.get("kmbm").setText(o.csGather.kmbmname);
            }
        });
	}
    function GetData() {
        var o = form.getData();
        return o;
    }
    function CloseWindow(action) {            
        if (action == "cancel" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onOk(e) {
        if(!form.validate()){
        	return;
        }else{
        	//startUpload(SaveData);
        	SaveData();
	    }
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
 	//“签署单位”清除时的方法
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
    //“合同存档编号”点击选择时的方法
    function onButtonEdit1(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/contract/contract_lookup.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:"<%=contextPath%>"+lookupUrl,
			title: "选择列表",
			width: 1150,
			height: 500,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();   //必须
					if (data) {
						var gatherid = nui.get("gatherid").getValue();
						btnEdit.setText(data.text);
						var json = nui.encode({gatherid: gatherid,contractid: data.id,contnum: data.text});
				        nui.ajax({
				            url: "com.primeton.mis.contract.gathering.querySalesByContractidAndGather.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {				            	
								var row = cont_grid.getSelected();
		                    	btnEdit.setValue(data.text);
		                    	//alert(nui.encode(o.data1));
		                    	var rowData = {csContract :{contractid: data.id, contnum: data.text, projectname: data.projectname, contsum: data.contsum, sales: o.data, order: o.data1, gatherfc: o.data2}};
		                    	cont_grid.updateRow(row,rowData);
				            }
				        });
					}
				}
			}
		});
	}
    var detailGrid_Form1 = document.getElementById("detailGrid_Form1");
    var detailGrid_Form2 = document.getElementById("detailGrid_Form2");
	var currentRow=null;
	var currentRow2=null;
	//合同点开对应的销售子grid时的方法
	function onShowRowDetail1(e) {
        var grid = e.sender;
        var row = e.record;
        if(row.csContract == null || row.csContract.contractid == null || row.csContract.contractid == ""){
        	alert("请先选择合同！");
        	return;
        }else{
        	if(currentRow){//如果有当前行
	        	var datas = sale_grid.getData();
	        	var datao = order_grid.getData();
	        	var datag = gatherfc_grid.getData();
	        	currentRow.csContract.sales = datas;
	        	currentRow.csContract.order = datao;
	        	currentRow.csContract.gatherfc = datag;
	        }
			currentRow=row;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_Form1);
	        var sales = row.csContract.sales;
	        var order = row.csContract.order;
	        var gatherfc = row.csContract.gatherfc;
	        if(sales){
	            sales = nui.decode(sales);
	            sale_grid.setData(sales);
	        }else{
				sale_grid.setData({});
				row.sales = {};
			}
			if(order){
	            order = nui.decode(order);
	            order_grid.setData(order);
	        }else{
				order_grid.setData({});
				row.order = {};
			}
			if(gatherfc){
	            gatherfc = nui.decode(gatherfc);
	            gatherfc_grid.setData(gatherfc);
	        }else{
				gatherfc_grid.setData({});
				row.gatherfc = {};
			}
			$('#detailGrid_Form1').show();
		}
	}
	//销售人员点开对应的产品子grid时的方法
	function onShowRowDetail2(e) {
        var grid = e.sender;
        var row = e.record; 
        if(currentRow2){//如果有当前行
        	var datas = prod_grid.getData();
        	currentRow2.saleProds = datas;
        }
		currentRow2=row;
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form2);
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            prod_grid.setData(saleProds);
        }else{
			prod_grid.setData({});
			row.saleProds = {};
		}
		$('#detailGrid_Form2').show();
	}
	
	function onrowclick(e){
		if(e.record.status=="1" || e.record.status=="2"||e.record.status=="3" || e.record.status=="4"||e.record.status=="5"){
			gatherfc_grid.setAllowCellEdit(false);
		}
		else{
		    gatherfc_grid.setAllowCellEdit(true);
		}
	}
</script>
</body>
</html>