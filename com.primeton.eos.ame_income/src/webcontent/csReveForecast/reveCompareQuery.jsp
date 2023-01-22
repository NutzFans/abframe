<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@ page import="com.eos.data.datacontext.UserObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2020-02-26 15:11:04
  - Description:
-->
<head>
<title>收入对照查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="合同收入对照查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>合同名称：</span></td>
						<td align="left">
						    <input name="criteria._expr[3]._value" class="nui-textbox" style="width:162px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right"><span>合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:162px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>客户：</span></td>
						<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox" style="width:162px;" />
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						
						<td align="right"><span>对照区间 ：</span></td>
		            	<td align="left">
					        <input class="nui-datepicker" id="day_min" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="day_max" name="criteria._expr[0]._max"  style="width:100px"/>
						</td>
					
						<td colspan="2"><input class="nui-checkbox" id="isdiff" checked="checked"/>去掉收入差额为'0'的合同	
							<input class="nui-hidden" name="criteria._expr[4]._property" value="sumdiff"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="<>"/>
					        <input class="nui-hidden" name="criteria._expr[4]._value" value="0"/>
						</td>
					</tr>
					<tr>
		    			<td align="center"  colspan='6'>
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                            <a class="nui-button" onclick="exportCsReves" iconCls="icon-download"  id="exportButton">导出合同收入差异</a>
                            <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="reveCompares" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    url="com.primeton.eos.ame_income.csReveForcastFin.queryCompareReve.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]"  multiSelect="true" frozenStartColumn="0" frozenEndColumn="1"
	   >
			<div property="columns">
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="custjc" width="150" align="left" allowSort="true" headerAlign="center">签署客户</div>			
				<div header="经营收入确认（不含税）" headerAlign="center">
	                <div property="columns">
						<div field="maactproductsum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额</div>
						<div field="maactservicesum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额</div>
						<div field="maactmasum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额</div>	
						<div field="maactsum2" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >总金额</div>
						<div field="maconfirmday" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true" >最近确认日期</div>	
					</div>
				</div>
				<div header="财务收入确认（不含税）" headerAlign="center">
	                <div property="columns">
						<div field="actproductsum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额</div>
						<div field="actservicesum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额</div>
						<div field="actmasum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额</div>	
						<div field="actsum2"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >总金额</div>
						<div field="confirmday" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" >最近确认日期</div>	
					</div>
				</div>
				<div header="差（经营-财务）" headerAlign="center">
	                <div property="columns">
						<div field="prodiff"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额</div>
						<div field="servdiff"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额</div>
						<div field="madiff"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额</div>	
						<div field="sumdiff"  width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" renderer="getReveConfirm">总金额</div>
					</div>
				</div>
				<div field="incometype" width="180" headerAlign="center" allowSort="true" renderer="dictcontreve">合同收入类型</div>
				<div field="projectname" width="180" headerAlign="center" allowSort="true" renderer="renderprojectname">合同项目名称</div>
				<div field="contsum" width="90" align="right"  headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >合同金额</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	search();
    	function init(){
	    	<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    	%>
	    	var userid = "<%=nowuserid %>";
	    	//初始化有权的机构
			//code:对应功能编码，map：对于机构的查询条件
			<%-- var json = {"code":"queryCsRevecastFin","map":{"property":"status","op":"=","value":"running"}};
			
			nui.get("search").disable();
			nui.get("reset").disable();
			nui.get("exportButton").disable();
    		//初始化事业部
			nui.ajax({
                url: "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
                type: "post",
                cache: false,
                data:json,
                contentType: 'text/json',
                success: function (text) {
                	if(text.orgs){
                		if(text.orgs.length==0){
							// 没有有权的机构时只能查销售为自己的数据
							nui.getbyName("criteria._expr[1]._value").setValue("<%=nowusername %>");
				    		nui.getbyName("criteria._expr[1]._value").setEnabled(false);
						}
						nui.get("orgid2").setData(text.orgs);
						var isall;
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
	        				nui.get("orgids1").setValue("");
						}else{
							nui.get("orgids1").setValue(text.orgids);
						}
						var data = form.getData();
						grid.sortBy("confirmday","desc");
			    		grid.load(data,function(){
							nui.get("search").enable();
							nui.get("reset").enable();
							nui.get("exportButton").enable();
			    		});
                	}else{
                		// 没有有权的机构时只能查销售为自己的数据
						nui.getbyName("criteria._expr[1]._value").setValue("<%=nowusername %>");
				    	nui.getbyName("criteria._expr[1]._value").setEnabled(false);
						var data = form.getData();
	    				grid.sortBy("contnum","desc");
			    		grid.load(data,function(){
							nui.get("search").enable();
							nui.get("reset").enable();
							nui.get("exportButton").enable();
			    		});
                	}
	    		}
	    	}); --%>
		}
		function dictOrg(e) {
			return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
		}
		function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
		function dictstatus(e) {
			if((e.value == "2" || e.value == "3") && e.record.processinstid != null){
				return "<a href='javascript:void(0)' onclick='checkDictstatus();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
			}else{
				return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
			}
		}
		function newtype(e) {
			return nui.getDictText('AME_NEWTYPE',e.value);//设置业务字典值
		}
		function checkDictstatus(e){
			var selectRow = grid.getSelected();
			var processInstID = selectRow.processinstid;
    		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
    		var title = "流程图查看";
    		var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processInstID});
					}
				},
				ondestroy: function (action){
				}
			});
		}
		
		function dictcontreve(e){
			return nui.getDictText("MIS_HTINCOMETYPE",e.value);
		}
		
		function renderprojectname(e) {
			if(e.value){
				return e.value;
			}
		}
		function doCsReveSum(e){        	
            if (e.field == "contsum" || e.field == "prodiff" ||e.field == "madiff" ||e.field == "servdiff" ||e.field == "sumdiff" ||e.field == "actproductsum2" || e.field == "maactproductsum2" ||e.field == "actservicesum2" || e.field == "maactservicesum2" ||e.field == "actmasum2" || e.field == "maactmasum2" ||e.field == "actsum2"||e.field == "maactsum2") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		
		function search() {
			nui.get("search").disable();
			nui.get("reset").disable();
			nui.get("exportButton").disable();
			var isdiff=nui.get("isdiff").getValue();
			if(isdiff=="true"){
				nui.getbyName("criteria._expr[4]._value").setValue("0");
			}else{
				nui.getbyName("criteria._expr[4]._value").setValue("");
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); 
			grid.sortBy("contnum","desc");
		  	grid.load(data,function(){
				nui.get("search").enable();
				nui.get("reset").enable();
				nui.get("exportButton").enable();
    		}); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
        //合同详细信息
        function detailCont(e){
        	return "<a href='javascript:void(0)' onclick='detailCont1();' title='点击查看合同信息'>" + e.value + "</a>";
        }
        function detailCont1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
	    }
	    
	    //收入列表
        function getReveConfirm(e){
        	if(e.value&&e.value!=0){
	        	return "<a href='javascript:void(0)' onclick='detailReveConfirm(&apos;"+e.field+"&apos;);' title='点击查看收入列表'>" + e.cellHtml + "</a>";
        	}
        }
        function detailReveConfirm(fields){
	 		var selectRow = grid.getSelected();
	 		var day_max=nui.get("day_max").getValue();
	 		var day_min=nui.get("day_min").getValue();
			var executeUrl = "<%=request.getContextPath() %>/ame_income/csReveForecast/detailReveList.jsp?contnum=" + selectRow.contnum+"&day_min="+day_min+"&day_max="+day_max;
			 //获得窗口的垂直位置 
			var iHeight = "500";
			var iWidth = "1500"
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(executeUrl, "收入对照明细", 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
	    }
	    
	    //项目详细信息
        function detailProj(e){
        	/* if(e.value){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	} */
        	if(e.value){
	        	if(e.value.split(',').length == 1){
		        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
	        	}else{
	        		return e.value;
	        	}
        	}
        }
        function detailProj1(){
	 		var selectRow = grid.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid1;
			window.open(executeUrl);
	    }
	    
	    //导出合同收入记录
        function exportCsReves(){
        	nui.confirm("是否确认导出合同收入对照记录？", "确定？",
            function (action) {
            	if(action=='ok'){
	            	var isdiff=nui.get("isdiff").getValue();
					if(isdiff=="true"){
						nui.getbyName("criteria._expr[4]._op").setValue("<>");
						nui.getbyName("criteria._expr[4]._value").setValue("0");
					}else{
						nui.getbyName("criteria._expr[4]._op").setValue("=");
						nui.getbyName("criteria._expr[4]._value").setValue("");
					}
            		var json = form.getData();
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csReveForcastFin.exportCsReveCompare.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "合同收入对照记录";
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
            });       
        }
        
        
  </script>
</body>
</html>