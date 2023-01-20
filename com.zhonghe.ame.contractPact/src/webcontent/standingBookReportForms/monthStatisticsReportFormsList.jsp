 <%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		html,body {
			margin: 0;
			padding: 0;
			border: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
	    <!--.nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }-->
    </style>
</head>
<body>
<div class="nui-panel" title="月度经营信息统计报表" style="width:100%;height: 100%">
    <div  id="form1">
        <!--         <input class="nui-hidden" name="critria._entity" value="standingBookReportForms.standingBookReportForms.ZhReportFormsMonthlyPlanEntity"/> -->
        <!-- 	        <div class="nui-toolbar" style="border-bottom:0px;padding:0px;"> -->
        <!-- 	        </div> -->
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr >
                    <!-- 		          <td class="form_label" align = "right">申请人:</td> -->
                    <!-- 		          <td colspan="1"> -->
                    <!-- 			    	<input name="critria._expr[2]._value" class="nui-textbox" style="width:65%;" /> -->
                    <!-- 				    <input class="nui-hidden" name="critria._expr[2]._property" value="empname"/> -->
                    <!-- 				    <input class="nui-hidden" name="critria._expr[2]._op" value="like"/> -->
                    <!-- 		          </td>	 -->
                    <td class="form_label" align = "right">填报单位:</td>
                    <td colspan="1">
                        <input name="map.dictid" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE"  style="width:65%;" />
                    </td>
                    <td class="form_label" align = "right">日期:</td>
                    <td colspan="1">
                        <input class="nui-monthpicker" name="map.time" style="width:65%;"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="9" align="center">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:20%;">
                    <!--                 	<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a> -->
                    <!-- 		            <a class="nui-button" id="checkview" iconCls="icon-edit" onclick="edit()">编辑</a> -->
                    <!-- 		            <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a> -->
                    <!-- 		            <a id="upload" class="nui-button" onclick="uploadFile" >导入</a> -->
                    <a class="nui-button" id="exportCsContBack" iconCls="icon-download" onclick="exportExcel()">导出</a>
                <td align="center" style="color:red;">单位：万元</td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="data"
             showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
             class="nui-datagrid" style="width:100%;height:100%;" url="standingBookReportForms.standingBookReportForms.queryReportFormsMonthStatisticsAll.biz.ext"
             multiSelect="true" allowSortColumn=true >
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div type="indexcolumn" align="center" headerAlign="center">序号</div>

                <!-- <div type="expandcolumn" width="20"></div> -->
                <!--         	<div field="empname"  align="center" headerAlign="center" allowSort="true" >申请人</div> -->
                <div field="dictid"  align="center" headerAlign="center" allowSort="true" renderer="zhInvoiceNameType">填报单位</div>
                <div header="本月" headerAlign="center">
                    <div property="columns">
                        <div field="chargeNum" width="150" headerAlign="center"   align="right" >本月新签合同数量</div>
                        <div field="newContractSum" width="150" headerAlign="center"  align="right"  dataType="currency" summaryType="sum">本月新签合同金额（万元）</div>
                        <div field="invoiceNum1" width="150" headerAlign="center"  align="right" >本月实际开票数量</div>
                        <div field="invoiceSum1" width="150" headerAlign="center"  align="right" dataType="currency" summaryType="sum">本月实际开票金额（万元）</div>
                        <div field="contractSum" width="150" headerAlign="center"  align="right" dataType="currency" summaryType="sum">本月计划开票金额（万元）</div>
                        <div field="bidNum" width="120" headerAlign="center"  align="right" >本月投标次数</div>
                        <div field="bidNum1" width="120" headerAlign="center"  align="right" >本月中标次数</div>
                        <div field="bidNum3" width="120" headerAlign="center"  align="right" >本月中标率</div>
                    </div>
                </div>
                <!--             <div field="chargeNum" align="center" headerAlign="center" allowSort="true" >本月新签合同数量</div> -->
                <!--             <div field="newContractSum"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">本月新签合同金额（万元）</div> -->
                <!--             <div field="invoiceNum1"  align="center" headerAlign="center" allowSort="true" >本月实际开票数量</div> -->
                <!--             <div field="invoiceSum1"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">本月实际开票金额（万元）</div> -->
                <!--             <div field="contractSum"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">本月计划开票金额（万元）</div> -->
                <!--             <div field="bidNum"  align="center" headerAlign="center" allowSort="true" >本月投标次数</div> -->
                <!--             <div field="bidNum1"  align="center" headerAlign="center" allowSort="true" >本月中标次数</div> -->
                <!--             <div field="bidNum3"  align="center" headerAlign="center" allowSort="true" >本月中标率</div> -->
                <div header="本年度" headerAlign="center">
                    <div property="columns">
                        <div field="chargeNum1" width="150" headerAlign="center"   align="right" >本年度新签合同数量</div>
                        <div field="newContractSum1" width="150" headerAlign="center"  align="right"  dataType="currency" summaryType="sum">本年度新签合同金额（万元）</div>
                        <div field="invoiceNum2" width="150" headerAlign="center"  align="right" >本年度实际开票数量</div>
                        <div field="invoiceSum2" width="150" headerAlign="center"  align="right" dataType="currency" summaryType="sum">本年度实际开票金额（万元）</div>
                        <div field="contractSum1" width="150" headerAlign="center"  align="right" dataType="currency" summaryType="sum">本年度计划开票金额（万元）</div>
                        <div field="bidNum11" width="120" headerAlign="center"  align="right" >本年度投标次数</div>
                        <div field="bidNum22" width="120" headerAlign="center"  align="right" >本年度中标次数</div>
                        <div field="bidNum33" width="120" headerAlign="center"  align="right" >本年度中标率</div>
                    </div>
                </div>
                <!--             <div field="chargeNum1"  align="center" headerAlign="center" allowSort="true" >本年度新签合同数量</div> -->
                <!--             <div field="newContractSum1"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">本年度新签合同金额（万元）</div> -->
                <!--             <div field="invoiceNum2"  align="center" headerAlign="center" allowSort="true" >本年度实际开票数量</div> -->
                <!--             <div field="invoiceSum2"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">本年度实际开票金额（万元）</div> -->
                <!--             <div field="contractSum1"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">本年度计划开票金额（万元）</div> -->
                <!--             <div field="bidNum11"  align="center" headerAlign="center" allowSort="true" >本年度投标次数</div> -->
                <!--             <div field="bidNum22"  align="center" headerAlign="center" allowSort="true" >本年度中标次数</div> -->
                <!--             <div field="bidNum33"  align="center" headerAlign="center" allowSort="true" >本年度中标率</div> -->
            </div>
        </div>
    </div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form> 
<% UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
	String orgName=user.getUserOrgName();
 %>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		search();
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
	    function doView(){
			var selectRow = grid.getSelected();
			var url = "<%=request.getContextPath()%>/contractPact/invoice/invoiceInfo.jsp";
			var myWindow = window.open(url);
			myWindow.onload = function(){
			myWindow.document.title = "发票信息查看";
			myWindow.setViewData(selectRow);
			};
			
// 			  	nui.open({
<%-- 			  		url : "<%= request.getContextPath() %>/contractPact/frameAgreement/feameAgreementInfo.jsp", --%>
// 			        width:'100%', 
// 			        height: '100%',
// 			       onload: function () {
// 			       	var iframe = this.getIFrameEl();
// 						iframe.contentWindow.setViewData(selectRow);
// 			       },
// 			       ondestroy: function (action) {
// 			       	search();
// 			       }
// 			  	});
		}
		
		 
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			if(data.map.time != ""){
				console.log(data)
				var timeSplit=data.map.time.split("-");
				data.map.timeYear = timeSplit[0];
				data.map.timeMonth = timeSplit[1];
				
			}
		/* 	data.map.timeYear = data.map.time.getFullYear();
			data.map.timeMonth = data.map.time.getMonth()+1; */
<%-- 			data.critria._expr[2]._value= "<%=userName %>"; --%>
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		function onOk(){
			search();
		}
		
		//修改投标明细
		function edit(){
    		var row = grid.getSelecteds();
    		var data=row[0];
			if (data) {
				nui.open({
				url: "/default/contractPact/monthlyPlan/monthPlanEdit.jsp",
				width: '90%',
				height: '90%',
				title: "月度计划填报编辑",
		        onload: function () {
		        	var iframe = this.getIFrameEl();
					iframe.contentWindow.setEditData(data);
		        },
				ondestroy: function (action) {
	            	search();
	            }
			})
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
//     		}
		}
		
		function deleteInfo(){
    		var rows = grid.getSelecteds();
			if (rows.length == 0) {
    		nui.alert("请选中一条项目记录进行删除");
    		}else{
    		if(!confirm("是否删除？")){
        				return;
        			}else{
					if (rows) {
						
						var json = nui.encode({'data':rows});
						nui.ajax({
							    url: "com.zhonghe.ame.monthlyPlan.monthlyPlan.deleteMonthPlan.biz.ext",
								type: 'POST',
								data: json,	
								contentType: 'text/json',
							    success: function (o) {
						           if(o.result==1){
				                	 	nui.alert("删除成功","系统提示",function(){
						        		//nui.get("sureButton").setEnabled(true);
						        		/* CloseWindow("ok"); */
						        		grid.reload();
						        	});
				                	 }else{
				                	 nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
										//nui.get("sureButton").setEnabled(true);
										grid.reload();
									});
				                	 
				                	 }
							    }
						}); 
					
					}else{
						nui.alert("请选中一条记录","提示");
					}
				}
    		}
		}
		
		
		//展示差旅行程明细
		function onShowRowDetail(e) {
	
		 	var grid = e.sender;
	    	var row = e.record;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_Form);
	        detailGrid_Form.style.display = "block";
	        reve_grid.load({ id: row.id });
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
	    
	    function onActionRenderer(e) {
			var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
        	var processInstID=record.processinstid;
			
			var s = " <a  href='javascript:void(0)' onclick='feeView();' >流程</a>";
			
            return s;
        }
        
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		   /*  if (e.field == "empname") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "total") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "confamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "hxamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "payamt") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    } */
		}
		//将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
	function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}
	
     function add(){
		nui.open({
			url: "/default/contractPact/monthlyPlan/monthPlanAdd.jsp",
			width: '98%',
			height: '90%',
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				search();
			}
		})
	}
	
	function exportExcel(){
		if(!confirm("是否确认导出？")){
				return;
			}
			var data = new nui.Form("#form1").getData();
			if(data.map.time != ""){
				var timeSplit=data.map.time.split("-");
				data.map.timeYear = timeSplit[0];
				data.map.timeMonth = timeSplit[1];
				
			}
			/* data.map.timeYear = data.map.time.getFullYear();
			data.map.timeMonth = data.map.time.getMonth()+1; */
			var json =  nui.encode(data);
			nui.ajax({
    			url: "standingBookReportForms.standingBookReportForms.exportStatistics.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "月度经营信息统计报表";
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
	
	
	function uploadFile(){
			nui.open({
	            url: "/default/contractPact/monthlyPlan/importMonthlyPlan.jsp",
            title: "导入", 
			width: 700,
            height: 230,
            allowDrag:true,
            onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			debugger;
				search();
			}
    	});
	}
	
	
	
	function zhFlowType(e) {
		return nui.getDictText("ZH_FLOW_TYPE", e.value);
	}
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	function zhInvoiceContent(e) {
		return nui.getDictText("ZH_INVOICE_CONTENT", e.value);
	}
	function zhInvoiceType(e) {
		return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
	}
	function zhProjectType(e) {
		return nui.getDictText("ZH_PROJECT_TYPE", e.value);
	}
	function zhInvoiceNameType(e) {
		return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
	}
</script>
</body>
</html>