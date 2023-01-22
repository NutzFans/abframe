<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-10-23 10:26:32
  - Description:
-->
<head>
<title>邮件模板管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js" type="text/javascript"></script>

</head>
<body>
<div class="nui-fix">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>邮件模板列表</legend>
		    <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
		    	<table style="width:100%;">
		    		<tr>
		    			<td align="right"><span>邮件模板名称：</span></td>
		    			<td align="left">
				           	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:170px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[0]._property" value="templatename" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				        </td>
				        <td align="right"><span>邮件主题：</span></td>
		    			<td align="left">
				           	<input name="criteria._expr[1]._value" class="nui-textbox"  style="width:170px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[1]._property" value="mailtitle" />
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
				        </td>
						<td align="right"><span>创建日期：</span></td>
						<td>
					      	<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>-
				    		<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px" id="maxdatepicker"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="createtime"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
				        </td>
			        </tr>
			        <tr>
			        	<td align="right"><span>邮件模板编号：</span></td>
		    			<td align="left">
				           	<input name="criteria._expr[3]._value" class="nui-textbox"  style="width:170px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[3]._property" value="templateid" />
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
				        </td>
			        	<td align="right"><span>邮件类型：</span></td>
		    			<td align="left">
				           	<input name="criteria._expr[4]._value" class="nui-dictcombobox" showNullItem="true" dictTypeId="MAIL_TYPE" style="width:170px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[4]._property" value="mailtype" />
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
				        </td>
				        <td align="right"><span>是否默认模板：</span></td>
						<td align="left" style="height: 35px;">
							<input name="criteria._expr[5]._value" class="nui-dictcombobox" showNullItem="true" dictTypeId="MIS_YN" style="width:170px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[5]._property" value="defaultflag" />
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
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
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:400px;" allowResize="true" dataField="mailTemplates" url="com.primeton.eos.ame_common.mailtemplate.mailtemplateList.biz.ext" sizeList="[10,20,50,100]" pageSize="20" idField="templateid" multiSelect="false" allowCellSelect="true" onselectionchanged="selectionChanged">
				<div property="columns">
					<div type="checkcolumn" width="10">&nbsp;</div>
					<div field="templateid" width="30" align="center" headerAlign="center" allowSort="true" allowSort="true">邮件模板编号</div>		
					<div field="templatename" width="100" align="left" headerAlign="center" allowSort="true" renderer="getDetail">邮件模板名称</div>
					<div field="mailtitle" width="100" align="left"  headerAlign="center" allowSort="true">邮件主题</div>	
					<div field="mailtype" width="65" align="left"  headerAlign="center" allowSort="true" renderer="dictGetMailType" >邮件类型</div>
					<div field="defaultflag" width="30" align="center"  headerAlign="center" allowSort="true" renderer="dictGetType" >是否默认模板</div>
					<div field="createtime" width="50" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" allowSort="true">创建时间</div>		
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
		grid.sortBy("createtime","desc")
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
	            url: "<%=request.getContextPath() %>/ame_common/mailtemplate/updateMailTemplate.jsp",
	            title: "修改邮件模板",
	            width: 1200,
            	height: 620,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {templateid: row.templateid };
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					if(action=="saveSuccess"){
	                	nui.alert("邮件模板修改成功！");
						grid.reload();
	                }
				}
			});
		} else {
			nui.alert("请选中一条您要编辑的邮件模板！","编辑提示");
		}
	}
	
	function remove(){
        var row = grid.getSelected();
        if (row){
        	nui.confirm("是否删除您选择的邮件模板？","删除提示",function(action){
				if(action == "ok"){
					var templateid = row.templateid;
		            var data = {mailTemplate:{templateid:templateid,templatename:row.templatename}};
		            var json = nui.encode(data);
		            nui.ajax({
		                url: "com.primeton.eos.ame_common.mailtemplate.deleteMailTemplate.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
		                success: function (o) {
		                	var reValue  = o.retValue;
		                	if(reValue == 'sucess'){
		                		nui.alert("邮件模板删除成功！","删除提示");
		                		grid.reload();
		                		return true;
		                	}else{
		                		nui.alert("邮件模板删除失败！","删除提示");
		                	}
		                }
			        });
				}
			});
        }else{
        	nui.alert("请选中一条您要删除邮件模板！","删除提示");	
        }
    }
    
    function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	
	//回车触发
	function onKeyEnter(){
		search();
	}
	
    function add(){
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_common/mailtemplate/addMailtemplate.jsp",
            title: "新增邮件模板",
            width: 1200,
            height: 620,
			ondestroy: function (action) {
				if(action=="saveSuccess"){
                	nui.alert("邮件模板新增成功！");
					grid.reload();
                }
			}
		});
    }
    
    //点击姓名查看详情
    function getDetail(e){
        return "<a href='javascript:void(0)' onclick='previewDetail();' title='点击查看'>" + e.value + "</a>";
    }
    
    function previewDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath()%>/ame_common/mailtemplate/mialtemplatePreview.jsp?id="+ selectRow.templateid;
		var iWidth=1200; //弹出窗口的宽度;
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    }
	 //设置业务字典值-邮件是否默认
	function dictGetType(e) {
		return nui.getDictText('MIS_YN',e.value);
	}
	 //设置业务字典值-邮件模板类型
	function dictGetMailType(e) {
		return nui.getDictText('MAIL_TYPE',e.value);
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