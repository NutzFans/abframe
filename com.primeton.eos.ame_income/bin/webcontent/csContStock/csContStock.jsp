<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>合同收入成本记录查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="合同收入成本记录查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
					    <td align="right"><span>财务年月：</span></td><!-- 查询实体拼接的yearmonth -->
		            	<td align="left">
						    <input class="nui-monthpicker" name="criteria._expr[0]._min" style="width:100px" format="yyyyMM" id="minyearmonth" />-<input class="nui-monthpicker" name="criteria._expr[0]._max" style="width:100px" format="yyyyMM" id="maxyearmonth"/>
					        <input class="nui-hidden" name="criteria._expr[0]._property" value="yearmonth"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
						</td>
		            	<td align="right"><span>客户简称：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[1].custjc" />
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
					    </td>
					    <td align="right"><span>合同名称：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[2]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="projectname"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					    </td>
						<td align="right"><span>合同编号：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[3]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>受益销售：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[4]._value" id="salename"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="salename"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>事业部：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="org" name="criteria._expr[5]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="" allowinput="true"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._property" value="org"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>状态 ：</span></td>
					    <td align="left">
					        <input class="nui-dictcombobox" name="criteria._expr[6]._value" dictTypeId="AME_CONTSTOCKSTATUS" showNullItem="true" nullItemText=""/>
			            	<input class="nui-hidden" name="criteria._expr[6]._property" value="status"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
						</td>
						<td align="right"><span>是否需要转换的项目合同 ：</span></td>
					    <td align="left">
			            	<input class="nui-dictcombobox" dictTypeId="MIS_YN" showNullItem="true" nullItemText="" id = "isconverse"/>
			            	<input class="nui-hidden" name="criteria._expr[7]._property" value="contnum1"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" id="ops" />
					         <input class="nui-hidden" name="criteria._expr[7]._value" id="contnum1" />
						</td>		
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                            <a class="nui-button" onclick="exportCsContStock" iconCls="icon-download" style="width:160px;" id="exportButton">导出合同收入成本记录</a>
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		              <tr>
		                  <td style="width:100%;">
				            <a class="nui-button" id="addCsCont" iconCls="icon-add" onclick="addCsCont()">新增</a>
				            <a class="nui-button" id="editCsCont" iconCls="icon-edit" onclick="editCsCont()">修改</a>
			                <a class="nui-button" id="removeBtn" iconCls="icon-remove" onclick="remove()">删除</a>
		                  	 <a class="nui-button" iconCls="icon-gd" onclick="sureFileData()">归档</a>
							 <a class="nui-button" iconCls="icon-ok" onclick="sureAuditData()">审计</a>
							 <a class="nui-button" iconCls="icon-collapse" onclick="costHandling">人工成本归集处理</a>
							 <a class="nui-button" iconCls="icon-gj" onclick="costPurchase">采购成本归集处理</a>
							 <a class="nui-button" iconCls="icon-converse" onclick="costConversion">项目已签合同的转换</a>
							 <a class="nui-button" iconCls="icon-jz" onclick="stockjz">成本结转或进存货</a>
							 <a class="nui-button" iconCls="icon-node" onclick="stockcs">存货减值测试</a>
		                  </td>
		              </tr>
		         </table>
		</div>		
	    <div id="contStock_grid" class="nui-datagrid" style="width:auto;height:335px;" allowResize="true" dataField="csContStocks" url="com.primeton.eos.ame_income.csContStock.queryCsContStock.biz.ext"
	    	 sizeList="[10,20,50,100,1000]"  idField="appid" multiSelect="true" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="7" ondrawcell="drawrow" ondrawsummarycell="onDrawSummaryCell">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div field="yearmonth" width="55" headerAlign="center" align="center" renderer="onYearMonthrenderer">财务年月</div>
				<div field="org" width="95" renderer="dictOrgRenderer" headerAlign="center" allowSort="true" >事业部</div>
		        <div field="salename" width="55" headerAlign="center" allowSort="true">受益销售</div>
		        <div field="custjc" width="70" headerAlign="center" allowSort="true">客户简称</div>
				<div field="contnum" width="75" renderer="onContnumRenderer" headerAlign="center" allowSort="true" >合同编号</div>
				<div field="contnum1" visible="false"></div>
		        <div field="projectname" width="140" headerAlign="center">合同项目名称</div>
		        <div field="status" align="center" width="60" headerAlign="center" allowSort="true" renderer="dictStatusRenderer">状态</div>
		        
		        <!-- 不含税 -->
		        <div field="incomeProdNet" width="100" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认产品额(不含税)</div>
		        <div field="incomeServNet" width="100" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认服务额(不含税)</div>
		        <div field="incomeMaNet" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认MA额(不含税)</div>
		        <div field="incomeNet" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认总额(不含税)</div>
		        
		        <!-- 含税 -->
		        <div field="incomeProd" width="100" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认产品额(含税)</div>
		        <div field="incomeServ" width="100" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认服务额(含税)</div>
		        <div field="incomeMa" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认MA额(含税)</div>
		        <div field="income" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">收入确认总额(含税)</div>
		        
		        <div field="scfyRg" width="110" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月生产成本-人工</div>
		        <div field="scfyWb" width="110" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月生产成本-采购</div>
		        <div field="scfyBx" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月生产成本-直接费用</div>
		        <div field="scfyDyze" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月生产成本-当月总额</div><!-- 计算 -->
		        <div field="scfy" width="95" headerAlign="center" align="right" dataType="currency" summaryType="sum">生产成本余额</div><!-- 累计 -->
		        
		        <div field="cbjzRg" width="110" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月成本结转-人工</div>
		        <div field="cbjzWb" width="110" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月成本结转-采购</div>
		        <div field="cbjzBx" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月成本结转-直接费用</div>
		        <div field="cbjz" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月成本结转-当月结转额</div>
		        
		        
		        <div field="stockRg" width="120" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月存货余额-人工</div>
		        <div field="stockWb" width="120" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月存货余额-采购</div>
		        <div field="stockBx" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月存货余额-直接费用</div>
		        <div field="stock" width="160" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月存货余额-当月余额总计</div>
		        
		        <div field="stockJz" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月存货减值</div>
		        <div field="stockNet" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">当月存货净值</div>
		        <div field="stockJzAll" width="90" headerAlign="center" align="right" dataType="currency" summaryType="sum">累计减值</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	/**供应商查询*/
	var form = new nui.Form("#form1");
	nui.parse();
	var contStock_grid = nui.get("contStock_grid");
	init();
	function init(){
		//初始化事业部
		nui.ajax({
            url: "com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
            type: "post",
            cache: false,
            contentType: 'text/json',
            success: function (text) {
				//除了PMO都能查到事业部，PMO为0
	    		if(text.syb.length > 0){
	    			//禁用按钮
	    			//nui.get("addBtn").disable();
    				var sybdata = [];
    				for(var i = 0;i < text.syb.length;i ++){
    					sybdata[i] = {"dictID": text.syb[i].dictid,"dictName": text.syb[i].dictname};
    				}
    				nui.get("org").setData(sybdata);
    				if(text.syb.length==1){
    					nui.get("org").setValue(sybdata[0].dictID);
	    				nui.get("org").setText(sybdata[0].dictName);
	    				//如果只有一个事业部,不显示nullitem，默认选择自己的事业部
	    				nui.get("org").setShowNullItem(false);
    					nui.get("org").select(0);
						var data = form.getData();
						data.criteria._expr[0]._min = nui.get("minyearmonth").getText();
						data.criteria._expr[0]._max = nui.get("maxyearmonth").getText();
					  	contStock_grid.load(data); 
						contStock_grid.sortBy("contnum","desc");
	    				return;
    				}else {//如果有多个事业部,不显示nullitem，默认查询两个事业部所有订单
    					nui.get("org").setShowNullItem(false);
    					nui.get("org").select(0);
						var data = form.getData();
					  	contStock_grid.load(data); 
						contStock_grid.sortBy("contnum","desc");
	    				return;
    				}
				}else{
					//PMO权限,默认展示全部
					var data = form.getData(); //获取表单JS对象数据
				  	contStock_grid.load(data); 
					contStock_grid.sortBy("contnum","desc");
				}
            },
            error: function () {
            }
       	});
	}
    
	function search() {
		var isconverse = nui.get("isconverse").getValue();
		if(isconverse=="1"){
			nui.get("ops").setValue("notnull");
		}else if(isconverse=="0"){
			nui.get("ops").setValue("null");
		}else{
			nui.get("ops").setValue("=");
			nui.get("contnum1").setValue("");
		}
        var form = new nui.Form("#form1");
		var data = form.getData();
		data.criteria._expr[0]._min = nui.get("minyearmonth").getText();
		data.criteria._expr[0]._max = nui.get("maxyearmonth").getText();
        contStock_grid.load(data);
    }
	
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		contStock_grid.load();
	}
	
	function doView(){
		var selectRow = contStock_grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/newcont/newCont/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
	    //导出合同收入成本记录查询结果（按条件导出）
        function exportCsContStock(){
			if(!confirm("导出合同收入成本记录？")){
				return;
			}
			var data = form.getData();
			data.criteria._expr[0]._min = nui.get("minyearmonth").getText();
			data.criteria._expr[0]._max = nui.get("maxyearmonth").getText();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.primeton.eos.ame_income.csContStock.exportCsContStock.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "合同收入成本记录";
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
	    
	function sureFileData(){//指合同收入成本日期范围内状态为“已进存货或结转”的数据的状态变更为已归档
		var rows = contStock_grid.getSelecteds();
		 if (rows.length > 0) {
		 	for (var i = 0; i < rows.length; i++) {
		 		if (rows[i].status != "0") {
		 			//nui.alert("存在," + nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "数据！");
		 			nui.alert("“"+nui.getDictText('AME_CONTSTOCKSTATUS', rows[i].status) + "”状态的数据不能变更为已归档，选择的数据中包含了“" + nui.getDictText('AME_CONTSTOCKSTATUS', rows[i].status) + "”状态的数据！","归档提醒");
                    return;
		 		}
		 	}
		 	var choosesRows = rows;
		 	sureFile(choosesRows);
		 } else {
		 	nui.alert("请选中一条记录！");
		 }
	}

	//批量确认归档
	function sureFile(rows){
        nui.confirm("确定要归档选中的合同收入成本信息？","确认归档提示",function(action){
            if(action=="ok"){
                var firstdate = nui.get("minyearmonth").getValue();
                var lastdate = nui.get("maxyearmonth").getValue();
                var countrow = 0;
                
                for (var i = 0;i < rows.length;i++) {
                	countrow++;
                }
                
                var json = nui.encode({"csContStock": rows,"csContStockParam":{"firstdate":firstdate,"lastdate":lastdate,"countrow":countrow}});
                
                contStock_grid.loading("正在归档中,请稍等...");
                $.ajax({
                    url:"com.primeton.eos.ame_income.csContStock.sureFileCsContStock.biz.ext",
                    data:json,
                    type:'POST',
                    cache: false,
                    contentType:'text/json',
                    success:function(text){
                        var returnJson = nui.decode(text);
                        contStock_grid.unmask();
                        if(returnJson.exception == null){
                            nui.alert("确认归档成功", "系统提示",function(){
                                contStock_grid.reload();
                            });
                        }else{
                            nui.alert("确认归档失败", "系统提示");
                        }
                    }
                });
            }
        });
    }
    
    //新增合同收入成本
    function addCsCont(){
		nui.open({
            url: "<%=request.getContextPath() %>/ame_income/csContStock/addCsContStock.jsp",
            title: "新增合同收入成本", 
            width: 1150, 
            height: 450,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action=="ok"){
            		contStock_grid.reload();
            	}
            }
        });
    }
    //edit合同收入成本
    function editCsCont(){
		var row = contStock_grid.getSelected();
		if ('3' == row.status){
			nui.alert("该合同收入成本状态为“已审计”，无法编辑，请确认！");
		}else{
			if (row) {
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_income/csContStock/addCsContStock.jsp",
		            title: "编辑合同收入成本", 
		            width: 1150, 
		            height: 450,
		            onload: function () {
		                var iframe = this.getIFrameEl();
		                var data = { action: "edit",csContStock:{contnum:row.contnum,finyear:row.finyear,finmonth:row.finmonth}};
		                iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		            	if(action=="ok"){
		            		contStock_grid.reload();
		            	}
		            }
		        });
	        }else{
		    	nui.alert("请选中一条记录","提示");
		    }
	    }
    }
    
	function remove() {            
        var rows = contStock_grid.getSelecteds();
        var data = {csContStocks:rows};
        var json = nui.encode(data);
        if (rows.length > 0) {
			for (var i=0;i<rows.length;i++){
        		if("3" == rows[i].status){
        			nui.alert("合同收入状态为“已审计”不可删除，请确认！");
        			return;
        		}
        	}        	
            if (confirm("确定删除选中记录？")) {
                contStock_grid.loading("操作中，请稍后......");
                nui.ajax({
                    url: "com.primeton.eos.ame_income.csContStock.deleteContStocks.biz.ext",
                    type: "post",
                    data: json, 
                    cache: false,
                    contentType: 'text/json',
                    success: function (text) {
                		if(text.result == "success"){
	                		nui.alert("删除成功！");
		                	contStock_grid.reload();
	                	}else{
	                		nui.alert("删除失败！");
	                	}
                    },
                    error: function () {
                    }
                });
            }
        } else {
            nui.alert("请选中一条记录");
        }
    }
        		
    function sureAuditData() {//指合同收入成本日期范围内状态为“已归档”的数据的状态变更为已审计
		var rows = contStock_grid.getSelecteds();
		 if (rows.length > 0) {
		 	for (var i = 0; i < rows.length; i++) {
		 		if (rows[i].status != "2") {
		 			//nui.alert("存在," + nui.getDictText('AME_OUTCOSTSTATUS', rows[i].outcoststatus) + "数据！");
		 			nui.alert("“"+nui.getDictText('AME_CONTSTOCKSTATUS', rows[i].status) + "”状态的数据不能变更为已审计，选择的数据中包含了“" + nui.getDictText('AME_CONTSTOCKSTATUS', rows[i].status) + "”状态。","审计提醒");
                    return;
		 		}
		 	}
		 	var choosesRows = rows;
		 	sureAudit(choosesRows);
		 } else {
		 	nui.alert("请选中一条记录！");
		 }
	}
	    
    //批量确认审计
    function sureAudit(rows){
        nui.confirm("确定要审计选中的成本结转明细信息？","确认审计提示",function(action){
            if(action=="ok"){
                var firstdate = nui.get("minyearmonth").getValue();
                var lastdate = nui.get("maxyearmonth").getValue();
                var countrow = 0;
                
                for (var i = 0;i < rows.length;i++) {
                	countrow++;
                }
                
                var json = nui.encode({"csContStock": rows,"csContStockParam":{"firstdate":firstdate,"lastdate":lastdate,"countrow":countrow}});
  
                contStock_grid.loading("正在确认审计中,请稍等...");
                $.ajax({
                    url:"com.primeton.eos.ame_income.csContStock.sureAuditCsContStock.biz.ext",
                    type:'POST',
                    data:json,
                    cache: false,
                    contentType:'text/json',
                    success:function(text){
                        var returnJson = nui.decode(text);
                        contStock_grid.unmask();
                        if(returnJson.exception == null){
                            nui.alert("确认审计成功", "系统提示",function(){
                                contStock_grid.reload();
                            });
                        }else{
                            nui.alert("确认审计失败", "系统提示");
                        }
                    }
                }); 
            }
        });
    }
        
    //人工成本归集处理
    function costHandling(){
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csContStock/selectYearMonth.jsp",
            title: "选择处理年月",
            width: 290,
            height: 100,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                    	var year =  data.year;
						var month = data.month;
						var message = {"year":year,"month":month};
						nui.open({
			                url:"<%=request.getContextPath() %>/ame_income/csContStock/selectContractByYear.jsp",
			                title: "合同信息",
			                width: 600,
			                height: 550,
			                onload: function () {
							    var iframe = this.getIFrameEl();
							    iframe.contentWindow.setData(message);
							},
			                ondestroy: function (action) {
			                    if (action == "ok") {
			                        var iframe = this.getIFrameEl();
			                        var data = iframe.contentWindow.GetData();
			                        data = nui.clone(data);
			                        if (data.length!=0) {
			                        	var json = {"cs":data};
			                        	contStock_grid.loading("人工成本归集处理中...");
			                        	nui.ajax({
							                url: "com.primeton.eos.ame_income.csContStock.costHandling.biz.ext",
							                type: "post",
							                data: json,
							                cache: false,
							                contentType: 'text/json',
							                success: function (o) {
							                	contStock_grid.unmask();
												if(o.result=='1'){
													nui.alert("人工成本归集处理成功!");
													contStock_grid.reload();
												}else{
													nui.alert("人工成本归集处理失败!");
												}
							                },
							                error: function () {
							                }
							           	});
			                         }else{
			                         	nui.alert("请先选择要进行成本归集的数据，在进行操作！");
			                         	return;
			                         }
			                    }
			                }
			            });
                     }
                }
            }
        });
    }
    
    //采购成本归集处理
    function costPurchase(){
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csContStock/selectYearMonth.jsp",
            title: "选择处理年月",
            width: 290,
            height: 100,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                    	var year =  data.year;
						var month = data.month;
						var message = {"year":year,"month":month};
						nui.open({
			                url:"<%=request.getContextPath() %>/ame_income/csContStock/selectContractByWB.jsp",
			                title: "合同信息",
			                width: 600,
			                height: 550,
			                onload: function () {
							    var iframe = this.getIFrameEl();
							    iframe.contentWindow.setData(message);
							},
			                ondestroy: function (action) {
			                    if (action == "ok") {
			                        var iframe = this.getIFrameEl();
			                        var data = iframe.contentWindow.GetData();
			                        data = nui.clone(data);
			                        if (data.length!=0) {
			                        	var json = {"cs":data};
			                        	contStock_grid.loading("采购成本归集处理中...");
			                        	nui.ajax({
							                url: "com.primeton.eos.ame_income.csContStock.costPurchase.biz.ext",
							                type: "post",
							                data: json,
							                cache: false,
							                contentType: 'text/json',
							                success: function (o) {
							                	contStock_grid.unmask();
												if(o.result=='1'){
													nui.alert("采购成本归集处理成功!");
													contStock_grid.reload();
												}else{
													nui.alert("采购成本归集处理失败!");
												}
							                },
							                error: function () {
							                }
							           	});
			                         }else{
			                         	nui.alert("请先选择要进行成本归集的数据，在进行操作！");
			                         	return;
			                         }
			                    }
			                }
			            });
                     }
                }
            }
        });
    }
    
     //合同收入成本结转或进存货
    function stockjz(){
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csContStock/selectYearMonth.jsp",
            title: "选择处理年月",
            width: 290,
            height: 100,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                    	var year =  data.year;
						var month = data.month;
						var message = {"year":year,"month":month};
						nui.open({
			                url:"<%=request.getContextPath() %>/ame_income/csContStock/csContStockJz.jsp",
			                title: "合同信息",
			                width: 1000,
			                height: 500,
			                onload: function () {
							    var iframe = this.getIFrameEl();
							    iframe.contentWindow.setData(message);
							},
			                ondestroy: function (action) {
			                    if (action == "ok") {
			                        var iframe = this.getIFrameEl();
			                        var data = iframe.contentWindow.GetData();
			                        data = nui.clone(data);
			                    }
			                }
			            });
                     }
                }
            }
        });
    }
    
    function costConversion(){
    	var rows = contStock_grid.getSelecteds();
    	var contnums;
    	if(!rows[0].contnum1){
    		nui.alert("该合同不满足转换的条件！");
    		return;
    	}
    	for(var i=0;i<rows.length;i++){
    		if(i==0){
	    		contnums=rows[i].contnum; 
    		}else{
    			if(contnums != rows[i].contnum){
    				nui.alert("每次只能转换一个合同！");
    				return;
    			}
    		}
    	}
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csContStock/csContStockConversion.jsp",
            title: "项目已签合同的转换",
            width: 1000,
            height: 500,
            onload: function () {
			    var iframe = this.getIFrameEl();
			    var message={"contnum":rows[0].contnum,"contnum1":rows[0].contnum1};
			    iframe.contentWindow.setData(message);
			},
            ondestroy: function (action) {
                if (action == "ok") {
                   contStock_grid.reload();
                }
            }
        });
    }
    
    //当contnum1有值时说明该项目合同可以作项目已签合同转换
	function drawrow(e){
		var record = e.record;
    	if(record.contnum1){
    		e.rowStyle = "background-color: #FF99CC";
        }
	}
	
	function onDrawSummaryCell(e) {
	    var result = e.result;
	    var grid = e.sender;
	    if (e.field == "status") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "incomeProdNet"||e.field == "incomeServNet"||e.field == "incomeMaNet"
		    ||e.field == "incomeMaNet"||e.field == "incomeNet"||e.field == "incomeProd"||e.field == "incomeServ"
		    ||e.field == "incomeMa"||e.field == "income" || e.field == "scfyRg" || e.field == "scfyWb"
		    ||e.field == "scfyBx" || e.field == "scfyDyze"|| e.field == "scfy"|| e.field == "cbjzRg"
		    ||e.field == "cbjzWb" || e.field == "cbjzBx" || e.field == "cbjz"|| e.field == "stockRg"
		    ||e.field == "stockWb"|| e.field == "stockBx"|| e.field == "stock"||e.field == "stockJz" 
		    || e.field == "stockNet" || e.field == "stockJzAll") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
	
	//存货减值测试
	function stockcs(){
		nui.open({
            url:"<%=request.getContextPath() %>/ame_income/csContStock/choiceDate.jsp",
            title: "选择处理年月及百分比",
            width: 300,
            height: 125,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                    	var year =  data.year;
						var month = data.month;
						var proportion = data.proportion;
						var message = {"year":year,"month":month,"proportion":proportion};
						nui.open({
			                url:"<%=request.getContextPath() %>/ame_income/csContStock/csContStockCS.jsp?proportion="+proportion,
			                title: "存货减值测试",
			                width: 800,
			                height: 400,
			                onload: function () {
							    var iframe = this.getIFrameEl();
							    iframe.contentWindow.setData(message);
							},
			                ondestroy: function (action) {
			                    if (action == "ok") {
			                        var iframe = this.getIFrameEl();
			                        var data = iframe.contentWindow.GetData();
			                        data = nui.clone(data);
			                    }
			                }
			            });
                     }
                }
            }
        });
	}
	
	//日期显示格式
    function onYearMonthrenderer(e) {
		return e.value.substring(0,4)+"/"+e.value.substring(4,6);
    }
    function dictOrgRenderer(e) {
		return nui.getDictText('CONT_ORG',e.value);
    }
    function dictStatusRenderer(e) {
    	if(!nui.getDictText('AME_CONTSTOCKSTATUS',e.value)){
    		return "空字典项！";
    	}
		return nui.getDictText('AME_CONTSTOCKSTATUS',e.value);
    }
    //查看合同详细信息
    function onContnumRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
	}
</script>
</html>