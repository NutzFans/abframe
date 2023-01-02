<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>Title</title>
</head>
<body>
<input type="button" class="button" onclick="showOrgSelect();" value="...">
<script>
	function showOrgSelect(){
		sUrl = "OrgMultiSelect.jsp";
		showModalCenter(sUrl,window,dealSelectedOrgs,600,570,"请选择组织机构...");
	}
	
	function dealSelectedOrgs(rValue){
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