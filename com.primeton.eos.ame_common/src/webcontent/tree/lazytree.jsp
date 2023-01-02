<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>

<html>
<head>
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body> 
<div class="nui-fit">
<div class="nui-splitter" style="width:100%;height:100%;">
    <div size="190" showCollapseButton="true">  
	<ul id="tree1" class="nui-tree" url="com.primeton.eos.ame_common.ameTree.getTree.biz.ext" 
		style="width:100%;height:100%;padding:5px;" ondrawnode="setIcon"
	    showTreeIcon="true" textField="orgname" onbeforeload="onBeforeTreeLoad" dataField="orgs" onnodeclick="dblclick"
	    idField="orgid" parentField="parentorgid">        
	</ul>
	</div>
	<div showCollapseButton="true">
	        <div class="nui-fit">
		        <div style="width:auto;">
			        <div class="nui-toolbar">
			         	<table style="width:100%;">
              				<tr>
					         	<td style="width:100%;">已选人员列表</td>
					   			<td><a class="nui-button" id="deltbtn" iconCls="icon-remove" plain="true" style="width:120px;"  onclick="gridRemoveRow('grid1')">&nbsp;删除已选人员 </a></td>    
			   			    </tr>
            			</table> 
			        </div>
		    	</div> 
	            <div id="grid1" class="nui-datagrid" style="width:auto;height:auto;" dataField="emps" showPager="false" multiSelect="true">         
	                <div property="columns">
	                	<div type="checkcolumn" width="10%"></div>
						<div field="userid" width="45%" headerAlign="center" >员工工号</div>      
	                    <div field="empname" width="45%"  headerAlign="center" >员工姓名</div>
	                    <div field="mobileno" width="45%"  headerAlign="center" >手机号码</div>                                      
	                </div>
	            </div> 
            </div> 
    </div>       
	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>
</div>
    <script type="text/javascript">
        nui.parse();
       var grid=nui.get("grid1"); 
    function onBeforeTreeLoad(e) {
        var tree = e.sender;    //树控件
        var node = e.node;      //当前节点
        var params = e.params;  //参数对象
        //可以传递自定义的属性
        //params.myField = "1"; //后台：request对象获取"myField"
    }
    init();
    function init(e){
    	var nodes=nui.get("tree1").getChildNodes(nui.get("tree1").getRootNode());
    	nui.get("tree1").expandNode(nodes[0]);
    }
	function dblclick(e){
		var a=grid.getData();
		if(e.node.userid==null||e.node.userid==""){
			alert("请选择人员!");
			return;
		}
		for(var i=0;i<a.length;i++){
			if(a[i].userid==e.node.userid){
				alert("该人员已被选中!");
				return;
			}
		}
		 var o = {
                "userid": e.node.userid,
                "empname": e.node.empname,
                "mobileno": e.node.mobileno
            };
            a.push(o);
            grid.setData(a);
		
	}
	function SetData(data){
		var data=nui.clone(data);
		var aaa=nui.encode(data);
		if(!isEmptyObject(aaa)){
			var a=data.userid.split(",");
			var b=data.empname.split(",");
			var m = "";
			if(data.mobileno){
				m=data.mobileno.split(",");
			}
			var c=[];
			for(var i=0;i<a.length;i++){
				var o={
				 	"userid": a[i],
	                "empname": b[i],
	                "mobileno": m[i]
				};
			c.push(o);	
			}
			grid.setData(c);
		}
	}
	function isEmptyObject(o){
	    for(var n in o){
	
	        return false;
	    }
	    return true;
	}
	
	function setIcon(e){
		 if(e.node.typeCode == "emp"){
			e.iconCls = "icon-user";
		}else if(e.node.typeCode == "org"){
			e.iconCls = "icon-organization";
		}
	}
	function onOk() {
		CloseWindow("ok");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function onCancel() {
		CloseWindow("cancel");
	} 
    function GetData() {
		var o=grid.getData();
		var userid="";
		var empname="";
		var mobileno = "";
		for(var i=0;i<o.length;i++){
			empname += o[i].empname+",";
            userid += o[i].userid+",";
            mobileno+=o[i].mobileno+",";
		}
		empname = empname.substring(0,empname.length-1);
        userid = userid.substring(0,userid.length-1);
        mobileno = mobileno.substring(0,mobileno.length-1);
        var a={
        	"empname":empname,
        	"userid":userid,
        	"mobileno":mobileno
        };
        var data={userid:userid,empname:empname,mobileno:mobileno};
		return data;
	}
	function gridRemoveRow(datagrid) {
    	var grid = nui.get(datagrid);
	    var rows = grid.getSelecteds();
	    if (rows.length > 0) {
	      grid.removeRows(rows, true);
	    }
   }
    </script>
</body>
</html>