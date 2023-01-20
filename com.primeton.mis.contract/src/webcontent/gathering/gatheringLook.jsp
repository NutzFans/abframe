<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收款确认信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
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
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
<div class="nui-fit">
  <form id="form1" method="post" >
        <input name="csGather.gatherid" id="gatherid" class="nui-hidden" />
        <input name="csGather.processinstid" id="processinstid" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款确认</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;">
            	 <tr>
                    <td style="width:110px;">支付单位：</td>
                    <td style="width:200px;" id="csGather.misCustinfo.custname"></td>
	                <td style="width:110px;">实际收款日期：</td>
	                <td style="width:200px;" id="csGather.gatherdate"></td>
                    <td style="width:140px;">收款金额：</td>
                    <td style="width:200px;" id="csGather.summon"></td>
                </tr>
                <tr>
                    <td style="width:110px;">收款操作人：</td>
                    <td style="width:200px;" id="csGather.username"></td>
	                <td style="width:110px;">收款操作日期：</td>
	                <td style="width:200px;" id="csGather.optime"></td>
                    <td style="width:140px;">收款方式：</td>
                    <td style="width:200px;" id="csGather.gathertype"></td>
                </tr>
                <tr>
                	<td style="width:110px;">总账科目：</td>
                    <td style="width:200px;" id="csGather.kmbm"></td>
	                <td style="width:110px;">财报收款日期：</td>
	                <td style="width:200px;" id="csGather.confirmday"></td>
                </tr>
            </table>
        </div>
        </fieldset>      
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款对应合同</legend>
            <div style="padding:5px;">
	        	<div id="cont_grid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" onshowrowdetail="onShowRowDetail1"
			        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">
			            <div type="expandcolumn">#</div>
			            <div field="csContract.contractid" width="0" headerAlign="center" >合同ID</div>
			            <div field="csContract.contnum" renderer="onTitle1Renderer" width="80" headerAlign="center" align="center">合同存档编号</div>
			            <div field="csContract.projectname" width="211" headerAlign="center" >合同名称（项目）</div>
			            <div field="csContract.contsum" dataType="currency" currencyUnit="￥" width="80" headerAlign="center" align="right">合同总金额</div>
			            <div field="summon" dataType="currency" currencyUnit="￥" width="80" headerAlign="center" align="right">本次收款金额</div>
			        </div>
			    </div>
			    <div id="detailGrid_Form1" style="display:none;">
				    <div id="sale_grid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" idField="contsaleid"
				        onshowrowdetail="onShowRowDetail2" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div type="expandcolumn">#</div>
				            <div field="saleid" width="45" headerAlign="center" >销售ID</div>
				            <div field="salename" width="45" headerAlign="center" >销售姓名</div>
				            <div field="org" width="70" headerAlign="center" renderer="onSYBRenderer">销售所属事业部</div>
				            <div field="contsum" dataType="currency" currencyUnit="￥" width="70" headerAlign="center" align="right">合同总金额</div>
				            <div field="prodmon" dataType="currency" currencyUnit="￥" width="68" headerAlign="center" align="right">产品金额</div>
				            <div field="servmon" dataType="currency" currencyUnit="￥" width="68" headerAlign="center" align="right">服务金额</div>
				            <div field="thisservmon" dataType="currency" currencyUnit="￥" width="70" headerAlign="center" align="right">本次服务收款金额</div>
				        </div>
				    </div>
				    <div id="detailGrid_Form2" style="display:none;">
				        <div id="prod_grid" class="nui-datagrid" style="width:99%;height:auto;" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
				            <div property="columns">
				                <div field="prod_name" width="210" headerAlign="center">产品名称</div>
				                <div field="price" dataType="currency" currencyUnit="￥" width="100" headerAlign="center" align="right">产品单价</div>
				                <div field="prodmon" dataType="currency" currencyUnit="￥" width="100" headerAlign="center" align="right">产品金额</div>
				                <div field="prodsubmon" dataType="currency" currencyUnit="￥" width="100" headerAlign="center" align="right">产品分包金额</div>
				                <div field="othmon" dataType="currency" currencyUnit="￥" width="100" headerAlign="center" align="right">产品服务费</div>
				                <div field="netprodmon" dataType="currency" currencyUnit="￥" width="100" headerAlign="center" align="right">产品净额</div>
					            <div field="thisprodmon" dataType="currency" currencyUnit="￥" width="100" headerAlign="center" align="right">本次产品收款金额</div>
				            </div>
				        </div>    
				    </div>
				    <div id="order_grid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" oncellendedit="doCal1" idField="contorderid"
				        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div field="contorderno" width="50" headerAlign="center" >订单编号</div>
				            <div field="memo" width="50" headerAlign="center" >订单备注说明</div>
				            <div field="orderreg" width="50" headerAlign="center" dateFormat="yyyy-MM-dd">订单登记日期</div>
				            <div field="orderdate" width="50" headerAlign="center" dateFormat="yyyy-MM-dd">订单签订日期</div>
				            <div field="orderprodmon" dataType="currency" width="63" headerAlign="center" >订单产品金额</div>
				            <div field="orderservmon" dataType="currency" width="63" headerAlign="center" >订单服务金额</div>
				            <div field="ordermon" dataType="currency" width="65" headerAlign="center" >合同订单金额</div>
				            <div field="thisprodmon" dataType="currency" width="70" headerAlign="center" >本次产品收款金额</div>
				            <div field="thisservmon" dataType="currency" width="70" headerAlign="center" >本次服务收款金额 </div>
				            <div field="thismon" dataType="currency" width="70" headerAlign="center" >本次金额总和 </div>
				        </div>
				    </div>
				    <!-- 合同收款纪录 -->
				    <div id="gatherfc_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" oncellendedit="doCal2" idField="gatherid"
				        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
				        editNextOnEnterKey="true" onrowclick="onrowclick">			        
				        <div property="columns">            
				            <div field="gatherno" width="40" headerAlign="center" >次数</div>
				            <div field="newyearmonth" width="63" headerAlign="center" >最新年月</div>
				            <div field="status" width="45" headerAlign="center" renderer="dictGetGatherType">状态</div>
				            <div field="billdate" width="82" headerAlign="center" dateFormat="yyyy-MM-dd">开票日期</div>
				            <div field="productsum" dataType="currency" width="70" headerAlign="center" >预计产品额</div>
				            <div field="servicesum" dataType="currency" width="70" headerAlign="center" >预计服务额</div>
				            <div field="fcsum" dataType="currency" width="70" headerAlign="center" >预计金额</div>
				            <div field="confirmday" width="97" headerAlign="center" dateFormat="yyyy-MM-dd">实际收款日期
				                <input property="editor" class="nui-datepicker" style="width:100%;"/>
				            </div>
				            <div field="actproductsum" dataType="currency" width="100" headerAlign="center" >实际产品额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actservicesum" dataType="currency" width="100" headerAlign="center" >实际服务额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actsum" dataType="currency" width="90" headerAlign="center" >实际金额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="productrate" dataType="currency" width="55" headerAlign="center" >产品税率
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="servicerate" dataType="currency" width="55" headerAlign="center" >服务税率
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				             <div field="actproductsum2" dataType="currency" width="112" headerAlign="center" >实际产品额(不含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actservicesum2" dataType="currency" width="112" headerAlign="center" >实际服务额(不含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actsum2" dataType="currency" width="105" headerAlign="center" >实际金额(不含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				        </div>
				    </div>
			    </div>
            </div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>核销应收</legend>
            	<div id="datagrid" class="nui-datagrid" style="width:100%;height:auto;" showPager="false">
				    <div property="columns">
				        <div field="contnum" width="60" renderer="onTitle2Renderer" headerAlign="center" allowSort="true">合同存档编号</div>
				        <div field="custname" width="200" headerAlign="center" allowSort="true">签署单位</div>
				        <div field="projectname"" width="180" align="left" headerAlign="center" allowSort="true">合同名称（项目）</div>
				        <div field="salename"" width="51" align="left" headerAlign="center" allowSort="true">销售姓名</div>
				        <div field="confmon" width="70" headerAlign="center" allowSort="true" dataType="currency" currencyUnit="￥" summaryType="sum" align="right">应收金额</div>
				        <div field="optime" width="60" headerAlign="center" allowSort="true" align="center">应收账龄起始日</div>
				        <%--<div field="csContractRec.rectype"" width="40" renderer="onRecTypeRenderer" align="center" headerAlign="center" allowSort="true">应收来源</div>
				        <div field="csContractRec.billid" width="50" renderer="onTitleRenderer" headerAlign="center" allowSort="true">对应开票ID</div>
				        <div field="csContractRec.billtype1" width="50" renderer="onGender1Renderer" headerAlign="center" allowSort="true">开票类型</div>--%>
					    <div field="recmon" width="60" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true">本次核销金额</div>
					    <div field="rectime" width="60" headerAlign="center" allowSort="true" align="center">应收核销时间</div>
				    </div>
				</div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>审批意见列表</legend>
            	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.mis.contract.contractApply.queryAuditOpinions.biz.ext"  idField="id" allowResize="true" showPager="false">
				    <div property="columns">
				        <div field="operatorname" width="40" headerAlign="center" allowSort="true">审批人</div>
				        <div field="orgname" width="80" align="right" headerAlign="center" allowSort="true">审批人所在机构</div>
				        <div field="time" width="90" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss">审批时间</div>
				        <div field="workitemname" width="80" align="right" headerAlign="center" allowSort="true">审批环节</div>
				        <div field="auditstatus" renderer="onGenderRenderer" width="40" align="right" headerAlign="center" allowSort="true">审批结果</div>
				        <div field="auditopinion" width="160" headerAlign="center">审批意见</div>
				        <div field="files" renderer="onFileRenderer" width="160" headerAlign="center">附件</div>
				    </div>
				</div>
        </fieldset>
    </form>
</div>
<script type="text/javascript">
    nui.parse();
    var gatherid = '<%=request.getParameter("gatherid") %>';
	SetData();
	var dept_grid = nui.get("datagrid");
	var cont_grid = nui.get("cont_grid");
	var sale_grid = nui.get("sale_grid");
	var prod_grid = nui.get("prod_grid");
	var order_grid = nui.get("order_grid");
	var gatherfc_grid = nui.get("gatherfc_grid");
	var grid = nui.get("datagrid1");	
	function onGenderRenderer(e) {
        return nui.getDictText('MIS_AUDITSTATUS',e.value);
    }
	function onGender1Renderer(e) {
        return nui.getDictText('CS_BILLTYPE',e.value);
    }
	function onSYBRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function onTitleRenderer(e) {
    	if(e.value != null && e.value != ""){
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看开票信息'>" + e.value + "</a>";
		}
	}
    function onTitle1Renderer(e) {
		return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看合同信息'>" + e.value + "</a>";
	}
    function onTitle2Renderer(e) {
		return "<a href='javascript:void(0)' onclick='doView2();' title='点击查看合同信息'>" + e.value + "</a>";
	}
	function doView(){
		var selectRow = dept_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条开票数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/bill/billApplyView.jsp?billid=" + selectRow.csContractRec.billid;
		window.open(executeUrl, "开票信息查看", "fullscreen=1");
	}
	function doView1(){
		var selectRow = cont_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.csContract.contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
	}
	function doView2(){
		var selectRow = dept_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.csContractRec.contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
	}
	function onFileRenderer(e) {
        var tempSrc = "";
        for(var i=0;i<e.record.files.length;i++){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
        }
       	return tempSrc;
    }
	//页面进入时调用的方法
	var form = new nui.Form("form1");
    function SetData() {
		var json = nui.encode({csGather:{processinstid: <%=processInstID %>}});
        nui.ajax({
            url: "com.primeton.mis.contract.gathering.getGathering.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                form.setChanged(false);
                document.getElementById("csGather.misCustinfo.custname").innerHTML = o.csGather.misCustinfo.custname;
                document.getElementById("csGather.gatherdate").innerHTML = o.csGather.gatherdate;
                document.getElementById("csGather.summon").innerHTML = formatNumber(o.csGather.summon.toFixed(2),'#,##.00');
                document.getElementById("csGather.username").innerHTML = o.csGather.username;
                document.getElementById("csGather.optime").innerHTML = o.csGather.optime;
                document.getElementById("csGather.confirmday").innerHTML = o.csGather.confirmday;
                document.getElementById("csGather.gathertype").innerHTML = nui.getDictText('AME_CSGATHERTYPE', o.csGather.gathertype);
                document.getElementById("csGather.kmbm").innerHTML = o.csGather.kmbm;
                if(o.csGather.kmbm != '' && o.csGather.kmbm!=null){
	                var json = ({"criteria":{"_expr[0]":{"kmbm":o.csGather.kmbm}}});
					nui.ajax({
			            url: "com.primeton.ame.ledger.equivalent.getkmbmbyseq.biz.ext",
						type: 'POST',
						data: json,	
		                async:false,
						contentType: 'text/json',
			            success: function (o) {
			            	if(o.kmbms != null && o.kmbms != ''){
				                document.getElementById("csGather.kmbm").innerHTML = o.kmbms[0].kmbmname;
			                }else{
					             document.getElementById("csGather.kmbm").innerHTML = '';
			                }
			            }
			        });
		        }
	                
                dept_grid.setData(o.csGather.csGathIncomes);
                cont_grid.setData(o.csGather.csGathConts);
               	var processinstid = o.csGather.processinstid;
               	if(processinstid){
               		nui.get("processinstid").setValue(processinstid);
               		grid.load({processInstID:processinstid});
					grid.sortBy("time", "desc");
           		}else{
               		nui.get("viewProcess").setEnabled(false);
               	}
            }
        });
	}
    function onRecTypeRenderer(e){
    	return nui.getDictText('CS_RECFROM',e.value);
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
    function onCancel(e) {
        CloseWindow("cancel");
    }
    function onViewProcess(e) {
    	var url = "<%=request.getContextPath() %>/bps/wfclient/task/taskView.jsp?processInstID=" + nui.get("processinstid").getValue();
    	var title = "流程信息 ";
    	var width=1000;
    	nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData(row);
				}	
			},
			ondestroy: function (action){
			}
			});
	}
    function onUpdate(e){
    	var incomeyear = nui.get("incomeyear").getValue();
    	var gatherid = nui.get("gatherid").getValue();
    	if(incomeyear == ""){
    		alert("“收款对应的收入年份”不能为空！");
    		return;
    	}else if(!/^\d{4}$/.test(incomeyear)){
    		alert("请输入正确的“收款对应的收入年份”！");
    		return;
    	}else{
    		var json = nui.encode({csGather:{gatherid: gatherid, isstart: 0, incomeyear: incomeyear}});
    		nui.ajax({
            url: "com.primeton.mis.contract.gathering.updateGathering.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	alert("更新成功！");
            }
        });
    	}
    }
    var detailGrid_Form1 = document.getElementById("detailGrid_Form1");
    var detailGrid_Form2 = document.getElementById("detailGrid_Form2");
	//合同点开对应的销售子grid时的方法
	function onShowRowDetail1(e) {
        var grid = e.sender;
        var row = e.record;
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form1);
        var sales = row.csContract.sales;
        if(sales){
            sales = nui.decode(sales);
            sale_grid.setData(sales);
        }else{
			sale_grid.setData({});
			row.sales = {};
		}
		var order = row.csContract.orders;
		if(order){
            order = nui.decode(order);
            order_grid.setData(order);
        }else{
			order_grid.setData({});
			row.order = {};
		}
		var gatherfc = row.csContract.gatherfcs;
		if(order){
            gatherfc = nui.decode(gatherfc);
            gatherfc_grid.setData(gatherfc);
        }else{
			gatherfc_grid.setData({});
			row.gatherfc = {};
		}
		$('#detailGrid_Form1').show();
	}
	//销售人员点开对应的产品子grid时的方法
	function onShowRowDetail2(e) {
        var grid = e.sender;
        var row = e.record;
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
	 //设置业务字典值-当前收款状态类型
	function dictGetGatherType(e){
		return nui.getDictText('AME_GATHERSTATUS',e.value);
	}
</script>
</body>
</html>