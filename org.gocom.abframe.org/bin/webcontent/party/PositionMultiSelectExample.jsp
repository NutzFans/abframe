<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>Title</title>
</head>
<body>
<input type="button" class="button" onclick="showPositionSelect();" value="...">
<script>
	function showPositionSelect(){
		sUrl = "PositionMultiSelect.jsp";
		showModalCenter(sUrl,window,dealSelectedPositions,600,570,"请选择岗位...");
	}
	
	function dealSelectedPositions(rValue){
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