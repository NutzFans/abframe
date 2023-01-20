<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2019-04-24 16:30:56
  - Description:
-->
<head>
	<title>配置动态表单</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-panel" title="动态业务表单信息" style="width:100%;">
		<div id="form1"  style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">业务代码：</td>
						<td>
							<input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="busformname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right">业务描述：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="busform"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right">业务类型：</td>
						<td>
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="buscode"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right">业务类型名称：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="buscodename"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						</tr>
	            </table>
	            <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
		                </td>
		            </tr>
        		</table>         
            </div>
        </div>
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="button_inorgid1">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="remove()">删除</a>
                        <a class="nui-button" id="copybutton" iconCls="icon-addnew" onclick="copy()">复制</a>
                    </td>
                </tr>
             </table>           
        </div>
    	<div id="grid_dyForm" class="nui-datagrid" dataField="dyforms" style="width:100%;height:auto;" allowCellSelect="true" multiSelect="true"
    	url = "com.primeton.eos.ame_common.ameFormConfig.queryDyForm.biz.ext" showPager="true"  sizeList="[10,20,50,100]" allowSortColumn="true">
            <div property="columns">
            	<div type="checkcolumn" width="10"></div>
                <div field="busform" width="60" align="left" headerAlign="center">业务代码</div>
                <div field="busformname"  width="120" align="left" headerAlign="center">业务描述</div>
                <div field="buscode"  width="50" align="left" headerAlign="center">业务类型</div>
                <div field="buscodename"  width="90" align="left" headerAlign="center">业务类型名称</div>
                <div width="60" align="center" renderer=onActionRenderer headerAlign="center">操作</div>
            </div>
        </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("grid_dyForm");
	var form = new nui.Form("form1");
	
	search();
	function search(){
		var data = form.getData();
		grid.load(data);
		grid.sortBy("busform","asc");
	}
	
	function reset(){
		form.reset();
		search();
	}
	//操作
	function onActionRenderer(e) {
		var record = e.record;
        var uid = record._uid;
		return "<a  href='javascript:void(0)' onclick='confform("+e.record.bussformid+");' style = 'text-decoration:none;'>配置表单信息</a>"+"&emsp;|&emsp;"+" <a  href='javascript:void(0)' onclick='preView("+uid+");' style = 'text-decoration:none;'>预览</a>";
    }
    
     //新增业务表单信息
    function add(){
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_common/dynamic_form/configForm.jsp",
            title: "配置业务表单",
            width: 1200,
            height: 550,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "add"};
              iframe.contentWindow.setData(data);
            },
            ondestroy: function (action) {
                if(action=="ok"){
                  grid.reload();
                }
            }
        });
    }
    
    //配置表单信息
    function confform(e){
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_common/dynamic_form/configForm.jsp",
            title: "配置业务表单",
            width: 1200,
            height: 550,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "edit", bussformid: e };
              iframe.contentWindow.setData(data);
            },
            ondestroy: function (action) {
                if(action=="ok"){
                  grid.reload();
                }
            }
        });
    }
    
    //复制这条记录，打开配置页面将这条记录的信息自动带入，清空主键id及业务类型代码，业务类型名称
    function copy(){
    	var rows = grid.getSelecteds();
    	if(rows.length!=1){
    		nui.alert("请选中一条记录！");
    		return;
    	}else{
	    	nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/dynamic_form/configForm.jsp",
	            title: "配置业务表单",
	            width: 1200,
	            height: 550,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "copy", bussformid: rows[0].bussformid };
	              iframe.contentWindow.setData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="ok"){
	                  grid.reload();
	                }
	            }
	        });
    	}
    }
    
    //删除选中记录
    function remove(){
    	var rows = grid.getSelecteds();
    	if(rows.length==0){
    		nui.alert("请选中一条记录！");
    	}else{
    		nui.confirm("是否确认删除","提示",function(action){
    			if(action=="ok"){
		    		var json = {bussforms:rows};
					nui.ajax({
			            url: "com.primeton.eos.ame_common.ameFormConfig.deleteDyForm.biz.ext",
			            type: "post",
			            data: json,
			            cache: false,
			            contentType: 'text/json',
			            success: function (o) {
			            	if(o.result=="1"){
				            	nui.alert("删除成功！","提示",function(){
					            	grid.reload();
				            	});
			            	}else{
			            		nui.alert("删除失败，请联系信息技术部！");
			            	}
			            },
			            error: function () {
			            	alert("error");
			            }
			        });
    			}
    		});
    	}
    }
    
    //预览
    function preView(uid){
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_common/dynamic_form/formPreview.jsp",
            title: "业务表单预览",
            width: 900,
            height: 450,
            onload: function () {
              var iframe = this.getIFrameEl();
              var row = grid.getRowByUID(uid);
              var data = {busform: row.busform,buscode:row.buscode };
              iframe.contentWindow.setData(data);
            },
            ondestroy: function (action) {
            }
        });
    }
</script>
</html>