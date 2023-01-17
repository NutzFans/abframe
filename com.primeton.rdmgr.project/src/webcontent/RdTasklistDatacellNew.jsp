<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2016-08-03 10:47:08
  - Description:
-->
<head>
<title>项目关联工时</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
            	<tr>
            		<td>
                		项目工时活动维护
                	</td>
                </tr>
            </table>           
        </div>
</div> 
	<div style="width: 100%; height: 100%; padding: 0px; margin: 2px 0 0 0;">
		<input name="RdProject.projectId" id="tasklist" class="nui-hidden" />
		<div style="width: 100%; height: 100%; padding: 0px; margin: 0px;"id="form1">
			<div style="width: 49%;float:left" >
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 20%;">项目分类列表</td>
						</tr>
					</table>
				</div>
				<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" showPager="false" dataField="RdTasklist" showPageInfo="false"
				    url="com.primeton.rdmgr.project.rdtasklistbiz.queryRdTasklistsNew.biz.ext" onselectionchanged="onSelectionChanged" multiSelect="false">
			        <div property="columns">   
			        	<div field="dictid" width="50" headerAlign="center" visible="true">项目类别ID</div>         
			            <div field="dictname" width="130" headerAlign="center">项目类别</div>     
			        </div>
		    	</div>    
			</div>
			
			<div style="width: 50%; height: 50%; padding: 0px; margin: 0px; float: right" >
				<div style="width: 100%;">
					<div class="nui-toolbar" id="id1"
						style="border-bottom: 0; padding: 0px;">
						<table style="width: 100%;">
							<tr>
								<td id="id3" style="width: 250px"></td>
							</tr>
						</table>
					</div>
				</div>
				<div style="width: 100%;">
					<div class="nui-toolbar" id="id2"
						style="border-bottom: 0; padding: 0px;">
						<table style="width: 100%;">
							<tr>
								<td style="width: 100%;"><a class="nui-button"
									iconCls="icon-add" onclick="addRow()" plain="true">增加</a> <a
									class="nui-button" iconCls="icon-remove" onclick="removeRow()"
									plain="true">删除</a> <span class="separator"></span> <a
									class="nui-button" iconCls="icon-save" id="saveid"
									onclick="saveData()" plain="true">保存</a></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 400px;"  showPager="false" showPageInfo="false" pageSize="100" dataField="RdTasklist" allowCellEdit="true" allowCellSelect="true" editNextOnEnterKey="true" allowCellValid="true" oncellendedit="ccc"
					url="com.primeton.rdmgr.project.rdtasklistbiz.getTasklist.biz.ext">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="tasklist" width="120" displayField="taskname"> 
							工时活动名称 <input property="editor" shownullItem="true" class="nui-combobox" url="com.primeton.rdmgr.project.rdtasklistbiz.queryTask.biz.ext" textField="taskname" valueField="tasklist" dataField = "RdTask" allowInput="true" style="width: 100%;" />
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<script type="text/javascript">
		var form = new nui.Form("#form1");
		nui.parse();
		var grid = nui.get("datagrid1");
		var grid1 = nui.get("datagrid2");
		init();
		function init() {
			//隐藏列表
			nui.get("id1").hide();
			nui.get("id2").hide();
			nui.get("datagrid2").hide();
			grid.load();
			grid.sortBy("projectName", "desc");
		}
		
		function ccc(e) {
			var data = grid1.getData();
			var record = e.record;

			for (var i = 0; i < data.length; i++) {
				if (record._uid != data[i]._uid) {
					if (record.taskname == data[i].taskname) {
						alert("该任务已存在,修改后才能继续保存!");
						nui.get("saveid").disable();
						return false;
					} else if (record.taskname != data[i].taskname) {
						nui.get("saveid").enable();
					}
				}
			}
		}

		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.load(data); //datagrid加载数据
		}

		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}

		function getdict1(e) {
			return nui.getDictText('PROJECT_TYPE', e.value);//设置业务字典值
		}
		function addRow() {
			var newRow = {
				name : "New Row"
			};
			grid1.addRow(newRow, 0);
		}

		function removeRow() {
			var rows = grid1.getSelecteds();
			if (rows.length > 0) {
				grid1.removeRows(rows, true);
			}
		}

		function saveData() {
			var rows = grid.getSelected();
			var projecttype = rows.dictid;
			var data = {
				rdtasklistprojtypes : grid1.getChanges(),
				projecttype : projecttype
			};
			var datas = grid1.getChanges();
			for (var i = 0; i < datas.length; i++) {
				if (datas[i]._state == 'modified' || datas[i]._state == 'added') {
					var e = datas[i].tasklist;
					if (e == null ) {
						alert("任务不允许为空，请检查!");
						return false;
					}
				}
			}
			var json = nui.encode(data);
			//grid.loading("保存中，请稍后......");
			nui.ajax({
						url : "com.primeton.rdmgr.project.rdtasklistbiz.saveRdTasklistProjectType.biz.ext",
						type : 'POST',
						data : json,
						success : function(text) {
							grid1.reload();
							if(text.result==0)
							{alert("无法执行修改操作！");}
							
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert(jqXHR.responseText);
						}
					});
		}

		function onSelectionChanged(e) {
			//展示列表
			nui.get("id1").show();
			nui.get("id2").show();
			nui.get("datagrid2").show();
			var grid = e.sender;
			var record = grid.getSelected();
			document.getElementById("id3").innerHTML = record.dictname + "工时活动";
			
			if (record) {
				grid1.load({projecttype : record.dictid},function(){
					var datagrid1 = grid1.getData();
					
				});
				
			}
		}
	</script>
</body>
</html>