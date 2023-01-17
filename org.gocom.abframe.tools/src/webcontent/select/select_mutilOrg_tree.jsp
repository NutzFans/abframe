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
		搜索：<h:text id="orgname" value="" onkeydown="if(event.keyCode == 13) doSearch();"/>
		<r:rtree  id="orgTree" height="100%" expandLevel="3" width="100%">      
			<r:treeRoot childEntities="oaOrg" display="机构树" initParamFunc="getInitParam"	icon="<%=SkinUtil.getStyleFileForTag("images/abf/arrow_merge.png",request)%>" action="org.gocom.abframe.select.SelectPerson.queryRootOrg.biz"></r:treeRoot>	
			<r:treeNode nodeType="oaOrg" showField="orgname" childEntities="oaOrg" icon="<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>" submitXpath="oParentOrg" onDblclickFunc="selectedCheckBox" onClickFunc="selectedCheckBox" action="org.gocom.abframe.select.SelectManage.queryOrgByParent.biz"></r:treeNode>	
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
		window.resize(600,500);
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
//只能选一个部门
//修改日期：20100403 zcfd
//alert($id("table_result").rows.length);
/*
    if($id("table_result").rows.length>1){
     alert("只能选择一个部门！");
     return true;
    }
    */
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
//----------------------------------------------------------搜索机构-----------------------------------------
	/******************************************** 
	  由于动态树的展开是异步的，因此定位操作也是异步的
	  由三大步骤组成：
	  1、设置需要定位的序列号
	  2、定义异步定位调用
	  3、单次定位操作调用
	 *********************************************/
	//判断节点类型
    var orgtypes = {'ORGTYPE':0};
	function checknodetype(node,type){
	    var ret =false;
	    if(!node.isRootNode()){	    
		    switch(type){
		       case orgtypes.ORGTYPE:
		          ret =isNotNullStr(node.getProperty("orgseq"));
		          break;
		       default:
		          break;	             
		    }
	    }
	    return ret;
	} 
	var locate_config={'type':null,'seq':null};
    var locate_step = 0;
	function loc(node){
	   locate(locate_config,node);
	}
	function getSeqValue(node){
       if(checknodetype(node,orgtypes.ORGTYPE)){
          return node.getProperty("orgseq");
       }
	}	
	function locate(config,curnode){
	   if(curnode==null){
	      curnode = $id("orgTree").getRootNode();
	   }
	   if(config!=null){
	      locate_config = config; //设置当前的定位序列号
	   }	   
	   var seq = config.seq[locate_step];
        var nodes = curnode.getChildren();
        if(nodes!=null){
           for(var i=0;i<nodes.length;i++){            
               var node = nodes[i];
               if(checknodetype(node,locate_step)){
	               var tmpseq = getSeqValue(node);
	               var hqjtmpseq;
	               var hqjseq;
	               if(tmpseq == null || tmpseq == ""){
	               		hqjtmpseq = "";
	               }else{
	               		hqjtmpseq = tmpseq.replace(/\./g,'A');
	               }
	               if(seq == null || seq == ""){
	               		hqjseq = "";
	               }else{
	               		hqjseq = seq.replace(/\./g,'A');
	               }
	                if(tmpseq == seq){                    
	                    if(checknodetype(node,config.type)){
	                        node.select();
	                        if(config.clickflag){                       
	                           node.cell.click();
	                        }
	                        locate_config = null;//找到结束寻找
	                        locate_step = 0;
	                    }else{//寻找下一级别
	                    	//该人员所在岗位为空，就跳过去，直接找人
							if(config.seq[1] == "" || config.seq[1] == null){
								locate_step = locate_step + 2;
							}else{
	                        	locate_step++;								
							}
	                        if(!node.isExpanded()){
	                          node.expandNode(loc);  //展开要定位的节点所在的上级节点，后续定位操作由展开后的触发事件来调用。                    
	                        }else{                      
	                          locate(config,node);
	                        } 
	                    }                     
	                    break;
	                }else if(hqjseq.test(hqjtmpseq)){
	                    if(!node.isExpanded()){
	                      node.expandNode(loc);  //展开要定位的节点所在的上级节点，后续定位操作由展开后的触发事件来调用。                    
	                    }else{                      
	                      locate(config,node);
	                    }                    
	                    break;
	               }  
              }            
           }
        }         
	}
	
	function locate_emp(empid,orgseq,posiseq){
	   locate_seq=orgseq;
	   locate_execute = false;
	   locate(orgseq);
	}
	//搜索
	var nowSeq = 1;
	var orgnameAll = "";
	function doSearch(){
		
		var orgname = document.getElementById("orgname").value;
		if(orgname == null || orgname == ""){
			return;
		}
		if(orgnameAll == orgname){
			nowSeq = nowSeq + 1;
		}else{
			nowSeq = 1;
		}
		orgnameAll = orgname;
		var myAjax = new Ajax("org.gocom.abframe.select.SelectPerson.queryOrgbyOrgcode.biz");
		myAjax.addParam("shortName",orgname);
		myAjax.addParam("nowSeq",nowSeq);
		myAjax.submit();
		if (myAjax.isSuccess()) {
			var orgseq = myAjax.getValue("root/data/orgseq");
			
			var orgid = myAjax.getValue("root/data/orgid");
			
			if(orgid == "" || orgid == null){
				alert("没有找到相应的机构！");
				return;
			}
			var flag = true;
			var obj = {'type':0,'seq':[orgseq,orgid],'clickflag':flag};
			locate(obj);
			//locate(obj,$id("orgTree").getRootNode());
			
		}
	}
	
	
</script>