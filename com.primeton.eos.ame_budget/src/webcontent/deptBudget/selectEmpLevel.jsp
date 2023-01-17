<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-11-27 10:11:04
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
                    </td>
                </tr>
             </table>           
        </div>
    	<div id="grid1" class="nui-datagrid" style="width:100%;height:auto;" allowCellSelect="true" showSummaryRow="true" sortMode="client"
        	 showPager="false" allowCellEdit="true" ondrawsummarycell="doCountSum" allowSortColumn="true" oncellendedit="getPrice" multiSelect="true">
            <div property="columns">
            	<div type="checkcolumn"></div>
            	<div field="percostid" displayField="percostname" width="100" align="center" headerAlign="center" >成本套别
					<input property="editor" class="nui-combobox" textField="percostname" valueField="percostid" dataField ="percosts" url="com.primeton.rdmgr.labor.mispricebiz.queryPercost.biz.ext"/>
				</div>
                <div field="degree" displayField="degreename" width="70" align="center" headerAlign="center" >人员级别
					<input property="editor" class="nui-combobox" textField="degreename" data = "degreeData" valueField="degree" dataField = "degrees" id="degrees" onclick="valueChangeDegree" />
				</div>
				 <div field="inout" width="60" align="center" headerAlign="center" renderer="getDict1">内外部
					<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_PRICETYPE"/>
				</div>
				 <div field="price" width="50" align="right" headerAlign="center" dataType="currency">单价（月/元）</div>
                <div field="amount"  width="30" align="center" headerAlign="center">数量
					<input property="editor" class="nui-spinner" allowLimitValue="false" format="n0" changeOnMousewheel="false" increment="0" showButton="false" />	
				</div>
                <div field="money"  width="40" align="right" headerAlign="center" summaryType="sum" numberFormat="n0" dataType="float">金额</div>
            </div>
        </div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" id="savebtn" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button"  id="closebtn" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid1 = nui.get("grid1");
    	var orgid;
    	
    	function add() {    
            var row = {"name":"newRow"};
            grid1.addRow(row);
        }
        function remove() {
        	var rows = grid1.getSelecteds();
            if (rows) {
            	for(var i=0; i<rows.length;i++){
	                grid1.removeRow(rows[i], true);
            	}
            }else{
            	alert("请 至少选中一条记录！");
            }
        }
        function onOk(){
        	var data = grid1.getData();
        	for(var i=0;i<data.length;i++){
        		if(data[i].money==null||data[i].money==""){
        			alert("金额不能为空，请检查并修改！");
        			return;
        		}
        	}
        	CloseWindow("ok");
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
		//标准方法接口定义
        function CloseWindow(action) {
        	var rows = grid1.getChanges();
        	if(action == "cancel"){
	        	if(rows.length>0){
	        		if(!confirm("放弃编辑内容？")){
	        			return;
	        		}
	        	}
        	}
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        var total;//汇总的费用
        function doCountSum(e){        	
            if (e.field == "money") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
            total = e.value;
        }
        //根据级别获取价格
        function getPrice(e){
        	var record = e.record;
        	var row = record;
        	if(e.field=="degree"){
        		if(e.value){
        			if(record.inout){
			        	var json = {"degree" : e.value,"inout":record.inout,"percostid":record.percostid};
			        	nui.ajax({
			                url: "com.primeton.eos.ame_budget.common.getEmpLevel.biz.ext",
			                type: "post",
			                data: json,
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                		var price;
			                		if(record.inout=="0"){
			                			price = text.misprice.mprice;
			                		}else if(record.inout=="1"){
			                			price = text.misprice.outmprice;
			                		}
			                		var money;
			                		if(record.amount){
			                			money = price*parseFloat(record.amount);
			                		}
			                		var rowData;
									rowData = {"price":price,"money":money};
								   	grid1.updateRow(row,rowData);
			                },
			                error: function () {
			                }
			           });
        			}
        		}
        	}
        	if(e.field=="inout"){
        		if(e.value){
        			if(record.degree){
			        	var json = {"degree" : record.degree,"inout": e.value,"percostid":record.percostid};
			        	nui.ajax({
			                url: "com.primeton.eos.ame_budget.common.getEmpLevel.biz.ext",
			                type: "post",
			                data: json,
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                		var price;
			                		if(e.value=="0"){
			                			price = text.misprice.mprice;
			                		}else if(e.value=="1"){
			                			price = text.misprice.outmprice;
			                		}
			                		var money;
			                		if(record.amount){
			                			money = price*parseFloat(record.amount);
			                		}
			                		var rowData = {"price":price,"money":money};
								   	grid1.updateRow(row,rowData);
			                },
			                error: function () {
			                }
			           });
        			}
        		}
        	}
        	if(e.field=="amount"){
        		if(record.price){
	        		money = parseFloat(record.price)*parseFloat(record.amount);
	        		var rowData = {"money":money};
				   	grid1.updateRow(row,rowData);
        		}
        	}
        }
        function getDict1(e){
        	return nui.getDictText('MIS_PRICETYPE',e.value);//设置业务字典值
        }
        function GetData(){
        	var data = grid1.getData();
        	var info;
        	for(var i=0;i<data.length;i++){
        		var degree = data[i].degreename;
        		if(info){
	        		if(info.indexOf(degree) < 0){
		        		var amount = 0; 
		        		for(var j=0;j<data.length;j++){
		        			if(data[i].degree == data[j].degree){
		        				amount = parseFloat(amount)+parseFloat(data[j].amount);
		        			}
		        		}
		        		var info1 = degree+","+amount+"人月";
	        			info = info+";"+info1;
        			}
        		}else{
        			var amount = 0; 
	        		for(var j=0;j<data.length;j++){
	        			if(data[i].degree == data[j].degree){
	        				amount = parseFloat(amount)+parseFloat(data[j].amount);
	        			}
	        		}
	        		var info1 = degree+","+amount+"人月";
        			info = info1;
        		}
        		
        	}
        	var datas = {"info":info,"total":total};
        	return datas;
        }
        var degreeData = [];
		function valueChangeDegree(e){
        	var datas = grid1.getSelected();
        	var percostid = datas.percostid;
        	if(percostid == '' || percostid == null){
        		alert("选择人员级别前请选择成本套别！");
        		return;
        	}
        	degreedate(percostid)
        }
        
        //根据人员所属部门，有效开始日期，有效结束日期取得级别下拉框
        function degreedate(percostid){
        	var json = {"manage":{"percostid":percostid}};
            nui.ajax({
				url:"com.primeton.rdmgr.labor.mispricebiz.getdegrees.biz.ext",
				data:json,
				type:'POST',
                async:false,
				contentType:'text/json',
				success:function(text){
					if(text.degrees.length>0){
						degreeData = nui.encode(text.degrees);
						nui.get("degrees").setData(degreeData);
					}
				}
			});
        }
  </script>
</body>
</html>