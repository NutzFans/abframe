<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-04-10 10:50:08
  - Description:
-->
<head>
<title>操作项目</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;}
</style>
</head>
<body>
<div class="nui-fit">

	<div title="应用信息" style="padding: 30px 0;float:left">
	 	<form id="form1" method="post" >
	 		<table style="table-layout:fixed;margin-bottom: 10px" id="table_file2">
	            <tr>
					<td align="right" style="width:100px"></td>
					<td>
        				<input id="operate" style="width:300px" onvaluechanged="operate()" class="nui-radiobuttonlist" data="[{id:'move', text: '部门调动'}, {id: 'copy', text: '增加新部门'}, {id: 'nomv', text: '非人事变动'}]" value="move" />	
					</td>
				</tr>
			</table>
			<fieldset style="border: solid 1px #aaa; padding: 3px;float: left;"id="lastTiaoDong">
			<legend>调动前信息</legend>
	         <table style="table-layout:fixed;width:250px;height:184px;" id="table_file3">
	            
				 <tr id="moveDate5" >
					<td align="right"></td>
					<td>
						<input format="yyyy-MM-dd"id="moveD52"  readonly="readonly" style="width:100px ;border:  solid 1px #FFFFFF !important"/>
					</td>
				</tr> 
				
				<tr id="level25"  >
					<td align="right" >调入工作地：</td>
	            	<td align="left"  >
					   <input id="inplace1" property="editor" allowInput="false" class="nui-dictcombobox" shownullItem="true" 
					   style="width:100px"   dictTypeId="AREA4CLRY"  readonly="readonly"/>
					</td>
				</tr> 
				<tr id="level35" >
					<td align="right">直属领导：</td>
	            	<td style="width:140px;" align="left">
	                	<input name="manager1" id="manager1"  width="100px"  class="nui-textbox" allowInput="false" readonly="readonly" />    
	                </td>
				</tr>
				<tr id="level36">
				<td align="right">职位分类:</td>
        			<td  align="left">    
            			<input name="emp.positionname" id="positionname1" onvaluechanged="setPositionName"class="nui-dictcombobox" shownullItem="true" allowInput="false"  readonly="readonly" dictTypeId="AME_POSITION_MEMO" style="width:100px;" />
        			</td>
				</tr>
				 <tr id="level45" >
					<td align="right">职位名称：</td>
	            	<td>
	            	<input id="inpositionname1" property="editor" class="nui-textbox"  style="width:100px" allowInput="false"/></td>
				</tr> 
			
				<tr id="nature15" >
					<td align="right">人员性质：</td>
	            	<td align="left" id="nature5">
					   <input name="nature" id="nature5" class="nui-dictcombobox"  style="width:100px"  
							dictTypeId="AME_EMPTYPE2" allowInput="false" readonly="readonly"/>
					</td>
				</tr>
				<tr id="degree15" >
					<td align="right">人员成本属性：</td>
	            	<td align="left" >
					   <input name="degree" id="degree5" class="nui-dictcombobox"  style="width:100px"  
							dictTypeId="AME_EMPTYPE2" allowInput="false"  readonly="readonly"/>
					</td>
				</tr>
        	</table>
        	</fieldset>      
			<fieldset style="border: solid 1px #aaa; padding: 3px;float:right;"id="lastTiaoDong1">
			<legend >本次改动信息</legend>
			
        	<table style="table-layout:fixed;width:250px;height:100px;" id="table_file1">
	            <tr id="oldOrgB" style="display: none">
					<td align="right">原部门占比数：</td>
					<td>
						<input id = "orgBtd" class="nui-textbox" style="width:100px" readonly="readonly"/>
					</td>
				</tr>
				<tr id="newOrgB" style="display: none">
					<td align="right">新部门占比数：</td>
	            	<td align="left" >
					   <input id = "newEmpprop" class="nui-textbox" style="width:100px"/>
					</td>
				</tr>
				<tr id="moveDate">
					<td align="right">调动日期：</td>
					<td>
						<input class="nui-datepicker" format="yyyy-MM-dd"id="moveD" style="width:100px" onvaluechanged="loadDegree"/>
					</td>
				</tr>
				<tr id="level1" style="display: none;">
					<td align="right">人员级别调整：</td>
	            	<td align="left" >
					   <input name="level" id="level" class="nui-combobox" required="true" style="width:100px"  
							textField="degreename" valueField="degree" />
					</td>
				</tr>
				
				<tr id="level2" >
					<td align="right">调入工作地：</td>
	            	<td align="left" >
					   <input id="inplace" property="editor"  class="nui-dictcombobox" shownullItem="true" style="width:100px"   dictTypeId="AREA4CLRY"/>
					</td>
				</tr> 
				<tr id="level3" >
					<td align="right">直属领导：</td>
	            	<td>
	            	
	            	<input name="emp.major" id="manager"  width="100px" onbuttonclick="selectOmEmployee" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />    
	            	 
					</td>
				</tr>
				<tr id="level6">
				<td align="right" >职位分类:</td>
        			<td align="left">    
            			<input name="emp.positionname" id="positionname" onvaluechanged="setPositionName"class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO"  style="width:100px;"  required="true"/>
        			</td>
				</tr>
				 <tr id="level4" >
					<td align="right">职位名称：</td>
	            	<td>
	            	<input id="inpositionname" property="editor" class="nui-textbox"  style="width:100px"/></td>
				</tr> 
				<tr id="level5" style="display: none;">
					<td align="right">操作方式：</td>
	            	<td align="left" >
					   <input id="operate1" class="mini-combobox" style="width:100px;" textField="text" data="[{id:'move', text: '移动'}, {id: 'copy', text: '复制'}]" value="copy" >

					</td>
				</tr>
				<tr id="nature1" >
					<td align="right">人员性质：</td>
	            	<td align="left" >
					   <input name="nature" id="nature" class="nui-dictcombobox"  style="width:100px"  
							dictTypeId="AME_EMPTYPE2"/>
					</td>
				</tr>
				<tr id="degree1" >
					<td align="right">人员成本属性：</td>
	            	<td align="left" >
					   <input name="degree" id="degree" class="nui-dictcombobox"  style="width:100px"  
							dictTypeId="AME_EMPTYPE2"/>
					</td>
				</tr>
        	</table>       
            </fieldset>      
        
        	
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-ok"  style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var oldempprop = null;
	var data = null;
	var toorgid = null;
	var fromorgid = null;
	function search(data){
		toorgid = data.toorgid;
		fromorgid = data.orgid;
		var empid = data.empid;
		nui.ajax({
        	url: "org.gocom.abframe.org.employee.EmpManager.getEmpprop.biz.ext",
        	type: 'POST',
        	cache: false,
        	data:data,
        	dataType:"json",
        	success: function (text) {
        		oldempprop = text.empprop;
        		var emp1=text.emp1;
        		var emp = text.emp;
        		nui.get("orgBtd").setValue(oldempprop);
        		nui.get("nature").setValue(emp.nature);
        		nui.get("degree").setValue(emp.degree);
        		nui.get("inplace").setValue(emp.workplace);
        		nui.get("manager").setValue(emp.major);
        		nui.get("inpositionname").setValue(emp.positioncall);
        		
        		nui.get("positionname1").setValue(emp.positionname);
        		nui.get("positionname").setValue(emp.positionname);
        		
        		
        		var date = new Date();
        		nui.get("moveD").setValue(date);
        		nui.get("inplace1").setValue(emp.workplace);
        		nui.get("inpositionname1").setValue(emp.positioncall);
        		nui.get("nature5").setValue(emp.nature);
        		nui.get("degree5").setValue(emp.degree);
        		if(emp.majorname ==""|| emp.majorname==null ){
        		        		nui.get("manager1").setValue(text.emp1[0].empname);
        		}else{
        		        		nui.get("manager1").setValue(emp.majorname);
        		}
        		
        		
        		
        	}
        });
	}
		
	
	//判断并加载人员级别部门
	function loadDegree(){
		var degree = nui.get("degree").getValue();
		if(degree =="2" ||degree =="3"){//如果是服务或者研发则需要填写级别
			var moveD = nui.get("moveD").getValue();
			var json = {"orgid":toorgid,"fromorgid":fromorgid,"moveDate":moveD};
			nui.ajax({
	        	url: "org.gocom.abframe.org.employee.EmpOrgChange.getEmpLevel1.biz.ext",
	        	type: 'POST',
	        	cache: false,
	        	data:json,
	        	dataType:"json",
	        	success: function (text) {
	        		var datas = text.datas;
	        		var result = text.result;
	        		var operate = nui.get("operate").getValue();
	        		if(result=='1'){
	        			if(operate=='move'){
	        				document.getElementById("level1").style.display = '';
	        				nui.get("level").setData(datas);
	        			}
	        		}
	        	}
	        });
		}
	}
	
	function operate(){
		var operate = nui.get("operate").getValue();
		if(operate == "move"){
			document.getElementById("oldOrgB").style.display = 'none';
			document.getElementById("newOrgB").style.display = 'none';
			document.getElementById("degree1").style.display = '';
			document.getElementById("nature1").style.display = '';
			document.getElementById("level2").style.display = '';
			document.getElementById("level3").style.display = '';
			document.getElementById("level4").style.display = '';
			document.getElementById("level5").style.display = 'none';
			document.getElementById("lastTiaoDong").style.display = '';
			document.getElementById("level6").style.display = '';
			
			
		}else if(operate == "copy"){
			document.getElementById("oldOrgB").style.display = '';
			document.getElementById("newOrgB").style.display = '';
			document.getElementById("degree1").style.display = '';
			document.getElementById("nature1").style.display = '';
			document.getElementById("level2").style.display = 'none';
			document.getElementById("level3").style.display = 'none';
			document.getElementById("level4").style.display = 'none';
			document.getElementById("level5").style.display = 'none';
			document.getElementById("lastTiaoDong").style.display = 'none';
			document.getElementById("level6").style.display = 'none';
			
			
			
			
			
		}else if(operate == "nomv"){
			document.getElementById("oldOrgB").style.display = 'none';
			document.getElementById("newOrgB").style.display = 'none';
			document.getElementById("degree1").style.display = 'none';
			document.getElementById("nature1").style.display = 'none';
			document.getElementById("level2").style.display = 'none';
			document.getElementById("level3").style.display = 'none';
			document.getElementById("level4").style.display = 'none';
			document.getElementById("level5").style.display = '';
			document.getElementById("lastTiaoDong").style.display = 'none';
			document.getElementById("level6").style.display = 'none';
			

			
		}
	}
	
	function ok(){
		var operate = nui.get("operate").getValue();
		var indatea = nui.get("moveD").getFormValue();
		var level = nui.get("level").getValue();
		var nature = nui.get("nature").getValue();
		var degree = nui.get("degree").getValue();
		var inplace = nui.get("inplace").getValue();
		var manager = nui.get("manager").getValue();
		var inpositionname = nui.get("inpositionname").getValue();
		
		var operate1 = nui.get("operate1").getValue();
		var positionname = nui.get("positionname").getValue();
		
		
		if(operate == 'copy'){
			var newEmpprop = nui.get("newEmpprop").getValue();
			var reg = new RegExp("^[0-9]+\.{0,1}[0-9]{0,2}$");  
	     	if(!reg.test(newEmpprop)){ 
	     		document.getElementById("newEmpprop").value=""; 
	     		nui.alert("请输入正确的数字!");
	     		return;
	     	}
			if(parseFloat(oldempprop) <= parseFloat(newEmpprop)){
				document.getElementById("newEmpprop").value="";
				nui.alert("新部门占比数不能大于等于原部门占比数！");
				return;
			}
			if(newEmpprop==null||newEmpprop==""){
        		nui.alert("占比数不能为空！");
        		return;
        	}
    		 if(indatea==""||indatea==null){
	        	nui.alert("调动日期不能为空！");
	        	return;
	        }
	       	data = {'newEmpprop':newEmpprop,"opertion":operate,"indatea":indatea,"nature":nature,"degree":degree};
        	CloseWindow("ok");
		}else{
        	if(operate=='move'){
        		 if(indatea==""||indatea==null){
		        	nui.alert("调动日期不能为空！");
		        	return;
		        }
        	}
        	data = {"opertion":operate,"indatea":indatea,newEmpprop:"0.00","level":level,"nature":nature,"degree":degree,"inplace":inplace,"manager":manager,"inpositionname":inpositionname,"operate1":operate1,"positionname":positionname};
        	CloseWindow("ok");
        }
	}
	
	function getData(){
		return data;
	}
	
	function onCancel(data){
		CloseWindow(data);
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	 function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择岗位代理人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }

            }
        });
    }
    
    
    function setPositionName(e){
		//var recposition = e.value;
		var position = nui.get("positionname").getText();
		nui.get("positioncall").setValue(position);
	} 

</script>
</html>