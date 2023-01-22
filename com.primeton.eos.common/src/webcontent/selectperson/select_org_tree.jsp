<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>机构选择</title>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
	<td width="40%" height="100%" valign="top" >
	<w:panel id="orgPanel" title="机构选择" height="100%" width="100%">
		<r:rtree  id="orgTree" height="100%" width="100%">      
			<r:treeRoot childEntities="oaOrg" display="机构树" initParamFunc="getInitParam"	icon="/common/images/icons/arrow_merge.png" action="com.bos.mp.common.SelectPerson.queryRootOrg.biz"></r:treeRoot>	
			<r:treeNode nodeType="oaOrg" showField="orgname" childEntities="oaOrg" icon="/common/images/icons/chart_organisation.png" submitXpath="oParentOrg" onDblclickFunc="selectedCheckBox" onClickFunc="selectedCheckBox" action="com.bos.mp.common.SelectManage.queryOrgByParent.biz"></r:treeNode>	
		</r:rtree>
	</td>
	</w:panel>
	<td width="60%" height="100%" valign="top">
		<w:panel id="queryResult" width="100%" title="选择结果" >
		<table align="center" border="0"  width="100%" class="EOS_table" id="table_result">
	    <tr id="row1">
	      <th width="60" align="center"><b:message key = 'l_select'/></th>
	      <th>机构编号</th>
	      <th>机构名称</th>
	      <th>机构代码</th>
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
		return "<orgid><b:write property='rootOrgID'/></orgid>";
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
  	strCells[1]=nullToBlank(node.getProperty("orgid"));
  	strCells[2]=nullToBlank(node.getProperty("orgname"));
  	strCells[3]=nullToBlank(node.getProperty("orgcode"));
  	//添加数据
  	if(!addReturnArray(node,4,strCells)){
  		if(isCheck){
	  		alert("该机构已选择过，不能再添加！");
  		}
  	}  	
}  
//添加数组
function addReturnArray(node,size,array){
  	var orgid = nullToBlank(node.getProperty("orgid"));
  	var orgname = nullToBlank(node.getProperty("orgname"));
  	var orgcode = nullToBlank(node.getProperty("orgcode"));
  	//唯一标识某行数据
  	var singleStr = orgid+"_"+orgcode;
  	if(addArray[orgid] != null)
  		return false;
  	else{
  		addFileSelectInput("table_result",singleStr,size,array,orgid);//添加显示数据
   		addArray[orgid]=[orgid,orgname];//添加提交数据
   		singleArray[singleStr] = singleStr;//添加唯一标识数据
  		displayArray[orgid]=[array[1],array[2],array[3]];//将数据保存
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
	retArray[0] = new Array(); //机构Id
	retArray[1] = new Array(); //机构名称
	retArray[2] = new Array(); //添加的显示数据
	retArray[3] = new Array(); //添加的唯一标识数据
	retArray[4] = new Array(); //提交的数据
	
	//设置返回数据
   	for(id in addArray){
      var arr = addArray[id];
      var arrCount = 0;
      if(arr !=null) arrCount = arr.length;
      if(arrCount == 2){
	      if(arr[0] != null){
		      retArray[0].push(arr[0]);
		      retArray[1].push(arr[1]);
	      	  var disp = displayArray[id];
	      	  
		      retArray[2].push(id); //存放显示数组的唯一标识
		      retArray[2].push(disp[0]);
		      retArray[2].push(disp[1]);
		      retArray[2].push(disp[2]);
		      
		      retArray[4].push(id); //存放返回数组的唯一标识
		      retArray[4].push(arr[0]);
		      retArray[4].push(arr[1]);
	      }
      }
   	}
   	//设置唯一标识行Id
   	for(single in singleArray){
	  var singleArr = singleArray[single];
	  if(singleArr != null){
		if(singleArr.toString().indexOf('_') != -1)
			retArray[3].push(single);
      }
    }
   	window.returnValue = retArray; 
    window.close();
  }
//初始化页面
function initSelectValue(){
    //取得主页面传过来的参数
	var ret = window["dialogArguments"];
	if(ret[2] != null){
	    for(var i=0;i<ret[3].length;i++){
	    	var retDisplay = new Array();   //显示数据
	        var retAddArray = new Array();//返回数据（提交数据）
	        //获取用于返回的数据 addArray
	        for(var k=0;k<3;k++){
	        	var index = i * 3 + k;
	            retAddArray[k]=ret[4][index];
	       	}
	        //获取用于显示的数据 displayArray
	        for(var j=0;j<4;j++){
	        	var index = i * 4 + j;
	            retDisplay[j]=ret[2][index];
	        }	            		
	        //获取用于标识的数据 singleArray
	        var singleStr = ret[3][i];
	        var addId = retDisplay[0];	        
	       	addArray[addId]=[retAddArray[1],retAddArray[2]]; //设置返回数据（提交数据）
	        singleArray[singleStr]=singleStr; //设置唯一标识数据
			displayArray[addId]=[retDisplay[1],retDisplay[2],retDisplay[3]];//设置显示数据
			addFileSelectInput("table_result",singleStr,retDisplay.length,retDisplay,addId);//添加数据
		}
    }
}
initSelectValue();
</script>