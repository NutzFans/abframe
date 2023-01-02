<%@page pageEncoding="UTF-8"%>
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-02 14:45:26
  - Description:
-->
<head>
<title>选择确认日期</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
 <script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:98%;" id="calendar1" class="mini-calendar" showTodayButton="false" showClearButton="false" viewDate=""></div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;width:225px; height:25px" >
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;" align="center">
                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="confirmIncome()">确认</a>
                        <a class="nui-button" id="cancelBtn" iconCls="icon-cancel" onclick="cancel()">取消</a>
                    </td>
                </tr>
             </table>           
        </div>
</body>
<script type="text/javascript">
    nui.parse();
    var now = new Date();
    var date = nui.get("calendar1");
	date.setValue(now);
	//取消按钮
	function cancel(){
		CloseWindow("close");
	}
	//确认收入
	function confirmIncome(){
		var date = nui.get("calendar1").getValue();
		window.Owner.initConfirmDate(date);
		CloseWindow("confirm");
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