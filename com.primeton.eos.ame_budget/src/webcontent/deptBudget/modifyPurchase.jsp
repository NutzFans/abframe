<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>采购预算明细</title>
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
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                        <a class="nui-button" id="copybutton" iconCls="icon-addnew"  onclick="copy()">复制</a>
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
    	<div id="grid_purchase" class="nui-datagrid" dataField="deptPurBudgets" style="width:100%;height:auto;" allowCellSelect="true" multiSelect="true" onheadercellclick="clickPurchaseHeader" sortMode="client"
        	url="com.primeton.eos.ame_budget.purchase.queryPurchase.biz.ext" showPager="false" allowCellEdit="true" oncellmousedown="changeColumns" showSummaryRow="true" ondrawsummarycell="doCountSum">
            <div property="columns">
            	<div type="indexcolumn" width="25" align="center" headerAlign="center" cellCls="myIndex">编号</div>
                <div field="orgname" width="100" align="center" headerAlign="center">部门</div>
                <div field="purbudid" visible="false">主键ID</div>
                <div field="orgid" visible="false">部门ID</div>
                <div field="year" visible="false">预算年度</div>
                <div field="month" width="50" align="center" headerAlign="center" dataType="int">预算月份
					<input property="editor" class="nui-combobox" valueField="id" textField="text" data="monthData" oncellendedit="calMoney" allowInput="true"/>
                </div>
                <div field="purtype"  width="60" align="center" headerAlign="center" renderer="dictPurtype">采购类型
					<input property="editor" class="nui-dictcombobox" valueField="id" textField="text" data="dictData" showNullItem="true"/>
				</div>
                <div field="money"  width="70" align="right" headerAlign="center" vtype="int" numberFormat="n0"  summaryType="sum" dataType="float">金额
                	<input property="editor" class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" inputStyle="text-align:right;"/>
				</div>
                <div field="memo"  width="130" align="center" headerAlign="center">说明
					<input property="editor" class="nui-textbox" />
				</div>
            </div>
        </div>
        <div id="win1" class="nui-window" title="复制操作" style="width:290px;height:80px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowDrag="true">
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='复制所选记录' onclick="copyOnly()" style="vertical-align: bottom;"/>
		        <input type='button' value='复制为全年' onclick="copyAllYear()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
		</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" id="savebtn" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')"  id="closebtn" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid_purchase = nui.get("grid_purchase");
    	var monthData = [{id: '1',text: '1'},{id:'2',text: '2'},{id:'3',text: '3'},{id:'4',text: '4'},{id:'5',text: '5'},{id:'6',text: '6'},
    					{id:'7',text: '7'},{id:'8',text: '8'},{id:'9',text: '9'},{id:'10',text: '10'},{id:'11',text: '11'},{id:'12',text: '12'}];
    	var dictData = "";
    	
    	//打开页面运行方法(初始化加载数据)
    	var orgid = "";
    	var orgname = "";
    	var year = "";
    	var costtype = "";
    	var costtypename = "";
    	var month = "";
    	var purtype = "";
    	var orgFlag = "";
    	//锁定解锁
    	var budstatus = "";
    	function SetData(data){
    		var data = nui.clone(nui.decode(data));
    		orgid=data.orgid;
    		orgname=data.orgname;
    		year=data.year;
    		costtype=data.costtype;
    		costtypename=data.costtypename;
    		month=data.month;
    		purtype=data.purtype;
    		orgFlag=data.orgFlag;
    		budstatus=data.budstatus;
    		if(data.costtype==2){//没有加业务字典，用这种方法写死，用业务字典还要控制范围
    			dictData=[{id: 'A',text: '产品非额度报销'},{id:'B',text: '服务非额度报销'},{id:'C',text: 'MA非额度报销'}];
	    	}else{
	    		dictData=[{id:'0',text: '分包'},{id:'1',text: '外包'},{id:'2',text: '市场营销'},{id:'3',text: '咨询'},{id:'4',text: '其他'}];
	    	}
    		//非业务单元没有编辑按钮
    		if(data.orgFlag!=3){
    			document.getElementById("addbtn").style.display = "none";
    			document.getElementById("deltbtn").style.display = "none";
    			document.getElementById("copybutton").style.display = "none";
    			document.getElementById("savebtn").style.display = "none";
    			grid_purchase.setAllowCellEdit(false);
    		}else if(data.orgFlag == 3 && data.budstatus==1){//是业务单元，锁定状态，有按钮按不能编辑
    			if(!((data.month!=null) || (data.purtype!=null))){//点击查看按钮
	    			document.getElementById("addbtn").style.display = "none";
	    			document.getElementById("deltbtn").style.display = "none";
	    			document.getElementById("copybutton").style.display = "none";
	    			document.getElementById("savebtn").style.display = "none";
	    		}else{
	    			grid_purchase.setAllowCellEdit(false);
	    		}
    		}else if(data.orgFlag==3){
    			if(!((data.month != null) || (data.purtype!=null))){
	    			document.getElementById("addbtn").style.display="none";
	    			document.getElementById("deltbtn").style.display="none";
	    			document.getElementById("copybutton").style.display="none";
	    			document.getElementById("savebtn").style.display="none";
	    			grid_purchase.setAllowCellEdit(false);
	    		}
    		}
    		var title = data.year+"年-"+data.orgname+"-" + data.costtypename + "-采购费用";
    		if(data.month){
    			document.getElementById("copybutton").style.display="none";
    		}
    		if(data.purtype!=null){
    			title=data.year + "年-" + data.orgname + "--" + data.costtypename + "采购费用-"+data.dictname+"费用";
    			if(data.month){
					title=data.year + "年"+data.month+"月-" + data.orgname + "-" + data.costtypename + "-采购费用-"+data.dictname+"费用";
    			}
    		}
    		document.getElementById("title").innerHTML=title;
			grid_purchase.sortBy("month","asc");
    		grid_purchase.load(data);
    	}
    	function add() {  
    		if(budstatus==1){
    			alert("当前处于锁定状态不可以新增！");
	        	return;
	        }      	
            var row = {"orgid":orgid,"year":year,"month":month,"costtype":costtype,"orgname":orgname,"purtype":purtype};
            grid_purchase.addRow(row,0);
            grid_purchase.beginEditCell(row, "orgid");
        }
        function remove() {
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以删除！");
	        	return;
	        } 
        	var rows = grid_purchase.getSelecteds();
            if (rows) {
            	for(var i=0; i<rows.length;i++){
	                grid_purchase.removeRow(rows[i], true);
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
	        var rows = grid_purchase.getChanges();
            if (rows.length==0) {
            	alert("没有修改的数据！");
            	return;
            }
	        for(var i=0; i<rows.length;i++){  
            	if(rows[i].month==null||rows[i].purtype==null||rows[i].purtype==""||rows[i].money==null){
            		alert("请补全信息后再保存！");
            		return;
            	}
            }
        	if(!confirm("确定保存？")){
        		return;
        	}
        	grid_purchase.loading("加载中....");
        	nui.get("savebtn").disable();
        	nui.get("closebtn").disable();
        	var rows = grid_purchase.getChanges();
        	var json = {deptpurBudgets:rows,costtypename:costtypename};
        	nui.ajax({
                url: "com.primeton.eos.ame_budget.purchase.savePurchase.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.exception==null){
	                	grid_purchase.reload();
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
        	var rows = grid_purchase.getChanges();
        	if(rows.length>0){
        		if(!confirm("放弃编辑内容？")){
        			return;
        		}
        	}        
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        //采购类型
        function dictPurtype(e){
        	if(costtype==2){//销售
        		if(e.value=="A"){
        			return "产品非额度报销";
        		}
        		if(e.value=="B"){
        			return "服务非额度报销";
        		}
        		if(e.value=="C"){
        			return "MA非额度报销";
        		}
        	}
        	return nui.getDictText('AME_PURTYPE',e.value);
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
        		grid_purchase.setAllowCellEdit(false);
        	}else{
        		grid_purchase.setAllowCellEdit(true);
        	}
        }
        function copy(){
        	 //锁定不可以编辑
	        if(budstatus==1){
	        	alert("当前为锁定安魂太，不能复制!");
	        	return;
	        }
        	var rows = grid_purchase.getSelecteds();
        	if(rows.length<1){
        		alert("请至少选中一条记录!");
        		return;
        	}
        	var win = nui.get("win1");
	        win.showAtPos("center", "top");
        }
        //复制选中记录
        function copyOnly(){
        	var rows = grid_purchase.getSelecteds();
        	for(var i = 0;i<rows.length;i++){
        		//必须要clone，否则修改的是内存地址，也就是rows数组的数据
        		var row = nui.clone(rows[i]);
        		row.purbudid = null;
	        	grid_purchase.addRow(row);
	        	var cls =  "myrow";
	        	grid_purchase.addRowCls ( row, cls );
        	}
        }
        
        //复制为全年
        function copyAllYear(){
        	var rows = grid_purchase.getSelecteds();
        	for(var i = 0;i<rows.length;i++){
        		//修改后拿到的month是String字符串，相加是字符串拼接
        		var month = Number(rows[i].month);
	        	for(var j = month+1; j <= 12;j++){
	        		var row = nui.clone(rows[i]);
	        		row.purbudid = null;
	        		row.month = j;
		        	grid_purchase.addRow(row);
		        	var cls =  "myrow";
		        	grid_purchase.addRowCls ( row, cls );
	        	}
        	}
        }
        function doCountSum(e){        	
            if (e.field == "money") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
        var flag=true;
		function clickPurchaseHeader(e){
			if(flag){
				grid_purchase.sortBy(e.column.field, "desc");
				flag=false;
			}else{
				grid_purchase.sortBy(e.column.field, "asc");
				flag=true;
			}
		}
  </script>
</body>
</html>