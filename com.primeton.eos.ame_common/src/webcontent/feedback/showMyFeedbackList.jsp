<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhouwenjie
  - Date: 2016-06-27 17:57:50
  - Description:
-->
<head>
<title>我的意见反馈列表</title>
</head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<body>
<%-- <label align="rignt"><a style="position:absolute;right:13px;top:12px;z-index:999;" href="<%= request.getContextPath()%>/ame_feedback/addFeedback.jsp">意见反馈</a></label> --%>
<div style="width:100%;height:100%;padding:0px;margin:0px;">
	<div style="width:100%;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <legend>我的意见反馈列表</legend>
	    </div>
	</div>
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
	      	<input class="nui-hidden" name="criteria._expr[0]._property" value="feedbackperson" />
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	        	<tr>
	                <td style="width:20%;">
	                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加意见反馈</a>
	                    <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">修改意见反馈</a>
	                    <a class="nui-button" id="deleteBtn" iconCls="icon-remove" onclick="remove()">删除意见反馈</a>
	                </td>
	            </tr>
	         </table>           
	</div>
	<div id="datagrid1" allowCellWrap="true" class="nui-datagrid" style="width:100%;height:450px;" allowResize="true" dataField="AmeFeedback" url="com.primeton.eos.ame_common.ameFeedback.showMyFeedbackList.biz.ext" sizeList="[10,20,50,100]" pageSize="15" idField="appid" multiSelect="true" onselectionchanged="selectionChanged">
			<div property="columns">
				<div field="feedbackid" width="0" align="center" headerAlign="center" allowSort="true" allowSort="true">反馈id</div>		
				<div field="feedbackdate" width="105" align="center" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true">反馈时间</div>
				<div field="feedbacktype" width="75" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">反馈类型</div>
				<div field="functionname" width="75" align="center" headerAlign="center" allowSort="true" >功能</div>
				<div field="contentexplain" width="175" align="left" headerAlign="center" allowSort="true" renderer="getDetail">内容说明</div>
				<div field="state" width="45" align="center" headerAlign="center" allowSort="true" renderer="dictGetState">是否回复</div>	
				<div field="replyadvice" width="120" align="center" headerAlign="center"allowSort="true">回复意见</div>				
			</div>
		</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = new nui.get("datagrid1");
	function init(){
		search();
		grid.sortBy("feedbackdate","desc");
	}
	init();
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
		grid.load(data); //datagrid加载数据
	}
     /**
     * 查看反馈信息
     */
    function look(){
    	var row = grid.getSelected();
		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/feedback/showFeedback.jsp",
	            title: "查看反馈详情",
	            width: 850,
	            height: 550,
	            onload: function () {
					var iframe = this.getIFrameEl();
	              	var data = {action: "look", feedbackid: row.feedbackid };
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
    /**
     * 添加反馈信息
     */
    function add() {   
        nui.open({
            url: "<%=request.getContextPath() %>/ame_common/feedback/addMyFeedback.jsp",
            title: "新增反馈信息", 
			width: 750,
            height: 450,
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
    
     /**
     * 修改反馈信息
     */
    function edit() {
    		var row = grid.getSelected();
    		if (row) {
    			if(row.state==0){
	    				nui.open({
			            url: "<%=request.getContextPath() %>/ame_common/feedback/addMyFeedback.jsp",
			            title: "修改反馈信息",
			            width: 750,
			            height: 450,
			            onload: function () {
							var iframe = this.getIFrameEl();
							var data = {action: "edit", feedbackid: row.feedbackid };
							iframe.contentWindow.SetData(data);
						},
						ondestroy: function (action) {
							if(action=="saveSuccess"){
			                	nui.alert("保存成功");
								grid.reload();
			                }
						}
					});
    			}else{
    				alert("已回复的意见反馈不能修改！");
    			}
			} else {
				nui.alert("请选中一条记录","提示");
			}
        }
    //设置业务字典值-反馈状态
	function dictGetState(e) {
		return nui.getDictText('MIS_YN',e.value);
	}
	 //设置业务字典值-反馈类型
	function dictGetType(e) {
		return nui.getDictText('AME_FEEDTYPE',e.value);
	}
	//点击姓名查看详情
    function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath()%>/ame_common/feedback/showFeedback.jsp?id=" + selectRow.feedbackid;
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
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
    function remove(){
        var row = grid.getSelected();
    	if(!confirm("是否确认删除？")){
    		return;
    	}
        var feedbackId = row.feedbackid
        if (feedbackId > 0) {
            var data = {ameFeedback:{feedbackid:feedbackId}};
            var json = nui.encode(data);
            nui.ajax({
                url: "com.primeton.eos.ame_common.ameFeedback.deleteFeedback.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                	nui.alert("删除成功！");
                	grid.reload();
                }
	         });
        }
        
    }
</script>
</html>