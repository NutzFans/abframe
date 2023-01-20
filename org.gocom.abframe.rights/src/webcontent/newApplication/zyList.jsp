<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:40:07
  - Description:
-->
<head>
<title>资源列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	资源列表
                    </td>
                </tr>
             </table>           
        </div>
    </div>
</div>
<div style="width:100%;">
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:10%;">
                    <a class="nui-button" iconCls="icon-add" onclick="insert()">新增</a>
                    <a class="nui-button" iconCls="icon-edit" onclick="edit()">修改</a>
                    <a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
            </tr>
        </table>           
    </div>
</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;"
    dataField="funcResourceList" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.rights.application.ResourceManager.queryResourceByFunction.biz.ext',>
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="restype" width="130" headerAlign="center" allowSort="true" align="center" renderer="restype">资源类型</div>
    	<div field="respath" width="75" headerAlign="center" align="center" allowSort="true">资源路径</div>     
        <div field="compackname" width="100" headerAlign="center" align="center">所属构建包</div>
        <div field="resname" width="50" headerAlign="center" allowSort="true" align="center" >显示名称</div> 
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	var appid = '<%=request.getParameter("appid") %>';
	search();
	//查询功能列表
	function search(){
		var json = {funccode:appid};
		grid.load(json);
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addZy.jsp?appid="+appid+"&status=0";
        nui.open({
            url: addUrl,
            title: "新增资源", 
            width:600,
            height:300,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	function edit(){
		var data = grid.getSelecteds();
		if(data.length<1){
			nui.alert("请选中所要编辑的资源。");
			return;
		}
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addZy.jsp?appid="+appid+"&status=1";
        nui.open({
            url: addUrl,
            title: "修改资源", 
            width:600,
            height:300,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(data);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	function remove(){
		var funcResourceDel = grid.getSelecteds();
		if(funcResourceDel.length<1){
			nui.alert("请选中所要删除的资源。");
			return;
		}
		nui.confirm("确定删除该资源么？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = {funcResourceDel:funcResourceDel};
					nui.ajax({
						url:'org.gocom.abframe.rights.application.ResourceManager.deleteFuncResource.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.funcResourceDel_result){
								nui.alert("删除成功。")
								search();
							}else{
								nui.alert("删除失败。")
								search();
							}
						}
					})
                } else {
                    return;
                }
            }
        );
	}
	
	//资源类型
	function appType(e){
		return nui.getDictText('ABF_RESOURCETYPE',e.value);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</html>