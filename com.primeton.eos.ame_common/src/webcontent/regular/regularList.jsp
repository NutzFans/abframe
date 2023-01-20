<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wqq
  - Date: 2016-08-08 11:03:50
  - Description:
-->
<head>
<title>规章制度管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>规章制度管理</legend>
		    <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
		    	<table style="width:100%;font-size:12px;">
		    		<tr>
		    			<td align="right"><span>规章制度名称：</span></td>
		    			<td align="left">
				           	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:170px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[0]._property" value="title" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				        </td>
				        <td align="right"><span>发布部门：</span></td>
				        <td>
				          	<input name="criteria._expr[1]._value" shownullItem="true" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField = "orgs"
								    allowInput="true" style="width:140px;" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="pubdept"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right"><span>发布日期：</span></td>
						<td>
					      	<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-
				    		<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px" id="maxdatepicker"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="pubdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
				        </td>
						<td align="right"><span>是否已发布：</span></td>
						<td>
					     	<input name="criteria._expr[2]._value" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:45px;"/>
							<input class="nui-hidden" name="criteria._expr[2]._property" value="pubstate"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
						</td>
			        </tr>
			       <tr>
			       	  <td align="center" colspan="15">
				          <a class="nui-button" style="width:60px;" iconCls="icon-search" onclick="search()">查询</a>
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
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:400px;"  allowResize="true" dataField="ameRegular" url="com.primeton.eos.ame_common.ameRegular.regularList.biz.ext" sizeList="[10,20,50,100]" pageSize="20" idField="appid" multiSelect="true" onselectionchanged="selectionChanged">
				<div property="columns">
						<div field="regularid" visible="false" align="center" headerAlign="center" allowSort="true" allowSort="true"></div>		
						<div field="title" width="130" align="left" headerAlign="center" allowSort="true" renderer="getDetail">制度名称</div>
						<div field="pubdate" width="20" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">发布日期</div>	
						<div field="orgname" width="50" align="center" headerAlign="center" allowSort="false">发布部门</div>		
						<div field="pubstate" width="15" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">发布状态</div>	
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
		grid.sortBy("pubdate","desc");
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
		            url: "<%=request.getContextPath() %>/ame_common/regular/updateRegular.jsp",
		            title: "修改规章制度",
		            width: 900,
		            height: 500,
		            onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit", regularid: row.regularid };
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
        var regularid = row.regularid;
        if (regularid > 0) {
            if (confirm("确定删除选中记录？")) {
		        grid.loading("操作中，请稍后......");
	            var data = {ameRegular:{regularid:regularid,title:row.title}};
	            var json = nui.encode(data);
	            nui.ajax({
	                url: "com.primeton.eos.ame_common.ameRegular.deleteRegular.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (o) {
	                		nui.alert("删除成功！");
	                		grid.reload();
		                	return;	
	                }
		         });
	       	}
        }
    }
    function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
    function add(){
    	nui.open({
		            url: "<%=request.getContextPath() %>/ame_common/regular/addRegular.jsp",
		            title: "新增规章制度",
		            width: 900,
		            height: 500,
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
    	<%-- window.location.href="<%=request.getContextPath() %>/ame_common/regular/addRegular.jsp"; --%>
    }
    //点击姓名查看详情
    function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath()%>/ame_common/regular/regularShow.jsp?id=" + selectRow.regularid;
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
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