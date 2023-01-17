<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>人员选择</title>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
	<td width="25%" height="100%" valign="top" >
	<w:panel id="orgPanel" title="人员选择" height="100%" width="100%">
		<r:rtree id="orgTree" height="100%" width="100%">
			<r:treeRoot childEntities="oaOrg" display="机构人员树" initParamFunc="getInitParam" icon="/common/images/icons/arrow_merge.png" onClickFunc="" action="com.bos.mp.common.SelectPerson.queryRootOrg.biz"></r:treeRoot>
			<r:treeNode nodeType="oaOrg" showField="orgname" initParamFunc="getInitParam" childEntities="oaOrg;oaPosi;oaEmp" icon="/common/images/icons/chart_organisation.png" submitXpath="oParentOrg" onRefreshFunc="" onClickFunc="" action="com.bos.mp.common.SelectPerson.queryOrgPosiEmpByParent.biz"></r:treeNode>
			<r:treeNode nodeType="oaPosi" showField="posiname" childEntities="oaEmp" icon="/common/images/icons/group.png" submitXpath="oParentPosi" onClickFunc="" action="com.bos.mp.common.SelectPerson.queryEmpOfPosi.biz"></r:treeNode>
			<r:treeNode  nodeType="oaEmp" showField="empname" icon="/common/images/icons/user.png" submitXpath="oEmp" onClickFunc="selectedCheckBox">
    		</r:treeNode>
		</r:rtree>
	</td>
	</w:panel>
	<td width="75%" height="100%" valign="top">
		<w:panel id="queryResult" width="100%" title="选择结果" >
		<table align="center" border="0"  width="100%" class="EOS_table" id="table_result">
	    <tr id="row1">
	      <th width="60" align="center"><b:message key = 'l_select'/></th>
	      <th>登录名</th>
	      <th>操作员姓名</th>
	      <th>性别</th>
	      <th>机构名称</th>
	    </tr>
	    </table>
	    <table style="display: none" id="selectButton">
	    <tr>
	    	<td>
				<input type="button" class="button" value="确定" onclick="javascript:setReturnArray()">				
			</td>
	    </tr>
	    </table>
		</w:panel>
	</td>
  </tr>
</table>
</body>
</html>
<script>
	function getInitParam(){
		return '<orgid><b:write property="orgid"/></orgid><positionid><b:write property="positionid"/></positionid>';
	}
	//--初始化树的高度-------------------------------------
	function custInit(){
        var height = document.body.clientHeight - 22;
		$id("orgTree").style.height =height;
		getInitParam();
	}
    eventManager.add(window,"load",custInit);
var addArray = new Array();    //返回数组（提交数据）
var singleArray = new Array(); //标识数组
var displayArray = new Array(); //显示数组
var isCheck = true; //是否判断
//双击选人
function selectedCheckBox(node){
  	var strCells = new Array();
  	strCells[1]=nullToBlank(node.getProperty("userid"));
  	strCells[2]=nullToBlank(node.getProperty("empname"));
  	if(nullToBlank(node.getProperty("gender")) == "m"){
  		strCells[3] = "男";
  	}else if(nullToBlank(node.getProperty("gender")) == "f"){
  		strCells[3] = "女";
  	}else if(nullToBlank(node.getProperty("gender")) == "n"){
  		strCells[3] = "未知";
  	}else{
  		strCells[3] = "";
  	}
  	strCells[4]=nullToBlank(node.getProperty("orgname"));
  	//添加数据
  	if(!addReturnArray(node,5,strCells)){
  		if(isCheck){
	  		alert("该人员已选择过，不能再添加！");
  		}
  	}  	
}  
//添加数组
function addReturnArray(node,size,array){
  	var userId = nullToBlank(node.getProperty("userid"));
  	var username = nullToBlank(node.getProperty("empname"));
  	var orgname = nullToBlank(node.getProperty("orgname"));
  	var orgId = nullToBlank(node.getProperty("orgid"));
  	//唯一标识某行数据
  	var singleStr = userId+"_"+orgId;
  	if(addArray[userId] != null)
  		return false;
  	else{
  		addFileSelectInput("table_result",singleStr,size,array,userId);//添加显示数据
   		addArray[userId]=[userId,username,orgId,orgname];//添加提交数据
   		singleArray[singleStr] = singleStr;//添加唯一标识数据
  		displayArray[userId]=[array[1],array[2],array[3],array[4]];//将数据保存
  	}
   	return true;
  }
