<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>运营预算明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .myrow{
	        background:#FFFF00;
	    }
	    .myIndex{
	        background:#F7F7F7;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
    	<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                        <a class="nui-button" id="copybutton" iconCls="icon-addnew"  onclick="copy()" >复制</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;" align="center" id="title">
                    </td>
                </tr>
             </table>           
        </div>
    	<div id="grid_operatCost" class="nui-datagrid" dataField="deptOperBudgets" style="width:100%;height:auto;" allowCellSelect="true" multiSelect="true" showSummaryRow="true" onheadercellclick="clickOperatCostHeader" sortMode="client"
        	url="com.primeton.eos.ame_budget.operatCost.queryOperatCost.biz.ext" showPager="false" allowCellEdit="true" oncellmousedown="changeColumns" ondrawsummarycell="doCountSum">
            <div property="columns">
            	<div type="indexcolumn" width="25" align="center" headerAlign="center" cellCls="myIndex">编号</div>
                <div field="orgname" width="100" align="center" headerAlign="center">部门</div>
                <div field="purbudid" visible="false">主键ID</div>
                <div field="orgid" visible="false">部门ID</div>
                <div field="year" visible="false">预算年度</div>
                <div field="month" width="50" align="center" headerAlign="center" dataType="int">预算月份
                	<input property="editor" class="nui-combobox" valueField="id" textField="text" data="monthData" allowInput="true"/>
                </div>
                <div field="feetype"  width="80" align="center" headerAlign="center" renderer="dictfeetype">费用类型
					<input property="editor" class="nui-dictcombobox" dictTypeId="AME_FEETYPE" showNullItem="true"/>
				</div>
                <div field="money"  width="70" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" dataType="float">金额
                	<input property="editor" class="nui-spinner" format="n0" allowLimitValue="false" vtype="int" changeOnMousewheel="false" increment="0" showButton="false"  inputStyle="text-align:right;"/>
				</div>
                <div field="memo"  width="130" align="center" headerAlign="center">说明
					<input property="editor" class="nui-textbox" />
				</div>
            </div>
        </div>
        <div id="win1" class="nui-window" title="复制操作" style="width:290px;height:105px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="false"
		    showToolbar="false" showFooter="true" showModal="false" allowDrag="true">
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='复制所选记录' onclick="copyOnly()" style="vertical-align: bottom;"/>
		        <input type='button' value='复制为全年' onclick="copyAllYear()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
		    <div property="footer" style="text-align:center;padding:5px;">
		        <input type='button' value='关闭' onclick="closeCopy()" />
		    </div>
		</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" id="savebtn" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closebtn" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid_operatCost = nui.get("grid_operatCost");
    	var monthData = [{id: '1',text: '1'},{id:'2',text: '2'},{id:'3',text: '3'},{id:'4',text: '4'},{id:'5',text: '5'},{id:'6',text: '6'},
    					{id:'7',text: '7'},{id:'8',text: '8'},{id:'9',text: '9'},{id:'10',text: '10'},{id:'11',text: '11'},{id:'12',text: '12'}];
    	//打开页面运行方法(初始化加载数据)
    	var orgid = "";
    	var orgname = "";
    	var year = "";
    	var costtype = "";
    	var costtypename = "";
    	var month = "";
    	var feetype = "";
    	var budstatus = "";
    	function SetData(data){
    		var data = nui.clone(nui.decode(data));
    		orgid=data.orgid;
    		orgname=data.orgname;
    		year=data.year;
    		costtype=data.costtype;
    		costtypename=data.costtypename;
    		month=data.month;
    		feetype=data.feetype;
    		budstatus=data.budstatus;
    		if(data.orgFlag!=3){
    			grid_operatCost.setAllowCellEdit(false);
    			document.getElementById("addBtn").style.display="none";
    			document.getElementById("deltbtn").style.display="none";
    			document.getElementById("copybutton").style.display="none";
    			document.getElementById("savebtn").style.display="none";
    		}else if(data.orgFlag == 3 && data.budstatus==1){//是业务单元，锁定状态，有按钮按不能编辑
    			if(!((data.month != null) || (data.feetype!=null))){
	    			document.getElementById("addBtn").style.display="none";
	    			document.getElementById("deltbtn").style.display="none";
	    			document.getElementById("copybutton").style.display="none";
	    			document.getElementById("savebtn").style.display="none";
	    		}else{
	    			grid_operatCost.setAllowCellEdit(false);
	    		}
    		}else if(data.orgFlag==3){
    			if(!((data.month != null) || (data.feetype!=null))){
	    			document.getElementById("addBtn").style.display="none";
	    			document.getElementById("deltbtn").style.display="none";
	    			document.getElementById("copybutton").style.display="none";
	    			document.getElementById("savebtn").style.display="none";
	    		}
    		}
    		var title = data.year+"年-"+data.orgname+"-" + data.costtypename + "-运营费用";
    		if(data.month){
    			document.getElementById("copybutton").style.display="none";
    		}
    		if(data.feetype!=null){
				title=data.year + "年-" + data.orgname + "-" + data.costtypename + "-运营费用-"+data.dictname+"费用";
    			if(data.month){
					title=data.year + "年"+data.month+"月-" + data.orgname + "-" + data.costtypename + "-运营费用-"+data.dictname+"费用";
    			}
    		}
    		document.getElementById("title").innerHTML=title;
    		grid_operatCost.load(data);
    	}
    	function add() {   
    		if(budstatus==1){
    			alert("当前处于锁定状态不可以新增！");
	        	return;
	        }     	
            var row = {"orgid":orgid,"year":year,"costtype":costtype,"month":month,"feetype":feetype,"orgname":orgname};
            grid_operatCost.addRow(row,0);
            grid_operatCost.beginEditCell(row, "orgid");
        }
        function remove() {
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以删除！");
	        	return;
	        }
        	var rows = grid_operatCost.getSelecteds();
            if (rows) {
            	for(var i=0; i<rows.length;i++){
	                grid_operatCost.removeRow(rows[i], true);
            	}
            }else{
            	alert("请 至少选中一条记录！");
            }
        }
        function onOk(){
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以保存！");
	        	return;
	        }
	        var rows = grid_operatCost.getChanges();
            if (rows.length==0) {
            	alert("没有修改的数据！");
            	return;
            }
	        for(var i=0; i<rows.length;i++){  
            	if(rows[i].month==null||rows[i].feetype==null||rows[i].money==null){
            		alert("请补全信息后再保存！");
            		return;
            	}
            }
        	if(!confirm("确定保存？")){
        		return;
        	}
        	grid_operatCost.loading("加载中....");
        	nui.get("savebtn").disable();
        	nui.get("closebtn").disable();
        	var rows = grid_operatCost.getChanges();
        	var json = {deptOperBudges:rows,costtypename:costtypename};
        	nui.ajax({
                url: "com.primeton.eos.ame_budget.operatCost.saveOperatCost.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.exception==null){
	                	grid_operatCost.reload();
                		alert("保存成功！");
                	}else{
                		alert("保存失败！");
                	}
                	nui.get("savebtn").enable();
                	nui.get("closebtn").enable();
                },
                error: function () {
                }
           });
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
		//标准方法接口定义
        function CloseWindow(action) {   
        	var rows = grid_operatCost.getChanges();
        	if(rows.length>0){
        		if(!confirm("放弃编辑内容？")){
        			return;
        		}
        	}
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        //采购类型
        function dictfeetype(e){
        	if(e.value=="99"){
        		return "公司福利分摊";
        	}
        	return nui.getDictText('AME_FEETYPE',e.value);
        }
        function changeColumns(e){
        	//只有在不是点击确定的月份的时候才放开月份的编辑
	        if(!month){
	        	return;
	        }
	         //非业务单元级不可以编辑
	        if(orgFlag!=3){
	        	return;
	        }
	        //锁定不可以编辑
	        if(budstatus==1){
	        	return;
	        }
        	if(e.column.field=="month"){
        		grid_operatCost.setAllowCellEdit(false);
        	}else{
        		grid_operatCost.setAllowCellEdit(true);
        	}
        }
        function copy(){
        	var rows = grid_operatCost.getSelecteds();
        	if(rows.length<1){
        		alert("请至少选中一条记录!");
        		return;
        	}
			var win = nui.get("win1");
	        win.showAtPos("center", "top");
        }
        //复制选中记录
        function copyOnly(){
        	var rows = grid_operatCost.getSelecteds();
        	for(var i = 0;i<rows.length;i++){
        		//必须要clone，否则修改的是内存地址，也就是rows数组的数据
        		var row = nui.clone(rows[i]);
        		row.operid = null;
	        	grid_operatCost.addRow(row);
	        	var cls =  "myrow";
	        	grid_operatCost.addRowCls ( row, cls );
        	}
        }
        
        //复制为全年
        function copyAllYear(){
        	var rows = grid_operatCost.getSelecteds();
        	for(var i = 0;i<rows.length;i++){
        		//修改后拿到的month是String字符串，相加是字符串拼接
        		var month = Number(rows[i].month);
	        	for(var j = month+1; j <= 12;j++){
	        		var row = nui.clone(rows[i]);
	        		row.operid = null;
	        		row.month = j;
		        	grid_operatCost.addRow(row);
		        	var cls =  "myrow";
		        	grid_operatCost.addRowCls ( row, cls );
	        	}
        	}
        }
        function doCountSum(e){        	
            if (e.field == "money") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
        function closeCopy(){
        	nui.get("win1").hide();
        }
        var flag=true;
		function clickOperatCostHeader(e){
			if(flag){
				grid_operatCost.sortBy(e.column.field, "desc");
				flag=false;
			}else{
				grid_operatCost.sortBy(e.column.field, "asc");
				flag=true;
			}
		}
  </script>
</body>
</html>