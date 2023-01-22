<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-07-07 15:45:54
  - Description:
-->
<head>
<title>公告列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:50%;padding:0px;margin:0px;">
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <legend>公告列表</legend>
        </div>
    </div>
    <div class="nui-toolbar" line-height:30px;" borderStyle="border:0;" id="form1">
    	<input id="noticestate" name="criteria._expr[2]._value" class="nui-hidden"/>
		<input class="nui-hidden" name="criteria._expr[2]._property" value="noticestate"/>
		<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
		<input id="noticedate" name="criteria._expr[4]._value" class="nui-hidden"/>
		<input class="nui-hidden" name="criteria._expr[4]._property" value="noticedate"/>
	    <input class="nui-hidden" name="criteria._expr[4]._op" value="<="/>
    	<table style="width:100%;">
    		<tr>
    			<td align="left" width="30%"><span>公告标题：</span>
		           	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:210px;" onenter="onKeyEnter"/>
		          	<input class="nui-hidden" name="criteria._expr[0]._property" value="noticetitle" />
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
		        </td>
		        <td align="center" width="30%"><span>发布部门：</span>
		          	<input name="criteria._expr[1]._value" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField = "orgs"
						    allowInput="true" style="width:160px;" />
					<input class="nui-hidden" name="criteria._expr[1]._property" value="noticedept"/>
				    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
				</td>
				<td align="right" width="30%"><span>发布日期：</span>
			      	<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-
		    		<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px" id="maxdatepicker"/>
			        <input class="nui-hidden" name="criteria._expr[3]._property" value="noticedate"/>
				    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
			        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
		        </td>
	        </tr>
	       <tr>
	       	  <td align="center" colspan="15">
		          <a class="nui-button" iconCls="icon-search" style="width:60px;" onclick="search()">查询</a>
		          <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
	          </td>
          </tr>
         </table>
    </div>
    <div id="datagrid1" class="nui-datagrid"  style="width:100%;height:400px;" allowResize="true" dataField="ameNotice" url="com.primeton.eos.ame_common.ameNotice.noticeList.biz.ext" sizeList="[10,20,50,100]" pageSize="20" idField="appid" multiSelect="true" onselectionchanged="selectionChanged">
		<div property="columns">
				<div field="noticeid" width="0" align="center" headerAlign="center" allowSort="true" allowSort="true"></div>		
				<div field="noticetitle" width="130" align="left" headerAlign="center" allowSort="true" renderer="getDetail">标题</div>
				<div field="noticedate" width="20" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">发布日期</div>	
				<div field="orgname" width="50" align="center" headerAlign="center" allowSort="false">发布部门</div>		
				<div field="noticestate" width="15" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">发布状态</div>	
		</div>
	</div>
</div>
<script type="text/javascript">
	nui.parse();
	var grid = new nui.get("datagrid1");
	function init(){
		nui.get("noticestate").setValue(1);
		nui.get("noticedate").setValue(new Date());
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
		grid.sortBy("noticedate","desc")
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
	function edit(){
		var row = grid.getSelected();
    		if (row) {
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_common/notice/updateNotice.jsp",
		            title: "修改公告信息",
		            width: 1125,
		            height: 515,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit", noticeid: row.noticeid };
						iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
						if(action=="saveSuccess"){
		                	nui.alert("保存成功");
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
        var noticeid = row.noticeid
        if (noticeid > 0) {
            var data = {ameNotice:{noticeid:noticeid}};
            var json = nui.encode(data);
            nui.ajax({
                url: "com.primeton.eos.ame_common.ameNotice.deleteNotice.biz.ext",
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
		            url: "<%=request.getContextPath() %>/ame_common/notice/addNotice.jsp",
		            title: "新增公告",
		            width: 1125,
		            height: 515,
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
     //点击姓名查看详情
    function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath()%>/ame_common/notice/noticeShow.jsp?id=" + selectRow.noticeid;
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
    }
	 //设置业务字典值-反馈类型
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