<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-08-26 22:59:14
  - Description:
-->
<head>
	<title>腾讯企业邮件组维护</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		body{
			width:100%;
			height:100%;
			padding:0px;
			margin:0px;
			font-size:12px;
		}
	</style>
</head>
<body>
	 <div style="width:800px;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="nui-button" iconCls="icon-edit" onclick="edit()">编辑</a>
                        <a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>       
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="nui-textbox" emptyText="请输入邮件组账号" style="width:200px;" onenter="onKeyEnter"/>   
                        <a class="nui-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    <div id="datagrid1" class="nui-datagrid" style="width: 100%; height: 480px;" allowResize="true" pageSize="20" dataField="txEmailGrpInfo"
        url="org.gocom.abframe.org.eamilgrpmaintaine.emailgrpmaintaine.queryAllEmailGrpInfo.biz.ext" sizeList="[10,20,30,50,100]"  
        idField="emailGroupId" multiSelect="true" onheadercellclick="search">
        <div property="columns">
            <div type="checkcolumn" ></div>        
            <div field="emailGroupAcc" width="80" headerAlign="center" allowSort="true">邮件组账号</div>    
            <div field="emailGrouName" width="90" headerAlign="center" allowSort="true">邮件组名称</div> 
            <div field="emailGrouOrgnames" width="190" headerAlign="center">邮件组所属部门</div>       
        </div>
    </div>
    <script type="text/javascript">
        nui.parse();
        var grid = nui.get("datagrid1");
        grid.load();
        //grid.sortBy("createtime", "desc");
        function add() {
            nui.open({
                url: "<%=request.getContextPath() %>/abframe/org/txemailgroup/modifyEamilGroup.jsp",
                title: "新增邮件组", width: 800, height: 360,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "add"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    grid.reload();
                }
            });
        }
        
        function edit() {
	        var rows = grid.getSelecteds();
			if (rows.length > 1){
				nui.alert("只能选中一条记录进行编辑！");
				return;
			}
            var row = grid.getSelected();
            if (row) {
                nui.open({
                    url: "<%=request.getContextPath() %>/abframe/org/txemailgroup/modifyEamilGroup.jsp",
                    title: "编辑邮件组", width:800, height: 360,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", emailGroupId: row.emailGroupId };
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        grid.reload();
                    }
                });
                
            } else {
                nui.alert("请选中一条记录！");
            }
        }
        
        function remove() {
            var rows = grid.getSelecteds();
            var data = {emailGroupInfos:rows};
            var json = nui.encode(data);
            if (rows.length > 0) {
            	nui.confirm("确定删除选中记录？","温馨提示",function(action){
					if(action == "ok"){
						grid.loading("操作中，请稍后......");
		                nui.ajax({
	                        url: "org.gocom.abframe.org.eamilgrpmaintaine.emailgrpmaintaine.deleteEmailGroup.biz.ext",
	                        type: "post",
	                        data: json, 
	                        cache: false,
	                        contentType: 'text/json',
	                        success: function (text) {
	                            grid.reload();
	                        },
	                        error: function (jqXHR, textStatus, errorThrown) {
			                    nui.alert(jqXHR.responseText);
			                }
	                    });
					}
				});
            } else {
                 nui.alert("请至少选中一条记录！");
            }
        }
        
        function search() {
            var key = nui.get("key").getValue();
            if(!!key){
            	 nui.get("key").setValue(trim(key));
            	 grid.load( {"emailGrp":{"emailGroupAcc": trim(key)}});
            }else{
            	 grid.load( {"emailGrp":{"emailGroupAcc": trim(key)}});
            }
        }
        
        function onKeyEnter(e) {
            search();
        }
		
		function trim(str){
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
    </script>
</body>
</html>