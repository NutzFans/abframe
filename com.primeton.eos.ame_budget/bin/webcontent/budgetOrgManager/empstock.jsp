<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-11-03 15:11:04
  - Description:
-->
<head>
<title>人力投入tab页面</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<fieldset style="border:solid 1px #aaa;padding:1px;width: 98%;">
    	<legend>存量人员</legend>
    	<div style="width: 100%;" id = "tools">
	        <div style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <span><a class="nui-button" id="addemp" iconCls="icon-add" onclick="addrow">增加</a></span>
	                        <span><a class="nui-button" id="delemp" iconCls="icon-remove" onclick="removerows">删除</a></span>
	                        <span><a class="nui-button" id="saveemp" iconCls="icon-save" onclick="onOk()">保存</a></span>
	                        <span><a class="nui-button" id="exportemp" iconCls="icon-download" onclick="exportEmp()">导出存量数据</a></span>
	                        <span><a class="nui-button" id="impemp" iconCls="icon-upload" onclick="impEmp()">导入存量数据</a></span>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="grid1" class="nui-datagrid" style="width: 100%;height: auto;" dataField="deptEmpBudgets" allowAlternating="true" allowCellSelect="true" multiSelect="true"
	    url="com.primeton.eos.ame_budget.budgetOrgManager.getEmpStock.biz.ext" showPager="false" allowCellEdit="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell"
	    oncellendedit="setYjbm">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div field="yjbm" name = "yjbm" width="100px" align="center" headerAlign="center" >一级部门</div>
				<div field="orgid" name = "orgname" displayField="orgname" width="120px" align="center" headerAlign="center" >部门
					<input property="editor" class="nui-combobox" data="orgData"  textField="orgname" valueField="orgid" allowInput="true" valueFromSelect="true"/>
				</div>
				<div field="citycode" width="60px" align="center" headerAlign="center" renderer="getDictCity">所在城市
					<input property="editor" class="nui-dictcombobox" dictTypeId="AREA4CLRY" allowInput="true" />
				</div>
				<div field="costtype" width="60px" align="center" headerAlign="center" renderer="getDictType">人员成本类型
					<input property="editor" class="nui-dictcombobox" dictTypeId="AME_DSBCOSTTYPE" />
				</div>
				<div field="empnum" width="50px" align="right" headerAlign="center" summaryType="sum">数量
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="sharmoney" width="70px" align="right" headerAlign="center" dataType="currency" summaryType="sum">公摊费用（月度）
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="tosalary" width="70px" align="right" headerAlign="center" dataType="currency" summaryType="sum">期初月薪资
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="toweal" width="70px" align="right" headerAlign="center" dataType="currency" summaryType="sum">期初月福利
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="tobonus" width="70px" align="right" headerAlign="center" dataType="currency" summaryType="sum">年终奖金
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
			</div>
		</div>
    </fieldset>
    <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	<script type="text/javascript">
    	nui.parse();
    	var grid1 = nui.get("grid1");
    	var orgFlag = '<%=request.getParameter("orgFlag") %>';
		var orgseq = '<%=request.getParameter("orgseq") %>';
		var year = '<%=request.getParameter("budgetYear") %>';
		var orgid = '<%=request.getParameter("orgid") %>';
		
		orgData = [];
		init();
		function init(){
			if(orgid != 1){
				grid1.hideColumn("yjbm");
			}
			if(orgFlag=='3'){
				grid1.hideColumn("orgname");
				document.getElementById("impemp").style.display = "none";
			}
			var json = {orgseq:orgseq,year:year};
			grid1.load(json,function(){
				if(orgFlag!='3'){
					nui.ajax({
			            url: "com.primeton.eos.ame_budget.budgetOrgManager.getOrg4empstock.biz.ext",
			            type: "post",
			            data: {orgseq:orgseq,year:year},
			            cache: false,
			            contentType: 'text/json',
			            success: function (text) {
			            	orgData = text.orgs;
			            }
			        });
				  }
			});
		}
			   //格式化汇总数据
	   	function onDrawSummaryCell(e) {
		    if(e.field == "empnum"){
		    	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
		    if(e.field == "tosalary"){
		    	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
		    if(e.field == "toweal"){
		    	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
			if(e.field == "tobonus"){
		    	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
		    if(e.field == "sharmoney"){
		    	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
        }
        //业务字典
	    function getDictCity(e){
			return nui.getDictText('AREA4CLRY',e.value);//设置业务字典值
	    }
	     //业务字典
	    function getDictType(e){
			return nui.getDictText('AME_DSBCOSTTYPE',e.value);//设置业务字典值
	    }
	     //新增删除一条存量人员记录
	  function addrow() {    
	    var newRow = { name: "New Row",orgid:orgid };
	    grid1.addRow(newRow);
	  }
	  function removerows() {
	    var rows = grid1.getSelecteds();
	    if (rows.length>0) {
	      grid1.removeRows(rows, true);
	    }else{
	      alert("请至少选中一条记录！");
	    }
	  }
	  function onOk(){
	  	if(grid1.isChanged()){
	  		var datas = grid1.getData();
	  		for(var i =0;i<datas.length;i++){
	  			for(var j =0;j<datas.length;j++){
	  				if(j!=i){
		  				if(datas[i].orgid==datas[j].orgid&&datas[i].citycode==datas[j].citycode&&datas[i].costtype==datas[j].costtype){
		  					alert("存在多条部门为"+datas[i].orgname+"，所在城市为"+nui.getDictText('AREA4CLRY',datas[i].citycode)+"，人员类型为"+nui.getDictText('AME_DSBCOSTTYPE',datas[i].costtype)+"的数据，请检查并修改！");
		  					return;
		  				}
	  				}
	  			}
	  		}
	  		var data = grid1.getChanges();
	  		for(var i =0;i<data.length;i++){
	  			if(data[i].orgid==null||data[i].orgid==""){
	  				alert("部门不能为空！");
	  				return;
	  			}
	  			if(data[i].citycode==null||data[i].citycode==""){
	  				alert("所在城市不能为空！");
	  				return;
	  			}
	  			if(data[i].costtype==null||data[i].costtype==""){
	  				alert("人员类型不能为空！");
	  				return;
	  			}
	  		}
	  		grid1.loading("保存中，请稍后...")
	  		nui.ajax({
	            url: "com.primeton.eos.ame_budget.budgetOrgManager.saveEmpStock.biz.ext",
	            type: "post",
	            data: {deptEmps:data,year:year},
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	var result = text.result;
	            	if(result!=-1){
	            		alert("保存成功！");
	            		grid1.unmask();
	            		grid1.reload();
	            	}
	            }
            });
	  	}else{
	  		alert("未做任何修改！");
	  	}
	  }
	  function setYjbm(e){
  		if(e.field == "orgid"){
	  		if(orgid == 1){
	  			nui.ajax({
		            url: "com.primeton.eos.ame_budget.budgetOrgManager.getBudYjbm.biz.ext",
		            type: "post",
		            data: {orgid:e.record.orgid,year:year},
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	var org = text.org;
		            	var row = e.record;
		            	var rowData = {yjbm:org.orgname};
		            	grid1.updateRow(row,rowData);
		            }
	            });
	  		}
	  	}
	  }
	  //导出当前页预算数据
	   function exportEmp(){
   	   		if(!grid1.isChanged()){
        			grid1.loading("请稍候...");
        			var data = grid1.getData();
					nui.ajax({
		                url: "com.primeton.eos.ame_budget.budgetOrgManager.exportEmpStock.biz.ext",
		                type: "post",
		                data: {deptEmps:data,year:year,orgseq:orgseq},
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		             		grid1.unmask();
		                	var filePath = o.downloadFile;
		                	var fileName = "存量人员数据";
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
            }else{
            	alert("存量人员数据有改动，请保存后导出！");
            	return;
            }
    	}
    	  // 导入
	    function impEmp(){
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_budget/budgetOrgManager/empstockTemp.jsp",
	            title: "导入存量数据", 
				width: 800,
	            height: 500,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = {year: year,orgseq:orgseq};
                    iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	            	if(action == "ok"){
		            	init();
	            	}
	            }
	        });
	    }
  </script>
</body>
</html>