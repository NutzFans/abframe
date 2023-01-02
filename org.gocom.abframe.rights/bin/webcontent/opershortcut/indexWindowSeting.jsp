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
<title>窗口管理</title>
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
                    	<a class="nui-button" iconCls="icon-add" id="addBtn" onclick="addRow()">新增</a>
                    	<a class="nui-button" iconCls="icon-remove" id="removeBtn" onclick="reMoveRow()">删除</a>
                        <a class="nui-button" iconCls="icon-save" id="saveBtn" onclick="onOk()">保存</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
	<div id="datagrid1" class="nui-datagrid"  dataField="windowList"  url="org.gocom.abframe.rights.menu.newMenu.queryIndexWindow.biz.ext"  style="height:440px;"
		allowResize="true" allowCellWrap="true" allowCellSelect="true" allowCellEdit="true" sizeList=[15,30,50,100] pageSize="15" multiSelect="true">  
		<div property="columns"> 
			<div type="checkcolumn" width="10"></div>
			<div field="windowname" width="80" align="left"  headerAlign="center" >窗口名称
				<input property="editor" class="nui-textbox" required="true"/>
			</div>
			<div field="windowrole" displayField="rolename" width="80px" align="left"  headerAlign="center">角色
				<input property="editor" class="nui-textboxlist" name="roleid" allowInput="true" textField="rolename" valueField="roleid" searchField="name" style="width:160px;" 
					url="com.primeton.eos.ame_budget.budgetOrgManager.queryRoleidByName.biz.ext"/>
			</div>
			<div field="windowemptype" displayField="emptype" width="80px" align="left"  headerAlign="center">人员类型
				<input property="editor" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" multiSelect="true" required="true"/>
			</div>
			<div field="windowurl" width="150" align="left"  headerAlign="center" >窗口链接
				<input property="editor" class="nui-textbox" required="true"/>
			</div>
			<div field="windowtype" width="60" align="left" headerAlign="center">窗口ID
				<input property="editor" class="nui-textbox" required="true"/>
			</div>
			<div field="windowwidth" renderer="widthS" width="30" align="center" headerAlign="center">窗口宽度
				<input property="editor" class="nui-dictcombobox" dictTypeId="AC_INDEX_WINDOW" required="true"/>
			</div>
			<div type="checkboxcolumn" field="isapper" trueValue="1" falseValue="0" width="30" headerAlign="center">是否显示</div> 
			<div field="windowsort" width="30" align="center" headerAlign="center">排序
				<input property="editor" class="nui-textbox" required="true"/>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
	
	search();//查找
	function search() {
	  	grid.load(); //datagrid加载数据
	}
	
	//确定保存或更新
	function onOk() {
	   saveData();
	}
	
	function saveData(){
		var editList = grid.getChanges('modified');
		var addList = grid.getChanges('added');
		var removeList = grid.getChanges('removed');
		if(addList.length >0 ){
			if(!check(addList)){
				return false;
			}
		}
		if(editList.length >0 ){
			if(!check(editList)){
				return false;
			}
		}
		if(editList.length == 0 && addList.length == 0 && removeList.length == 0){
			nui.alert("请调整之后再做保存。");
			return;
		}
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '保存中...'
        });
		var json = {editList:editList,addList:addList,removeList:removeList};
		nui.ajax({
			url:"org.gocom.abframe.rights.menu.newMenu.saveIndexWindow.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				nui.unmask();
				if(text.result == '1'){
					nui.alert("保存成功。");
					search();
				}else{
					nui.alert("保存失败。");
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		});
	}
	
	function check(data){
		var bolen = true;
		$.each(data,function(i,v){
			if(v.windowrole == "" || v.windowrole == null){
				bolen = false;
				nui.alert("角色不能为空");
				return false
			}
			if(v.windowemptype == "" || v.windowemptype == null){
				bolen = false;
				nui.alert("人员类型不能为空");
				return false
			}
			if(v.windowwidth == "" || v.windowwidth == null){
				bolen = false;
				nui.alert("窗口宽度不能为空");
				return false
			}
			if(v.windowurl == "" || v.windowurl == null){
				bolen = false;
				nui.alert("窗口链接不能为空");
				return false
			}
			if(v.windowtype == "" || v.windowtype == null){
				bolen = false;
				nui.alert("窗口ID不能为空");
				return false
			}
		})
		return bolen;
	}
	
	//新增行
	function addRow(){
		var newRow = {};
		grid.addRow(newRow);
	}
	
	//删除行
	function reMoveRow(){
		var rows = grid.getSelecteds();
        if (rows.length>0) {
            grid.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	
	function widthS(e){
		return nui.getDictText("AC_INDEX_WINDOW",e.value)
	}
</script>
</html>