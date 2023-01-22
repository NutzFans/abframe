<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>招聘人力明细</title>
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
    	<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
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
    	<div id="grid_recruitDetail" class="nui-datagrid" dataField="deptStaffRebuds" style="width:100%;height:auto;" allowCellSelect="true" showSummaryRow="true" ondrawsummarycell="doCountSum" oncellbeginedit="beforecelledit" 
    	url="com.primeton.eos.ame_budget.personInput.queryRecruitList.biz.ext" showPager="false" allowCellEdit="true" oncellendedit="calMoney" oncellmousedown="beforeClick" onheadercellclick="clickRecruitHeader" sortMode="client">
            <div property="columns">
            	<div type="indexcolumn" width="25" align="center" headerAlign="center" cellCls="myIndex">编号</div>
                <div field="orgname" width="100" align="center" headerAlign="center">部门</div>
                <div field="rebudid" visible="false">主键ID</div>
                <div field="orgid" visible="false">部门ID</div>
                <div field="year" visible="false">预算年度</div>
                <div field="month" width="50" align="center" headerAlign="center" dataType="int">预算月份
					<input property="editor" class="nui-combobox" valueField="id" textField="text" data="monthData"  allowInput="true"/>
				</div>
                <div field="citycode"  width="60" align="center" headerAlign="center" renderer="dictCity">所在城市
					<input property="editor" class="nui-dictcombobox" dictTypeId="AREA4CLRY" allowInput="true" />
				</div>
                <div field="degree" displayField="degreename" width="85" align="center" headerAlign="center" >招聘人员类型
					<input property="editor" class="nui-combobox" data= "degreeData" valueField="perdegree" textField="degreename" allowInput="true"/>
				</div>
                <div field="renum"  width="60" align="center" headerAlign="center" summaryType="sum" numberFormat="n0" dataType="float">招聘数量
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n0" changeOnMousewheel="false" increment="0" showButton="false" />
				</div>
                <div field="memo"  width="120" align="center" headerAlign="center">说明
					<input property="editor" class="nui-textbox" align="left"/>
				</div>
				<div field="monthTosalary" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" dataType="float">每月薪资</div>
				<div field="monthToweal" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" dataType="float">每月福利</div>
				<div field="perratio" width="75" align="right" headerAlign="center" numberFormat="p0" >绩效比例</div>
				<div field="tosalary" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" dataType="float">全年薪资总和</div>
				<div field="toweal" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" dataType="float">全年福利总和</div>
				<div field="tobonus" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" dataType="float">全年奖金总和</div>
            </div>
        </div>
        <div>
		    <font color="red" size="2">1：新增人员奖金计算按照招聘月三个月之后开始。
		    </br>2：关于一、二、三线城市的说明：
		    </br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一线城市：北京、上海、广州、深圳、杭州 
		    </br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二线城市：南京、苏州、武汉、西安
		    </br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三线城市：除一二线以外的城市
		     </font>
		</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" id="savebtn" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')"  id="closebtn" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid_recruitDetail = nui.get("grid_recruitDetail");
    	var monthData = [{id: '1',text: '1'},{id:'2',text: '2'},{id:'3',text: '3'},{id:'4',text: '4'},{id:'5',text: '5'},{id:'6',text: '6'},
    					{id:'7',text: '7'},{id:'8',text: '8'},{id:'9',text: '9'},{id:'10',text: '10'},{id:'11',text: '11'},{id:'12',text: '12'}];
    	//打开页面运行方法(初始化加载数据)
    	var orgid = "";
    	var orgname = "";
    	var year = "";
    	var costtype = "";
    	var orgFlag = "";
    	var budstatus = "";
    	var degreeData = [];
    	function SetData(data){
    		var data = nui.clone(nui.decode(data));
    		orgid=data.orgid;
    		orgname=data.orgname;
    		year=data.year;
    		costtype=data.costtype;
    		orgFlag=data.orgFlag;
    		budstatus=data.budstatus;
    		var json = {"year":year};
    		nui.ajax({
                url: "com.primeton.eos.ame_budget.personInput.queryDegreeByYear.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	degreeData = text.degrees;
                },
                error: function () {
                }
           });
    		
    		if(data.orgFlag!="3"){//非业务单元级的权限
				document.getElementById("addbtn").style.display="none";
				document.getElementById("deltbtn").style.display="none";
				document.getElementById("savebtn").style.display="none";
				grid_recruitDetail.setAllowCellEdit(false);
    		}else if(data.orgFlag==3){
    			grid_recruitDetail.hideColumn(grid_recruitDetail.getColumn(1));
    			if(data.budstatus==1){
	    			grid_recruitDetail.setAllowCellEdit(false);
    			}
    		}
    		document.getElementById("title").innerHTML=data.year+"年度-"+data.orgname+"-" + data.costtypename + "-招聘成本";
    		grid_recruitDetail.load(data);
    	}
    	function add() {   
    		if(budstatus==1){
    			alert("当前处于锁定状态不可以新增！");
	        	return;
	        }     	
            var row = {"orgid":orgid,"year":year,"costtype":costtype,orgname:orgname};
            var data = grid_recruitDetail.getData();
            grid_recruitDetail.addRow(row,data.length+1);
            grid_recruitDetail.beginEditCell(row, "orgid");
        }
        function remove() {
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以删除！");
	        	return;
	        } 
        	var rows = grid_recruitDetail.getSelecteds();
            if (rows) {
            	for(var i=0; i<rows.length;i++){
	                grid_recruitDetail.removeRow(rows[i], true);
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
        	var rows = grid_recruitDetail.getChanges();
            if (rows.length==0) {
            	alert("没有修改的数据！");
            	return;
            }
            for(var i=0; i<rows.length;i++){
            	if(rows[i].month==null||rows[i].citycode==null||rows[i].degree==null||rows[i].renum==null){
            		alert("请补全信息后再保存！");
            		return;
            	}else{
            		if(rows[i].renum==0){
            			alert("人员数量不能为0！");
            			return;
            		}
            	}
            }
        	if(!confirm("确定保存？")){
        		return;
        	}
        	grid_recruitDetail.loading("加载中....");
        	nui.get("savebtn").disable();
        	nui.get("closebtn").disable();
        	var json = {deptStaffRebuds:rows};
        	for(var i=0;i<rows.length;i++){
        		rows[i].tosalary=rows[i].tosalary/(12-parseInt(rows[i].month)+1);
        		rows[i].toweal=rows[i].toweal/(12-parseInt(rows[i].month)+1);
        		if(12-parseInt(rows[i].month)+1-3==0){
        			rows[i].tobonus=0;
        		}else{
	        		rows[i].tobonus=rows[i].tobonus/(12-parseInt(rows[i].month)+1-3);//奖金滞后三个月
        		}
        	}
        	nui.ajax({
                url: "com.primeton.eos.ame_budget.personInput.saveRecruit.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.exception==null){
	                	grid_recruitDetail.reload();
                		alert("保存成功！");
	                	nui.get("savebtn").enable();
        				nui.get("closebtn").enable();
                	}else{
                		alert("保存失败！");
                		//提交之后就会重新计算金额，clone方法又不会把state状态信息复制下来（用的是getChanges方法），要么就在逻辑流里处理金额
                		//理论上不会出现保存失败的情况
                		window.CloseOwnerWindow();
                	}
                },
                error: function () {
                }
           });
        }
        function calMoney(e){
        	//因为人员数量必须是整数，所以spinner用的formatNum
        	//alert(row.renum);是formatNum之前的数据（包括getselected得到的也是没处理之前的数据），所以要在js里面用相同的处理方式处理一下数据（四舍五入）
	  		var row = e.record;
	  		if(row.renum==0){
	  			alert("人数不能为0");
	  		}
	  		if(row.degree && row.month && row.citycode && row.renum){
	  			var renum = row.renum;
		  		renum=renum.toFixed(0);
		  		debugger;
	  			nui.ajax({
	                url: "com.primeton.eos.ame_budget.personInput.queryCostByStaff.biz.ext",
	                type: "post",
	                data: {perdegree:row.degree,renum:renum,month:row.month,year:year},
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	if(text.results==null){
		                	alert("没有该级别对应的招聘标准，请在招聘对应级别成本维护菜单添加！");
	                	}else{
	                		var tosalary = text.results[0].tosalary;
	                		var toweal = text.results[0].toweal;
	                		var tobonus = text.results[0].tobonus;
	                		var monthTosalary = text.results[0].monthTosalary;
	                		var monthToweal = text.results[0].monthToweal;
// 	                		var monthTobonus = text.results[0].monthTobonus;
	                		var perratio = text.results[0].perratio;
							var rowData = {"tosalary":tosalary,"toweal":toweal,"tobonus":tobonus,"monthTosalary":monthTosalary,"monthToweal":monthToweal,perratio:perratio};
							
						   	grid_recruitDetail.updateRow(row,rowData);
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
        	var rows = grid_recruitDetail.getChanges();
        	if(rows.length>0){
        		if(!confirm("放弃编辑内容？")){
        			return;
        		}
        	}         
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        //人员级别业务字典
        function dictDegree(e){
        	return nui.getDictText('AME_EMPTYPE1',e.value);
        }
        function dictCity(e){
        	return nui.getDictText('AREA4CLRY',e.value);
        }
        function doCountSum(e){        	
            if (e.field == "renum") {
                e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "monthTosalary") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
            if (e.field == "monthToweal") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
           	if (e.field == "monthTobonus") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
            if (e.field == "tosalary") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
            if (e.field == "toweal") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
           	if (e.field == "tobonus") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
        function beforeClick(e){
        	 if(orgFlag==3){
	        	if(e.record.rebudid){//数据库查出来的数据
	        		if(e.column.field == "citycode"||e.column.field == "month"){
		        		grid_recruitDetail.setAllowCellEdit(false);
	        		}else{
	        			grid_recruitDetail.setAllowCellEdit(true);
	        		}
	        	}else if(e.record._state){//新增按钮产生
	        		grid_recruitDetail.setAllowCellEdit(true);
	        	}else{
	        		
	        	}
        	} 
        }
        function beforecelledit(e){
        	 if(orgFlag==3){
	        	if(e.record.rebudid){//数据库查出来的数据
	        		if(e.column.field == "citycode"||e.column.field == "month"){
		        		grid_recruitDetail.setAllowCellEdit(false);
	        		}else{
	        			grid_recruitDetail.setAllowCellEdit(true);
	        		}
	        	}else if(e.record._state){//新增按钮产生
	        		grid_recruitDetail.setAllowCellEdit(true);
	        	}else{
	        		
	        	}
        	}
        }
        var flag=true;
		function clickRecruitHeader(e){
			if(flag){
				grid_recruitDetail.sortBy(e.column.field, "desc");
				flag=false;
			}else{
				grid_recruitDetail.sortBy(e.column.field, "asc");
				flag=true;
			}
		}
  </script>
</body>
</html>