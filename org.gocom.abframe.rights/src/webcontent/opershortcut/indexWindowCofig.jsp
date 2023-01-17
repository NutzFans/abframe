<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-11-15 13:31:12
  - Description:
-->
<head>
<title>首页窗口</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-panel" title="首页窗口配置" style="width:100%;">
    <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-save" id="saveBtn" onclick="onOk()">保存</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
	<div id="datagrid1" class="nui-datagrid"  dataField="windowList"  url="org.gocom.abframe.rights.menu.newMenu.queryMyIndexWindow.biz.ext"  style="height:440px;"
		allowResize="true" allowCellWrap="true" allowCellSelect="true" allowCellEdit="true" sizeList=[15,30,50,100] pageSize="15" multiSelect="true">  
		<div property="columns"> 
			<div field="windowname" width="80" align="center"  headerAlign="center" >窗口名称
				<input property="editor" class="nui-textbox" required="true"/>
			</div>
			<div type="checkboxcolumn" field="isapper" trueValue="1" falseValue="0" width="20" headerAlign="center">是否显示</div> 
			<div field="windowsort" width="20" align="center" headerAlign="center" >排序
				<input property="editor" class="nui-textbox" required="true"/>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
	//页面初始化
	search();
	//查找
	function search() {
	  	grid.load(); //datagrid加载数据
	}
	
	//确定保存或更新
	function onOk() {
	   nui.get("saveBtn").disable(); 
	   saveData();
	}
	
	function saveData(){
		var windowList = grid.getChanges('modified');
		if(windowList.length == 0){
			return;
		}
		var json = {windowList:windowList};
		nui.ajax({
			url:"org.gocom.abframe.rights.menu.newMenu.saveMyIndexWindow.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.get("saveBtn").enable(); 
				if(text.result == '1'){
					nui.alert("保存成功。");
					
				}else{
					nui.alert("保存失败。");
				}
				search();
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		});
	}
	
	function isapper(e){
		return nui.getDictText("MIS_YN",e.value)
	}
</script>
</html>