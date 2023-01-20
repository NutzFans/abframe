<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>
<style media=print>
 .Noprint{display:none;}  .PageNext{page-break-after: always;}
 </style>
</head>
 <body>
 <OBJECT  id="WebBrowser"  classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" style="display:none"></OBJECT>
 <table align="center" class="Noprint">
   <!-- <tr>
       <td align="center">
       	   <button title=打印 onclick="printWithAlert()">打印</button>
       	   <button title=直接打印 onclick="printWithoutAlert()">直接打印</button>
       	   <button onclick ='printSetup()' title='打印设置' >打印设置</button>
           <button onclick ='printPrieview()' title='打印预览...' >打印预览</button>
       </td>
   </tr> -->
 </table>
 <div  class="Noprint"> 以下为打印区:<br></div>
      <!-- 获取传递到图表的参数 -->
 
 
 <% 
  String expnos =  request.getParameter("expnos"); 
/*  String expnos = "P20170600014,P20170600017,C20170600004,P20170600013,P20170600018,P20170600019,P20170600015,P20170600016,C20170600001,T20170600017,P20170600012,C20170600003,C20170600002,P20170600009,P20170600010,P20170600011,T20170600013,T20170600014,T20170600015,T20170600016,T20170600012"; */ 
 String[] exp = expnos.split(",");
 int explen = exp.length;
 
 for(int i = 0;i<explen;i++){
 	if(i != explen-1){
 	
 %>
 <hr size=1 noshadow color=black  class="Noprint" >
 <div class="PageNext">
 	  <jsp:include page="/ame_fee/myExpenseReimbursement/printAll4Batch.jsp" flush="true"> 
	  <jsp:param name="expno" value="<%=exp[i] %>"/>
	  <jsp:param name="ids" value="<%=i %>"/>
	  </jsp:include>
 </div>
  <%System.out.println(i); }else{%>
  <hr size=1 noshadow color=black  class="Noprint" >
  <div>
 	  <jsp:include page="/ame_fee/myExpenseReimbursement/printAll4Batch.jsp" flush="true"> 
	  <jsp:param name="expno" value="<%=exp[i] %>"/>
	  <jsp:param name="ids" value="<%=i %>"/>
	  </jsp:include>
 </div>
 <% }
Thread.sleep(2);
 }%>
<script type="text/javascript">
nui.parse();
  function printWithAlert() {      
  document.all.WebBrowser.ExecWB(6,1);   
  }    
  function printWithoutAlert() {     
    document.all.WebBrowser.ExecWB(6,6);    
  }  
  function printSetup() {      
  document.all.WebBrowser.ExecWB(8,1);    
  }   
  function printPrieview() {      
  document.all.WebBrowser.ExecWB(7,1);    
  }    
 function printImmediately() {      
 document.all.WebBrowser.ExecWB(6,6);     
  window.close();    
  }
       
</script>
   </body>
 </html>