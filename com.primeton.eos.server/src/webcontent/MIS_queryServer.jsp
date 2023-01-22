<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-01 09:36:51
  - Description:
-->
<head>
<title>服务器信息维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>服务器名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="servname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>服务器类型：</span></td>
		            	<td align="left">
						    <input class="nui-dictcombobox" name="criteria._expr[1]._value" dictTypeId="MIS_SERVTYPE" style="width:100px;" />
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="servtype"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/> 
						</td>
					</tr>
					<tr>
						<td align="right"><span>服务器IP：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="servip"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>对应资产编号：</span></td>
		            	<td align="left">
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="assetid"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="in" id="tempcond21"/>
					        <input class="nui-hidden" name="criteria._expr[3]._ref" value="1" id="tempcond22"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="id"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.machine.machine.MisMachine"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="assetnum">
		            		<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="dyassetnum" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
					    </td>
						<td align="right"><span>服务器主要用途：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[4]._value" class="nui-textbox"  style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="servuse"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
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
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:415px;" allowResize="true" dataField="servers"
	    		 url="com.primeton.eos.server.servercomponent.queryServer.biz.ext"  
		 		 idField="serverid" sizeList="[5,15,25,50]" pageSize="15" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="20"></div>				
				<div field="servip"width="63" headerAlign="center"allowSort="true">服务器IP</div>	
				<div field="servos"width="80" headerAlign="center"allowSort="true">服务器操作系统</div>
				<div field="servuse" width="160"headerAlign="center"allowSort="true">服务器主要用途</div>
				<div field="servname" width="110" headerAlign="center" renderer="getDetail" allowSort="true">服务器名称</div>
				<div field="servtype" width="50" renderer="dictServtype" align="center" headerAlign="center" allowSort="true">服务器类型</div>
				<div field="assetnum" width="60" headerAlign="center"  allowSort="false">对应资产编号</div>			
				<div field="servmemory" width="55"headerAlign="center" allowSort="true">服务器内存(G)</div>
				<div field="servcpu" width="56"headerAlign="center" allowSort="true">服务器CPU(个)</div>
				<div field="servhardware"width="55" headerAlign="center"allowSort="true">服务器硬盘(G)</div>
			</div>
		</div>
		<script type="text/javascript">
			var form = new nui.Form("#form1");
	    	nui.parse();
	    	var grid = nui.get("datagrid1");
	    	init();
	    	function init(){
	    		grid.load();
				grid.sortBy("servname","desc");
				<%	UserObject user = (UserObject) session.getAttribute("userObject");
					Map attr = user.getAttributes();
					String userid = user.getUserId();
					DataObject[] roles = (DataObject[]) attr.get("roles");
					Boolean isServAdmin = false;
					for(int i=0;i<roles.length;i++){
						if(roles[i].getString("roleid").equals("servAdmin")){
							isServAdmin = true;
						}
					}
					if(isServAdmin == false){
				 %>
		 				nui.get("addBtn").disable();
		 				nui.get("updateBtn").disable();
		 				nui.get("deltbtn").disable();
		 		  <%}%> 	    	
				}
	    	function search() {
	    		if(nui.get("dyassetnum").getValue()==""){
				nui.get("tempcond21").setValue("=");
				nui.get("tempcond22").setValue("");
				} else {
				nui.get("tempcond21").setValue("in");
				nui.get("tempcond22").setValue("1");
				}
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			}
			function reset(){
				var form = new nui.Form("#form1");
				form.reset();
				grid.load();
			}
			function dictServtype(e) {
				return nui.getDictText('MIS_SERVTYPE',e.value);//设置业务字典值
			}
			function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/server/MIS_inputServer.jsp",
	                title: "新增信息", width: 800, height: 400,
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
			    var data = {servers:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {
	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
			                url: "com.primeton.eos.server.servercomponent.deleteServer.biz.ext",
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
	            url: "<%=request.getContextPath() %>/server/MIS_editServer.jsp",
	            title: "编辑数据",
	            width: 800,
	            height: 550,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = row;
	              //直接从页面获取，不用去后台获取
	              iframe.contentWindow.setData(data);
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
				var executeUrl = "<%=request.getContextPath() %>/server/MIS_detailServer.jsp?id=" + selectRow.servid;
				window.open(executeUrl, "服务器详细信息", "fullscreen=1");
		    }
	  </script>
</body>
</html>