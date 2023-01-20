<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): zhx
  - Date: 2015-10-13 10:59:27
  - Description:
-->
<%@include file="/nui/common.jsp" %>
<%@include file="/common/common.jsp"%>
<head>
	<title>待签署合同管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="nui-panel" title="待签署合同管理" style="width:100%;">
		<div id="form1">
			<input class="nui-hidden" name="sortField" value="contappid"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
			        	<td align="right"><span>提交审批日期：</span></td>
		            	<td>
		            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="tjappdate"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
					    </td>
		            	<td align="right"><span>合同类型：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[2].contapptype" dictTypeId="MIS_DECONTRACTTYPE" multiSelect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					    </td>
						<td align="right"><span>签署单位：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[3]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="misCustinfo.custname"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>项目名称：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[4]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="projectname"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>销售姓名：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[5]._value" id="salename"/>
		            		<input class="nui-hidden" name="criteria._expr[5]._property" value="salename"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>合同金额：</span></td>
					    <td>
		            		<input class="nui-textbox" name="criteria._expr[9]._min" style="width:98px"/>-<input class="nui-textbox" name="criteria._expr[9]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[9]._property" value="contmo"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
					    </td>
					    <td align="right"><span>所属事业部：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="syb" name="criteria._expr[6]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="syb"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>审批状态：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="appstatus" name="criteria._expr[7]._value" dictTypeId="MIS_CONTAPPSTATUS" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="appstatus"/>
					    </td>
					    <td align="right"><span>签订状态：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="signstatus" name="criteria._expr[8]._value" dictTypeId="MIS_CONTSIGNSTATUS" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="signstatus"/>
					    </td>
					</tr>				
					<tr>
						<td align="center" colspan="10">
							<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
							<a class="nui-button" onclick="exportCsReves" iconCls="icon-download" id="exportButton">导出Excel</a>
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
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deleteBtn" iconCls="icon-remove" onclick="remove()">删除</a>
	                        <a class="nui-button" id="editBtn2" iconCls="icon-help" onclick="edit2()">审批意见</a>       
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div id="datagrid1" dataField="miscontapps" class="nui-datagrid" style="width:100%;height:auto;" showSummaryRow="true"
	    	url="com.primeton.mis.contract.decontract.decontractQuery.biz.ext" idField="id" allowResize="true"  
	    	sizeList="[10,15,20,30,50,100,200,500,1000,5000,10000]" pageSize="15" allowAlternating="true" multiSelect="true">
		    <div property="columns">
		    	<div name="temp123" type="checkcolumn"></div>
		        <div field="tjappdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">提交审批日期</div>
		        <div field="contapptype" renderer="dictContapptype" width="60" headerAlign="center" allowSort="true">合同类型</div>
		        <div field="misCustinfo.custname" width="120" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签署单位</div>
		        <div field="projectname" width="100" headerAlign="center">项目名称</div>
		        <div field="contappnum" width="73" headerAlign="center" allowSort="true">合同编号</div>
		        <div field="salename" width="50" headerAlign="center" allowSort="true">销售姓名</div>
		        <div field="syb" renderer="onGenderRenderer" width="70" headerAlign="center" allowSort="true">所属事业部</div>
		        <div field="appstatus" renderer="onGender2Renderer" width="60" headerAlign="center" allowSort="true" >审批状态</div>
		        <div field="signstatus" renderer="onGender3Renderer" width="45" headerAlign="center" allowSort="true">签订状态</div>
		        <div field="contmo" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="90" headerAlign="center" allowSort="true">合同金额（元）</div>
		        <div field="outsofee1" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">外包1（元）</div>
		        <div field="outsofee2" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">外包2（元）</div>
	 			<div field="emailstatus" align="center" headerAlign="center"  allowSort="true" width="80" renderer="onIssaveandsend">邮件发送状态</div>                      
	            <div align="center" headerAlign="center" allowSort="true" width="60" renderer="onsend">发送邮件</div>
	            <div field="managername" width="50" headerAlign="center" allowSort="true">经办人</div>
		    </div>
		</div>
	</div>
	<script type="text/javascript">
        var form = new nui.Form("#form1");
        nui.parse();
        var grid = nui.get("datagrid1");        
		init();
		function init(){
		var data = form.getData();
		grid.load(data);
		grid.sortBy("tjappdate", "desc");
		}
		function search() { 
			var form = new nui.Form("#form1");
			var data = form.getData();
            grid.load(data);
        }
        function add() {
            nui.open({
                url: "<%=request.getContextPath() %>/contract/decotract/decontractModify.jsp",
                title: "新增待签署合同", width: 950, height: 518,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	if(action=='save'){
                    	grid.reload();
                	}
                }
            });
        }
        function edit() {
        	var rows = grid.getSelecteds();
        	if (rows.length > 1) {
        		alert("只能选中一条记录进行编辑");
        	}else{
	            var row = grid.getSelected();
	            if (row) {
	                nui.open({
	                    url: "<%=request.getContextPath() %>/contract/decotract/decontractModify.jsp",
	                    title: "编辑合同", width: 950, height: 518,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", contappid: row.contappid };
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                        grid.reload();
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
            }
        }
        function remove() {            
            var rows = grid.getSelecteds();
            var data = {miscontapps:rows};
            var json = nui.encode(data);
            if (rows.length > 0) {
                if (confirm("确定删除选中记录？")) {
                    grid.loading("操作中，请稍后......");
                    nui.ajax({
                        url: "com.primeton.mis.contract.decontract.deleteDecontract.biz.ext",
                        type: "post",
                        data: json, 
                        cache: false,
                        contentType: 'text/json',
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
            } else {
                alert("请选中一条记录");
            }
        }
        
        function onGenderRenderer(e) {
   			return nui.getDictText('CONT_ORG',e.value);
   		}
		
		function onGender2Renderer(e) {
        	return nui.getDictText('MIS_CONTAPPSTATUS',e.value);
    	}
    	function onGender3Renderer(e) {
        	return nui.getDictText('MIS_CONTSIGNSTATUS',e.value);
    	}
    	function onIssaveandsend(e) {
	       return  nui.getDictText('MIS_SENDSTATE',e.value);
	 	}
	  	<%--function doView2(){
	       var selectRow = grid.getSelected();
		   var executeUrl = "<%=request.getContextPath() %>/mis_cs2/componentappManager/componentapp_log.jsp?id=" + selectRow.componentapplyid;
		     window.open(executeUrl, "组件申请操作日志");
	    } --%>
	    
	   //重新发送邮件
	    function onsend(e) {
	       var emailstatus = e.record.emailstatus;
		   if(emailstatus==2){
		     return "<a href='javascript:void(0)' onclick='doView3();' >" + "发送邮件" + "</a>";
		   }
		   else{
		    return null;		
		   }
	 	}
	    function doView3(){
	      var selectRow = grid.getSelected();
		  var json = nui.encode({"miscontapp":{"contappid":selectRow.contappid}});
	      nui.ajax({
            url: "com.primeton.mis.contract.decontract.getDecontract.biz.ext",
			type: 'POST',
			data: json,
			cache:false,	
			contentType: 'text/json',
            success: function (text) {
	            if(text.miscontapp.emailstatus == "2"){
				  var executeUrl = "com.primeton.mis.decontract.decontractappload.flow?contappid=" + selectRow.contappid;
				  window.open(executeUrl, "发送邮件");
	            }else{
	            	alert("邮件已发送！");
	            	grid.reload();
	            }
            }
          });
	    }
	    function edit2() {
			var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		nui.alert("只能选中一条记录进行处理");
	    	}else{
				var row = grid.getSelected();
		    	if(!row){
					nui.alert("请选择其中一条记录数据!");
					return;
				}
		        if (row) {
		            nui.open({
		                url: "<%=request.getContextPath() %>/contract/decotract/decontractAppyj.jsp",
		                title: "审批意见", width: 950, height: 550,
		                onload: function () {
		                    var iframe = this.getIFrameEl();
		                    var data = {contappid: row.contappid};
		                    iframe.contentWindow.SetData(data);
		                },
		                ondestroy: function (action) {
		                    grid.reload();
		                }
		            });
		        } 
	         }
	    }
		grid.on("drawcell", function (e) {
	            var record = e.record,
		        column = e.column,
		        field = e.field,
		        value = e.value; 
		        if (field == "appstatus" && value == 2) {
	                e.cellStyle = "color:red;";
	            }
        }); 
        function exportCsReves(){
        	nui.confirm("是否确认导出待签署合同记录？", "确定？",
            function (action) {
            	if(action=='ok'){
            		var json = form.getData();
					nui.ajax({
		    			url: "com.primeton.mis.contract.decontract.decontractExport.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "待签署合同记录";
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
        //2015-11-26 jn
        
        function dictContapptype(e) {
        	return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>"+nui.getDictText('MIS_DECONTRACTTYPE',e.value)+ "</a>";
    	}
        
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条合同数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/contract/decotract/decotractView.jsp?contappid=" + selectRow.contappid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}             
    </script>
</body>
</html>