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
<title>应用列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	应用查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="application._entity" value="org.gocom.abframe.dataset.privilege.AcApplication"/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" width="115px" nowrap="nowrap"><span>应用名称：</span></td>
			 	<td>
			 		<input class="nui-textbox" name="application._expr[0]._value" style="width: 150px;"/>
		 		 	<input class="nui-hidden" name="application._expr[0]._property" value="appname"/>
                    <input class="nui-hidden" name="application._expr[0]._op" value="like"/>
			    </td>
				<td align="right" width="95px"><span>应用类别：</span></td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="application._expr[1].value" dictTypeId="ABF_APPTYPE" style="width: 160px;" id="dyassetnum1"/>
		 		 	<input class="nui-hidden" name="application._expr[1]._property" value="apptype"/>
                    <input class="nui-hidden" name="application._expr[1]._op" value="like"/>
				</td>
    		</tr>
    		<tr>
    			<td align="center" colspan="6">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
    			</td>
    		</tr>
    	</table>
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
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" dataField="appList" 
    url="org.gocom.abframe.rights.application.ApplicationManager.queryApplication.biz.ext"
	 pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true" multiSelect="true">
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="appname" width="130" headerAlign="center" align="left" allowSort="true" >应用名称</div>
    	<div field="appcode" width="75" headerAlign="center" align="left" allowSort="true">应用代码</div> 
	  	<div field="apptype" width="50" headerAlign="center" align="center" renderer="appType">应用类型</div>
	  	<div field="isopen" width="50" headerAlign="center" align="center" renderer="isOpen">是否开通</div>
	  	<div field="opendate" width="90" headerAlign="center" align="center" allowSort="true">开通日期</div>   
	  	<div field="url" width="75" headerAlign="center" align="center" allowSort="true">应用上下文</div>
	  	<div field="ipaddr" width="75" headerAlign="center" align="center" allowSort="true">IP</div> 
	  	<div field="ipport" width="75" headerAlign="center" align="center" allowSort="true">端口</div> 
        <div field="appdesc" width="100" headerAlign="center" allowSort="true" align="center" >应用描述</div> 
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid1');
	search();
	//查询应用信息
	function search(){
		var form = new nui.Form("#form1");
        var data = form.getData();
		grid.load(data);
	}
	//重置
	function reset(){
		var form = new nui.Form("#form1");
        var data = form.getData();
        //console.log(data);
		grid.load(data);
	}
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApp.jsp?status=0";
        nui.open({
            url: addUrl,
            title: "新增应用", 
            width:600,
            height:300,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	console.log(action);
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//修改
	function　edit(){
		var appinfo = grid.getSelecteds();
		console.log(appinfo);
		if(appinfo.length!=1){
			nui.alert("请选中所要修改的应用进行操作。");
			return;
		}
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApp.jsp?status=1";
        nui.open({
            url: addUrl,
            title: "修改应用功能", 
            width:600,
            height:300,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(appinfo);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//删除
	function remove(){
		var form = new nui.Form("#form1");
        var data = form.getData();
		var application = grid.getSelecteds();
		if(application.length<1){
			nui.alert("请选中所要修改的应用进行操作。");
			return;
		}
		var json = {application:application};
		
		nui.ajax({
			url:'org.gocom.abframe.rights.application.ApplicationManager.deleteApplication.biz.ext',
			data:json,
			type:'post',
			dataType:'json',
			success:function(res){
				if(res.appDeleteResult == '-1'){
					nui.alert("删除失败，请联系信息技术部。")
				}else{
					nui.alert("删除成功。")
					search();
				}
				
			},
			error:function(res){
			
			}
		})
	}
	//是否开通
	function isOpen(e){
		return nui.getDictText('ABF_YESORNO',e.value);
	}
	//应用类型
	function appType(e){
		return nui.getDictText('ABF_APPTYPE',e.value);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</html>