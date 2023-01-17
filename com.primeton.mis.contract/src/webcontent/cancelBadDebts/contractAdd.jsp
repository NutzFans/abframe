<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-08-18 14:42:49
  - Description:
-->
<head>
<title>新增</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/util/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/util/swfupload/swfupload.js"></script>
    
</head>
<body>

<body>
<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:95%;" plain="false">
	<div title="基本信息" >
		<table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;">
		 <tr>
		        <td align="right" style="width:25%;">项目名称：</td>
		        <td  colspan="3">
		            <input name="projectName" class="nui-textbox" style="width:100%;" />
		        </td>
		 </tr>
		 <tr>
		        <td align="right" style="width:25%;">起止时间：</td>
		        <td  colspan="3">
		           <input name="staDate" class="nui-datepicker" style="width:200px;" />至<input name="endDate" class="nui-datepicker" style="width:200px;" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right" style="width:100px;">项目类别：</td>
		        <td >
		             <input name="noticeType" class="nui-combobox" style="width:100%;"  data="[{text: '基础应用研究'}, {text: '科技攻关项目'}, {text: '.........'}]"/>
		        </td>
		        <td align="right" style="width:100px;">项目类型：</td>
		        <td >
		        	<input name="releaseDemp" class="nui-combobox" style="width:100%;" data="[{text: '一般项目'}, {text: '........'}]" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right" style="width:100px;">项目所属年度：</td>
		        <td >
		             <input name="noticeType" class="nui-combobox" style="width:100%;"  data="[{text: '2010'}, {text: '2011'}, {text: '2012'}, {text: '2013'}, {text: '2014'}, {text: '2015'}]"/>
		        </td>
		        <td align="right" style="width:100px;">是否有外协：</td>
		        <td >
		        	<input name="releaseDemp" class="nui-combobox" style="width:100%;" data="[{text: '是'}, {text: '否'}]" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right" style="width:100px;">项目负责人：</td>
		        <td >
		             <input name="noticeType" class="nui-combobox" style="width:100%;"  data="[{text: '张三'}, {text: '李四'}, {text: '叶良辰'}, {text: '......'}]"/>
		        </td>
		        <td align="right" style="width:100px;">承担单位：</td>
		        <td >
		        	<input name="releaseDemp" class="nui-combobox" style="width:100%;" data="[{text: '市场发展部'}, {text: '技术中心'}, {text: '......'}]" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right">攻关目标和研究内容：</td>
		        <td colspan="3">
		           <input name="staDate" class="nui-textbox" style="width:100%;" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right">项目费用(万元)：</td>
		        <td colspan="3">
		           <input name="staDate" class="nui-textbox" style="width:100%;" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right">技术成果的归属和分享：</td>
		        <td colspan="3">
					<input name="staDate" class="nui-textarea" style="width:100%;" />
		        </td>
		        
		    </tr>
		    <tr>
		        <td align="right">验收标准和方式：</td>
		        <td colspan="3">
					<input name="staDate" class="nui-textarea" style="width:100%;" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right">甲方：</td>
		        <td colspan="3">
		           <input name="staDate" class="nui-textbox" style="width:100%;" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right">乙方：</td>
		        <td colspan="3">
		           <input name="staDate" class="nui-textbox" style="width:100%;" />
		        </td>
		    </tr>
		    <tr>
		        <td align="right">合同有效期：</td>
		        <td colspan="3">
		           <input name="staDate" class="nui-datepicker"style="width:40%;" />
		          	 至<input name="staDate" class="nui-datepicker"style="width:40%;" />
		        </td>
		    </tr>
		    
		</table>
		<div style="text-align:center;padding:10px;">               
	        <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">下一步</a>       
	        <a class="nui-button" onclick="onCancel" style="width:60px;">取消</a>       
	    </div>
	</div>
	

	<div title="进度子项" >
		
		<div style="width:95%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" iconCls="icon-add" onclick="addRow2()" plain="true">增加</a>
	                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow2()" plain="true">删除</a>
	                        <span class="separator"></span>
	                        <a class="nui-button" iconCls="icon-save" onclick="saveData2()" plain="true">保存</a>            
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		<div id="datagrid2" class="nui-datagrid" style="width:95%;height:300px;" allowResize="true" pageSize="20" 
	        url="data/contents.txt" allowCellEdit="true" allowCellSelect="true" multiSelect="true" >
	        <div property="columns">
	     		<div type="checkcolumn" ></div>
	     		<div field="startTime" width="120" headerAlign="center" >
	            	开始时间：<input property="editor" class="nui-datepicker"style="width:100px;" />
	            </div>
	            <div field="endTime" width="120" headerAlign="center" >
	            	结束时间：<input property="editor" class="nui-datepicker"style="width:100px;" />
	            </div>
	     		<div field="content" width="120" headerAlign="center" >
	            	目标：<input property="editor" class="nui-textarea"style="width:100%;" />
	            </div>
	            <div field="money" width="120" headerAlign="center" >
	            	奖金总额（万元）：<input property="editor" class="nui-textarea"style="width:100%;" />
	            </div>
	     	</div>
	    </div>
	    <div style="text-align:center;padding:10px;">               
	        <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">下一步</a>       
	        <a class="nui-button" onclick="onCancel" style="width:60px;">上一步</a>       
	    </div>
	</div>
	
	<div title="项目参加人员" >
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
	                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
	                        <span class="separator"></span>
	                        <a class="nui-button" iconCls="icon-save" onclick="saveData()" plain="true">保存</a>            
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:280px;" idField="id"
	        url="data/users.txt" allowResize="true" pageSize="20" 
	        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" >
	        
	        <div property="columns">
	     		<div type="checkcolumn" ></div>
	            <div field="userName" width="120" headerAlign="center" allowSort="true">
	            	姓名<input property="editor" class="nui-combobox" style="width:100%;" valueField="text" data="[{id: 1, text: '张三'}, {id: 2, text: '李四'}, {id: 3, text: '......'}]" />
	            </div>    
	            <div field="userDuty" width="120" headerAlign="center" allowSort="true">
	            	职务<input property="editor" class="nui-textbox"style="width:100%;" />
	            </div>
	            <div field="userOrg" width="120" headerAlign="center" allowSort="true">
	            	单位<input property="editor" class="nui-textbox"style="width:100%;" />
	            </div>
	            <div field="userRole" width="120" headerAlign="center" allowSort="true">
	            	角色<input property="editor" class="nui-combobox" style="width:100%;" valueField="text" data="[{text: '经理'}, {text: '职员'}, {text: '......'}]" />
	            </div>
	            <div field="userTask" width="120" headerAlign="center" allowSort="true">
	            	职责、任务<input property="editor" class="nui-textarea"style="width:100%;" />
	            </div>
	        </div>
	    </div>
	    <div style="text-align:center;padding:10px;">               
	        <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
	        <a class="nui-button" onclick="onCancel" style="width:60px;">上一步</a>       
	    </div>
	</div>
</div>




    <script type="text/javascript">
    
        nui.parse();
        
        var grid = nui.get("datagrid1");
        grid.load();
       var grid2 = nui.get("datagrid2");
        grid2.load();
        
        
        
        function addRow() {          
            var newRow = { name: "New Row" };
            grid.addRow(newRow, 0);
        }
        function removeRow() {
            var rows = grid.getSelecteds();
            if (rows.length > 0) {
                grid.removeRows(rows, true);
            }
        }
        
        
        function addRow2() {          
            var newRow = { name: "New Row" };
            grid2.addRow(newRow, 0);
        }
        function removeRow2() {
            var rows = grid2.getSelecteds();
            if (rows.length > 0) {
                grid2.removeRows(rows, true);
            }
        }

        function search() {
            var key = nui.get("key").getValue();
            grid.load({ key: key });
        }
        function onKeyEnter(e) {
            search();
        }

    </script>

</body>
</html>