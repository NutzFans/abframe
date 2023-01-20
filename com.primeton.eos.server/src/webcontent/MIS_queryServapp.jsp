<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-08 15:11:04
  - Description:
-->
<head>
<title>应用管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>应用中文名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="appchname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>应用名：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="appname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td> 
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
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:415px;" allowResize="true" dataField="servapps" url="com.primeton.eos.server.servercomponent.queryServapp.biz.ext" sizeList="[5,15,25,50]" pageSize="15" idField="appid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>			
				<div field="appid" width="0" headerAlign="center">应用id</div>
				<div field="servid" width="0" headerAlign="center">服务器id</div>
				<div field="appchname" width="125" headerAlign="center" renderer="getDetail" allowSort="true">应用中文名称</div>
				<div field="dyservip"width="90" headerAlign="center"allowSort="true">服务器IP</div>	
				<div field="dyservname" width="140" headerAlign="center" allowSort="false">服务器名称</div>							
				<div field="appinstallpath"width="0" headerAlign="center"allowSort="true">应用安装路径</div>				
				<div field="appaccessoutpath" width="130"headerAlign="center" allowSort="true">应用外网访问地址</div>
				<div field="appaccessinnerpath" width="150"headerAlign="center" allowSort="true">应用内网访问地址</div>
				<div field="appport"width="60" headerAlign="center"allowSort="true">应用端口号</div>
				<div field="appname"width="60" headerAlign="center"allowSort="true">应用名</div>
				<div field="governorpwd" name="governorpwd" width="0" headerAlign="center"allowSort="true">GOVERNOR密码</div>
				<div field="adminuser" width="80" headerAlign="center"allowSort="true">管理员用户名</div>
				<div field="adminpwd" name="adminpwd" width="0" headerAlign="center"allowSort="true">管理员密码</div>
				<div field="ishavebak" width="60" renderer="dictIshavebak" headerAlign="center"allowSort="true">是否有备份</div>
				<div field="appbakpath" width="0" headerAlign="center" allowSort="true">备份文件存放路径</div>
				<div field="baktype" width="70" renderer="dictBaktype" align="center" headerAlign="center" allowSort="true">备份机制</div>
				<div field="appuse" width="91" headerAlign="center"  allowSort="true">应用主要用途</div>	
			</div>
		</div>
		<script type="text/javascript">
			var form = new nui.Form("#form1");
	    	nui.parse();
	    	var grid = nui.get("datagrid1");
	    	init();
	    	function init(){
	    		grid.load();
				grid.sortBy("appid","desc");
				}
	    	function search() {	    		
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			}
			function reset(){
				var form = new nui.Form("#form1");
				form.reset();
				grid.load();
			}
			function dictIshavebak(e) {
				return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
			}
			function dictBaktype(e) {
				return nui.getDictText('MIS_BAKTYPE',e.value);//设置业务字典值
			}
			function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/server/MIS_modifyServapp.jsp",
	                title: "新增信息", width: 800, height: 300,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { action: "new"};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    grid.reload();
	                }
	            });
	        }
	        function remove() {
			    var rows = grid.getSelecteds();   //获取所有选中的行对象
			    var data = {servapps:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {
	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
			                url: "com.primeton.eos.server.servercomponent.deleteServapp.biz.ext",
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
	            url: "<%=request.getContextPath() %>/server/MIS_modifyServapp.jsp",
	            title: "编辑数据",
	            width: 800,
	            height: 300,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", appid: row.appid };
	              //直接从页面获取，不用去后台获取
	              iframe.contentWindow.SetData(data);
	              },
	              ondestroy: function (action) {
	                if(action=="saveSuccess"){
	                  grid.reload();
	                }
	              }
	              });
	            } else {
	              nui.alert("请选中一条记录","提示");
	            }
	        }
            function getDetail(e){
            	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
            }
            function checkDetail(){
		 		var selectRow = grid.getSelected();
				var executeUrl = "<%=request.getContextPath() %>/server/MIS_detailServapp.jsp?id=" + selectRow.appid;
				window.open(executeUrl, "应用详细信息", "fullscreen=1");
		    }
	  </script>
</body>
</html>