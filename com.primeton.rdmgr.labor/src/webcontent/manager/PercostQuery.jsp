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
  - Author(s): zhuhx
  - Date: 2016-06-17 13:57:17
  - Description:
-->
<head>
<title>定额成本套别信息维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div style="width:100%;height:30%;padding:0px;margin:0px;">
	<input name="percost.percostid" id="percostid" class="nui-hidden" />
	    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	工时定额成本套别列表
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
	<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
	    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" showPager="false" dataField="percosts" 
	    url="com.primeton.rdmgr.labor.mispricebiz.queryPercost.biz.ext" onselectionchanged="onSelectionChanged" multiSelect="true">
			<div property="columns">
				<div field="percostname" headerAlign="center" width="15" >工时成本套别名称</div>				
				<div field="startdate"  headerAlign="center" width="10" dateFormat="yyyy-MM-dd">有效开始日期</div>
				<div field="closedate" headerAlign="center" width="10" dateFormat="yyyy-MM-dd" >有效截止日期</div>
				<div field="currentstate" headerAlign="center" width="10" renderer="getdict">当前状态</div>
				<div name="action" width="10" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>	
			</div>
		</div>
		<div style="width:100%;height:70%;padding:0px;margin:0px;" >
	    <div style="width:100%;">
		        <div class="nui-toolbar" id="id1" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td id="id3" style="width:250px" ></td>	
		                </tr>
	                 </table>           
		        </div>
		    </div>
		    <div style="width:100%;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
                        <span class="separator"></span>
                        <a class="nui-button" iconCls="icon-save"  id="saveid" onclick="saveData()" plain="true">保存</a>            
                    </td>
                </tr>
            </table>           
        </div>
    </div> 
	    <div id="datagrid2" class="nui-datagrid" style="width:100%;height:300px;" showPager="false" dataField="percost"  allowCellEdit="true" allowCellSelect="true" 
	    editNextOnEnterKey="true" allowCellValid="true" oncellendedit="ccc"
	        url="com.primeton.rdmgr.labor.mispricebiz.getMisprice.biz.ext">
	        <div property="columns"> 
	        	<div type="checkcolumn"></div>
	            <div field="pricetype" displayField="orgname"width="120" headerAlign="center">所属部门
	            	<input property="editor" id="abd" class="nui-combobox" textField="orgname" valueField="orgid" dataField = "orgs" shownullItem="true" allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" style="width:100%;"/>
	            </div>
	            <div field="degree" width="120" headerAlign="center">服务人员级别代码
	            	<input property="editor" id="abc" class="nui-textbox" style="width:100%;"/>
	            </div>
	            <div field="degreename" width="120" headerAlign="center">服务人员级别
	            	<input property="editor" id="abe"class="nui-textbox" style="width:100%;"/>
	            </div>
	            <div field="joblevel" width="120" headerAlign="center" renderer="getJobLvel">技术职位级别
	            	<input property="editor" id="abf"class="nui-dictcombobox" dictTypeId="AME_TECH" style="width:100%;"/>
	            </div>
	            <div field="dprice" width="100" headerAlign="center">内部日价
	            	<input property="editor" class="nui-textbox" style="width:100%;" />
	            </div>
	            <div field="mprice" width="100" headerAlign="center">内部月价
	            	<input property="editor" class="nui-textbox" style="width:100%;" />
	            </div>  
	            <div field="outdprice" width="100" headerAlign="center">外部日价
	            	<input property="editor" class="nui-textbox" style="width:100%;" />
	            </div>
	            <div field="outmprice" width="100" headerAlign="center">外部月价
	            	<input property="editor" class="nui-textbox" style="width:100%;" />
	            </div>        
	        </div>
	    </div>    
		<script type="text/javascript">
			var form = new nui.Form("#form1");
	    	nui.parse();
	    	var grid = nui.get("datagrid1");
	    	var grid1 = nui.get("datagrid2");
	    	init();
	    	function init(){
	    		//隐藏列表
	    		nui.get("id1").hide();
				nui.get("id2").hide();
				nui.get("datagrid2").hide();
	    		grid.load();
				grid.sortBy("startdate","desc");
				
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
			function getdict(e){
				return nui.getDictText('ABF_STATUS',e.value);//设置业务字典值
			}
			function getdict2(e){
				return nui.getDictText('MIS_DEGREESET',e.value);//设置业务字典值
			}
			function getJobLvel(e){
				return nui.getDictText('AME_TECH',e.value);//设置业务字典值
			}
	        function add() {        	
	            nui.open({
	                url: "<%=request.getContextPath() %>/labor/manager/modifyPercostt.jsp",
	                title: "新增定额成本套别", 
					width: 750,
		            height: 250,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = { action: "new"};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
			            grid.reload();
			            grid1.reload();
	                }
	            });
	        }
	        function remove(row_uid) {
			    var row = grid.getRowByUID(row_uid);  //获取所有选中的行对象
			    var data = {percost:{percostid:row.percostid}};
			    var json = nui.encode(data);     //序列化成json字符串
	    		if(row.currentstate==1){
	    			alert("不能删除套别状态为有效的记录");
	    			return;
		   		}
            	if (confirm("确定删除选中记录？")) {
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.rdmgr.labor.mispricebiz.deletePercosts.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	grid.reload();
		                	grid1.reload();
		                },
		                error: function () {
	                    }
	               });
                }
	        }
	        function edit(row_uid) {
        		var row = grid.getRowByUID(row_uid);
        		if (row) {
          		nui.open({
		            url: "<%=request.getContextPath() %>/labor/manager/modifyPercostt.jsp",
		            title: "编辑定额成本套别",
		            width: 750,
		            height: 250,
		            onload: function () {
		              var iframe = this.getIFrameEl();
		              var data = {action: "edit", percostid: row.percostid };
		              iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		                if(action=="save"){
		                  grid.reload();
		                  grid1.reload();
		                }
		            }
	            });
	            } else {
	              nui.alert("请选中一条记录","提示");
	            }
	        }
	        function onSelectionChanged(e) {
	        	//展示列表
	        	nui.get("id1").show();
				nui.get("id2").show();
				nui.get("datagrid2").show();
	            var grid = e.sender;
	            var record = grid.getSelected();
				document.getElementById("id3").innerHTML = record.percostname+"级别明细";
	            nui.get("percostid").setValue(record.percostid);
	            if (record) {
	                grid1.load({percostid:record.percostid});
	            }
	        }
	        function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;

            var s = ' <a class="Edit_Button" href="javascript:edit(\'' + uid + '\')" >编辑</a>'
                    + ' <a class="Delete_Button" href="javascript:remove(\'' + uid + '\')">删除</a>';
            return s;
        }
        function addRow() {          
            var newRow = { name: "New Row" };
            grid1.addRow(newRow, 0);
        }
        function removeRow() {
            var rows = grid1.getSelecteds();
            if (rows.length > 0) {
                grid1.removeRows(rows, true);
            }
        }
        function saveData() {
        	var percostid = nui.get("percostid").getValue();
            var data = {misprices:grid1.getChanges(),percostid:percostid};
            var datas = grid1.getChanges();
            for(var i=0;i<datas.length;i++){
        		if(datas[i]._state=='modified'||datas[i]._state=='added'){
        			var a=Number(datas[i].dprice);
        			var b=Number(datas[i].mprice);
        			var oa=Number(datas[i].outdprice);
        			var ob=Number(datas[i].outmprice);
        			var e=datas[i].dprice;
        			var f=datas[i].mprice;
        			var oe=datas[i].outdprice;
        			var of=datas[i].outmprice;
        			if(isNaN(a)||isNaN(b)||isNaN(oa)||isNaN(ob)){
        				alert("价格存在非数字，请检查!");
        				return false;
        			}
        			if(e==null||e==""||f==null||f==""||oe==null||oe==""||of==null||of==""){
        				alert("价格不允许为空，请检查!");
        				return false;
        			}
        		}
            }
            var json = nui.encode(data);
            //grid.loading("保存中，请稍后......");
            nui.ajax({
                url: "com.primeton.rdmgr.labor.mispricebiz.savePrice.biz.ext",
                type: 'POST',
                data: json,
                success: function (text) {
                    grid1.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
        }
        function ccc(e){
        	var data = grid1.getData();
            var record = e.record;
            for(var i=0;i<data.length;i++){
            	if(record._uid!=data[i]._uid){
            		if(record.degree == data[i].degree){
            			alert("该级别的该计价模式已存在,修改后才能继续保存!");
            			nui.get("saveid").disable();
            			return false;
            		}else{
            			nui.get("saveid").enable();
            		}
            	}
            }
        }
	  </script>
</body>
</html>