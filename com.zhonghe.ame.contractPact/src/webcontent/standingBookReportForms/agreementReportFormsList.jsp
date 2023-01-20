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
<div class="nui-panel" title="付费合同台账" style="width: 100%;height: 100%">
    <div  id="form1">
        <input class="nui-hidden" name="critria._entity" value="standingBookReportForms.standingBookReportForms.ZhReportFormsAgreementEntity"/>
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr >
                    <td class="form_label" align = "right">合同编号:</td>
                    <td colspan="1">
                        <input name="critria._expr[2]._value" class="nui-textbox" style="width:70%;" />
                        <input class="nui-hidden" name="critria._expr[2]._property" value="contractNo"/>
                        <input class="nui-hidden" name="critria._expr[2]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">合同名称:</td>
                    <td colspan="1">
                        <input name="critria._expr[3]._value" class="nui-textbox" style="width:78%;" />
                        <input class="nui-hidden" name="critria._expr[3]._property" value="contractName"/>
                        <input class="nui-hidden" name="critria._expr[3]._op" value="like"/>
                    </td>
                    <!-- <td align="right" style="width: 100px">承办单位：</td>
                    <td  style="width: 20%;">
                         <input name="organizer" id="organizer" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" 
                         parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:65%;" 
                         url="com.zhonghe.ame.contractPact.common.GetRunSecOrg.biz.ext" allowInput="false" 
                         multiSelect="true" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>
                    </td> -->

                    <!-- <td align="right" style="width: 100px">合同实施部门：</td>
                    <td  style="width: 20%;">
                         <input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" 
                         parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:65%;" 
                         url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" 
                         multiSelect="false" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>
                    </td> -->



                    <td class="form_label" align = "right">合同实施部门:</td>
                    <td colspan="1">
                        <input id="orgid2"  name="critria._ref[0]._expr[0]._value" style="width:50%;" class="nui-combobox"
                               textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
                        <input class="nui-hidden" name="critria._expr[5]._property" value="implementOrg"/>
                        <input class="nui-hidden" name="critria._expr[5]._op" value="in" id="tempCond1"/>
                        <input class="nui-hidden" name="critria._expr[5]._ref" value="1" id="tempCond2"/>
                        <input class="nui-hidden" name="critria._ref[0]._id" value="1"/>
                        <input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
                        <input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid"/>
                        <input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq"/>
                        <input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like"/>
                        <input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end"/>
                        <input class="nui-hidden" name="critria._expr[6]._property" value="implementOrg"/>
                        <input class="nui-hidden" name="critria._expr[6]._op" value="in"/>
                        <input class="nui-hidden" name="critria._expr[6]._value" id="orgids2"/>
                    </td>
                    <td class="form_label" align = "right">申请人:</td>
                    <td colspan="3">
                        <input name="critria._expr[1]._value" class="nui-textbox" style="width:70%;" id="createname"/>
                        <input class="nui-hidden" name="critria._expr[1]._property" value="empname"/>
                        <input class="nui-hidden" name="critria._expr[1]._op" value="like"/>
                        <input name="critria._expr[7]._value" class="nui-hidden" id="createUserid"/>
                        <input class="nui-hidden" name="critria._expr[7]._property" value="createUserid"/>
                    </td>
                </tr>
                <tr >


                    <!-- <td class="form_label" align = "right">合同期限:</td>
                    <td colspan="1">
                      <input name="critria._expr[6]._value" class="nui-textbox" style="width:65%;" />
                      <input class="nui-hidden" name="critria._expr[6]._property" value="contractPeriod"/>
                      <input class="nui-hidden" name="critria._expr[6]._op" value="like"/>
                    </td> -->
                    <td class="form_label" align = "right">合同签约主体:</td>
                    <td colspan="1">
                        <input name="critria._expr[3]._value" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE"  shownullItem="true" nullItemText="全部" style="width:70%;" />
                        <input class="nui-hidden" name="critria._expr[3]._property" value="contractSubject"/>
                        <input class="nui-hidden" name="critria._expr[3]._op" value="like"/>
                    </td>
                    <td class="form_label" align = "right">签约方:</td>
                    <td colspan="1">
                        <input class="nui-hidden" name="critria._expr[4]._op" value="like" />
                        <input class="nui-hidden" name="critria._expr[4]._property" value="signatoryname" />
                        <input class="nui-textbox" name="critria._expr[4]._value" style="width:78%;"/>
                    </td>
                    <td class="form_label" align = "right">签订日期:</td>
                    <td colspan="1">
                        <input class="nui-datepicker" name="map.signingDate_min" style="width:27%;" />-
                        <input class="nui-datepicker" name="map.signingDate_max" style="width:27%;"/>
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
                    <a class="nui-button" id="exportCsContBack" iconCls="icon-download" onclick="exportExcel()">导出</a>
                <td align="center" style="color:red;">单位：万元</td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data"
             showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
             class="nui-datagrid" style="width:100%;height:100%;" url="standingBookReportForms.standingBookReportForms.queryReportFormsAgreementAll.biz.ext"
             multiSelect="true" allowSortColumn=true >
            <div property="columns">
                <div name="temp123" type="checkcolumn"></div>
                <div type="indexcolumn" align="center" headerAlign="center">序号</div>
                <!-- <div type="expandcolumn" width="20"></div> -->
                <div field="contractNo"  align="center" headerAlign="center" allowSort="true" >合同编号</div>
                <div field="contractName" width="130" align="center" headerAlign="center" allowSort="true" >合同名称</div>
                <div field="signatoryname" align="center" headerAlign="center" allowSort="true">签约方</div>
                <!-- <div field="organizer" align="center" headerAlign="center" allowSort="true" >承办单位</div> -->
                <div field="contractSubject" renderer="zhInvoiceNameType" align="center" headerAlign="center" allowSort="true" >签约主体</div>
                <div field="projectSize"  align="center" headerAlign="center" allowSort="true" >标的规模</div>
                <div field="empname"  align="center" headerAlign="center" allowSort="true" >申请人</div>
                <div field="orgname"  align="center" headerAlign="center" allowSort="true" >合同实施部门</div>
                <div field="signingDate"  align="center" headerAlign="center" allowSort="true" >签订日期</div>
                <div field="contractPeriod" align="center" headerAlign="center"  allowSort="true" >合同期限</div>
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
	String userId=user.getUserId();
	String orgName=user.getUserOrgName();
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
			

<%-- 			  		url : "<%= request.getContextPath() %>/contractPact/frameAgreement/feameAgreementInfo.jsp", --%>

		}
		
		
		init();
    	function init(){
    		//按钮权限的控制
	    	//getOpeatorButtonAuth("ffhtlist_add,ffhtlist_edit,ffhtlist_bcxy,ffhtlist_fksq");//操作按钮权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"kjxytzbb","map":{"property":"status","op":"=","value":"running"}};
    		nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue('<%=userId %>');
							nui.get("createname").setValue('<%=userName %>');
							nui.get("createname").setReadOnly(true);
						}
						//根据情况选择一种
						nui.get("orgid2").setData(text.orgs);
						nui.get("orgids2").setValue(text.orgids);
					}else{
						//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue('<%=userId %>');
							nui.get("createname").setValue('<%=userName %>');
							nui.get("createname").setReadOnly(true);
					}
					search();
				}
			});
		}
		
		 
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
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
			var json =  nui.encode(data);
			nui.ajax({
    			url: "standingBookReportForms.standingBookReportForms.exportAgreement.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "框架协议台账报表";
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