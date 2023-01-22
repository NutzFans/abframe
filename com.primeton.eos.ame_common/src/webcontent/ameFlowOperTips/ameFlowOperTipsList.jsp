<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-07-21 17:12:25
  - Description:
-->
<head>
<title>流程操作提示列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>流程操作提示列表</legend>
		    <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
		    	<table style="table-layout:fixed;">
		    		<tr>
		    			<td align="right" width="120px"><span>流程定义名称：</span></td>
		    			<td align="left">
				          	<input name="criteria._expr[0]._value" shownullItem="true" class="nui-combobox" id="processdefname" onvaluechanged="onActivitydefname(this.value)" url="com.primeton.eos.ame_common.processPrompt.queryProcessDefName.biz.ext" textField="processChName" valueField="processDefName" dataField = "processDefines"
								    allowInput="true" style="width:200px;" emptyText="请选择流程定义名称"/>
				          	<input class="nui-hidden" name="criteria._expr[0]._property" value="processdefname" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				        </td>
				        <td align="right" width="310px"><span>活动定义名称：</span></td>
				        <td align="left">
				          	<input name="criteria._expr[1]._value" shownullItem="true" class="nui-combobox" id="activitydefname" textField="name" valueField="id" dataField = "wfActivityDefines"
								    allowInput="true" style="width:200px;" emptyText="请选择活动定义名称"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="activitydefname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right"  width="290px"><span>是否可用：</span></td>
						<td align="left">
					     	<input name="criteria._expr[2]._value" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:45px;"/>
							<input class="nui-hidden" name="criteria._expr[2]._property" value="prostatus"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
						</td>
		          </tr>
		         </table>
		         <table style="width:100%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" style="width:60px;" iconCls="icon-yicon" onclick="search()">查询</a>
		                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
		                </td>
		            </tr>
		        </table>
		    </div>
		    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		        	<tr>
		                <td style="width:20%;">
		                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                    <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
		                    <a class="nui-button" id="deleteBtn" iconCls="icon-remove" onclick="remove()">删除</a>
		                </td>
		            </tr>
		         </table>           
		    </div>
		    <div id="datagrid1" class="nui-datagrid" allowCellWrap="true" style="width:100%;height:400px;" allowResize="true" dataField="AmeFlowOperTips" url="com.primeton.eos.ame_common.processPrompt.queryameFlowOperTips.biz.ext" sizeList="[10,20,50,100]" pageSize="20" idField="appid" multiSelect="true" onselectionchanged="selectionChanged">
				<div property="columns">
						<div field="processChName" width="100" align="center" headerAlign="center" allowSort="true" renderer="getDefineDetail">流程定义名称</div>
						<div field="activityDefName" width="100" align="center"  headerAlign="center" allowSort="true">活动定义名称</div>	
						<div field="processinfo" width="300" align="left" headerAlign="center" allowSort="true" >流程提示信息</div> <!--renderer="getDetail"  -->
						<div field="prostatus" width="45" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">是否可用</div>	
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	nui.parse();
	var grid = new nui.get("datagrid1");
	function init(){
		grid.load();
	}
	init();
	function onActivitydefname(e){
		var json =  nui.encode({processDefName:e});
		nui.ajax({
                url: "com.primeton.eos.ame_common.processPrompt.queryActivityDefName.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                	o.wfActivityDefines.splice(0,2);
                	nui.get("activitydefname").setData(o.wfActivityDefines);
                }
	         });
	}
	function search() {	    		
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	function edit(){
		var row = grid.getSelected();
    		if (row) {
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_common/ameFlowOperTips/ameFlowOperTipsAdd.jsp",
		            title: "修改公告信息",
		            width: 810,
		            height: 450,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit", processdefname: row.processdefname,activitydefname: row.activitydefname };
						iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
						if(action=="saveSuccess"){
		                	nui.alert("修改成功");
							grid.reload();
		                }
					}
				});
			} else {
				nui.alert("请选中一条记录","提示");
			}
	}
	function remove(){
        var row = grid.getSelected();
        var processdefname = row.processdefname;
        var activitydefname = row.activitydefname;
        if (processdefname !=null) {
            var data = {AmeFlowOperTips:{processdefname:processdefname,activitydefname:activitydefname}};
            var json = nui.encode(data);
            nui.ajax({
                url: "com.primeton.eos.ame_common.processPrompt.ameFlowOperTipsDelete.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                	nui.alert("删除成功！");
                	grid.removeRow(row, true);
                	return;
                }
	         });
        }
    }
    function reset(){
				var form = new nui.Form("#form1");
				form.reset();
				grid.load();
	}
    function add(){
    	nui.open({
		            url: "<%=request.getContextPath() %>/ame_common/ameFlowOperTips/ameFlowOperTipsAdd.jsp",
		            title: "新增流程提示信息",
		            width: 810,
		            height: 450,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = { action: "new"};
						iframe.contentWindow.SetData(data); 
					},
					ondestroy: function (action) {
						if(action=="saveSuccess"){
		                	nui.alert("保存成功");
							grid.reload();
		                }
					}
				});
    	<%-- window.location.href="<%=request.getContextPath() %>/ame_common/notice/addNotice.jsp"; --%>
    }
    function getDefineDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDefineDetail("+ e.record.processDefID +");' title='点击查看'>" + e.value + "</a>";
    }
    function checkDefineDetail(processDefID){
 		var row = grid.getSelected();
		nui.open({
   			 url: "<%=request.getContextPath() %>/ame_common/ameCommon/processDetail.jsp",
   			 title: "<%=I18nUtil.getMessage(request, "bps.wfclient.process.ProcDetail") %>",
   			 type:'POST',
             cache: false,
   			 width: 800,
   			 height: 500,
   			 onload: function () {
     			var iframe = this.getIFrameEl();
               	iframe.contentWindow.setData(processDefID);
     		 }
    	});
    }
    //点击姓名查看详情
    function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath()%>/ame_common/ameFlowOperTips/ameFlowOperTipsDetail.jsp?processdefname=" + selectRow.processdefname+"&activitydefname="+selectRow.activitydefname;
		var iWidth=780; //弹出窗口的宽度;
		var iHeight=420; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "流程提示信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    }
	function dictGetType(e) {
		return nui.getDictText('MIS_YN',e.value);
	}
	//当选择列时
    function selectionChanged(){
        var rows = grid.getSelecteds();
        if(rows.length>1){
            nui.get("addBtn").disable();
            nui.get("deleteBtn").disable();
            nui.get("editBtn").disable();
        }else{
            nui.get("addBtn").enable();
            nui.get("deleteBtn").enable();
            nui.get("editBtn").enable();
        }
    }
</script>
</body>
</html>