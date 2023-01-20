<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2017-11-02 10:12:43
  - Description:
-->
<head>
<title>预算组织机构维护管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;overflow: hidden;width: 100%;height: 100%;">
	<div class = "nui-fit">
        <!-- 组织机构树-->
		<ul id="tree1" class="nui-tree" url="com.primeton.eos.ame_budget.budgetOrgManager.getOrgTree4Orgimp.biz.ext" 
			style="width:100%;padding:5px;"  expandOnLoad="0" showFolderCheckBox="true" showCheckBox="true" showTreeIcon="true" textField="ORGNAME" idField="ORGID"  
			parentField="PARENTORGID" dataField="orgs" checkRecursive = "true" showArrow="true"  resultAsTree ="false"  expandOnDblClick="false" ondrawnode="setIcon" 
			multiSelect="true"  autoCheckParent="true" >        
		</ul>
    </div>
	<div property="footer" style="padding:5px;">
        <table style="width:100%">
            <tr>
                <td style="width:100%;text-align: center;">
                    <input type="button" value="确定" onclick="okWindow()"/>
                    <input type="button" value="关闭" onclick="CloseWindow('cancel')"/>
                </td>
            </tr>            
        </table>
    </div>
</body>
	<script type="text/javascript">
		nui.parse();
		var tree = nui.get("tree1");
		var year;
		function SetData(data){
			year = nui.clone(data);
		}
	    //设置图片
	    function setIcon(e){
	    	e.iconCls = "icon-organization";
		}
		function okWindow(){
    	var nodes = tree.getCheckedNodes();
    	if(nodes){
    		var tips = "是否保存？";
	    	if(confirm(tips)){
	    		var json = nui.encode({orgs:nodes,year:year});
				nui.ajax({
		            url: "com.primeton.eos.ame_budget.budgetOrgManager.SaveBatchBudgetOrg1.biz.ext",
		            type: 'POST',
		            data: json,
		            cache: false,
		            contentType:'text/json',
		            cache: false,
		            success: function (text) {
		            	if(text.result == 0){
		            		alert("部门新增成功！");
		            		CloseWindow("ok");
		            		
		            	}else if(text.result == 1){
		            		alert(text.orgnames+"已存在，请取消勾选再次提交");
		            		return;
		            	}else{
		            		alert("生成失败，请联系信息技术部！");
		            		return;
		            	}
		            }
			     });
	    	}
	    	
    	}else{
    		nui.alert("请选择一个预算机构","提示");
    	}
    }
		
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}	
		
	</script>
</html>