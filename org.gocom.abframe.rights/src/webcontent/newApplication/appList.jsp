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
<title>功能组列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	功能组列表
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
    dataField="funcGroupList" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.rights.application.ApplicationManager.queryFuncGroupByAppWithPage.biz.ext',>
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="funcgroupname" width="130" headerAlign="center" allowSort="true" align="center">功能组名称</div>
    	<div field="grouplevel" width="75" headerAlign="center" align="center" allowSort="true">节点层次</div>     
        <div field="funcgroupseq" width="100" headerAlign="center" align="center">功能组序号</div>
        <div field="isleaf" width="50" headerAlign="center" allowSort="true" align="center" renderer="isLeaf">是否叶子节点</div> 
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
		var json = {appid:appid};
		grid.load(json);
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApps.jsp?status=0&appid="+appid;
        nui.open({
            url: addUrl,
            title: "新增功能组", 
            width:400,
            height:200,
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
	
	//修改
	function　edit(){
		var appinfo = grid.getSelecteds();
		if(appinfo.length!=1){
			nui.alert("请选中所要修改的应用进行操作。");
			return;
		}
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApps.jsp?status=1";
        nui.open({
            url: addUrl,
            title: "修改应用功能", 
            width:400,
            height:200,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(appinfo);
            },
            ondestroy: function (action) {
            	if (action == "edit") {
                	search();
	            }
            }
        });
	}
	
	//删除
	function remove(){
		var funcGroup = grid.getSelecteds();
		if(funcGroup.length<1){
			nui.alert("请选中所要删除的功能组。");
			return;
		}
		nui.confirm("确定删除该功能组？", "确定？",
            function (action) {
                if (action == "ok") {
                
                    var json = {funcGroup:funcGroup};
					nui.ajax({
						url:'org.gocom.abframe.rights.application.FuncGroupManager.deleteFuncGroup.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.funcGroupDelResult){
								nui.alert("删除成功。")
								search();
							}
						},
					})
                } else {
                    return;
                }
            }
        );
	}
	//是否叶子节点
	function isLeaf(e){
		return nui.getDictText('ABF_YESORNO',e.value);
	}
	//应用类型
	function appType(e){
		return nui.getDictText('ABF_APPTYPE',e.value);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</html>