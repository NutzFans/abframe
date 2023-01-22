<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>运营预算详情</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .myrow{
	        background:#FFFF00;
	    }
	    .myIndex{
	        background:#F7F7F7;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	    <div style="border-bottom:0;padding:0px;">
		    <form id="form1" method="post" >
		    	<input name="deptOperBudget.operid" id="operid" class="nui-hidden" />
		    	<input name="deptOperBudget.orgid" id="orgid" class="nui-hidden" />
		    	<input name="deptOperBudget.year" id="year" class="nui-hidden" />
		    	<input name="deptOperBudget.month" id="month" class="nui-hidden" />
		    	<input name="deptOperBudget.feetype" id="feetype" class="nui-hidden" />
		    	<input name="deptOperBudget.costtype" id="costtype" class="nui-hidden" />
	            <table style="table-layout:fixed;" style="border-collapse:collapse;width:100%" bordercolor="#A8A8A8" border="1" cellspacing="0">
		            <tr>
						<td align="right" style="width:70px">金额：</td>
						<td><input name="deptOperBudget.money" id="money" class="nui-spinner" format="n0" style="width:200px" allowLimitValue="false" vtype="int" changeOnMousewheel="false" increment="0" showButton="false" /></td>
					</tr>
					<tr>
						<td align="right" style="width:70px">说明：</td>
						<td><input name="deptOperBudget.memo" id="memo" class="nui-textarea" style="width:290px"/></td>
					</tr>
		    	</table>  
	    	</form>        
		</div>
</div>
<div style="text-align:center;padding:3px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" id="savebtn" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var form = new nui.Form("#form1");
    	//打开页面运行方法(初始化加载数据)
    	var budstatus = "";
    	var orgname = "";
    	var costtypename = "";
    	function SetData(data){
    		budstatus=data.budstatus;
    		orgname=data.orgname;
    		costtypename=data.costtypename;
    		if(data.budstatus==1){
    			form.setEnabled(false);
    		}
    		var json = {deptOperBudget:data};
    		nui.ajax({
	            url: "com.primeton.eos.ame_budget.operatCost.detailOperatCost.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	form.setData(o);
	            }
		    });
    	}
        function onOk(){
        	if(budstatus==1){
    			alert("当前处于锁定状态不可以保存！");
	        	return;
	        }
        	if(!confirm("确定保存？")){
        		return;
        	}
        	var data = form.getData();
        	var json = {deptOperBudget:data.deptOperBudget,costtypename:costtypename,orgname:orgname};
        	nui.ajax({
                url: "com.primeton.eos.ame_budget.operatCost.saveDetailOperatCost.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.exception==null){
	                	alert("保存成功！");
	                	CloseWindow();
                	}else{
                		alert("保存失败！");
                	}
                },
                error: function () {
                }
           });
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
		//标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
  </script>
</body>
</html>