<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-09-05 15:58:35
  - Description:
-->
<head>
<title>部门买卖关系维护</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;
    }
</style>
</head>
<body>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                   	部门买卖关系维护
                </td>
            </tr>
         </table>           
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<table style="width:100%;">
    		<tr>
    			<td align="right">机构名称：</td>
            	<td align="left" style="width: 200px;">
				   <input name="orgid" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgid" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"/>
				</td>
				<td align="center" >
    				<a class="nui-button" iconCls="icon-search" onclick="init()">查找</a>
    				<a class="nui-button" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>
    	</table>
    </div>
	<div style="width:100%;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                       	<a class="nui-button" iconCls="icon-add" onclick="addDept()">新增</a>
                       	<a class="nui-button" iconCls="icon-remove" onclick="removeDept()">删除</a>
                    	<a class="nui-button" iconCls="icon-save" onclick="ok()">保存</a>
                    </td>
                </tr>
            </table>           
        </div>
	</div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" dataField="erprpttdeptbudgetexpconds" allowCellEdit="true"
		multiSelect="false" pageSize="20" sizeList="[20,30,50,100,300]"allowCellSelect="true" 
		url='com.primeton.eos.common.erprpttdeptbudgetexpcondbiz.queryErprptTDeptbudgetExpconds.biz.ext' >
	    <div property="columns">
	    	<div name="temp123" type="checkcolumn"></div>
	        <div field="orgid" width="80" displayField="orgname"headerAlign="center" align="left">部门名称
	        	<input name="orgid" property="editor" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgid" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"/>
	        </div>
	    	<div field="orgisleaf" width="20" renderer="isLeaf" headerAlign="center" align="center">是否叶子部门
	    		<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" required="true"/>
	    	</div>
	    	<div field="expinnerorgid" width="80" displayField="expinnerorgname" headerAlign="center" align="left">买入关系不属于事业部内部买卖
	    		<input name="orgid" property="editor" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgid" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"/>
	    	</div>
	    	<div field="expoutorgid" width="80" displayField="expoutorgname" headerAlign="center" align="left">卖出关系不属于事业部内部买卖
	    		<input name="orgid" property="editor" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgid" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
					    allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"/>
	    	</div>         
	    </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");//表单信息
	var grid = nui.get("datagrid1"); 
	
	init();
	function init(){
		var json = form.getData();
		grid.load(json);
	}
	
	//新增
	function addDept(){
		var rowS = {name: "New Row"};
    	grid.addRow(rowS,0);
	}
	
	//删除 
	function removeDept(){
		var rows = grid.getSelecteds();
        if (rows.length>0) {
            grid.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	
	//保存
	function ok(){
		var addJson = grid.getChanges("added");
		var editJson = grid.getChanges("modified");
		var removeJson = grid.getChanges("removed");
		if(addJson.length == 0 && editJson.length == 0 && removeJson.length == 0 ){
			return false;
		}
		if(!check(addJson) && addJson.length>0){
			nui.alert("部门名称不能为空。");
			return false;
		}
		if(!check(editJson) && editJson.length>0){
			nui.alert("部门名称不能为空。");
			return false;
		}
		save(addJson,editJson,removeJson);
	}
	
	//保存
	function save(addJson,editJson,removeJson){
		var json = {};
		if(addJson.length > 0){
			json.addJson = addJson;
		}
		if(editJson.length > 0){
			json.editJson = editJson;
		}
		if(removeJson.length > 0){
			json.removeJson = removeJson;
		}
		nui.ajax({
	        url: "com.primeton.eos.common.erprpttdeptbudgetexpcondbiz.newSaveErpDeptB.biz.ext",
	        type: "post",
	        data: json,
	        success: function (o) {
	        	if(o.result == '1'){
	        		nui.alert("保存成功。","提示",function(e){
	        			init();
	        		})
	        	}else{
	        		nui.alert("保存失败。")
	        	}
	        },
	        error: function () {
	        	alert("error");
	        }
        });
	}
	
	//检查数据
	function check(data){
		for (var i = 0 ; i < data.length ; i++){
			if(typeof(data[i].orgid) == "undefined"){
				return false;
			}else{
				if(data[i].orgid == "" || data[i].orgid == "null" || data[i].orgid == null){
					return false;
				}
				else{
					return true;
				}
			}
			
		}
	}
	
	//重置
    function reset(){
        var form = new nui.Form("#form1");
        form.reset();
        grid.load();
    }
	
	//回车触发事件
    function onKeyEnter(){
    	init();
    }
	
	//是否叶子部门
	function isLeaf(e){
		return nui.getDictText("MIS_YN",e.value);
	}
	
</script>
</html>