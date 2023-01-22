<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>Title</title>
</head>
<body>
<DIV id="chatMessage"
	style="OVERFLOW-Y: auto; WIDTH: 100%; HEIGHT: 150px">
<w:panel id="list_panel" width="100%" title="已经选择的工作组">
<table width="100%" id="selectedElements"  class="EOS_table">

	<tr>
		<th>编号</th>
		<th>编码</th>
		<th>工作组名</th>
		<th></th>
	</tr>
</table>
</w:panel>
</div>
<iframe src="org.gocom.abframe.org.party.GroupQuery.flow"
	width="100%" height="400" frameborder="0" scrolling="No"> </iframe>
<script>
	var returnArray = new Array();
	var rowid = 0;
	
	function insertEntity(tmpArray){
		if (isExists(tmpArray[0])) alert("已经选中");
		else{
			returnArray[rowid] = tmpArray;
			insertEntityToTable(tmpArray);
		}
	}
	
	function isExists(id){
		var idIsExist = false;
		for(var i =0;i<returnArray.length;i++){
			var row = returnArray[i];
		
			if(id == row[0]){
				idIsExist = true;
				break;
			}
		}
		return idIsExist;
	}
	
	function insertEntityToTable(tmpArray){
	/* 以下代码在Table中增加一行信息  */
		rowid += 1;
		row = selectedElements.insertRow();
		cell = row.insertCell();
		cell.innerHTML = tmpArray[0];
		cell = row.insertCell();
		cell.innerHTML = tmpArray[1];
		cell = row.insertCell();
		cell.innerHTML = tmpArray[2];
		cell = row.insertCell();
		cell.innerHTML = "<span onclick='removeEntityFromTable(\""+tmpArray[0]+"\")'>取消选择</span>";
	}
	
	
	function removeEntityFromTable(id){
		
		
		for(var i =0;i<returnArray.length;i++){
			var row = returnArray[i];
		
			if(id == row[0]){
				// 删除Table中的行
				selectedElements.deleteRow(i+1);
				// 删除数组中的数据
				returnArray.splice(i,1);
				// 重设rowid
				rowid = returnArray.length;
				break;
			}
		}
	}

	function closeWindow1(){
		window['returnValue'] = returnArray;
		
		window.close();
	}
	

</script>
</body>
</html>
