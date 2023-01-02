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
	   <!-- .nui-radiobuttonlist-item{
	    	float: left;
		    margin-left: 200px;
		    color: pink;
		 }-->
    </style>
</head>
<body>
<div class="nui-panel" title="月度计划填报管理" style="width:100%;height: 100%;">
    <div  id="form1">
        <input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.monthlyPlan.monthlyPlan.ZhContractMonthlyPlanEntity"/>
        <!-- <div class="nui-toolbar" style="border-bottom:0px;padding:0px;"> -->
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr >
                    <td class="form_label" align = "right">申请人:</td>
                    <td colspan="1">
                        <input name="critria._expr[2]._value" class="nui-textbox" style="width:65%;" />
                        <input class="nui-hidden" name="critria._expr[2]._property" value="empname"/>
                        <input class="nui-hidden" name="critria._expr[2]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">填报单位:</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="critria._expr[8]._op" value="like" />
                        <input class="nui-hidden" name="critria._expr[8]._property" value="title" />
                        <input class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE"  name="critria._expr[8]._value" style="width:65%;"/>
                    </td>
                    <td class="form_label" align = "right">年份:</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="critria._expr[4]._op" value="like" />
                        <input class="nui-hidden" name="critria._expr[4]._property" value="createTime" />
                        <input class="nui-textbox" name="critria._expr[4]._value" style="width:65%;"/>
                    </td>
                </tr>
                <tr >
                    <td class="form_label" align = "right">合同编号:</td>
                    <td colspan="1">
                        <input name="critria._expr[9]._value" class="nui-textbox" style="width:65%;" />
                        <input class="nui-hidden" name="critria._expr[9]._property" value="contractNo"/>
                        <input class="nui-hidden" name="critria._expr[9]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">合同名称:</td>
                    <td colspan="1">
                        <input name="critria._expr[3]._value" class="nui-textbox" style="width:65%;" />
                        <input class="nui-hidden" name="critria._expr[3]._property" value="contractName"/>
                        <input class="nui-hidden" name="critria._expr[3]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">客户名称:</td>
                    <td colspan="1">
                        <input name="critria._expr[5]._value" class="nui-textbox" style="width:65%;" />
                        <input class="nui-hidden" name="critria._expr[5]._property" value="customerName"/>
                        <input class="nui-hidden" name="critria._expr[5]._op" value="like"/>
                    </td>

                </tr>
                <tr>
                    <td class="form_label" align = "right">集团内/外:</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="critria._expr[6]._op" value="like" />
                        <input class="nui-hidden" name="critria._expr[6]._property" value="headquarterGroup" />
                        <input class="nui-dictcombobox" dictTypeId="ZH_GROUP"  name="critria._expr[6]._value" shownullItem="true" nullItemText="全部" style="width:65%;"/>

                        <!-- <input name="critria._expr[6]._value" class="nui-textbox" style="width:65%;" />
                        <input class="nui-hidden" name="critria._expr[6]._property" value="headquarterGroup"/>
                        <input class="nui-hidden" name="critria._expr[6]._op" value="like"/> -->
                    </td>
                    <td class="form_label" align = "right">工程类别:</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="critria._expr[7]._op" value="like" />
                        <input class="nui-hidden" name="critria._expr[7]._property" value="projectType" />
                        <input class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" name="critria._expr[7]._value" style="width:65%;"/>
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
                    <td style="width:70%;">
                        <a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
                        <a class="nui-button" id="edit" iconCls="icon-edit" onclick="edit()">编辑</a>
                        <a class="nui-button" id="delbu" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
                        <a  id="uploadFile" class="nui-button" iconCls="icon-upload" onclick="uploadFile()" >导入</a>
                        <a class="nui-button" id="exportExcel" iconCls="icon-download" onclick="exportExcel()">导出</a>
                        <a class="nui-button" id="islock" iconCls="icon-edit" onclick="islock()">锁定</a>
                        <a class="nui-button" id="unlock" iconCls="icon-edit" onclick="unislock()">解锁</a>
                    </td>
                    <td align="center" style="color:red;">单位：万元</td>
                </tr>
            </table>
        </div>
    <div class="nui-fit">
        <div id="datagrid1" frozenStartColumn="0"  sizeList="[10,20,50,100]" showPager="true" dataField="data"
             showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
             class="nui-datagrid" style="width:100%;height:100%;" url="com.zhonghe.ame.monthlyPlan.monthlyPlan.queryMonthlyPlanAll.biz.ext"
             multiSelect="true" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="5">
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
                <div field="empname"  align="center" headerAlign="center" allowSort="true" >申请人</div>
                <div field="createTime" align="center" headerAlign="center" >年份</div>
                <div field="title"  align="center" headerAlign="center" allowSort="true" renderer="zhInvoiceNameType">填报单位</div>
                <div field="contractNo"  align="center" headerAlign="center" allowSort="true" >合同编号</div>
                <div field="projectName" width="200" align="center" headerAlign="center" allowSort="true" >项监部（内设机构）名称</div>
                <div field="customerName" align="center" headerAlign="center" allowSort="true" >客户名称</div>
                <div field="contractName" width="200" align="center" headerAlign="center" allowSort="true" >合同名称</div>
                <div field="contractSum" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额（含税）</div>
                <div field="plannedIncome"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" width="150">计划收入（不含税）</div>
                <div field="january"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">1月</div>
                <div field="february"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">2月</div>
                <div field="march"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">3月</div>
                <div field="april"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">4月</div>
                <div field="may"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">5月</div>
                <div field="june"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">6月</div>
                <div field="july"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">7月</div>
                <div field="august"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">8月</div>
                <div field="september"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">9月</div>
                <div field="october"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">10月</div>
                <div field="november"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">11月</div>
                <div field="december"  align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">12月</div>
                <div field="projectType"  align="center" headerAlign="center" allowSort="true" >工程类别</div>
                <div field="headquarterGroup"  align="center" headerAlign="center" allowSort="true" renderer="headquarterGroup">集团内/外</div>
                <div field="remark"  align="center" headerAlign="center" allowSort="true" >边界条件及说明</div>
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
	String userOrgId = user.getUserOrgId();
 %>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	search();
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		
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
		}
		function islock(){
		var cpData= {}
			cpData= {'islock':'1' }
		var json =  nui.encode({'cpData':cpData});
			nui.ajax({
    			url: "com.zhonghe.ame.monthlyPlan.monthlyPlan.updateIslock.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		        	if(o.result==1){
	                	 	nui.alert("已锁定","系统提示",function(){
			        		search();
			        	});
	                	 }else{
	                	 nui.alert("修改权限失败，请联系信息技术部人员！","系统提示", function(action){
							search();
						});
		        		}
		        	}
		    })
		}
		
		function unislock(){
		var cpData= {}
			cpData= {'islock':'2' }
		var json =  nui.encode({'cpData':cpData});
			nui.ajax({
    			url: "com.zhonghe.ame.monthlyPlan.monthlyPlan.updateIslock.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		        	if(o.result==1){
	                	 	nui.alert("已解锁","系统提示",function(){
			        		search();
			        	});
	                	 }else{
	                	 nui.alert("修改权限失败，请联系信息技术部人员！","系统提示", function(action){
							search();
						});
		        		}
		        	}
		    })
		}
		 
		function search() {

			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
           
		  	grid.load(data); //datagrid加载数据
		  	
		  	nui.ajax({
    			url: "com.zhonghe.ame.monthlyPlan.monthlyPlan.queryMonthlyPlanIslock.biz.ext",
		        type: "post",
 //		        data: json,
		        cache: false,
 		        contentType: 'text/json',
		        success: function (o) {
		        var text = o.data[0]
			        if(("<%=userOrgId %>") == "16"){
			        	//解锁所有按钮
			        	nui.get("add").enable();
			        	nui.get("edit").enable();
			        	nui.get("uploadFile").enable();
			        	nui.get("delbu").enable();
			        }else{
				        if(text.islock == 1){
				        	//锁定所有按钮
				        	nui.get("add").disable();
				        	nui.get("edit").disable();
				        	nui.get("uploadFile").disable();
				        	nui.get("delbu").disable();
				        }else{
				        	//解锁所有按钮
				        	nui.get("add").enable();
				        	nui.get("edit").enable();
				        	nui.get("uploadFile").enable();
				        	nui.get("delbu").enable();
				        }
			        }
		       
		    	}
		   })
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
    		if (row.length>1){
				nui.alert("只能选中一条记录！");
			} else if (data) {
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
				nui.alert("请选中一条记录!","提示");
			}
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
			title:"&nbsp;",
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
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.zhonghe.ame.monthlyPlan.monthlyPlan.exportMonthlyPlan.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "营业收入预算表";
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
				search();
			}
    	});
	}
	
	
	function headquarterGroup(e) {
		return nui.getDictText("ZH_GROUP", e.value);
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