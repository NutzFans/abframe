<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
	UserObject user = (UserObject) session.getAttribute("userObject");
   	String username = user.getUserName();
   	String userno = user.getUserId();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-02-22 16:46:53
  - Description:
-->
<head>
	<title>供应商股东和高管管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="供应商股东和高管管理" style="width: auto">
			<div style="width: 100%;height:20;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width:120px;"><span>供应商名称：</span></td>
			            	<td align="left" style="width:280px;">
			            		<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:150px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td> 
							<td align="right" style="width:120px;"><span>姓名：</span></td>
			            	<td align="left" style="width:280px;">
							    <input name="criteria._expr[1]._value" id="shareholderName" onblur="setName" class="nui-textbox" style="width:150px;"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="shareholderName"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							    <input name="criteria._expr[2]._value" id="executivesName" class="nui-hidden" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="executivesName"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
							</td> 
							<td align="right" style="width:120px;"><span>身份证号码：</span></td>
			            	<td align="left" style="width:280px;">
							    <input name="criteria._expr[3]._value" id="shareholderCardno" onblur="setCardno" class="nui-textbox" style="width:180px;"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="shareholderCardno"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
							    <input name="criteria._expr[4]._value" id="executivesCardno" class="nui-hidden"  style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="executivesCardno"/>
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
		    <div style="width: 100%;">
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
		    <div style="width: 1350px;height: 375px;">
			    <div style="float: left;width: 650px;height: 320px;">
				    <fieldset style="width: 640px;">
				    	<legend>供应商股东信息</legend>
					    <div id="datagridShareholder" class="nui-datagrid" style="width: 100%;height: 300px;" allowResize="true" dataField="purSupplierShareholders" 
					    	url="com.primeton.eos.ame_pur.PurSupplierManager.queryPurSupplierShareholder.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]" multiSelect="true">
							<div property="columns">
								<div type="checkcolumn" width="25"></div>	
								<div field="custname" width="auto" align="left" headerAlign="center" renderer="getDetail" allowSort="true">供应商名称</div>	
								<div field="custnum" width="0" align="center" headerAlign="center" allowSort="true">供应商编号</div>
								<div field="suppliersname" width="0" align="center" headerAlign="center" allowSort="true">供应商简称</div>							
								<div field="shareholderName" width="80" align="center" headerAlign="center" allowSort="true">股东姓名</div>
								<div field="shareholderCardno" width="130" align="left" headerAlign="center" allowSort="true">身份证号码</div>
								<div field="shareholdingRatio" width="60" align="left" headerAlign="center" allowSort="true" numberFormat="p">持股比例</div>
								<div field="comment" width="140" align="left" headerAlign="center" allowSort="true">备注（持股期间+比例）</div>
								<div field="updateTime" width="0" align="center" headerAlign="center" allowSort="true">更新日期</div>
							</div>
						</div>
					</fieldset>
				</div>
				<div style="float: left;margin-left: 10px;width: 650px;height: 320px;">
					<fieldset style="width: 640px;">
						<legend>供应商高管信息</legend>
						<div id="datagridExecutives" class="nui-datagrid" style="width: 100%;height: 300px;" allowResize="true" dataField="purSupplierExecutives" 
					    	url="com.primeton.eos.ame_pur.PurSupplierManager.queryPurSupplierExecutives.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]" multiSelect="true">
							<div property="columns">
								<div type="checkcolumn" width="25"></div>	
								<div field="custname" width="auto" align="left" headerAlign="center" renderer="getDetail" allowSort="true">供应商名称</div>	
								<div field="custnum" width="00" align="center" headerAlign="center" allowSort="true">供应商编号</div>
								<div field="suppliersname" width="0" align="center" headerAlign="center" allowSort="true">供应商简称</div>							
								<div field="executivesName" width="80" align="center" headerAlign="center" allowSort="true">高管姓名</div>
								<div field="executivesCardno" width="130" align="left" headerAlign="center" allowSort="true">身份证号码</div>
								<div field="executivesPositions" width="60" align="center" headerAlign="center" allowSort="true">高管职务</div>
								<div field="comment" width="140" align="left" headerAlign="center" allowSort="true">备注（任职期间）</div>
								<div field="updateTime" width="0" align="center" headerAlign="center" allowSort="true">更新日期</div>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		//供应商股东
		var datagridShareholder = nui.get("datagridShareholder");
		//供应商高管
		var datagridExecutives = nui.get("datagridExecutives");
		init();
    	function init(){
			var data = form.getData(); //获取表单JS对象数据
			datagridShareholder.sortBy("shareholderName","asc");
    		datagridShareholder.load(data,function(){
    			datagridExecutives.sortBy("executivesName","asc");
				var data2 = form.getData();
				datagridExecutives.load(data2);
    		});
		}
		
		function search(){
			var data = form.getData(); //获取表单JS对象数据
			datagridShareholder.sortBy("shareholderName","asc");
    		datagridShareholder.load(data,function(){
    			datagridExecutives.sortBy("executivesName","asc");
				var data2 = form.getData();
				datagridExecutives.load(data2);
    		});
		}	
		
		function reset(){
			form.reset();
			var data = form.getData(); //获取表单JS对象数据
			datagridShareholder.sortBy("shareholderName","asc");
    		datagridShareholder.load(data,function(){
    			datagridExecutives.sortBy("executivesName","asc");
				var data2 = form.getData();
				datagridExecutives.load(data2);
    		});
		}
		
		//设置高管姓名
		function setName(){
			nui.get("executivesName").setValue(nui.get("shareholderName").getValue());
		}
		
		//设置高管姓名
		function setCardno(){
			nui.get("executivesCardno").setValue(nui.get("shareholderCardno").getValue());
		}
		
		function add(){
			nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/PurSupplierManager/PurSupplierManagerAdd.jsp",
                title: "新增供应商股东和高管信息", 
				width: 1060,
	            height: 450,
                onload: function () {
                    //var iframe = this.getIFrameEl();
                    //var data = { action: "new"};
                    //iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	if(action == "ok"){
			    		datagridShareholder.reload();
						datagridExecutives.reload();
                	}
                }
            });
		}
		
		function edit(){
			var rows1 = datagridShareholder.getSelecteds();
			var rows2 = datagridExecutives.getSelecteds();
			var custid = "";
			var custname = "";
			var suppliersname = "";
			if((rows1.length + rows2.length) > 1){
				nui.alert("只能选择一条记录！");
				return;
			}
			if(rows1.length == 1){
				var rows11 = datagridShareholder.getSelected();
				custid = rows11.custid;
				custname = rows11.custname;
				suppliersname = rows11.suppliersname;
				nui.open({
	                url: "<%=request.getContextPath() %>/ame_pur/PurSupplierManager/PurSupplierManagerEdit.jsp",
	                title: "编辑供应商股东和高管信息", 
					width: 1060,
		            height: 450,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { "action": "edit","custid": custid,"custname": custname,"suppliersname": suppliersname};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                	if(action == "ok"){
				    		datagridShareholder.reload();
							datagridExecutives.reload();
	                	}
	                }
	            });
			}else if(rows2.length == 1){
				var rows22 = datagridExecutives.getSelected();
				custid = rows22.custid;
				custname = rows22.custname;
				suppliersname = rows22.suppliersname;
				nui.open({
	                url: "<%=request.getContextPath() %>/ame_pur/PurSupplierManager/PurSupplierManagerEdit.jsp",
	                title: "编辑供应商股东和高管信息", 
					width: 780,
		            height: 450,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { "action": "edit","custid": custid,"custname": custname,"suppliersname": suppliersname};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                	if(action == "ok"){
				    		datagridShareholder.reload();
							datagridExecutives.reload();
	                	}
	                }
	            });
			}else{
				nui.alert("请选择一条记录！");
				return;
			}
		}
		
		function remove(){
			var rows1 = datagridShareholder.getSelecteds();
			var rows2 = datagridExecutives.getSelecteds();
			if((rows1.length + rows2.length) == 0){
				nui.alert("请至少选中一条记录！");
				return;
			}
			var suppliersname = "";
						//alert("哈哈".indexOf("哈哈"));
			for(var i = 0;i < rows1.length;i ++){
				if(suppliersname){
					if(suppliersname.indexOf(rows1[i].suppliersname) > -1){
						
					}else{
						suppliersname = suppliersname + "，" + rows1[i].suppliersname;
					}
				}else{
					suppliersname = rows1[i].suppliersname;
				}
				
			}
			for(var i = 0;i < rows2.length;i ++){
				if(suppliersname.indexOf(rows2[i].suppliersname) > -1){
						
				}else{
					if(suppliersname){
						suppliersname = suppliersname + "，" + rows2[i].suppliersname;
					}else{
						suppliersname = rows2[i].suppliersname;
					}
				}
			}
			nui.confirm("确定要删除选中记录吗？","系统提示",function(o){
				if(o=="ok"){
					var data = {};
					data.deleteShareholders = rows1;
					data.deleteExecutives = rows2;
					data.suppliersname = suppliersname;
					var json = nui.encode(data);
		            nui.ajax({
		                url: "com.primeton.eos.ame_pur.PurSupplierManager.deletePurSupplierManager.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
		                success: function (o) {
		                	if(o.exception == null){
		                		nui.alert("删除成功！",null,function(){
		                			datagridShareholder.reload();
									datagridExecutives.reload();
		                		});
		                	}else{
		                		nui.alert("删除失败！");
		                	}
		               	}
					});
				}else{
					return;
				}
			
			});
		}
		
		function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = datagridShareholder.getSelected();
			var executeUrl = "/default/ame_pur/PurSupplier/DetailPurSupplier.jsp?id=" + selectRow.custid;
			window.open(executeUrl, "供应商详细信息", "fullscreen=1");
	    }
		
		
	</script>
</body>
</html>