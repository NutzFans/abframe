<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>
<%
	String empprop = request.getParameter("empprop");
 %>
<script language="javascript">
    var opertion="move";
    /* 
     *  确定关闭页面
     */
    function ok(){
        //定义窗口关闭时的返回值
        var indatea = $name("indatea").value;
    	if(opertion=='copy'){
        	var newEmpprop = document.getElementById("newEmpprop").value;
        	if(newEmpprop==null||newEmpprop==""){
        		alert("占比数不能为空！");
        		return;
        	}
    		 if(indatea==""||indatea==null){
	        	alert("调动日期不能为空！");
	        	return;
	        }
        	var data = {'newEmpprop':newEmpprop,"opertion":opertion,"indatea":indatea};
        	window['returnValue'] = data;
        	window.close();
        }else{
        	if(opertion=='move'){
        		 if(indatea==""||indatea==null){
		        	alert("调动日期不能为空！");
		        	return;
		        }
        	}
        	var data = {"opertion":opertion,"indatea":indatea};
        	window['returnValue'] = data;
        	window.close();
        }
        
    }

    /* 
     *  选择操作时给变量赋值
     */
	function changeStatus( op ) {
		if(op=='copy'){
			document.getElementById("a1").style.display="";//显示
			document.getElementById("a2").style.display="";//显示
		}else{
			document.getElementById("a1").style.display="none";//不显示 
			document.getElementById("a2").style.display="none";//不显示 
		}
		if(op=='cancel'){
			document.getElementById("a4").style.display="none";//不显示 
		}else{
			document.getElementById("a4").style.display="";//显示 
		}
		opertion=op;
	}
	
	function checkempprop(){
		var oldempprop = '<%=empprop %>';
		var newEmpprop = document.getElementById("newEmpprop").value;
		var reg = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");  
	     if(!reg.test(newEmpprop)){  
	     	alert("请输入正确的数字!");
	     	document.getElementById("newEmpprop").value="";
	     	return;
	     }
		if(parseFloat(oldempprop) <= parseFloat(newEmpprop)){
			alert("新部门占比数不能大于等于原部门占比数！");
			document.getElementById("newEmpprop").value="";
			return;
		}
	}
	
</script>

</head>

<body scroll="no" leftmargin="0px;" topmargin="0px;" rightmargin="0px;" bottommargin="0px;">

	<TABLE class="form_table" width="100%" height="100%">
		<tr>
			<td  class="form_table" style="text-align: left">
			    <b:message key="l_selectOperation" /> <!-- 请选择您需要的操作：   -->
			</td>
	   </tr>
	   	<tr>
			<td>
	   			<h:radio name="changeRadio"  id="changeRadio1" checked="true" onclick="changeStatus('move');"/>部门调动 <!--移动 -->
	   			<h:radio name="changeRadio" id="changeRadio2" onclick="changeStatus('copy');"/>增加新部门 <!--复制 -->
	   			<h:radio name="changeRadio" id="changeRadio3" onclick="changeStatus('cancel');"/><b:message key="l_cancel" /> <!--取消 -->
		   </td>

	   </tr>
	   	<tr id="a2" style = "display: none;">
			<td style="width: 275px">原部门占比数:<%=empprop %></td>
	   </tr>
	   <tr id="a1" style = "display: none;">
	   		<td>增加新部门的占比数：<input type="text" onblur="checkempprop()" id = "newEmpprop" style="width: 140px;"/></td>
	   </tr>
	   <tr  id="a3">
	   	    <td id="a4">调动日期： <w:date property ="indatea" name="indatea" style="width: 180px;"/></td>	
	   	   
	   </tr>
	   <tr>
			<td  class="form_bottom">
			<input type="button" class="button" value='<b:message key="l_cofirm" />' onclick="ok()" />
			</td>
	   </tr>
	</table>
</body>
</html>