//增加表格
function addFileSelectInput(table_id,rowId,cellsCount,strCells,addId){
	//获取表格
	var myTable = $id(table_id);
	//向表格中增加一行
	var myNewRow = myTable.insertRow(myTable.rows.length);
	//取得表格的总行数
	var aRows=myTable.rows;
	//取得表格的总网格数
	var aCells=myNewRow.cells;
	//获取行数
	myNewRow.id=rowId;	
	var str =  '<input type="checkbox" onclick="deleteFileSelectInput(\''+ table_id +'\',\''+rowId+'\',\''+addId+'\');" checked>';
	var i=0;
	for(i=0;i<cellsCount;i++){
		//向表中增加一个列(TD)
		aRows(myNewRow.rowIndex).insertCell(i);		
		//为每个td(cell)赋值
		if(i != 0)
			aCells(i).innerHTML=strCells[i];
		else
			aCells(i).innerHTML=str;
	}	
	$id("selectButton").style.display = "block";
}
//删除表格
function deleteFileSelectInput(table_id,rowId,userId){
	var myTable = $id(table_id);	
	myTable.deleteRow($id(rowId).rowIndex);
	addArray[userId] = null;
  	displayArray[userId] = null;
  	singleArray[rowId] = null;
	if(myTable.rows.length == 1)
		$id("selectButton").style.display = "none";
}
//设置返回值
function setReturnArray(){
  	var retArray = new Array();
	retArray[0] = new Array(); //人员Id
	retArray[1] = new Array(); //人员名称
	retArray[2] = new Array(); //组织Id
	retArray[3] = new Array(); //组织名称
	retArray[4] = new Array(); //添加的显示数据
	retArray[5] = new Array(); //添加的唯一标识数据
	retArray[6] = new Array(); //提交的数据
	
	//设置返回数据
   	for(id in addArray){
      var arr = addArray[id];
      var arrCount = 0;
      if(arr !=null)
      	arrCount = arr.length;
     
      if(arrCount == 4)
      {
	      retArray[0].push(arr[0]);
	      retArray[1].push(arr[1]);
	      retArray[2].push(arr[2]);
	      retArray[3].push(arr[3]);
	      
      	  var disp = displayArray[id];
	      retArray[4].push(id); //存放显示数组的唯一标识
	      retArray[4].push(disp[0]);
	      retArray[4].push(disp[1]);
	      retArray[4].push(disp[2]);
	      retArray[4].push(disp[3]);
	      
	      retArray[6].push(id); //存放返回数组的唯一标识
	      retArray[6].push(arr[0]);
	      retArray[6].push(arr[1]);
	      retArray[6].push(arr[2]);
	      retArray[6].push(arr[3]);
      }
   	}
   	//设置唯一标识行Id
   	for(single in singleArray){
	  var singleArr = singleArray[single];
	  if(singleArr != null){
		if(singleArr.toString().indexOf('_') != -1)
			retArray[5].push(single);
      }
    }
   	window.returnValue = retArray; 
    window.close();
  }
//初始化页面
function initSelectValue(){
    //取得主页面传过来的参数
	var ret = window["dialogArguments"];
	if(ret[4] != null){
	    for(var i=0;i<ret[5].length;i++){
	    	var retDisplay = new Array();   //显示数据
	        var retAddArray = new Array();//返回数据（提交数据）
	        //获取用于返回的数据 addArray
	        for(var k=0;k<5;k++){
	        	var index = i * 5 + k;
	            retAddArray[k]=ret[6][index];
	       	}
	        //获取用于显示的数据 displayArray
	        for(var j=0;j<5;j++){
	        	var index = i * 5 + j;
	            retDisplay[j]=ret[4][index];
	        }	            		
	        //获取用于标识的数据 singleArray
	        var singleStr = ret[5][i];
	        var addId = retDisplay[0];	        
	       	addArray[addId]=[retAddArray[1],retAddArray[2],retAddArray[3],retAddArray[4]]; //设置返回数据（提交数据）
	        singleArray[singleStr]=singleStr; //设置唯一标识数据
			displayArray[addId]=[retDisplay[1],retDisplay[2],retDisplay[3],retDisplay[4]];//设置显示数据
			addFileSelectInput("table_result",singleStr,retDisplay.length,retDisplay,addId);//添加数据
		}
    }
}
initSelectValue();
</script>