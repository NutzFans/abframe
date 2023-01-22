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
<title>功能列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	功能列表
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
                    <a class="nui-button" iconCls="icon-add" onclick="addRow">新增</a>
              		<!-- <a class="nui-button" iconCls="icon-edit" onclick="edit()">修改</a> -->
                    <a class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>   
                    <a class="nui-button" iconCls="icon-save" onclick="onOk()">保存</a>    
                     
                </td>
            </tr>
        </table>           
    </div>
</div>
<!-- <div id="datagrid"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true"  frozenStartColumn="0" frozenEndColumn="4"
	showPager="false"   showSummaryRow="true" url="org.gocom.abframe.rights.application.FunctionManager.queryFunctionByFuncGroup.biz.ext"
    dataField="funcList" multiSelect="true"  allowAlternating="true" allowCellSelect="true" allowCellEdit="true" 
	allowCellWrap="true"> -->
	<div id="datagrid"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" pageSize="20"  showSummaryRow="true" 
    dataField="funcList" multiSelect="true" url="org.gocom.abframe.rights.application.FunctionManager.queryFunctionByFuncGroup.biz.ext"
	allowCellWrap="true" allowCellEdit="true"  allowAlternating="true" allowCellSelect="true" allowSortColumn="true">
    <div property="columns">
    	<div name="temp123" type="checkcolumn"></div>
        <div field="funcname" width="130" headerAlign="center" allowSort="true" align="center">
   			 <input property="editor" class="nui-textbox" inputStyle="text-align: right;" />
        	功能名称</div>
    	<div field="functype" width="75" headerAlign="center" align="center" allowSort="true" renderer="funType">
		 	<input property="editor" align="center" headerAlign="center" required="true"  class="nui-dictcombobox" dictTypeId="ABF_FUNCTYPE" />
    		功能类型</div>     
        <div field="ismenu" width="100" headerAlign="center" align="center" renderer="iscontrolconfig">
        	<input property="editor" align="center" headerAlign="center" required="true"  class="nui-dictcombobox" dictTypeId="ABF_YESORNO" />
                                 是否定义为菜单</div>
        <div field="funccode" width="75" headerAlign="center" align="center" allowSort="true" >
        	<input property="editor" class="nui-textbox" inputStyle="text-align: right;" />
        	功能代码</div>     
        <div field="funcaction" width="170" headerAlign="center" align="center" allowSort="true" >
        	 <input property="editor" class="nui-textbox" inputStyle="text-align: right;" />
        	功能入口</div>     
        <div field="iscontrolconfig" width="100" headerAlign="center" align="center" allowSort="true" renderer="iscontrolconfig">
        	<input property="editor" align="center" headerAlign="center" required="true"  class="nui-dictcombobox" dictTypeId="ABF_YESORNO" />
        	是否数据权限控制</div>     
        <div field="parainfo" width="75" headerAlign="center" align="center" allowSort="true" renderer="parainfo">
         	<input property="editor" class="nui-textbox" inputStyle="text-align: right;" />
        	输入参数</div> 
        <div field="funcdesc" width="75" headerAlign="center" align="center" allowSort="true" renderer="funcdesc">
        	 <input property="editor" class="nui-textbox" inputStyle="text-align: right;" />
        	功能描述</div>     
        <div field="acFuncgroup.funcgroupname" width="50" headerAlign="center" allowSort="true" align="center" >所属功能节点</div>
			        
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get('datagrid');
	var appid = '<%=request.getParameter("appid") %>';
	//初始化数据
	search();
	
	 
/* 	//查询功能列表
	function search(){
		var json = {funcGroupTemp:{funcgroupid:appid}};
		nui.ajax({
			url:"org.gocom.abframe.rights.application.FunctionManager.queryFunctionByFuncGroup.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
			   var text = nui.decode(text);
				grid.setData(text.funcList);
				
			}
			
		});
	}
	 */
	
	
	
	 function search(){
		var json = {funcGroupTemp:{funcgroupid:appid}};
		grid.load(json);
		
	}  
<%--	setData();
	function setData(){
		var json = {funcGroupTemp:{funcgroupid:appid}};
		nui.ajax({
			url: "org.gocom.abframe.rights.application.FunctionManager.queryFunctionByFuncGroup.biz.ext",
            type: "post",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	console.log(text);
            }
		})
	}--%>
	//新增
	function insert(){
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addAppsss.jsp?status=0&appid="+appid;
        nui.open({
            url: addUrl,
            title: "新增功能", 
            width:700,
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
	
	//修改
	function　edit(){
		var appinfo = grid.getSelecteds();
		if(appinfo.length!=1){
			nui.alert("请选中所要修改的功能。");
			return;
		}
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addAppsss.jsp?status=1";
        nui.open({
            url: addUrl,
            title: "修改功能", 
            width:700,
            height:300,
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
			nui.alert("请选中所要删除的功能。");
			return;
		}
		nui.confirm("确定删除该功能？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = {function:funcGroup};
					nui.ajax({
						url:'org.gocom.abframe.rights.application.FunctionManager.deleteFunction.biz.ext',
						data:json,
						type:'post',
						dataType:'json',
						success:function(res){
							if(res.funcDelResult){
								nui.alert("删除成功。")
								search();
							}else{
								nui.alert("删除失败。")
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
	
	function isMenu(e){
		
		if(e.value = 'y'){
			return "是"
		}else{
			return "否"
		}
	}

	//应用类型
	function funType(e){
		return nui.getDictText('ABF_FUNCTYPE',e.value);
	}
	
	//是否
	function iscontrolconfig(e){
		return nui.getDictText('ABF_YESORNO',e.value);
	}
	
	
	
	
	
	function addRow(){
		var newRow = {funcgroupid:appid};
		grid.addRow(newRow);
	}
	
	
		//确定保存或更新
	function onOk(){
	   saveData();
	}
	
	function saveData(){
		var acfunction = grid.getChanges();
		/* 
		var obj = {};
		//做效验。
		for(var i = 0 ; i < funcList.length ; i++){
			if(obj[funcList[i].orglevel]){
		   		nui.alert("层级不能相同。");
		   		nui.get("okbutton").enable(); 
		   		return;
		 	}else{
			   	obj[authList[i].orglevel]=authList[i].orglevel;
		 	}
		} */
		var json = {acfunction:acfunction,funcgroupid:appid};
	
		nui.ajax({
			url:"org.gocom.abframe.rights.application.FunctionManager.saveFunction.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.isSuccess==1){
					nui.alert("更新成功。");
					search();
				}else if(text.isSuccess==2) {
					nui.alert("新增成功。");
					search();
				}else if(text.isSuccess==-1) {
					nui.alert("更新失败！");
					search();
				}else if(text.isSuccess==-2) {
					nui.alert("新增失败！");
					search();
				}
			
			},
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		});
	}
	
	
	
	
	
	
	
	
	
	
	
</script>
</html>