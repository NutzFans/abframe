<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2016-12-21 13:24:36
  - Description:
-->
<head>
	<title>财务口径工时转换系数维护</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="财务口径工时转换系数列表" style="width:100%;">
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
						<!-- 换成时间段查找或者系数查找或设置人查找 -->
						<!-- 设置起止日期时间段 , 记录的开始日期 startdate 在此时间段内即满足条件可以显示;
								问题: 怎么显示包含开始日期的一条记录??? 
								解决: 分别判断有效开始/截止日期 -->
							<td align="right"><span>有效开始日期：</span></td>
							<td>
						      	<input class="nui-datepicker" name="criteria._expr[0]._min" style="width:100px"/>-
					    		<input class="nui-datepicker" name="criteria._expr[0]._max" style="width:100px" id="maxdatepicker"/>
						        <input class="nui-hidden" name="criteria._expr[0]._property" value="startdate"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
						        
					        </td>
							<td align="right"><span>有效截止日期：</span></td>
							<td>
						      	<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:100px"/>-
					    		<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:100px" id="maxdatepicker"/>
						        <input class="nui-hidden" name="criteria._expr[1]._property" value="enddate"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>     
					        </td>
					    </tr>
					    <tr>
						    <td align="right"><span>财务年月：</span></td>
			            	<td align="left">
			            		<input class="nui-combobox" name="criteria._expr[5]._value" showNullItem="true" id="year" valueField="id" textField="text" data="yearlist" style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="year"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/> 
							    <input class="nui-combobox" name="criteria._expr[2]._value" showNullItem="true" id="month" 
							    	   valueField="id" textField="text" data=[{"id":"01","text":"1"},{"id":"02","text":"2"},{"id":"03","text":"3"},{"id":"04","text":"4"},{"id":"05","text":"5"},{"id":"06","text":"6"},{"id":"07","text":"7"},{"id":"08","text":"8"},{"id":"09","text":"9"},{"id":"10","text":"10"},{"id":"11","text":"11"},{"id":"12","text":"12"}]
							     	   style="width:100px;" />
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
						    </td>
						    <td align="right"><span>设置人：</span></td>
			            	<td align="left">
			            		<input class="nui-textbox" name="criteria._expr[3]._value" style="width:100px"/>
						        <input class="nui-hidden" name="criteria._expr[3]._property" value="updater"/>
						        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[3]._rule" value="all"/>
						    </td>
						    <td align="right"><span>最近更新日期：</span></td>
							<td>
						      	<input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px"/>-
					    		<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px" id="maxdatepicker"/>
						        <input class="nui-hidden" name="criteria._expr[4]._property" value="lastupdatetime"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>     
					        </td>
					       
					    </tr>
					    <tr>
			    			<td align="center" colspan="15">
	                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a> 
	                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
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
				            	<a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
		                        <a class="nui-button" iconCls="icon-edit" id="transCostCal" onclick="transCostCal()">工时转换成本计算</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
	    	</div> 
		    <!-- 修改数据源 -->
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="erptransconfs"
		        url="com.primeton.eos.ame_common.erptransconf.queryErpTransconf.biz.ext"   allowResize="true" pageSize="20" sizeList="[10,20,50,100,500]" 
		        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
		        <div property="columns"> 
		            <div type="checkcolumn"></div>
		<!--             <div field="finyearmonth" width="80" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM">财务年月</div>   -->
		            <div field="orgname" width="100" headerAlign="center" align="center" allowSort="false" visible="false">所属事业部</div>  
		            <div field="year"  width="60" headerAlign="center" align="center" allowSort="true">财务年</div>
		            <div field="month"  width="60" headerAlign="center" align="center" allowSort="true">财务月</div>                   
		            <div field="servicestaticcost"  width="90" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="3" renderer="format">服务静态成本</div>
		            <div field="laborcost" width="90" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="3" renderer="format">工时总成本</div>
		            <div field="transconf"  width="100" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="6">转换系数</div>
		            <div field="startdate" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">有效开始日期 </div>
		            <div field="enddate"  width="100" headerAlign="center"  align="center" dateFormat="yyyy-MM-dd" allowSort="true">有效截止日期</div> 
		            <div field="updater"  width="60" headerAlign="center" align="center" allowSort="true">设置人</div>
		            <div field="lastupdatetime" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss" allowSort="true">最近更新时间</div>          
		        </div>
		    </div>
	</div>
    <script type="text/javascript">
        nui.parse();
        var grid = nui.get("datagrid1");
        init();
        //动态设置财务年的值，为当前日期前两年到后两年的数组
        var nowdate = new Date();
		var year = nowdate.getFullYear();
		var yearlist = [{id: year-2,text: year-2},{id: year-1,text: year-1},{id: year,text: year},{id: year+1,text: year+1},{id: year+2,text: year+2}];
		nui.get("year").setData(yearlist);
		
    	function init(){
    		grid.load();
			grid.sortBy("startdate","desc");
			}
      	function search() {	    		
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
		function checkNum(){
			var getNum = nui.get("transconf").getValue();
			var re = /^[0-9]+.?[0-9]{0,3}$/;
			
			if(re.test(getNum) == true){
				if(getNum <= 0.0)
					alert("系数不合法,请重新输入! ");
				else if(getNum >= 10.0 && getNum <= 100.0)
					alert("输入数字过大,请确定您的输入是否正确! ");
				else if(getNum > 100.0){
					alert("输入数字不合法,请重新输入!");
					nui.get("transconf").setValue('');
				}
			}else{
				if(getNum == ''|| getNum == null)
					//alert("未填写系数 ! ");
					return;
				else 
					alert("系数输入有误!请输入正数或三位以内小数!");
				nui.get("transconf").setValue('');
			}
			return;
		}
		
        function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_common/erptransconf/importTransconf.jsp",
	                title: "新增工时转换系数", 
					width: 860,
		            height: 495,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { action: "new"};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                	if(action == "ok"){
				            grid.reload();
	                	}
	                }
	            });
	        }
	        function remove() {
	        // 可多行删除  
			    var rows = grid.getSelecteds();   //获取所有选中的行对象
			    var data = {erptransconfs:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {

	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
		                //逻辑流修改  
			                url: "com.primeton.eos.ame_common.erptransconf.deletErpTansconf.biz.ext",
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
	                alert("请至少选中一条记录");
	            }
	        }
	        
        function edit() {
        	var rows = grid.getSelecteds();
        	if(rows.length != 1){
        		nui.alert("请选中一条记录编辑。");
        		return;
        	}
    		var row = grid.getSelected();
    		if (row) {
      			nui.open({
  			// 编辑界面  
		            url: "<%=request.getContextPath() %>/ame_common/erptransconf/importTransconf.jsp",
		            title: "编辑工时转换系数 ",
		            width: 860,
		            height: 495,
		            onload: function () {
		              var iframe = this.getIFrameEl();
		              // <!--var data = {action: "edit", emplevelid: row.emplevelid };-->
		              var data = {action: "edit", year: row.year, month: row.month, erptransconfid:row.erptransconfid };
		              iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		                if(action=="ok"){
		                  grid.reload();
		                }
	           	 	}
            	});
            } else {
              nui.alert("请选中一条记录","提示");
            }
        }
        
        function transCostCal(){
            // 可多行工时转换  
			var rows = grid.getSelecteds();   //获取所有选中的行对象
			var data = {erptransconfs:rows};
			var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
			   if (confirm("确定计算选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
		                //逻辑流修改  
			                url: "com.primeton.eos.ame_common.erptransconf.countErpTrandconf.biz.ext",
			                type: "post",
			                data: json, 
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.count == null ){
			                		alert("工时转换失败！");  
			                	}
			                	else{
			                    	alert("处理了"+text.count+"条数据。");
			                    }  
			                	grid.reload();
			                },
			                error: function () {
		                    }
		               });
	                }
	         } else {
	              alert("请至少选中一条记录");
	           }  
        }
        
	  	function reset(){
				var form = new nui.Form("#form1");
				form.reset();
				grid.load();
		}
		function format (e) {
		    return (e.value.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
		}
		
		<%--function changeyear(){
	  		var pzyear = nui.get("year").getValue();
	  		if(pzyear){
		  		var cyear = pzyear.getYear();
		  		var cmonth = pzyear.getMonth() + 1;
		  		if(cmonth < 10){
		  			cmonth = "0" + cmonth;
		  		}else{
	    			cmonth = "" + cmonth;
	    		}
		  		var yearmonth = cyear + "-" + cmonth;
		  		nui.get("month").setValue(yearmonth);
	  		}
	  	}--%>
    </script>
</body>
</html>