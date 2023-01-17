<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>Title</title>
</head>
<body>
<input type="button" class="button" onclick="showEmpSelect();" value="...">
<script>
	function showEmpSelect(){
		sUrl = "EmpMultiSelect.jsp";
		showModalCenter(sUrl,window,dealSelectedEmps,600,570,"请选择人员...");
	}
	
	function dealSelectedEmps(rValue){
		var str = "";
		
		for(var i =0;i<rValue.length;i++){
			var row = rValue[i];
			
			for(var j =0;j<row.length;j++){
				str = str + row[j]+";";
			}
			str += "\r\n";
		}
		alert(str);
	}
</script>
</body>
</html>