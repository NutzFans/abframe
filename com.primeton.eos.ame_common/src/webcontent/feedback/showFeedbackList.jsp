<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wenyy
  - Date: 2016-06-27 13:22:00
  - Description:
-->
<head>
<title>显示反馈列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <legend>反馈列表</legend>
        </div>
    </div>
	<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td align="right"><span>反馈人：</span></td>
				<td align="left">
					<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:110px;" onenter="onKeyEnter"/>
		          	<input class="nui-hidden" name="criteria._expr[0]._property" value="feedbackperson" />
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				</td>
				<td align="right"><span>反馈类型：</span></td>
				<td align="left">
					<input name="criteria._expr[1]._value" class="nui-dictcombobox" shownullItem="true" dictTypeId="AME_FEEDTYPE" style="width:110px;"/>
					<input class="nui-hidden" name="criteria._expr[1]._property" value="feedbacktype"/>
					<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
				</td>
				<td align="right"><span>反馈时间：</span></td>
				<td align="left">
					<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-
		    		<input class="nui-datepicker" name="criteria._expr[3]._max" id="maxdatepicker" style="width:100px"/>
			        <input class="nui-hidden" name="criteria._expr[3]._property" value="feedbackdate"/>
				    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
			        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td align="right"><span>是否回复：</span></td>
				<td align="left">
					<input name="criteria._expr[2]._value" class="nui-dictcombobox" shownullItem="true" dictTypeId="MIS_YN" style="width:50px;"/>
					<input class="nui-hidden" name="criteria._expr[2]._property" value="state"/>
					<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
				</td>
				<td align="right"><span>功能：</span></td>
				<td align="left">
					<input name="criteria._expr[4]._value" class="nui-textbox"  style="width:110px;" onenter="onKeyEnter"/>
		          	<input class="nui-hidden" name="criteria._expr[4]._property" value="functionname" />
			        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
				</td>
				<td align="right"><span>反馈内容：</span></td>
				<td align="left">
					<input name="criteria._expr[5]._value" class="nui-textbox"  style="width:110px;" onenter="onKeyEnter"/>
		          	<input class="nui-hidden" name="criteria._expr[5]._property" value="contentexplain" />
			        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				</td>
			</tr>
			</table>
			<table style="width:90%;">
	            <tr>
	                <td align="center" style="width:100%;">
	                    <a class="nui-button" iconCls="icon-search" style="width:60px;" onclick="search()">查询</a>
	                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
	                </td>
	            </tr>
	        </table>
    </div>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit()">回复</a>
                    </td>
                </tr>
             </table>           
        </div>
 </div>
 <div id="datagrid1" class="nui-datagrid" allowCellWrap="true" style="width:100%;height:400px;" allowResize="true" dataField="AmeFeedback" url="com.primeton.eos.ame_common.ameFeedback.showFeedbackList.biz.ext" sizeList="[10,20,50,100]" pageSize="10" idField="appid" multiSelect="true" onselectionchanged="selectionChanged">
	<div property="columns">
			<div field="feedbackid" width="0" align="center" headerAlign="center" allowSort="true" allowSort="true"></div>		
			<div field="feedbackperson" width="75" align="center" headerAlign="center" allowSort="true">反馈人</div>
			<div field="feedbackdate" width="100" align="center" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true">反馈时间</div>	
			<div field="feedbacktype" width="75" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">反馈类型</div>		
			<div field="functionname" width="75" align="center" headerAlign="center" allowSort="true">功能</div>
			<div field="contentexplain" width="175" align="left" headerAlign="center" allowSort="true"  renderer="getDetail">反馈内容</div>	
			<div field="state" width="45" align="center" headerAlign="center" allowSort="true" renderer="dictGetState">是否回复</div>	
			<div field="replyadvice" width="120" align="center" headerAlign="center"allowSort="true">回复意见</div>
			<div field="requirmentnumber" width="75" align="center" headerAlign="center" allowSort="true">需求编号</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = new nui.get("datagrid1");
	function init(){
		grid.load();
		grid.sortBy("feedbackdate","desc")
	}
	init();
	function search() {	    		
				var form = new nui.Form("#form1");
				var str = nui.get("maxdatepicker").getValue();
				if(str!=null || str!=""){
					var strDate = str.substring(0,10)+" 23:59:59";
					nui.get("maxdatepicker").setValue(strDate);
				}
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
	}
	function onKeyEnter(e) {
		search();
	}
	//当选择列时
    function selectionChanged(){
        var rows = grid.getSelecteds();
        if(rows.length>1){
            nui.get("updateBtn").disable();
        }else{
            nui.get("updateBtn").enable();
        }
    }
    /**
     * 回复反馈信息
     */
    function edit() {
		var row = grid.getSelected();
		if (row) {
  		nui.open({
        url: "<%=request.getContextPath() %>/ame_common/feedback/replyFeedback.jsp",
        title: "回复反馈信息",
        width: 1130,
        height: 500,
        onload: function () {
          var iframe = this.getIFrameEl();
          var data = {action: "edit", feedbackid: row.feedbackid };
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
    function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
</script>
</html>