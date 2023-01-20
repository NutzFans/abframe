<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-06-20 16:08:29
  - Description:
-->
<head>
	<title>工时转换系数维护</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
    <div class="nui-panel" title="工时转换系数列表" style="width:100%;">
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
					         <td align="right"><span>受益部门:</span></td>
					        <!-- 受益部门 -->
					        <td>
					        	<input name="criteria._expr[5]._value"  class="nui-treeselect" expandOnLoad="0" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
					        	textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" style="width:200px;"/>
								<input class="nui-hidden" name="criteria._expr[5]._property" value="org"/>
								<input class="nui-hidden" name="criteria._expr[5]._op" value="in">
					        </td>
					    </tr>
					    <tr>
						    <td align="right"><span>财务月度：</span></td>
			            	<td align="left">
			            		<input class="nui-monthpicker" name="criteria._expr[2]._value" id="cwmonth" style="width:222px;" />
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="finyearmonth"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="="/> 
						    </td>
						    <td align="right"><span>最近更新日期：</span></td>
							<td>
						      	<input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px"/>-
					    		<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px" id="maxdatepicker"/>
						        <input class="nui-hidden" name="criteria._expr[4]._property" value="lastupdatetime"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>     
					        </td>
					       <td align="right"><span>填报部门:</span></td>
				           <td>
					        	<input name="criteria._expr[6]._value"  class="nui-treeselect" expandOnLoad="0" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
					        	textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
								showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true" style="width:200px;"/>
								<input class="nui-hidden" name="criteria._expr[6]._property" value="orgid"/>
								<input class="nui-hidden" name="criteria._expr[6]._op" value="in">
					        </td>
					    </tr>
					    <tr>
						    <td align="right"><span>设置人：</span></td>
			            	<td align="left">
			            		<input class="nui-textbox" name="criteria._expr[3]._value" style="width:100px"/>
						        <input class="nui-hidden" name="criteria._expr[3]._property" value="updater"/>
						        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[3]._rule" value="all"/>
						    </td>
			    			<td align="center" colspan="13">
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
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div> 
	    <!-- 修改数据源 -->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="transconfs"
	        url="com.primeton.eos.ame_common.ameTransconf.queryTransconf.biz.ext"   allowResize="true" pageSize="20" sizeList="[10,20,50,100,500]" 
	        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" onselectionchanged="selectionChanged">
	        <div property="columns"> 
	            <div type="checkcolumn"></div>
	<!--             <div field="finyearmonth" width="80" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM">财务年月</div>   -->
	            <div field="salesname" width="100" headerAlign="center" align="center" allowSort="false" >受益部门</div>             
	            <div field="orgname" width="100" headerAlign="center" align="center" allowSort="false" >填报部门</div>               
	            <div field="sybjtcb"  width="90" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="3" renderer="format">财务核算成本</div>
	            <div field="laborcost" width="90" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="3" renderer="format">工时总成本</div>
	            <div field="laborncost" width="90" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="3" renderer="format">非加班工时总成本</div>
	            <div field="transconf"  width="100" headerAlign="center" align="center" allowSort="true" dataType="float" decimalPlaces="6">系数</div>
	            <div field="finyearmonth"  width="60" headerAlign="center" align="center" allowSort="true">财务年月</div>
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
    	function init(){
    		grid.load();
			grid.sortBy("startdate","desc");
			}
      	function search() {	    		
			var form = new nui.Form("#form1");
			if(nui.get("maxdatepicker").getValue() != ""){
				nui.get("maxdatepicker").setValue(nui.get("maxdatepicker").getValue().substring(0,10) + " 23:59:59");
			}
			var data = form.getData(); //获取表单JS对象数据
			if (data.criteria._expr[2]._value != null && data.criteria._expr[2]._value != ''){
				var year =  nui.get("cwmonth").getValue().getFullYear();
	        	var month = nui.get("cwmonth").getValue().getMonth()+1;
	        	if(month<10){
		  			month = '0'+month;
		  		}
				data.criteria._expr[2]._value = year+'-'+month;
			}
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
	                url: "<%=request.getContextPath() %>/ame_common/transconf/addTransconf.jsp",
	                title: "新增工时转换系数", 
					width: 650,
		            height: 315,
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
			    var data = {transconfs:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {

	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
		                //逻辑流修改  
			                url: "com.primeton.eos.ame_common.ameTransconf.deleteTransconf.biz.ext",
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
    		var row = grid.getSelected();
    		if (row) {
      			nui.open({
  			// 编辑界面  
		            url: "<%=request.getContextPath() %>/ame_common/transconf/updateTransconf.jsp",
		            title: "编辑工时转换系数 ",
		            width: 650,
		            height: 315,
		            onload: function () {
		              var iframe = this.getIFrameEl();
		              // <!--var data = {action: "edit", emplevelid: row.emplevelid };-->
		              var data = {action: "edit", transconfid: row.transconfid };
		              iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		                if(action=="save"){
		                  grid.reload();
		                }
	           	 	}
            	});
            } else {
              nui.alert("请选中一条记录","提示");
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
		
		 //当选择列时
        function selectionChanged(){
            var rows = grid.getSelecteds();
            if(rows.length>1){
                nui.get("updateBtn").disable();
            }else{
                nui.get("updateBtn").enable();
            }
        }
	
    </script>
</body>
</html>