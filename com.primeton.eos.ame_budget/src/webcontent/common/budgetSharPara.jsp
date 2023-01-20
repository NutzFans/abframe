<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2018-11-29 17:23:19
  - Description:
-->
<head>
<title>预算损益计算项参数设置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="预算损益计算项参数设置" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>预算年度：</span></td>
			           	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"   id="year"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="year"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>计算项：</span></td>
			           	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-dictcombobox" dictTypeId="AME_SHARTERM" showNullItem = "true" style="width:120px;"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="sharterm"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right"><span>预算机构：</span></td>
			           	<td align="left">
			           		<input class="nui-textbox" name="criteria._expr[2]._value" style="width:120px;"/>
			           		<input class="nui-hidden" name="criteria._expr[2]._property" value="orgname"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>计算模式：</span></td>
			           	<td align="left">
			           		<input class="nui-dictcombobox"name="criteria._expr[3]._value" dictTypeId="AME_SHARCALTYPE" showNullItem = "true"  style="width:120px;"/>
			           		<input class="nui-hidden" name="criteria._expr[3]._property" value="caltype"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
						</td> 
					</tr>
				    <tr>
			    		<td align="center" colspan="15">
		                       <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		                       <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                </td>
		            </tr>
		           </table>           
		        </div>
		    </div>
		    
		    <div style="width:100%;">
			    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			        <table style="width:100%;">
			            <tr>
			                <td style="width:20%;">
                        		<a class="nui-button" iconCls="icon-add" onclick="add()">设置</a>
                        		<!-- <a class="nui-button" iconCls="icon-edit" onclick="edit()">编辑</a> -->
                        		<a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>     
			                </td>
			            </tr>
			        </table>
			    </div>
			</div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="budSharParas" 
		        	url="com.primeton.eos.ame_budget.common.queryBudSharPara.biz.ext" 
		        	 allowCellSelect="true" multiSelect="true" showPager="true"  >
		        <div property="columns">
		               <div type="checkcolumn" width="30"></div>
		               <div field="year" width="80" align="center" headerAlign="center" allowSort="true">预算年度</div>
		               <div field="orgname" width="120" align="center" headerAlign="center" allowSort="true">机构名称</div>
		               <div field=sharterm width="100" align="center" headerAlign="center" renderer="getDictTerm" allowSort="true">计算项</div>
		               <div field=caltype width="100" align="center" renderer="getDictType" headerAlign="center">计算模式</div>
		               <div field="shartarget" width=120 align="left" renderer="getDictTarget" headerAlign="center">计算指标</div>
		               <div field="parameters" width=80 align="center" headerAlign="center" >参数值</div>
		               <div field="sharmemo" width=300 align="left" headerAlign="center">计算说明</div>
		        </div>
		    </div>
		<script type="text/javascript">
			nui.parse();
			/* var myDate = new Date();
			nui.get("year").setValue(myDate.getFullYear()); */
			var grid = nui.get("datagrid1");
			var form = new nui.Form("form1");
			//初始化加载数据,默认按照预算年度降序排列
			init();
	    	function init() {
	    		var data = form.getData();
			  	grid.load(data); 
	    		grid.sortBy("year","asc");
	    	}
	    	//执行多条件查询
	        function search() {
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			}
			//重置多条件查询
			function reset(){
				var form = new nui.Form("#form1");
				form.reset();
			}
			
		        //编辑页面
	    function add() {
	  		nui.open({
	            url: "<%=request.getContextPath() %>/ame_budget/common/ModifySharPara.jsp",
	            title: "预算分摊设置",
	            width: 500,
	            height: 350,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "add"};
	              iframe.contentWindow.setData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="saveSuccess"){
	                  grid.reload();
	                }
	            }
	        });
	    }
	    
	            //编辑页面
	    function edit() {
	  		var row = grid.getSelecteds();
		if (row.length==1) {
	  		nui.open({
	            url: "<%=request.getContextPath() %>/ame_budget/common/ModifySharPara.jsp",
	            title: "编辑预算设置",
	            width: 500,
	            height: 350,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit",sharPara:row[0]};
	              iframe.contentWindow.setData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="saveSuccess"){
	                  grid.reload();
	                }
	            }
	        });
	        }else{
	        	nui.alert("请选中一条记录","提示");
	        }
	    }
	    
	    function remove(){
    		var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {sharParas:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
            	if (confirm("确定删除选中记录？")) {
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_budget.common.deleteSharPara.biz.ext",
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
                alert("请选中一条记录");
            }
	    }
	    
	    function getDictTerm(e){
	    	 return nui.getDictText('AME_SHARTERM',e.value);//设置业务字典值
	    }
	    function getDictType(e){
	    	 return nui.getDictText('AME_SHARCALTYPE',e.value);//设置业务字典值
	    }
	    function getDictTarget(e){
	    	 return nui.getDictText('AME_SHARTARGET',e.value);//设置业务字典值
	    }
		</script>
</body>
</html>