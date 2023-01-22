<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/skins/skin0/component.jsp" %>
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
<style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
</style>
</head>
<body>
		<div style="width:100%;height:auto;padding:0px;margin:0px;" id="form1">
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
	    <div  class="nui-fit" >
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" allowResize="true" dataField="attendance" showPager="true" sortMode="client"
	    url="com.primeton.eos.ame_common.ameAttendance.queryAttendance.biz.ext" sizeList="[10,20,50,100]"  multiSelect="false" onrowdblclick="onRowDblClick"> 
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="ruleid" width="0" >考勤规则ID</div>		
				<div field="ruleno" width="60" align="center" headerAlign="center"  allowSort="true" >考勤规则编号</div>
				<div field="rulename" width="100" align="left" headerAlign="center"  allowSort="true">规则名称</div>
				<div field="starttime" width="40" align="center"  headerAlign="center" allowSort="true">签到时间</div>
				<div field="endtime" width="40" align="center" headerAlign="center" allowSort="true">签退时间</div>
				<div field="ruletype" width="80" align="center" headerAlign="center"  renderer="ruletype1"  allowSort="true">类型</div>
				<div field="address" width="150" align="left" headerAlign="center" allowSort="true">考勤地理位置</div>	
				<div field="status"width="46" align="center" headerAlign="center"  renderer="status1" allowSort="true">默认规则</div>
				<div field="validrange" width="55" align="center" headerAlign="center" allowSort="true">有效范围(米)</div>
			</div>
		</div>
		</div>
		<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
		    <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
		    <span style="display:inline-block;width:25px;"></span>
		    <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
	  	</div>
	<script type="text/javascript">
    	nui.parse();
    	//先隐藏考勤规则对应的项目组以及外包人员。
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	//考勤规则grid
    	grid.load();
		grid.sortBy("ruleid","desc");
			
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
		
		<%-- function add() {        	
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
	            url: "ModifyAttendance.jsp",
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
        } --%>
	    function GetData() {
			var row = grid.getSelected();
			return row;
		}
        
        function onRowDblClick(e) {
			onOk();
		}
		function onOk() {
	      var row = grid.getSelected();
	      if (!row) {
	        alert("请选中一条记录");
	        return;
	      }
	      //项目信息维护页面调用
	      window.returnValue = GetData();
	      CloseWindow("ok");
	    }
	    function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
		function onCancel(){
			CloseWindow();
		}
		function onRowDblClick(e) {
			onOk();
		}
  </script>
</body>
</html>