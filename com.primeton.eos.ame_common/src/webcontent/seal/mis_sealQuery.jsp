<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
	<!-- 
	  - Author(s): zhx。
	  - Date: 2015-04-03 15:57:54
	  - Description:
	-->
	<head>
		<title>印章登记查询页面</title>
	    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="nui-panel" title="印章管理" style="width:100%;">
			<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr> 
							<td align="right"><span>申请人：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[0]._value"  class="nui-textbox"  id="applyname" style="width:150px;" />
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="applyname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
								<!-- <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="like" id="applyname"/>  -->
							</td>
							<td align="right"><span>用章类型：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[1]._value" id="sealtype" class="nui-combobox" style="width:150px" allowInput="false" multiSelect="true" shownullItem="true"
									textField="sealname" valueField="confid" url="com.primeton.eos.ame_common.SealConfigure.querySealname.biz.ext" dataField="sealConfigures" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="sealtype" />
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
							</td> 
							<td align="right"><span>用章单位：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[3]._value" class="nui-textbox"  style="width:150px;"  />
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
							</td>
							<td align="right"><span>申请时间：</span></td>
			            	<td align="left">
							    <input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="applydate"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
							    <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
							</td>						
						</tr>
						<tr>
							<td align="right"><span>受益部门：</span></td>
			            	<!-- <td align="left">
							    <input name="criteria._expr[4]._value" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
									filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;">
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="orgid"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
							</td> -->
							<td>
							<input class="nui-treeselect" expandOnLoad="0"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" id="syb"
							showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
							name="criteria._expr[4]._value" id="syb" style="width:150px;"  nullItemText=""/>
							<input class="nui-hidden" name="criteria._expr[4]._property" value="orgid"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" id="tempCond81" value="in"/>
							<input class="nui-hidden" name="criteria._expr[9]._property" value="orgid"/>
							<input class="nui-hidden" name="criteria._expr[9]._op" id="tempCond82" value="in"/>
							<input class="nui-hidden" name="criteria._expr[9]._value" id="syb1"/>
							</td>
							
							<td align="right"><span>状态：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="SEAL_STATE" multiSelect="true" shownullItem="true" style="width:150px">
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="sealstate" />
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
							</td>
							<td align="right"><span>用章管理人：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[6]._value" class="nui-textbox" style="width:150px">
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="operatorer" />
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
							</td>
							<td align="right"><span>用章事由：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[7]._value" class="nui-textbox" style="width:205px">
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="memo" />
							    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
							</td>  
						</tr>
						<tr>
						<td align="right"><span>用章地点：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="AREA4SEAL" multiSelect="true" shownullItem="true" style="width:150px">
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="sealaddress" />
							    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
							</td>
						
						</tr>
					    <tr>
			    			<td align="center" colspan="15">
	                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
	                            <a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>	
	                            <a class="nui-button" id="export-seal"  iconCls="icon-download" onclick="exportRd()">导出</a>
	                            
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
		                        <a class="nui-button" id="add-seal" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="edit-seal" iconCls="icon-edit" id="ediBtn" onclick="edit()">编辑</a>
		                        <a class="nui-button" id="delete-seal" iconCls="icon-remove" id="delBtn" onclick="remove()">删除</a>        
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:300px;" allowResize="true" dataField="seals" 
		    url="com.primeton.eos.ame_common.seal.QuerySeal.biz.ext"  ondrawsummarycell="doCountSum" idField="id" multiSelect="true" showSummaryRow="true">
				<div property="columns">
					<div type="checkcolumn" width="15"></div>
					<div field="applyname" width="40"  align="center" headerAlign="center" allowSort="true">申请人</div>
					<div field="orgname" width="60"  align="center" headerAlign="center" allowSort="true">受益部门</div>
					<div field="sealname" width="80"  align="center" headerAlign="center" allowSort="true">印章类型</div>
					<div field="sealaddress" width="60"  align="center" headerAlign="center" allowSort="true" renderer="getSealaddress">用章地点</div>
					<div field="custname" width="120" headerAlign="center" allowSort="true" align="left">文件接收单位</div>
					<div field="filenum"  width="60" headerAlign="center" summaryType="sum" allowSort="true" align="center">文件份数</div>
					<div field="sealstate" width="40"  align="center" headerAlign="center" allowSort="true" renderer="getSealstate">状态</div>
					<div field="memo" width="150" headerAlign="center" align="left" allowSort="true">用章事由</div>
					<div field="operatorer" width="60" headerAlign="center" align="left" allowSort="true">用章管理人</div>
					<div field="sealdate" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">用章日期</div>
					<div field="applydate" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">申请时间</div>
					
				</div>
			</div>
		</div>
		<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
		</form>
		<script type="text/javascript">
	    	nui.parse();
	    	var form = new nui.Form("#form1");
	    	var grid = nui.get("datagrid1");
	    	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
		String nowuserorgid=user.getUserOrgId(); %>
	
	
		var nowusername = '<%=nowusername %>';
	    	//初始化
	    	init1();
	    /* 	function init(){
	    		grid.load();
				grid.sortBy("applydate","desc");
	    	}
	    	 */
	    	
	    function init1(){
		form.reset();
		//初始化事业部
		var json = {"code":"sealQuery","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
            url: "com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
            data:json,
            type: "post",
            cache: false,
            contentType: 'text/json',
            success: function (text) {
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时没有权限
						nui.get("applyname").setValue(nowusername)
						nui.get("applyname").setReadOnly(true)
						
					}else{
						nui.get("syb").loadList(text.orgs, "orgid", "parentorgid");
						
						if(text.orgids){
							
							var isall;
							for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
								nui.get("tempCond81").setValue("=");
        						nui.get("tempCond82").setValue("=");
        						nui.get("syb").setValue("");
        						nui.get("syb1").setValue(""); 
        						
        					/* 	console.log("quanbu")
        						nui.get("syb1").setValue(text.orgids); */
        						
						}else{
							nui.get("syb1").setValue(text.orgids);
							
						}
						
						}else{
						
						nui.get("applyname").setValue(nowusername)
						}
					}
				}else{
						nui.get("applyname").setValue(nowusername)
					}
				//初始化页面
				search();
            },
            error: function () {
            }
       	});
	}
	    	
	    	
	    	
	    	//查询
			function search() {
			/* 	if((nui.get("syb").getValue()==""||nui.get("syb").getValue()==null)){
				nui.get("tempCond81").setValue("=");
				nui.get("tempCond82").setValue("");
				nui.get("syb").setValue("=");
				nui.get("syb1").setValue("");
			}else{
				nui.get("tempCond81").setValue("in");
				nui.get("tempCond82").setValue("8");
				nui.get("syb").setValue("in");
				nui.get("syb1").setValue("0");
				
			}  */	
				if(!(nui.get("syb").getValue()==""||nui.get("syb").getValue()==null)){
			
				nui.get("tempCond81").setValue("in");
				nui.get("tempCond82").setValue("in");
				}
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			  	grid.sortBy("applydate","desc");
			  	getOpeatorButtonAuth("add-seal,edit-seal,delete-seal,export-seal");//操作按钮权限初始化 
			  	
			  	
			}
			
			//删除
			function remove() {
			    var rows = grid.getSelecteds();   //获取所有选中的行对象
			    var data = {seall:rows};
			    var json = nui.encode(data);     //序列化成json字符串
				if (rows.length> 0) {
	            	if (confirm("确定删除选中记录？")) {
		                grid.loading("操作中，请稍后......");
		                nui.ajax({
			                url: "com.primeton.eos.ame_common.seal.deleteSeal.biz.ext",
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
	        
	        //增加
	        function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_common/seal/SealInput.jsp",
	                title: "新增信息", width: 730, height: 400,
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
	        
	        //修改
	        function edit() {
	            var row = grid.getSelected();
	            if (row) {	            	
		                nui.open({
		                    url: "<%=request.getContextPath() %>/ame_common/seal/SealInput.jsp",
		                    title: "编辑信息", width: 730, height: 400,
		                    onload: function () {
		                        var iframe = this.getIFrameEl();
		                        var data = {action: "edit", sealid: row.sealid };
		                        iframe.contentWindow.SetData(data);
		                    },
		                    ondestroy: function (action) {
		                        grid.reload();
		                    }
		                });					
	            } else {
	                alert("请选中一条记录");
	            }
	        }
	        
	        //重置
			function reset(){
				form.reset();
				grid.load();
			}
			
			function getSealstate(e) {
		        var record = e.record;
		    	var processinstid = record.processinstid;
		    	if(processinstid){
		    		var s = " <a  href='javascript:void(0)' onclick='checkApply();' >"+ nui.getDictText('SEAL_STATE',e.value); +"</a>";
		    		return s;
		    	}else{
		    		return nui.getDictText('SEAL_STATE',e.value);
		    	}
		    }
		    
		    function getSealaddress(e) {
		       
		    		return nui.getDictText('AREA4SEAL',e.value);
		    	
		    }
			
			//申请流程
		    function checkApply(){
		    	var selectRow = grid.getSelected();
				var processInstID = selectRow.processinstid;
				var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
				var title = "流程图查看";
				var width=1000;
			    nui.open({
					url: url,
					title: title,
					width: width,
					height: 550,
					onload: function () {
						var iframe = this.getIFrameEl();
						if(iframe.contentWindow.initData) {
							iframe.contentWindow.initData({"processInstID": processInstID});
						}
					},
					ondestroy: function (action){
					}
				});
		    }
		    
		    //设置合计行样式---数字靠右等
	function doCountSum(e){
		if (e.field == "filenum") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml +"份"+ "</b></div>";
        }
       
	}
	
	//导出
		function exportRd(){
			if(!confirm("是否确认导出？")){
				return;
			}
			var data = form.getData();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.primeton.eos.ame_common.seal.exportSeal.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "sealQuery";
		        	var myDate = new Date();
		        	var year = myDate.getFullYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9){
						curDateTime = curDateTime + "" + month;
					}else{
						curDateTime = curDateTime + "0" + month;
						}
		        	if(day>9){
						curDateTime = curDateTime + day;
					}else{
						curDateTime = curDateTime + "0" + day;
						}
					if(hours>9){
						curDateTime = curDateTime + hours;
					}else{
						curDateTime = curDateTime + "0" + hours;
						}
					if(minutes>9){
						curDateTime = curDateTime + minutes;
					}else{
						curDateTime = curDateTime + "0" + minutes;
						}
					if(seconds>9){
						curDateTime = curDateTime + seconds;
					}else{
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
			});
		}
	
	
	    </script>
	</body>
</html>