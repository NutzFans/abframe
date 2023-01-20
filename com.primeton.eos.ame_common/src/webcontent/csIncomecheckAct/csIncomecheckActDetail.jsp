<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common.jsp"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-24 17:07:54
  - Description:
-->
<head>
<title>流程审核要点配置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-panel" title="配置详情" style="width:100%;height:50%;" buttons="collapse">
		<div style="width:100%;" id="exp1">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	            		<td style="width:20%;">
	            			<a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addRow()">增加</a>
	                        <a class="nui-button" id="deleteWXBtn" iconCls="icon-remove" onclick="deleteRow()">删除</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-save" onclick="saveD()">保存</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" onrowclick="doView" allowSortColumn="false" multiSelect="true"
	    	url="com.primeton.eos.ame_common.csIncomecheckAct.querycheckAct.biz.ext" dataField="datas" allowCellEdit="true" allowCellSelect="true" >
			<div property="columns">
				<div type="checkcolumn" width="10"></div>
				<div field="processdefname" width="100" align="center" headerAlign="center" allowSort="true">流程定义名称</div>
				<div field="activitydefid" width="40" align="center" headerAlign="center" allowSort="true">活动定义ID</div>
				<div field="busicode" width="20" align="center" headerAlign="center" >业务参数
					<input id="busicode" property="editor" class="nui-textbox" inputstyle="text-align: center;" onvaluechanged="checkBusicode"/>
				</div>
				<div field="busicodedesc" width="150" align="left" headerAlign="left" >参数说明
					<input property="editor" class="nui-textbox" inputstyle="text-align: left;"/>
				</div>
			</div>
	   	</div>
   	</div>
   	<div id ="checklist" class="nui-panel" title="核查要点与配置关联关系" style="width:100%;height: 50%;visibility: hidden;" buttons="collapse">
		<div class="nui-fit" >
			<!-- 机构树展现  start-->
			<ul id="tree1" class="nui-tree"  
				style="width:100%;height:90%;padding:5px;"  resultAsTree ="false" showTreeIcon="true" 
				textField="checklistname" checklistname""  dataField="csIncomechecklists"   idField="checklistid" showCheckBox="true" checkRecursive="true" resultAsTree="false"  expandOnLoad="0"
				parentField="parentid"  allowDrag="true" allowLeafDropIn="true" ondrawnode="onDrawNode" onbeforenodecheck="onBeforeNodeCheck" allowSelect="false" enableHotTrack="false">      
			</ul>
		</div>
		<div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="saveFunc" id="a" style="width:60px;margin-right:20px;">保存</a>
		</div>
	</div>
</body>
<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		var tree = nui.get("tree1");
		var freshNode = null;
		var addNode = null;
		var rootNode = tree.getRootNode();
		var processdefname = '<%=request.getParameter("processdefname") %>';
		var activitydefid = '<%=request.getParameter("activitydefid") %>';
		init();
		
		function init(){
			var data = {"processdefname":processdefname,"activitydefid":activitydefid};
			grid.load(data);
		}
		
		
		//增加配置
		function addRow(){
			var newRow = { name: "New Row","processdefname": processdefname,"activitydefid": activitydefid};
	        grid.addRow(newRow, 0);
		}
		
		//删除配置
		function deleteRow(){
			var rows = grid.getSelecteds();
			grid.removeRows(rows, false);
		}
		
		//保存配置
		function saveD(){
			var adddata = grid.getChanges("added",false);
			var removeddata = grid.getChanges("removed",false);
			var modifieddata = grid.getChanges("modified",false);
			var json = {"adddata":adddata,"removeddata":removeddata,"modifieddata":modifieddata};
			nui.ajax({
            	url: "com.primeton.eos.ame_common.csIncomecheckAct.saveIncomeheckAct.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var result = text.result;
            		if(result=='1'){
            			alert("保存成功！");
            			init();
            		}else{
            			alert("保存失败！");
            		}
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });
		}
		
		//设置图片
		function onDrawNode(e) {
	    	if(e.node.level == "0"){
	    		e.iconCls = "icon-jcs";
	    	}else{
	    		if(e.node.iscancheck == "1"){
	    			e.iconCls = "icon-jcx";
	    		}else{
	    			e.iconCls = "icon-jcl";
	    		}
	    	}
        }
        
        //展开详情
        function doView(e){
			var processdefname = e.record.processdefname;
			var activitydefid = e.record.activitydefid;
			var busicode = e.record.busicode;
			var json = nui.encode({"processdefname":processdefname,"activitydefid":activitydefid,"busicode":busicode});
			if(e){
				search(json);
			}else{
				nui.alert("请选中一条记录","提示");
			}
		}
        
		//重新初始化树
		function search(json){
			document.getElementById("checklist").style.visibility="visible";
			nui.ajax({
            	url: "com.primeton.eos.ame_common.csIncomecheckAct.queryIncomeCheck.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.csIncomechecklists;
						//重新加载数据
						tree.loadList(data, "checklistid", "parentid");
						var datas = text.queryIncomeCheck;
						if(datas!=null&&datas!=""){
							var checklistids;
		            		for(var i = 0; i<datas.length; i ++){
		            			if(i==0){
		            				checklistids = datas[i].checklistid;
		            			}else{
		            				checklistids = checklistids + "," + datas[i].checklistid;
		            			}
		            		}
		        		  	tree.setValue(checklistids);
						}
	              	}
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });
		}
		
		function onBeforeNodeCheck(e) {
            var tree = e.sender;
            var node = e.node;
            if (tree.hasChildren(node)) {
                //e.cancel = true;
            }
        }
        
        //检查字段是否重复
        function checkBusicode(){
        	var busicode = nui.get("busicode").getValue();
        	if(busicode!=null){
        		var num = 0;
        		var data = grid.getData();
	        	for(var i=0;i<data.length;i++){
	        		var b = data[i].busicode;
	        		if(b==busicode){
	        			num++;
	        		}
	        	}
	        	if(num>0){
	        		alert("业务参数有重复，请检查后再进行操作！");
	        		nui.get("busicode").setValue("");
	        	}
        	}
        }
        
        //保存
        function saveFunc(){
        	var row = grid.getSelected();
        	var checkid = row.checkid;
        	if(checkid!=null&&checkid!=""){
        		var value = tree.getValue(true);
	        	var json = nui.encode({"checkid":checkid,"checklistid":value});
	        	nui.ajax({
	            	url: "com.primeton.eos.ame_common.csIncomecheck.saveIncomecheck.biz.ext",
	            	data: json,
	            	type: 'POST',
	            	cache: false,
	            	contentType: 'text/json',
	            	success: function (text) {					 
	            		var result = text.result;
	            		if(result=='1'){
	            			alert("保存成功！");
	            			var processdefname = row.processdefname;
							var activitydefid = row.activitydefid;
							var busicode = row.busicode;
							var json = nui.encode({"processdefname":processdefname,"activitydefid":activitydefid,"busicode":busicode});
	            			search(json);
	            		}else{
	            			alert("保存失败！");
	            		}
	            	},
	            	error: function (jqXHR, textStatus, errorThrown) {
	    				CloseWindow();
	                }
	            });
        	}else{
        		alert("请先保存配置信息，再进行该操作！");
        	}
        }
</script>
</html>