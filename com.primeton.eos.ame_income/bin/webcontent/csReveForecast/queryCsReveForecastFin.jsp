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
<title>财务收入查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="合同财务收入明细查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>受益部门：</span></td>
						<td align="left">
							 <input id="orgid2"  name="criteria._expr[1]._value" style="width:162px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
			            	<input class="nui-hidden" name="criteria._expr[1]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[0]._value" id="orgids1"/>
						</td>
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
						    <input name="criteria._expr[6]._value" class="nui-textbox" style="width:162px;" />
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						
						<td align="right"><span>收入确认类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="AME_REVETYPE" style="width:162px;"  multiSelect="true" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="revetype"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
						</td>
						<td align="right"><span>新合同收入类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="AME_NEWTYPE" style="width:162px;" showNullItem="true" nullItemText=""  multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="newtype"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
						</td>
						<td align="right"><span>财报确认日期 ：</span></td>
		            	<td align="left">
					        <input class="nui-datepicker" name="criteria._expr[8]._min" id="startTime" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" id="endTime" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="confirmday"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					        <input class="nui-hidden" name="criteria._expr[9]._value" value=""/>
					        <input class="nui-hidden" name="criteria._expr[9]._property" value="orgseq"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="end"/>
						</td>
						<td align="right"><span>状态：</span></td>
						<td align="left">
						    <input name="criteria._expr[11]._value" class="nui-dictcombobox" dictTypeId="AME_REVESTATUS" style="width:162px;" showNullItem="true" nullItemText="" />
						    <input class="nui-hidden" name="criteria._expr[11]._property" value="status"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>是否批量预估：</span></td>
						<td align="left">
						    <input id = "isfinreve" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:162px;" showNullItem="true" nullItemText="" onvaluechanged="changefin"/>
						    <input class="nui-hidden" name="criteria._expr[12]._property" value="processinstid"/>
						    <input class="nui-hidden" name="criteria._expr[12]._op" value="="/>
						</td>
						<td align="right"><span>收入类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[13]._value" class="nui-dictcombobox" dictTypeId="AME_REVETYPE" style="width:162px;" showNullItem="true" nullItemText=""  multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[13]._property" value="revetype"/>
						    <input class="nui-hidden" name="criteria._expr[13]._op" value="in"/>
						</td>
					</tr>
					<tr>
		    			<td align="center"  colspan='6'>
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                            <a class="nui-button" onclick="exportCsReves" iconCls="icon-download"  id="exportButton">导出合同收入记录</a>
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
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="updateBtn" iconCls="icon-jcx" onclick="confirmbatch()">批量确认</a>
                        <a class="nui-button" id="updateBtn" iconCls="icon-add" onclick="add()">新增</a>
                        <a class="nui-button" id="startBtn" iconCls="icon-edit" onclick="edit()">修改</a>
                        <a class="nui-button" id="deleBtn" iconCls="icon-remove" onclick="remove()">删除</a>
                    </td>
                </tr>
             </table>           
        </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csReveForecastFins" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    url="com.primeton.eos.ame_income.csReveForecast.queryCsReveForeCastFinList.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]"  multiSelect="true" frozenStartColumn="0" frozenEndColumn="9"
	   >
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="reveid" width="0" >预估主键</div>	
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="custjc" width="120" align="left" allowSort="true" headerAlign="center">签署客户</div>			
				<div field="projectname" width="180" headerAlign="center" allowSort="true" renderer="renderprojectname">合同项目名称</div>
				<div field="contsum" width="90" align="right"  headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >合同金额</div>
				<div field="reveno" width="60" align="center"  headerAlign="center" renderer="detailReve" allowSort="true" >确认次数</div>
				<div field="revetype" width="100" align="center" headerAlign="center" renderer="revetype">收入类型</div>
				<div field="newtype" width="100" align="center" headerAlign="center" renderer="newtype">新合同收入类型</div>
				<div field="confirmday" width="80" align="center" headerAlign="center" allowSort="true" >确认日期</div>	
				<div field="actsum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次确认</div>
				<div field="actsum2" width="110" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次确认(不含税)</div>
				<div field="actproductsum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额</div>
				<div field="actservicesum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额</div>
				<div field="actmasum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额</div>
				<div field="actproductsum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额(不含税)</div>
				<div field="actservicesum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额(不含税)</div>
				<div field="actmasum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额(不含税)</div>	
				<div field="confirmdayStart" width="80" align="center" headerAlign="center" allowSort="true">应收开始日期</div>	
				<div field="projectno" width="100" renderer="detailProj" headerAlign="center" allowSort="true">项目编号</div>
				<div field="salename" width="70" align="left" allowSort="true" headerAlign="center">所属销售</div>	
				<div field="yjbm" width="100" align="center" headerAlign="center"  allowSort="true">一级部门</div>	
				<div field="ejbm" width="100" align="center" headerAlign="center" allowSort="true">二级部门</div>	
				<div field="status" width="120" align="center" headerAlign="center" renderer="dictstatus">状态</div>
				<div field="setstart" width="120" align="center" headerAlign="center" allowSort="true">本次结算开始年月</div>	
				<div field="setend" width="120" align="center" headerAlign="center" allowSort="true">本次结算结束年月</div>	
				<div field="labormonth" width="120" align="center" headerAlign="center" summaryType="sum"  allowSort="true">本次确认工作量</div>	
				<div field="labormonthact" width="120" align="center" renderer="getReveLabor" headerAlign="center" summaryType="sum"  allowSort="true">本次实际工作量</div>	
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
	    	<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    	%>
	    	var userid = "<%=nowuserid %>";
	    	//初始化有权的机构
			//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"queryCsRevecastFin","map":{"property":"status","op":"=","value":"running"}};
			
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
	    				grid.sortBy("contnum","asc");
			    		grid.load(data,function(){
							nui.get("search").enable();
							nui.get("reset").enable();
							nui.get("exportButton").enable();
			    		});
                	}
	    		}
	    	});
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
		function revetype(e) {
			return nui.getDictText('AME_REVETYPE',e.value);//设置业务字典值
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
		
		function renderprojectname(e) {
			if(e.value){
				return e.value;
			}
		}
		function doCsReveSum(e){        	
            if (e.field == "contsum" || e.field == "labormonth"|| e.field == "labormonthact"|| e.field == "fcsum2" ||e.field == "actsum2"||e.field == "actsum"||e.field == "actproductsum"||e.field == "actservicesum"||e.field == "actservicesum2"||e.field == "actmasum"||e.field == "actproductsum2"||e.field == "actmasum2") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		
		function search() {
			nui.get("search").disable();
			nui.get("reset").disable();
			nui.get("exportButton").disable();
			var form = new nui.Form("#form1");
			var data = form.getData(); 
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
	    //合同收入记录详情
        function detailReve(e){
        	return "<a href='javascript:void(0)' onclick='detailReve1();' title='点击查看收入记录'>" + e.value + "</a>";
        }
        function detailReve1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_income/csReveForecast/detailCsReveForecastFin.jsp?id=" + selectRow.reveid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
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
        	nui.confirm("是否确认导出合同收入记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var json = form.getData();
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csReveForcastFin.exportCsReveForecastFin.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "合同收入记录";
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
     
    //财务批量确认收入    
    function confirmbatch(){
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_income/csReveForecast/confimReveFinBatch.jsp",
            title: "批量预估人力服务收入", width: 1100, height: 515,
            ondestroy: function (action) {
            	if(action=='ok'){
                	grid.reload();
            	}
            }
        });
    }    
        //新增财务收入
    function add() {
        nui.open({
            url: "<%=request.getContextPath() %>/ame_income/csReveForecast/addReveFin.jsp",
            title: "新增财务收入明细", width: 770, height: 515,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "add"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action=='ok'){
                	grid.reload();
            	}
            }
        });
    }
    
    //修改财务收入
    function edit() {
    	var rows = grid.getSelecteds();
    	if (rows.length > 1) {
    		nui.alert("只能选中一条记录进行编辑");
    	}else{
            var row = grid.getSelected();
            if (row) {
                nui.open({
                    url: "<%=request.getContextPath() %>/ame_income/csReveForecast/addReveFin.jsp",
                    title: "编辑财务收入", width: 770, height:515,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", csReveForecastFin: row};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                    	if(action == "ok"){
	                        grid.reload();
                    	}
                    }
                });
                
            } else {
                nui.alert("请选中一条记录");
            }
        }
    }
    
    //删除财务收入
    function remove() {            
        var rows = grid.getSelecteds();
        var data = {csReveForecastFins:rows};
        var json = nui.encode(data);
        if (rows.length > 0) {
            if (confirm("确定删除选中记录？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
                    url: "com.primeton.eos.ame_income.csReveForcastFin.deleFin.biz.ext",
                    type: "post",
                    data: json, 
                    cache: false,
                    contentType: 'text/json',
                    success: function (text) {
                        grid.unmask();
                        if(text.result=="-1"){
                        	nui.alert("删除失败！");
                        }else{
	                        nui.alert("删除成功","提示",function(){
		                        grid.reload();
	                        });
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
    
    function changefin(e){
    	if(e.value=="1"){
    		nui.getbyName("criteria._expr[12]._op").setValue("null");
    	}else if(e.value=="0"){
    		nui.getbyName("criteria._expr[12]._op").setValue("notnull");
    	}else{
    		nui.getbyName("criteria._expr[12]._op").setValue("=");
    	}
    }
    
     //本次实际工作量
        function getReveLabor(e){
        	if(e.value!=0&&e.value!=null&&e.value!=""){
	        	return "<a href='javascript:void(0)' onclick='detailReveLabor();' title='点击查看工作量明细'>" + e.value + "</a>";
        	}
        }
        function detailReveLabor(){
	 		var selectRow = grid.getSelected();
	 		var setstart = selectRow.setstart;
	 		var starts = setstart.substring(0,4)+"-"+setstart.substring(4,6)+"-01"
			var setend = selectRow.setend;
			var endyear = setend.substring(0,4);
	 		var endmonth = setend.substring(4,6);
	 		ends = endyear+"-"+endmonth+"-"+new Date(endyear,endmonth,0).getDate()
			var executeUrl = "<%=request.getContextPath() %>/ame_income/reveConfirmProcess/detailReveLabor.jsp?contnum=" + selectRow.contnum+"&startdate="+starts+"&enddate="+ends;
			 //获得窗口的垂直位置 
			var iHeight = "400";
			var iWidth = "1000"
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(executeUrl, '工作量明细查看', 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
	    
	    }
    
  </script>
</body>
</html>