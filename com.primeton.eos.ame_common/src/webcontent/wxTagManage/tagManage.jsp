<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-05-28 09:23:50
  - Description:
-->
<head>
	<title>企业微信标签管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		body{margin: 0;padding: 0;width: 100%;height: 100%;background: #f1f8ff;}
	</style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-splitter" style="width:100%;height:100%;">
			<div size="40" showCollapseButton="true" style="height: 100%;">
                <div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
                    <table style="width:100%;">
                        <tr>
                            <td style="width:20%;">
                               	 企业微信标签列表
                            </td>
                        </tr>
                     </table>           
                </div>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	                <table>
	                    <tr>
	                        <td>
	                            <a class="nui-button" iconCls="icon-add" onclick="addTag()">新增</a>
	                            <a class="nui-button" iconCls="icon-edit" onclick="editTag()">修改</a>
	                            <a class="nui-button" iconCls="icon-remove" onclick="delTag()">删除</a>
	                        </td>
	                    </tr>
	                </table>
	            </div> 
	            <div id="datagrid1" class="nui-datagrid" style="width:100%;height:85%;overflow-y: scroll;" 
	            	selectOnLoad="true" onselectionchanged="onSelectionChanged" showPager="false">
	                <div property="columns" >
	                	<!--<div type="checkcolumn"></div>-->
	                	<div field="tagid" width='30' headerAlign="center" align="center">标签id</div>
	                    <div field="tagname" width='100' headerAlign="center" align='left'>标签名称</div>
	                </div>
	            </div>
			</div>
			<div size="60" showCollapseButton="true" style="height: 100%;">
				<div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
                    <table style="width:100%;">
                        <tr>
                            <td style="width:20%;">
                               	标签人员列表
                            </td>
                        </tr>
                     </table>           
                </div>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	                <table>
	                    <tr>
	                        <td>
	                            <a class="nui-button" iconCls="icon-add" onclick="addUser()">新增人员</a>
	                            <a class="nui-button" iconCls="icon-addnew" onclick="addUsers()">新增角色人员</a>
	                            <a class="nui-button" iconCls="icon-addnew" onclick="addOrgUsers()">新增机构人员</a>
	                            <a class="nui-button" iconCls="icon-remove" onclick="delUser()">删除</a>
	                        </td>
	                    </tr>
	                </table>
	            </div> 
	            <div id="datagrid2" class="nui-datagrid" style="width:100%;height:85%;" 
	               showPager="true" pageSize="20" sizeList="[10,20,50,100]" multiSelect="true"  sortMode="client" allowResize="true">
	                <div property="columns">
	                	<div type="checkcolumn"></div>
	                	<div field="userid" width='100' allowSort="true" headerAlign="center" align="center">用户id</div>
	                    <div field="name" width='100' headerAlign="center" align='left'>用户姓名</div>
	                </div>
	            </div> 
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var grid = nui.get("datagrid1");
	var grid1 = nui.get("datagrid2");
	var tagid = null;//标签id
	
	search();
	//查询企业微信的列表
	function search(){
		grid.loading("数据加载中。。。");
		nui.ajax({
			url: "com.primeton.eos.ame_common.wxTagManage.queryTagList.biz.ext",
            type: "post",
            cache: false,
            contentType: 'text/json',
            success: function (o) {
            	grid.unmask();
            	var tagList = eval('(' + o.tagList + ')'); //将字符串转为json
            	grid.setData(tagList);
            }
		})
	}
	
	//查看该标签成员列表
	function onSelectionChanged(e) {
		var grid = e.sender;
        var record = grid.getSelected();
        if (record) {
        	grid1.loading("数据加载中。。。");
            tagid = record.tagid;
            tagname = record.tagname;
			var json = {tagid:record.tagid};
			nui.ajax({
				url: "com.primeton.eos.ame_common.wxTagManage.queryTagUsers.biz.ext",
	            type: "post",
	            cache: false,
	            data:json,
	            success: function (o) {
	            	grid1.unmask();
	            	tagList = eval('(' + o.userlist + ')'); //将字符串转为json
	            	//grid1.setData(tagList);
	            	// 第一次设置
	    			fillData(0, grid1.getPageSize(), tagList, grid1);
	    			applySort();
	            }
			})
        }
    }
	
	//新建一个标签
	function addTag(){
		nui.prompt("请输入要新增的标签名称：", "请输入",
            function (action, value) {
                if (action == "ok") {
                	var json = {tagname:value,type:"add"};
                    onOk(json);
                } else {
                    return;
                }

            }
        );
	}
	
	//修改一个标签
	function editTag(){
		var row = grid.getSelected();
		if(typeof(row) == "undefined"){
			nui.alert("请选择要修改的标签！");
			return;
		}
		var uid = nui.prompt("请输入要修改的标签名称：","请输入",
            function (action, value) {
                if (action == "ok") {
                	var json = {tagname:value,type:"edit",tagid:row.tagid}
                    onOk(json);
                } else {
                    return;
                }

            }
        );
        //根据uid给弹出框默认值
        var win = mini.getbyUID(uid);        
		$(win.el).find("textarea,input").val(row.tagname);
	}
	
	

	
	
	
	
	//删除一个标签
	function delTag(){
		var row = grid.getSelected();
		if(typeof(row) == "undefined"){
			nui.alert("请选择要删除的标签！");
			return;
		}
		if(confirm("是否确认删除当前标签？")){
        	var json = {type:"del",tagid:row.tagid};
            onOk(json);
		}else{
			return;
		}
	}
	
	//保存
	function onOk(data){
		var type = data.type;
		if(type == "add"){
			nui.ajax({
				url: "com.primeton.eos.ame_common.wxTagManage.addTag.biz.ext",
	            type: "post",
	            cache: false,
	            data:{tagname:data.tagname},
	            success: function (o) {
	            	if(o.retCode == "SUCC"){
	            		nui.alert("新增成功！","提示",function(e){
	            			search();
	            		})
	            	}else if(o.retCode == "40071"){
	            		nui.alert("该标签名称不合法，或者已经存在！");
	            	}
	            }
			})
		}else if(type == "edit"){
			nui.ajax({
				url: "com.primeton.eos.ame_common.wxTagManage.editTag.biz.ext",
	            type: "post",
	            cache: false,
	            data:{tagid:data.tagid,tagname:data.tagname},
	            success: function (o) {
	            	if(o.retCode == "SUCC"){
	            		nui.alert("修改成功！","提示",function(e){
	            			search();
	            		})
	            	}else{
	            		nui.alert("修改失败，请联系信息技术部！")
	            	}
	            }
			})
		}else if(type == "del"){
			nui.ajax({
				url: "com.primeton.eos.ame_common.wxTagManage.delTag.biz.ext",
	            type: "post",
	            cache: false,
	            data:{tagid:data.tagid},
	            success: function (o) {
	            	if(o.retCode == "SUCC"){
	            		nui.alert("删除成功！","提示",function(e){
	            			search();
	            		})
	            	}else{
	            		nui.alert("删除失败，请联系信息技术部！")
	            	}
	            }
			})
		}
		
	}
	
	
	function addUsers(){
		if(tagid == null){
			nui.alert("请确认增加哪个标签。")
			return;
		}
		nui.open({
            url: "<%=request.getContextPath() %>/ame_common/wxTagManage/addUsers.jsp",
            title: "新增角色",
            width: 800,
            height: 530,
            onload: function () {
				var iframe = this.getIFrameEl();
				var data = {tagid:tagid};
				iframe.contentWindow.SetData(data);
			},
			ondestroy: function (action) {
				var iframe = this.getIFrameEl();
				if(action=="ok"){
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);
					var json = {useridS:data,tagid:tagid};
					saveRoleUser(json);
                }
			}
		});
	}
	//新增机构人员
	function addOrgUsers(){
		if(tagid == null){
			nui.alert("请确认增加哪个标签。")
			return;
		}
		nui.open({
            url: "<%=request.getContextPath() %>/ame_common/wxTagManage/addOrgUsers.jsp",
            title: "新增机构人员",
            width: 800,
            height: 530,
            onload: function () {
				var iframe = this.getIFrameEl();
				var data = {tagid:tagid};
				iframe.contentWindow.SetData(data);
			},
			ondestroy: function (action) {
				var iframe = this.getIFrameEl();
				if(action=="ok"){
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);
					var json = {useridS:data,tagid:tagid};
					saveRoleUser(json);
                }
			}
		});
	}
	//新增
	function addUser(){
		if(tagid == null){
			nui.alert("请确认增加哪个标签。")
			return;
		}
		nui.open({
            url: "<%=request.getContextPath() %>/ame_common/fault/SelectEmployee.jsp",
            title: "新增人员",
            width: 800,
            height: 530,
            onload: function () {
				var iframe = this.getIFrameEl();
				var data = {multiSelect:true,isPage:false};
				iframe.contentWindow.SetData(data);
			},
			ondestroy: function (action) {
				var iframe = this.getIFrameEl();
				if(action=="ok"){
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);
					var json = {useridS:data,tagid:tagid};
					saveRoleUser(json);
                }
			}
		});
	}
	
	
	
	//保存角色人员到标签
	function saveRoleUser(data){
		grid1.loading("数据保存中。。。");
		nui.ajax({
			url: "com.primeton.eos.ame_common.wxTagManage.saveRoleUser.biz.ext",
            type: "post",
            cache: false,
            data:data,
            success: function (o) {
            	if(o.retCode == "SUCC"){
            		grid1.unmask();
            		nui.alert("新增成功！","提示",function (e){
            			//重新加载列表
	            		var json = {tagid:data.tagid};
	            		nui.ajax({
							url: "com.primeton.eos.ame_common.wxTagManage.queryTagUsers.biz.ext",
				            type: "post",
				            cache: false,
				            data:json,
				            success: function (o) {
				            	tagList = eval('(' + o.userlist + ')'); //将字符串转为json
				            	//grid1.setData(tagList);
				            	// 第一次设置
				    			fillData(0, grid1.getPageSize(), tagList, grid1);
				    			applySort();
				            }
						})
            		})
            	}else{
            		grid1.unmask();
            		nui.alert("新增失败，请联系信息技术部！")
            	}
            }
		})
	}
	
	//删除标签成员
	function delUser(){
		var userList = grid1.getSelecteds();
		if(userList.length<=0){
			nui.alert("请选择要删除标签中的人员吗？");
			return;
		}
		if(confirm("是否确认删除当前人员？")){
			grid1.loading("数据保存总。。。");
			nui.ajax({
				url: "com.primeton.eos.ame_common.wxTagManage.delTagUser.biz.ext",
	            type: "post",
	            cache: false,
	            data:{userList:userList,tagid:tagid},
	            success: function (o) {
	            	if(o.retCode == "SUCC"){
	            		grid1.unmask();
	            		nui.alert("删除成功！","提示",function(e){
	            			//重新加载列表
		            		var json = {tagid:tagid};
		            		nui.ajax({
								url: "com.primeton.eos.ame_common.wxTagManage.queryTagUsers.biz.ext",
					            type: "post",
					            cache: false,
					            data:json,
					            success: function (o) {
					            	tagList = eval('(' + o.userlist + ')'); //将字符串转为json
					            	//grid1.setData(tagList);
					            	// 第一次设置
					    			fillData(0, grid1.getPageSize(), tagList, grid1);
					    			applySort();
					            }
							})
	            		})
	            	}else{
	            		grid1.unmask();
	            		nui.alert("删除失败，请联系信息技术部！")
	            	}
	            }
			})
		}else{
			return;
		}
	}
	
	// 分页填充细节处理
    function fillData(pageIndex, pageSize, dataResult, gridd) {
        var data = dataResult, totalCount = dataResult.length;
        var arr = [];
        var start = pageIndex * pageSize, end = start + pageSize;
        for (var i = start, l = end; i < l; i++) {
            var record = data[i];
            if (!record) continue;
            arr.push(record);
        }
        
        gridd.setTotalCount(totalCount);
        gridd.setPageIndex(pageIndex);
        gridd.setPageSize(pageSize);
        gridd.setData(arr);
    }

    // 监听分页前事件，阻止后自行设置当前数据和分页信息
    grid1.on("beforeload", function (e) {
        e.cancel = true;
        var pageIndex = e.data.pageIndex, pageSize = e.data.pageSize;
        fillData(pageIndex, pageSize, tagList, grid1);
    });
	
	function applySort() {
        var sortField = "userid";
        var sortOrder = "asc";
        grid1.sortBy(sortField, sortOrder);
    }

</script>
</html>