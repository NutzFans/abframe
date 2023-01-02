<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhengquan
  - Date: 2019-05-08 09:11:02
  - Description:
-->
<head>
<title>会议室管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;"class="mini-panel" title="会议室管理" >
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;" id="BtnControl">
                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">添加</a>
                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
                    </td>
                </tr>
             </table>
        </div>
    </div>
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:320px;" allowResize="true" dataField="hysDatas" showPager="true"
    url="com.primeton.eos.ame_dailyoffice.Hysxx.queryMeetingRoomList.biz.ext" sizeList="[10,20,50,100,200,500,1000]"  idField="hysid" multiSelect="true">
		<div property="columns">
			<div type="checkcolumn" width="6"></div>
			<div type="indexcolumn" align="center" headerAlign="center" width="6">编号</div>
			<div field="hysmc" width="12" align="center" headerAlign="center" renderer="getDetail">会议室名称</div>
			<div field="hysztch" width="8" align="center" headerAlign="center">会议室状态</div>	
			<div field="dz" width="12" align="center" headerAlign="center">会议室地址</div>		
			<div field="glymc" width="8" align="center" headerAlign="center">管理员名称</div>	
			<div field="rnrs" width="6" align="center" headerAlign="center">可容纳人数</div>	
			<div field="tyysl" width="6" align="center" headerAlign="center">投影数量</div>	
			<div field="sbms" width="12" align="center" headerAlign="center">设施说明</div>	
			
			
			
		</div>
	</div>
	<script type="text/javascript">
	    nui.parse();
	    //var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	
    	//初始化数据
		function init(){
			grid.load();
		}	
		    	
    	function getDetail(e){
			return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
		}
		
		function checkDetail(){
			var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/hygl/hysGoernor/meetingRoomDetail.jsp?hysid=" + selectRow.hysid;
			nui.open({
				url: executeUrl,
				title: "详细信息",
				width: "750px",
				height: "600px",
				allowResize: false,
				onload: function() {
					var iframe = this.getIFrameEl().contentWindow;
					iframe.type = "view";
					iframe.init();
				},
				ondestroy: function(action) {
					if(action == "ok") {}
				}
			});
		}
		
		function add() {      	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/hygl/hysGoernor/meetingRoomDetail.jsp",
                title: "新增会议室信息", 
				width: "750px",
				height: "430px",
                onload: function () {
               	  var iframe = this.getIFrameEl().contentWindow;
               	  iframe.type = "add";
               	  iframe.bh = grid.pageSize + 1;
	              iframe.init();
                },
                ondestroy: function (action) {
                    grid.reload();
                }
            });
        }
        
        function remove() {
		    var rows = grid.getSelecteds();   //获取所有选中的行对象
		    var data = {hysDatas:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
            	if (confirm("确定删除选中记录？")) {
	                grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_dailyoffice.Hysxx.deleteMeetingRoomData.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	if(text.flag ==true){
		                	alert("删除成功！");
		                	grid.reload();
		                	}else{
		                	alert("删除失败！");
		                	}
		                },
		                error: function () {
	                    }
	               });
                }
            } else {
                nui.alert("请至少选中一条记录","提示");
            }
        }
        
        
        function edit() {
    		var row = grid.getSelecteds();
    		if(row.length == 1){
	    		row = row[0];
	    		var executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/hygl/hysGoernor/meetingRoomDetail.jsp?hysid=" + row.hysid;
	          		nui.open({
			            url: executeUrl,
			            title: "编辑会议室信息",
			            width: "750px",
						height: "430px",
			            onload: function () {
			              var iframe = this.getIFrameEl().contentWindow;
			              iframe.type = "update";
			              iframe.init();
			            },
			            ondestroy: function (action) {
			                  grid.reload();
			            }
		            });
            }else{
              nui.alert("只能选中一条记录","提示");
            }
        }
	</script>
</body>
	
</html>