<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): liubo
  - Date: 
  - Description:
-->
<head>
<title>外包人员考勤规则列表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="外包人员考勤规则管理" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right">规则编号：</td>
		            	<td align="left">
						    <input name="map/ruleno" class="nui-textbox"/>
						</td> 
						<td align="right">规则名称：</td>
		            	<td align="left">
						    <input name="map/rulename" class="nui-textbox" />
						</td> 
						<td align="right"><span>规则类型：</span></td>
		            	<td align="left">
						    <input name="map/ruletype" class="nui-dictcombobox" showNullItem="true" nullItemText="" dictTypeId="AME_ATTENDANCE_RULETYPE"  />
						</td>
						<td align="right"><span>考勤地理位置：</span></td>
		            	<td align="left">
						    <input name="map/address" class="nui-textbox"  />
						</td>
					</tr>
					
				    <tr>
				    	<td align="right"><span>项目编号：</span></td>
		            	<td align="left">
						    <input name="map/projectNO" class="nui-textbox"  />
						</td>
		    			<td align="center" colspan="14">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="attendance" showPager="true" sortMode="client"
	    url="com.primeton.eos.ame_common.ameAttendance.queryAttendance.biz.ext" sizeList="[10,20,50,100]"  multiSelect="false" onselectionchanged="selectionChanged"> 
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="ruleid" width="0" >考勤规则ID</div>		
				<div field="ruleno" width="60" align="center" headerAlign="center"  allowSort="true" >考勤规则编号</div>
				<div field="rulename" width="100" align="left" headerAlign="center"  allowSort="true">规则名称</div>
				<div field="starttime" width="40" align="center"  headerAlign="center" allowSort="true">签到时间</div>
				<div field="endtime" width="40" align="center" headerAlign="center" allowSort="true">签退时间</div>
				<div field="ruletype" width="80" align="center" headerAlign="center"  renderer="ruletype1"  allowSort="true">类型</div>
				<div field="address" width="150" align="left" headerAlign="center" allowSort="true">考勤地理位置</div>	
				<div field="datatype"width="58" align="center" headerAlign="center"  renderer="datatype1" allowSort="true">经纬度类型</div>						
				<div field="longitude"width="60" align="center" headerAlign="center"allowSort="true">经度</div>						
				<div field="latitude"width="60" align="center" headerAlign="center"allowSort="true">纬度</div>
				<div field="status"width="46" align="center" headerAlign="center"  renderer="status1" allowSort="true">默认规则</div>
				<div field="validrange" width="55" align="center" headerAlign="center" allowSort="true">有效范围(米)</div>
			</div>
		</div>
		
		<div id="br">
		  <br/>
		</div>
		<div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:350px;"
   		contextMenu="#tabsMenu">
		<div name="first" title="项目组信息">
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="addPersonnel()">增加</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="removePersonnel()">删除</a>
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
	    	
	    	 <div id="datagrid2" class="nui-datagrid" style="width:100%;height:281px;" allowResize="true"
	    	 	onrowdblclick="onRowDblClick" dataField="projects" sortMode="client"
	    	 	url="com.primeton.eos.ame_common.ameAttendance.getProjectsByRuleID.biz.ext" sizeList="[10,20,50,100]"
	    	 	pageSize="10"  multiSelect="true">
				<div property="columns">
					<div type="checkcolumn" width="25"></div>	
					<div field="PROJECT_ID" width="0" >项目ID</div>
					<div field="CUSTJC" width="100" align="center" headerAlign="center"  allowSort="true" >所在客户</div>		
					<div field="PROJECT_NO" width="70" align="center" headerAlign="center"  allowSort="true" >项目代码</div>
					<div field="PROJECT_NAME" width="100" align="center" headerAlign="center"  allowSort="true" >项目名称</div>
					<div field="ORGNAME"width="80" align="center" headerAlign="center"  allowSort="true">受益部门</div>
					<div field="OPERATORNAME"width="50" align="center" headerAlign="center" allowSort="true">项目经理</div>
					<div field="STARTDATE"width="60" align="center" headerAlign="center"allowSort="true" dateFormat="yyyy-MM-dd">开始日期</div>
					<div field="EXPENDDATE"width="60" align="center" headerAlign="center"allowSort="true" dateFormat="yyyy-MM-dd">预计结束日期</div>
					<div field="PCOSTTYPE" width="70" align="center"  headerAlign="center" renderer="pcosttype1" allowSort="true">项目成本类型</div>
				</div>
			</div> 
		</div>
		
		<div  title="外包人员信息" >
			<div id="datagrid3" class="nui-datagrid" style="width:100%;height:100%;" allowResize="true"
		    	 onrowdblclick="onRowDblClick" dataField="queryOutPersons"  sortMode="client"
		    	 url="com.primeton.eos.ame_common.ameAttendance.getOutPersonByRuleID.biz.ext" sizeList="[10,20,50,100]"
		    	 pageSize="10"  multiSelect="true" >
				<div property="columns">
					<div field="OUTPERNO" width="0" >外包人员ID</div>	
					<div field=OUTPERNAME width="40" align="center" headerAlign="center"  allowSort="true" >姓名</div>
					<div field="CUSTNAME"width="80" align="center" headerAlign="center"allowSort="true">供应商</div>
					<div field=PROJECT_NAME width="180" align="left" headerAlign="center"  allowSort="true" >所属项目</div>
					<div field="PROJECT_NO" width="60" align="center" headerAlign="center"  allowSort="true">项目编号</div>
					<div field="OPERATORNAME"width="40" align="center" headerAlign="center"allowSort="true">汇报对象</div>
					<div field="CURRENTSTATUS" width="60" align="center" headerAlign="center"  allowSort="true" renderer="outStatus">服务状态</div>	
					<div field="GENDER" width="25" align="center" headerAlign="center" renderer="gender1" allowSort="true">性别</div>
					<div field="LINKTEL"width="60" align="center" headerAlign="center"allowSort="true">联系电话</div>
					<div field="CREATEDATE" width="50" align="center"  headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">创建时间</div>
				</div> 
			</div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
    	nui.parse();
    	//先隐藏考勤规则对应的项目组以及外包人员。
		document.getElementById("tabs1").style.display="none";
		document.getElementById("br").style.display="none";
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	//考勤规则grid
    	grid.load();
		grid.sortBy("ruleid","desc");
			
		//考勤规则对应的项目组grid
    	var grid2 = nui.get("datagrid2");
    	//考勤规则对应的外包人员grid
    	var grid3 = nui.get("datagrid3");
    	
    	//规则默认状态
		function status1(e) {
			return nui.getDictText('MIS_YN',e.value);
		}
		//考勤位置类型,固定地点，非固定地点
		function ruletype1(e) {
			return nui.getDictText('AME_ATTENDANCE_RULETYPE',e.value);
		}
		//分为百度地图/google地图,目前只支持百度地图
		function datatype1(e) {
			return nui.getDictText('AME_ATTENDANCE_DATATYPE',e.value);//经纬度类型
		}
		//服务状态
		function outStatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
    	function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		function add() {        	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_common/attendance/ModifyAttendance.jsp",
                title: "新增考勤规则信息", 
				width: 830,
	            height: 250,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
		            grid.reload();
                }
            });
        }
        function remove() {
        	//删除权限
		    var row = grid.getSelected();
		    //取对应的项目第一条数据。
		    var g2_row = grid2.getRow(0);
		    if(row.status == 2){//默认考勤规则的状态是2
		    	alert("默认考勤规则不能删除！");
		    	return;
		    } 
		    //如果不为空，则表示有项目与之对应
		    if(g2_row){
		    	alert("该考勤规则存在考勤项目，不能删除！");
		    	return;
		    }
		    var g2_row = grid2.getRow(0);
		    var datagrid1 = nui.get("datagrid1");
	 		var selectRow = datagrid1.getSelected();
	    	//var data = nui.decode({ameAttendanceRule:{ruleid: selectRow.ruleid}});
		    
		    var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {attendances:rows,ameAttendanceRule:{ruleid: selectRow.ruleid}};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
            	if (confirm("确定删除选中记录？")) {
	               // grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_common.ameAttendance.deleteAttendance.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		                	var aa = o.projectnos;
		                	//alert(typeof(aa));
		                	
		                	if(aa==""||aa==null){
		                		grid.reload();
		                		alert("删除成功");
		                	}else {
		                		alert("该规则下有项目不能删除");
		                	}
		                },
		                error: function () {
	                    }
	               });
                }
            } else {
                alert("请至少选中一条记录");
            }
        }
        function edit() {
    		var row = grid.getSelected();
    		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/attendance/ModifyAttendance.jsp",
	            title: "编辑考勤规则",
	            width: 830,
	            height: 250,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", ruleid: row.ruleid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if(action=="saveSuccess"){
	                  grid.reload();
	                }
	            }
            });
            } else {
              nui.alert("请选中一条记录","提示");
            }
        }
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_pur/PurSupplier/DetailPurSupplier.jsp?id=" + selectRow.custid;
			window.open(executeUrl, "考勤规则详细信息", "fullscreen=1");
	    }
	    
	    //当选择规则时显示项目组
	    function selectionChanged(){
	     
			var datagrid1 = nui.get("datagrid1");
	 		var selectRow = datagrid1.getSelected();
	    	//var data = nui.decode({ameAttendanceRule:{ruleid: selectRow.ruleid}});
	    	var data = nui.decode({ruleID:selectRow.ruleid});
	 		//重新加载项目组
	 		grid2.load(data,function (e){
	 			//alert(e.rdProjects);
	 		});
	 		
	 		//重新加载外包人员
	 		grid3.load(data,function (o){
	 			//alert(e.rdProjects);
	 		});
	 		
	 		document.getElementById("tabs1").style.display="";
	 		//显示空行。
	 		document.getElementById("br").style.display="";
	       	grid2.sortBy("projectId","desc");
	 		grid3.sortBy("outperno","desc");
	    } 
	    
	   function addPersonnel() {        	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_common/attendance/SelectProject.jsp",
                title: "项目组信息", 
				width: 700,
	            height: 450,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            var row = grid.getSelected();   //获取所有选中的行对象
						  	//var data1 = {rdProject1: {rdProject1: data},rule:{rule:row.ruleid}};
 						    //var json = nui.encode(data1);     //序列化成json字符串
                           	var json = nui.encode({rdProject: data,rule:{ruleid:row.ruleid}});
					    	nui.ajax({
					    		url: "com.primeton.eos.ame_common.ameAttendance.addProjectRule.biz.ext",
					            data: json,
					            type: 'POST',
					            cache: false,
					            showModal: false,
					            contentType: 'text/json',
					            success: function (o) {
					            	var a = nui.encode(o.result);
					            	 if(a==0){
					            		alert("增加成功");
					            		grid2.reload();
					            		grid3.reload();
					            	}else if(a==-1){
					            		alert("保存失败,请检查该项目是否设置汇报对象。");
					            		return false;
					            	}else{
					            		alert("该项目已经配置考勤规则了。");
					            		return false;
					            	}
					            },
					            error:function(jqXHR, textStatus, errorThrown){
					            	alert(errorThrown);
					            }
					    	});
                        }
                    }

                }
            });
        }
        
        function removePersonnel() {
        	//删除权限
		    /* var row = grid2.getSelected();  
		    if(row.status != 0){//供应商状态为无效：2，（终止：3）
		    	alert("考勤规则只有在状态为无效时才可以删除！");
		    	return;
		    }  */
		    var row = grid.getSelected();
		    var rows = grid2.getSelecteds();   //获取所有选中的行对象
		    var data = {projcets:rows,rule:{ruleid:row.ruleid}};
		    var json = nui.encode(data);     //序列化成json字符串
		    //alert(json);
		   // return false;
			if (rows.length> 0) {
            	if (confirm("确定删除选中记录？")) {
	                //grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_common.ameAttendance.deleteProjectRule.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	grid2.reload();
		                	grid3.reload();
		                	//alert(json);
		                },
		                error: function () {
		                
	                    }
	               });
                }
            } else {
                alert("请至少选中一条记录");
            }
        }
        
	 	function projectStatus1(e){
			return nui.getDictText('MIS_PROJSTATUS',e.value);
		}
		function projectType1(e){
			return nui.getDictText('PROJECT_TYPE',e.value);
		}
		//所属事业部
		function belongto1(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		function pcosttype1(e){
			return nui.getDictText('AME_PCOSTTYPE',e.value);
		}
		function gender1(e){
			return nui.getDictText('ABF_GENDER',e.value);
		}
		function degree1(e){
			return nui.getDictText('DEGREE',e.value);
		}
	

	     
  </script>
</body>
</html>