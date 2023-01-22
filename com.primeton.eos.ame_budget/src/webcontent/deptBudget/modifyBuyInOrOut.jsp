<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>部门买入成本明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .myIndex{
	        background:#F7F7F7;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="button_inorgid1">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
                        <a class="nui-button" id="copybutton" iconCls="icon-addnew"  onclick="copy()" >复制</a>
                    </td>
                </tr>
             </table>           
        </div>
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;" align="center" id="title">
                    </td>
                </tr>
             </table>           
        </div>
    	<div id="grid_BuyInDetail" class="nui-datagrid" dataField="deptInoutBudgets" style="width:100%;height:auto;" allowCellSelect="true" showSummaryRow="true" onheadercellclick="clickBuyInHeader" sortMode="client"
        	url = "com.primeton.eos.ame_budget.buyInOut.buyInList.biz.ext" showPager="false" allowCellEdit="true" ondrawsummarycell="doCountSum" allowSortColumn="true">
            <div property="columns">
            	<div type="indexcolumn" width="25" align="center" headerAlign="center" cellCls="myIndex">编号</div>
                <div field="orgname" visible="false">部门</div>
                <div field="inoutid" visible="false">主键ID</div>
                <div field="orgid" visible="false">部门ID</div>
                <div field="year" visible="false">预算年度</div>
                <div field="month" width="40" align="center" headerAlign="center" dataType="int">预算月份
					<input property="editor" class="nui-combobox" valueField="id" textField="text" data="monthData" allowInput="true"/>
				</div>
                <div field="inorgid" displayField="inorgname" width="80" align="left" headerAlign="center">买入部门</div>
                <div field="outorgid"  width="90" align="left" displayField="outorgname"  headerAlign="center">卖出部门
					<input property="editor" class="nui-combobox" data="orgData" valueField="leaforgid" textField="leaforgname" style="width:100%;" valueFromSelect="true" filterType="like" allowInput="true"/>
				</div>
                <div field="money" displayField="money" width="50" align="right" headerAlign="center" summaryType="sum" numberFormat="n0" dataType="float">金额
					<input property="editor" class="nui-buttonedit" onbuttonclick="selectEmp"/>
				</div>
                <div field="memo"  width="90" align="left" headerAlign="center">预算说明
					<input property="editor" class="nui-textbox" />
				</div>
            </div>
        </div>
        <div id="win1" class="nui-window" title="复制操作" style="width:300px;height:105px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="false"
		    showToolbar="false" showFooter="true" showModal="false" allowDrag="true">
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='复制粘贴所选记录' onclick="copyOnly()" style="vertical-align: bottom;"/>
		        <input type='button' value='复制为全年记录' onclick="copyAllYear()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
		    <div property="footer" style="text-align:center;padding:5px;">
		        <input type='button' value='关闭' onclick="closeCopy()" />
		    </div>
		</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" id="savebtn" onclick="onOk" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button"  id="closebtn" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid_BuyInDetail = nui.get("grid_BuyInDetail");
    	var orgData = [];
    	var monthData = [{id: '1',text: '1'},{id:'2',text: '2'},{id:'3',text: '3'},{id:'4',text: '4'},{id:'5',text: '5'},{id:'6',text: '6'},
    					{id:'7',text: '7'},{id:'8',text: '8'},{id:'9',text: '9'},{id:'10',text: '10'},{id:'11',text: '11'},{id:'12',text: '12'}];
    	//打开页面运行方法(初始化加载数据)
    	var orgid = "";
    	var orgname = "";
    	var year = "";
    	var costtype = "";
    	var costtypename = "";
    	var budstatus = "";
    	function SetData(data){
    		var data = nui.clone(nui.decode(data));
    		orgid=data.orgid;
    		orgname=data.orgname;
    		year=data.year;
    		costtype=data.costtype;
    		costtypename=data.costtypename;
    		budstatus=data.budstatus;
    		if(data.orgFlag!="3"){//非业务单元级的权限
				document.getElementById("addbtn").style.display="none";
				document.getElementById("deltbtn").style.display="none";
				document.getElementById("savebtn").style.display="none";
				document.getElementById("copybutton").style.display="none";
				grid_BuyInDetail.setAllowCellEdit(false);
    		}else if(data.orgFlag==3){
    			if(data.budstatus==1){
	    			grid_BuyInDetail.setAllowCellEdit(false);
    			}
    		}
    		document.getElementById("title").innerHTML=data.year+"年度-"+data.orgname+"-" + data.costtypename + "-买入";
    		grid_BuyInDetail.load(data);
    		//加载事业部
    		nui.ajax({
	            url: "com.primeton.eos.ame_budget.common.getBudgetNotLeafOrg.biz.ext",
	            type: "post",
	            data: {year:data.year},
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	orgData=text.budgetNotLeafOrgs;
	            },
	            error: function () {
	            }
	       });
    	}
    	function add() {    
    		if(budstatus==1){
    			alert("当前处于锁定状态不可以新增！");
	        	return;
	        }     	
            var row = {"orgid":orgid,"year":year,"costtype":costtype,"inorgid":orgid,"inorgname":orgname,"orgname":orgname};
            var data = grid_BuyInDetail.getData();
            grid_BuyInDetail.addRow(row,data.length+1);
            grid_BuyInDetail.beginEditCell(row, "orgid");
        }
        function remove() {
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以删除！");
	        	return;
	        } 
        	var rows = grid_BuyInDetail.getSelecteds();
            if (rows) {
            	for(var i=0; i<rows.length;i++){
	                grid_BuyInDetail.removeRow(rows[i], true);
            	}
            }else{
            	alert("请 至少选中一条记录！");
            }
        }
        function copy(){
        	var rows = grid_BuyInDetail.getSelecteds();
        	if(rows.length<1){
        		alert("请至少选中一条记录!");
        		return;
        	}
			var win = nui.get("win1");
	        win.showAtPos("center", "top");
        }
        //复制选中记录
        function copyOnly(){
        	var rows = grid_BuyInDetail.getSelecteds();
        	for(var i = 0;i<rows.length;i++){
        		//必须要clone，否则修改的是内存地址，也就是rows数组的数据
        		var row = nui.clone(rows[i]);
        		row.inoutid = null;
	        	grid_BuyInDetail.addRow(row);
	        	var cls =  "myrow";
	        	grid_BuyInDetail.addRowCls ( row, cls );
        	}
        }
        
        //复制为全年
        function copyAllYear(){
        	var rows = grid_BuyInDetail.getSelecteds();
        	for(var i = 0;i<rows.length;i++){
        		//修改后拿到的month是String字符串，相加是字符串拼接
        		var month = Number(rows[i].month);
	        	for(var j = month+1; j <= 12;j++){
	        		var row = nui.clone(rows[i]);
	        		row.inoutid = null;
	        		row.month = j;
		        	grid_BuyInDetail.addRow(row);
		        	var cls =  "myrow";
		        	grid_BuyInDetail.addRowCls ( row, cls );
	        	}
        	}
        }
        function onOk(){
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以保存！");
	        	return;
	        } 
	        var rows = grid_BuyInDetail.getChanges();
            if (rows.length==0) {
            	alert("没有修改的数据！");
            	return;
            }
	        for(var i=0; i<rows.length;i++){  
            	if(rows[i].month==null||rows[i].outorgid==null||rows[i].money==null){
            		alert("请补全信息后再保存！");
            		return;
            	}
            }
        	if(!confirm("确定保存？")){
        		return;
        	}
        	grid_BuyInDetail.loading("加载中....");
        	nui.get("savebtn").disable();
        	nui.get("closebtn").disable();
        	var rows = grid_BuyInDetail.getChanges();
        	var json = {deptInoutBudgets:rows,costtypename:costtypename};
        	nui.ajax({
                url: "com.primeton.eos.ame_budget.buyInOut.saveMyBuyIn.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.exception==null){
	                	grid_BuyInDetail.reload();
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
        function calMoney(){
	  		var row = grid_BuyInDetail.getSelected();
	  		if(row.degree && row.month && row.citycode && row.renum){
	  			nui.ajax({
	                url: "com.primeton.eos.ame_budget.personInput.queryCostByStaff.biz.ext",
	                type: "post",
	                data: {perdegree:row.degree,renum:row.renum},
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	if(text.results==null){
		                	
	                	}else{
	                		var tosalary = text.results[0].tosalary;
	                		var toweal = text.results[0].toweal;
	                		var tobonus = text.results[0].tobonus;
							var rowData = {"tosalary":tosalary,"toweal":toweal,"tobonus":tobonus};
							
						   	grid_BuyInDetail.updateRow(row,rowData);
	                	}
	                },
	                error: function () {
	                }
	           });
	  		}
	  	}
        function onCancel(e) {
            CloseWindow("cancel");
        }
		//标准方法接口定义
        function CloseWindow(action) {
        	var rows = grid_BuyInDetail.getChanges();
        	if(rows.length>0){
        		if(!confirm("放弃编辑内容？")){
        			return;
        		}
        	}
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
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
		function clickBuyInHeader(e){
			if(flag){
				grid_BuyInDetail.sortBy(e.column.field, "desc");
				flag=false;
			}else{
				grid_BuyInDetail.sortBy(e.column.field, "asc");
				flag=true;
			}
		}
		//根据人员级别，数量计算汇总得到金额，并将选择的人员级别信息放到说明中--zhuhx
		function selectEmp(){
			var btnEdit = this;
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_budget/deptBudget/selectEmpLevel.jsp",
	            title: "选择人员数量", 
				width: 700,
	            height: 400,
	            onload: function () {
	               
	            },
	            ondestroy: function (action) {
	            	if(action == "ok"){
		            	var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);
						btnEdit.setValue(data.total);
						btnEdit.setText(data.total);
						var row =  grid_BuyInDetail.getSelected();
						var rowdata = {"money":data.total,"memo":data.info};
						   grid_BuyInDetail.updateRow(row,rowdata);
	            	}
	            }
	        });
		}
  </script>
</body>
</html>