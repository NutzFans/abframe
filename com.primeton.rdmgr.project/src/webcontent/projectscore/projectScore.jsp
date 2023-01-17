	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-05-30 10:52:28
  - Description:
-->
<head>
	<title>项目经理月度打分</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	    .setColor{
	    	color: red;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="项目经理月度打分" style="width: auto">
    	 <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    	 <fieldset id="field1" style="width:98%;border:solid 1px #aaa;padding:3px;">
    	 	<input class="nui-hidden" name="map.projectId" id="projectId" />
    	 	<input class="nui-hidden" name="map.projectname" id="projectname" />
	        <legend>选择项目</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:150px;">选择年月：</td>
						<td colspan="1">
							<input name="map.yearmonth" id="yearmonth"   class="nui-monthpicker" required="true" onvaluechanged = "changeDate" style="width:100px" allowInput="true" />
							<input  id="year" name = "map.year" class="nui-hidden"/>
							<input  id="month" name = "map.month" class="nui-hidden"/>
						</td>
						<td align="right" style="width:150px;">考核项目：</td>
						<td colspan="3"><input name="map.projectno"  onbuttonclick="selectProjectCheck" id="projectno"   class="nui-buttonedit" emptyText="请选择项目" required="true" style="width:300px" allowInput="true" />
						</td>
						<!-- <td align="right" style="width:100px;"></td>
						<td colspan="1"><a class="nui-button" id="checksave" onclick="checksave()">查询项目参与人员</a></td> -->
					</tr>
				</table>
			</div>
	     </fieldset>
	     </div>
	     <fieldset id="field2" style="border:solid 1px #aaa;width:98%;padding:3px;display: none;">
	     	<legend>项目考核人员</legend>
	     	<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
			    <table style="width:auto;" >
			        <tr>
			            <td style="width:100%;">
			                <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
			                <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
			                <!-- <a class="nui-button" iconCls="icon-add" onclick="saveRow()" plain="true">保存</a> -->
		                </td>
		            </tr>
		        </table>           
		    </div>
	        <div id="datagrid_person" class="nui-datagrid" style="width:auto;height:auto;" dataField="emps"
 				allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" allowCellWrap="true" multiSelect="true" editNextOnEnterKey="false" showPager="false">
    			<div property="columns"> 
	    			<div type="checkcolumn"></div> 
        			<div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名
        				<input property="editor" id="userid" class="nui-combobox" showClose="false" clearOnLoad="true" required="true" allowInput="true" 
        				url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" onvaluechanged="changeEmp" dataField="data" filterType="like" textField="empname" valueField="userid" valueFromSelect="true"/>
        			</div>
	                <div field="orgname" width="100" align="center" headerAlign="center" >所属部门</div>
	                <div field="daynum" width="60" align="center" headerAlign="center" >工时天数</div>
	                <div field="pennum" width="60" align="center" headerAlign="center" >工时笔数</div>
	                <div field="acthours" width="60" align="center" headerAlign="center" >总工时</div>
	                <div field="otwhours" width="60" align="center" headerAlign="center" >加班工时</div>
	                <div field="total" width="60" align="center" headerAlign="center" >总分</div>
	                <div field="remark" width="200" align="left" headerAlign="center" >备注
	                	<input property="editor" class="nui-textbox"/>
	                </div>
				</div>
			</div>
			<div id="panel1" class="mini-panel" title="项目人员打分" style="width:100%;height:auto" 
			 allowResize="true">
		        <div id="grid_projectScore" class="nui-datagrid" style="width:100%;height:auto"  dataField="data"  allowCellEdit="true"  allowCellWrap="true" 
			    	url="com.primeton.rdmgr.project.projectscore.queryProjectScores.biz.ext" allowCellSelect="true" showPager="false"   multiSelect="true" >
				</div>
				<div>
					<div><b>评分标准:</b></div>
					<div>1、<b class="setColor">5分Excellent</b>&nbsp;&nbsp;<b class="setColor">4分Very good</b>&nbsp;&nbsp;<b class="setColor">3分Good</b>&nbsp;&nbsp;<b class="setColor">2分Pass</b>&nbsp;&nbsp;<b class="setColor">1分Bad</b>&nbsp;&nbsp;<b class="setColor">0分Very Bad</b></div>
					<div>2、 在评分时，允许评0.5分；各项目组内所有员工的分值必须拉开。</div>
				</div>
        	</div>
	     </fieldset>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
    <a class="nui-button" onclick="onOk()" iconCls="labor-recount" style="width:140px;margin-right:20px;" id="okbutton">保存打分</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
		
	var form = new nui.Form("#form1");
	var datagrid_person = nui.get("datagrid_person");
	var grid_projectScore = nui.get("grid_projectScore");
	var datas=null;
	var empdata ;
	function checksave(){
		if(form.validate()){
			datas = form.getData();
			var json = nui.encode({"map":datas.map});
			nui.ajax({
				url: "com.primeton.rdmgr.project.projectscore.querEmpByProject.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
		        success: function (o) {
		        	empdata =o.emps;
		        	datagrid_person.setData(empdata);
		        	setmap(empdata);
		        	var grid_emps = getColumns(empdata);
				    grid_projectScore.set({columns:grid_emps,frozenStartColumn:0,frozenEndColumn:1});
					grid_projectScore.load({"map":datas.map});
					$("#field2").show();
		        }
			});
		}
	}
	
	function setmap(emps){
		var userids="";
    	for(var i = 0;i<emps.length;i++){
    		if(i==emps.length-1){
    			userids=userids+"["+emps[i].userid+"]";
    		}else{
    			userids=userids+"["+emps[i].userid+"],";
    		}
    	}
    	datas.map.userids=userids;//将拼接好的用户id存入map
	}
	
	function onOk(){
		var selectRow = grid_projectScore.getChanges("modified");//更改的datagrid
		var projectStaffRemoved=datagrid_person.getChanges("removed");//获取删除的信息
		var projectStaffChanged = datagrid_person.getChanges();
		if(form.validate()){
			if(selectRow.length>0 || projectStaffChanged.length>0){
				nui.confirm("是否确认打分？", "确定？",function (action) {
		        	if(action=='ok'){
				        nui.get("okbutton").disable();
		        		var projectStaff=datagrid_person.getData();
		        		var projectScore=grid_projectScore.getData();
						var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
						for(var i=0;i<projectStaff.length;i++){
							var row = datagrid_person.findRow(function(row){
							    if(row.userid==projectStaff[i].userid){
							   		return true;
							    } 
							});
							var arr=[];
							var obj = {};
							for( var k=0;k<projectScore.length;k++){
								if(reg.test(projectScore[k][projectStaff[i].userid])){
									obj = createObj(projectStaff[i].userid,projectStaff[i].staffscoreid,projectScore[k].SCOREITEMID,projectScore[k].WEIGHT,projectScore[k][projectStaff[i].userid]);
									arr.push(obj);
								}
							}
							var rowData = {scoredetails:arr};
							datagrid_person.updateRow(row,rowData);	
						}
						var json = nui.encode({"map":datas.map,"rdProjStaffScores":projectStaff,"projectStaffRemoved":projectStaffRemoved});
						nui.ajax({
							url: "com.primeton.rdmgr.project.projectscore.saveProjectScore.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
					        success: function (o) {
			    				var returnJson = nui.decode(o);
			    				if(returnJson.result=="success"){
			    					nui.alert("打分成功","提示",function(){
			    						checksave();
			    					});
			    				}else{
			    					nui.alert("打分失败");
			    				}
			    				nui.get("okbutton").enable();
					        }
						});
		        	}
		        });
	        }else{
	        	nui.alert("请打分后再保存！");
	        }
        }else{
        	nui.alert("请先选择考核年月和考核项目！");
        }
	}
	
	//工厂赋值修改的对象
	function createObj(userid,staffscoreid,scoreitemid,weight,score){
		var o = new Object();
	    o.userid = userid;
	    o.scoreitemid = scoreitemid;
	    o.staffscoreid = staffscoreid;
	    if(parseFloat(score)==0){
	    	o.score = null;
	    	o.weightscore = null;
	    }else{
	    	o.weightscore = parseFloat(weight*score);
	    	o.score = parseFloat(score);
	    }
	    return o;
	}
	
	function saveData(){
	}
	function addRow() {          
	    var newRow = { name: "New Row" };
	    datagrid_person.addRow(newRow);
	}
	function removeRow() {
	    var rows = datagrid_person.getSelecteds();
	    datagrid_person.removeRows(rows, false);
	    empdata = nui.clone(datagrid_person.getData());
		setmap(empdata);
		var grid_emps = getColumns(empdata);
	    grid_projectScore.set({columns:grid_emps,frozenStartColumn:0,frozenEndColumn:1});
		grid_projectScore.load({"map":datas.map});
	}
	
	//动态获取列
    function getColumns(emps) {
    	var result = [];
		result.push({field:'ASSESSITEM',width:'100px',align:'left',headerAlign:'center',header:'考核项'});
		result.push({field:'ASSESSCONTENT',width:'400px',align:'left',headerAlign:'center',header:'考核标准'});
		for(var i = 0 ; i<emps.length; i++){
    		result.push({field:emps[i].userid,width:'60px',align:'right',headerAlign:'center',header:emps[i].empname,summaryType:'sum',numberFormat:'0.0',editor: { type: "spinner",format:"n1",minValue:0,maxValue:5,increment:0.5,onvaluechanged:'changeData'}});
		}
        return result;
	}
	
	datagrid_person.on("drawcell", function (e) {
	    var record = e.record,
	        column = e.column,
	        field = e.field;
	    //设置行样式   
	    if("userid" == field || "remark" == field){
	    	e.cellStyle = "background: #FFFFE7";
	    }
	});
	grid_projectScore.on("drawcell", function (e) {
	    var record = e.record,
	        column = e.column,
	        field = "["+e.field+"]";
        var userids = datas.map.userids;
		if(userids){
			var userids1 = userids.split(",");
			for(var i=0;i<userids1.length;i++){
				if(userids1[i] == field){
					//设置行样式   
					e.cellStyle = "background: #FFFFE7";
				}
			}
		}
	});
	/* function sumRender(e){
		if(empdata.length>0){
			for(var i=0;i<empdata.length;i++){
				if(e.field ==empdata[i].userid ){
					e.cellHtml = "<div align='right'><b>" +e.cellHtml.toFixed(1) + "</b></div>";
				}
			}
		}
	} */
	
	function changeData(e){
		var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
		if(!reg.test(e.value)){
			e.value = "";
			e.cellHtml = "";
			nui.alert("输入非正确字符，请重新输入。");
		}
	}
	function changeEmp(e){
		var row = datagrid_person.getSelected();
		if(e.value){
			var userid = e.value;
			var userid1 = "["+userid+"]";
			var userids = datas.map.userids;
			var isnotexist =true; //不存在
			if(userids){
				var userids1 = userids.split(",");
				for(var i=0;i<userids1.length;i++){
					if(userid1 ==userids1[i]){
						isnotexist =false ;//存在
					}
				}
			}
			if(isnotexist){
				var omemp = e.selected;
				var empname =omemp.empname;
				var orgname = omemp.ORGNAME;
	            datas.map.userid=userid;
	            var json =nui.encode({"map":datas.map});
	            nui.ajax({
			        url: "com.primeton.rdmgr.project.projectscore.querEmpByProject.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
			        success: function (o) {
			        	var emps = o.emps;
			        	if(emps !=null &&  emps !="" && emps.length==1){
			        		var rowData = {userid:userid,staffscoreid:emps[0].staffscoreid,empname:empname,projectno:datas.map.projectno,projectname:datas.map.projectname,year:datas.map.year,month:datas.map.month,orgname:orgname,daynum:emps[0].daynum,pennum:emps[0].pennum,acthours:emps[0].acthours,otwhours:emps[0].otwhours,total:emps[0].total};
			        	}else {
			        		var rowData = {userid:userid,empname:empname,projectno:datas.map.projectno,projectname:datas.map.projectname,year:datas.map.year,month:datas.map.month,orgname: orgname,daynum:"",pennum:"",acthours:"",otwhours:"",total:""};
			        	}
	        			datagrid_person.updateRow(row,rowData);	
	        			empdata = nui.clone(datagrid_person.getData());
	        			setmap(empdata);
	        			var grid_emps = getColumns(empdata);
					    grid_projectScore.set({columns:grid_emps,frozenStartColumn:0,frozenEndColumn:1});
						grid_projectScore.load({"map":datas.map});
				    }
				});
			}else{
				nui.alert("输入人员已存在列表中","提示",function(e){
					nui.get("userid").setText("");
					var rowData = {userid:"",empname:""};
		        	datagrid_person.updateRow(row,rowData);	
				})
				
			}
		}else{
			nui.get("userid").setText("");
			var rowData = {userid:"",empname:""};
        	datagrid_person.updateRow(row,rowData);	
		}
	}	
	//选择员工
	function showEmployee(e){
		var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择人员",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
                    	var row = datagrid_person.getSelected();
                    	var userid =data.userid;
		                btnEdit.setValue(userid);
		                btnEdit.setText(data.empname);
		                datas.map.userid=userid;
		                var json =nui.encode({"map":datas.map});
		                nui.ajax({
					        url: "com.primeton.rdmgr.project.projectscore.querEmpByProject.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
					        success: function (o) {
					        	var emps = o.emps;
					        	if(emps.length==1){
					        		var rowData = {userid:userid,staffscoreid:emps[0].staffscoreid,empname:data.empname,projectno:datas.map.projectno,projectname:datas.map.projectname,year:datas.map.year,month:datas.map.month,orgname: data.orgname,daynum:emps[0].daynum,pennum:emps[0].pennum,acthours:emps[0].acthours,otwhours:emps[0].otwhours};
					        	}else {
					        		var rowData = {userid:userid,empname:data.empname,projectno:datas.map.projectno,projectname:datas.map.projectname,year:datas.map.year,month:datas.map.month,orgname: data.orgname,daynum:"",pennum:"",acthours:"",otwhours:""};
					        	}
                    			datagrid_person.updateRow(row,rowData);	
                    			empdata = nui.clone(datagrid_person.getData());
                    			setmap(empdata);
                    			var grid_emps = getColumns(empdata);
							    grid_projectScore.set({columns:grid_emps,frozenStartColumn:0,frozenEndColumn:1});
								grid_projectScore.load({"map":datas.map});
						    }
						});
					}
				}
			}
		});
	}
	
	//选择项目考核方案
    function selectProjectCheck(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=projectScore",
            title: "选择考核项目",
            width: 850,
            height: 460,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectName);
                        nui.get("projectId").setValue(data.projectId);
                        nui.get("projectname").setValue(data.projectName);
	 					var yearmonth = nui.get("yearmonth").getValue();
	 					if(yearmonth){
	 						checksave();
	 					}
                    }
                }
            }
        });
    }
    
    //选择年月，拆分成年和月
    function changeDate(e){
    	if(e.value){
	    	var year = e.value.getFullYear();//年份
	    	var month = e.value.getMonth()+1;
	 		nui.get("year").setValue(year);
	 		nui.get("month").setValue(month);
	 		var projectno = nui.get("projectno").getValue();
	 		if(projectno){
	 			checksave();
	 		}
    	}
    }   
</script>
</html>