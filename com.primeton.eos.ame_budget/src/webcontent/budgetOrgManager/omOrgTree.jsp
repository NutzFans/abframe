<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-08 17:06:35
  - Description:
-->
<head>
<title>组织机构树</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
	<div id="moveWindow" title="选择组织机构" class="nui-window" style="width:300px;height:250px;"
        showModal="true" showFooter="true" allowResize="true"
        >
		<ul id="tree1" class="nui-tree" url="com.primeton.eos.ame_budget.budgetOrgManager.getOrgTree.biz.ext" 
			style="width:300px;padding:5px;" onnodeclick="click" expandOnLoad="0"
		    showTreeIcon="true" textField="ORGNAME" idField="ORGID"  parentField="PARENTORGID" dataField="orgs"
		     showArrow="true"  resultAsTree ="false" showCheckBox="true" expandOnDblClick="false"
		     checkRecursive="false" autoCheckParent="false" nodedblclick="choseOk()">        
		</ul>
		<div property="footer" style="padding:5px;">
            <table style="width:100%">
                <tr>
                    <td style="width:120px;text-align:right;">
                        <input type="button" value="确定" onclick="okWindow()"/>
                        <input type="button" value="取消" onclick="hideWindow()"/>
                    </td>
                </tr>            
            </table>
        </div>
  </div>
</body>
	<script type="text/javascript">
		nui.parse();
		var tree = nui.get("tree1");
		var moveWindow = nui.get("moveWindow");
		moveWindow.show();
		function click(e){
			var node = e.node;
		}
		
		function choseOk(){
			CloseWindow("close");
		}
		
		 //取消
     function onCancel(){
     	CloseWindow("close");
     }
     
     //关闭窗口
	function CloseWindow(action){
      if(action=="close"){
      	CloseWindow("cance");
      }else if(window.CloseOwnerWindow) 
        return window.CloseOwnerWindow(action);
      else
        return window.close();
    }
	</script>
</html>