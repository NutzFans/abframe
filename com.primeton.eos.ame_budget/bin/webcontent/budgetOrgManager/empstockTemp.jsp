<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@include file="/common/common.jsp"%>
<h:css href="/css/style1/style-custom.css"/>
<%@include file="/common/skins/skin0/component.jsp" %>
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
<!-- 实现页面遮罩效果 -->
	<style type="text/css">
		#bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: #ccc; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);}
		.blue { 
			color: #d9eef7; 
			border: solid 1px #0076a3; 
			background: #0095cd; 
			background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5)); 
			background: -moz-linear-gradient(top, #00adee, #0078a5); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5'); 
		} 
		.blue:hover { 
			background: #007ead; 
			background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e)); 
			background: -moz-linear-gradient(top, #0095cc, #00678e); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e'); 
		} 
		.blue:active { 
			color: #80bed6; 
			background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee)); 
			background: -moz-linear-gradient(top, #0078a5, #00adee); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee'); 
		} 
	</style>
</head>
<body>
	<div id="mengban" style="background-color:#F0F0F0;position:absolute;z-index:999;width:98.5%;height:98.5%;display: none">
		<table width=100% height=100%>
			<tr><td width=100% style="text-align:center;vertical-align:middle"><img src="/default/images/loading.gif"><br>数据导入中请稍候...</td></tr>
		</table>
	</div>
<div id = "forms">
<form id="form3" action="com.primeton.eos.ame_budget.importBudget.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_eosFlowAction" value="action7">
		<input type="hidden" name="year" id = "year">
		<table>
		<tr>
			<td >
				导入注意事项：</br>1、导入时,请确定部门名称，所在城市，人员类型与系统中一致。</br>
							2、导入成功后,数据会展示在下方列表中，如果出现标红的数据则为有误数据，需要手动调整。</br>
							3、当列表中数据无误时，如果希望导入的数据生效，需要点击“保存”按钮!
			</td>
		</tr>
		<tr style="height:5px"><td></td></tr>
		<tr>
			<td align="left" style = "width:10px;">
				<input type="file" id="uploadfile" name="uploadfile" style = "width:100%"/>
			</td>
			<td align="left">
				<input type="button" value="导入存量人员数据" id="impEmp" onclick="javascript:importLabor();" class="button">
			</td>
		</tr>
		</table>
	</form>
	<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	<fieldset style="border:solid 1px #aaa;padding:1px;width: 100%;">
    	<legend>存量人员</legend>
    	<div style="width: 100%;" id = "tools">
	        <div style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <span><a class="nui-button" id="addemp" iconCls="icon-add" onclick="addrow">增加</a></span>
	                        <span><a class="nui-button" id="delemp" iconCls="icon-remove" onclick="removerows">删除</a></span>
	                        <span><a class="nui-button" id="saveemp" iconCls="icon-save" onclick="onOk()">确认导入</a></span>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="grid1" class="nui-datagrid" style="width: 100%;height: 290px;" dataField="deptEmpBudgets" allowAlternating="true" allowCellSelect="true" multiSelect="true"
	    showPager="false" allowCellEdit="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" ondrawcell="aa">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div field="orgid" name = "orgname" displayField="orgname" width="80" align="center" headerAlign="center" >部门
					<input property="editor" class="nui-combobox" data="orgData"  textField="orgname" valueField="orgid" allowInput="true" valueFromSelect="true"/>
				</div>
				<div field="citycode" width="50" align="center" headerAlign="center" renderer="getDictCity">所在城市
					<input property="editor" class="nui-dictcombobox" dictTypeId="AREA4CLRY" allowInput="true" />
				</div>
				<div field="costtype" width="50" align="center" headerAlign="center" renderer="getDictType">人员类型
					<input property="editor" class="nui-dictcombobox" dictTypeId="AME_DSBCOSTTYPE" />
				</div>
				<div field="empnum" width="50" align="right" headerAlign="center" summaryType="sum">数量
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="sharmoney" width="70px" align="right" headerAlign="center" dataType="currency" summaryType="sum">公摊费用（月度）
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="tosalary" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum">期初月薪资
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="toweal" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum">期初月福利
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n2" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
				<div field="tobonus" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum">年终奖金
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
	</div>
	
	<script type="text/javascript">
    	nui.parse();
    	var grid1 = nui.get("grid1");
    	var year;
    	var orgseq;
		orgData = [];
		function SetData(data){
			year = data.year;
			orgseq = data.orgseq;
			document.getElementById("year").value = data.year;
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
		//导入
		function importLabor(){
			var a=document.getElementById("uploadfile").value;
			if(a==null||a==""){
				alert("请选择一个文件!");
				return; 
			}
			document.getElementById("mengban").style.display = "";
			form3.submit();
		}
		
		function init(aa){
			document.getElementById("mengban").style.display = "none";
			grid1.setData(nui.decode(aa));
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
	    var newRow = { name: "New Row"};
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
  		var data = grid1.getData();
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
  		document.getElementById("impEmp").disabled=true;
  		grid1.loading("保存中，请稍后...")
  		nui.ajax({
            url: "com.primeton.eos.ame_budget.budgetOrgManager.saveEmpStock4All.biz.ext",
            type: "post",
            data: {deptEmps:data,year:year,orgseq:orgseq},
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var result = text.result;
            	if(result!=-1){
            		alert("保存成功！");
            		grid1.unmask();
            		CloseWindow("ok");
            	}
            }
        });
	  }
	  function aa(e){
	  	if(e.field == "orgid"){
		  	if(!e.value){
		  		e.cellStyle = "background-color: red";
		  	}
	  	}
	  	if(e.field == "citycode"){
		  	if(!e.value){
		  		e.cellStyle = "background-color: red";
		  	}
	  	}
	  	if(e.field == "costtype"){
		  	if(!e.value){
		  		e.cellStyle = "background-color: red";
		  	}
	  	}
	  }
	  function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
  </script>
</body>
</html>