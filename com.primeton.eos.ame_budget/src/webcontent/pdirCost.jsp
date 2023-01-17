<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-08-09 11:17:15
  - Description:
-->
<script src="../common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<head>
<title>直接费用预算明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-fit">
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
		    <input id="pbid" class="nui-hidden" />
		    <input id="sybm" class="nui-hidden" />
		    <!-- <div style="width:100%;">
		        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
	    	</div>  -->
			<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" dataField="pdircosts"  allowCellEdit="true" allowCellSelect="true" 
				    editNextOnEnterKey="true" allowCellValid="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell">
	        	<div property="columns"> 
		        	<div type="indexcolumn"></div>
		        	<div field="prjBugdetVer.pbid" width="0">预算编号</div> 
		            <div field="expid" width="80" renderer="getExptype" headerAlign="center">费用类别</div>    
		            <div field="budgetfee" width="100" dataType="currency" align="right" summaryType="sum">费用预算
		            	<input property="editor" class="nui-spinner" style="width:100%;" vtype="float" maxValue="999999999"/>
		            </div>
		            <div field="budgetmemo" width="auto" >预算说明
		            	<input property="editor" class="nui-textbox" style="width:100%;" />
		            </div>                
		        </div>
		    </div> 
	    </div>
    </fieldset>
    </div>
    <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
		    <a class="nui-button" id="budgetModify_bxbutton" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>      
		    <a class="nui-button" onclick="onCancel()" style="width:60px;">关闭</a>
		</div> 
	</body>
</html>
	<script type="text/javascript">
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	//页面进入时调用的方法
	    function SetData(data) {
	    		getOpeatorButtonAuth("budgetModify_bxbutton");//按钮权限
				data = nui.clone(data);
			    nui.get("pbid").setValue(data.pbid);
				var json = nui.encode(data);
	            nui.ajax({
	                url: "com.primeton.eos.ame_budget.ame_budget.getPdircosts.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (o) {
	                	grid.loadData(o.pdircosts);
	                }
	            });
			
		}
		function getExptype(e){
			return nui.getDictText('AME_EXPTYPE',e.value);//设置业务字典值
		}
		function saveData() {
			if(form.validate()){
				var data={pdircosts: grid.getData()};
		        var json = nui.encode(data);
		        //grid.loading("保存中，请稍后......");
		        nui.ajax({
		            url: "com.primeton.eos.ame_budget.ame_budget.savePdircosts.biz.ext",
		            type: 'POST',
		            data: json,
		            success: function (text) {
		               CloseWindow("ok");
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		            }
		        });
		    }
	    }
	    function onOk(){
	    	saveData();
	    }
	    function onCancel(e) {
            CloseWindow("cancel");
        }
        function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}	
	    //获取直接费用的汇总值
	  	var pcost="";
	  	function onDrawSummaryCell(e) {
            if(e.field=='budgetfee'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	pcost=parseInt(e.value);
            }
        } 
        //预算页面调用方法，获取直接费用的汇总值
        function GetData(){
        	return pcost;
        }
	  </script>
