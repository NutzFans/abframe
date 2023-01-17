<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-27 11:33:59
  - Description:
-->
<head>
<title>业务字典</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit">
	    <div class="nui-splitter" style="width:100%;height: 100%;">
	        <div size="90" showCollapseButton="true">
	            <div style="width:100%;">
	                <div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
	                    <table style="width:100%;">
	                        <tr>
	                            <td style="width:20%;">
	                                业务字典类型
	                            </td>
	                        </tr>
	                     </table>           
	                </div>
	            </div> 
	            <div id="form1" style="margin: 15px 0;">
	                <input class="nui-hidden" name="criteria._entity" value="org.gocom.abframe.dataset.tools.EosDictType"/>
	                <table style="width:100%;" class="table">
	                    <tr>
	                        <td style="width:17%;"align="right">类型代码：</td>
	                        <td style="width:20%;" align="left">
	                            <input class="nui-textbox" name="dictType._expr[0]._value" id="dicttypeid" style="width: 120px;" onenter="onKeyEnter"/>
	                            <input class="nui-hidden" name="dictType._expr[0]._property" value="dicttypeid"/>
	                            <input class="nui-hidden" name="dictType._expr[0]._op" value="like"/>
	                        </td>
	                        
	                        <td style="width:17%;" align="right">类型名称：</td>
	                        <td style="width:20%;" align="left">
	                            <input class="nui-textbox" name="dictType._expr[1]._value" style="width: 120px;" onenter="onKeyEnter"/>
	                            <input class="nui-hidden" name="dictType._expr[1]._property" value="dicttypename"/>
	                            <input class="nui-hidden" name="dictType._expr[1]._op" value="like"/>
	                        </td>
	                    </tr>

	                    <tr>
	                        <td style="width:17%;" align="right">业务字典类型：</td>
	                        <td style="width:20%;" align="left">
	                            <input class="nui-dictcombobox" dicttypeid="AME_DICTTYPE" name="dictType._expr[2]._value" multiSelect="true" showNullItem="true" style="width: 120px;" onenter="onKeyEnter"/>
	                            <input class="nui-hidden" name="dictType._expr[2]._property" value="dicttype"/>
	                            <input class="nui-hidden" name="dictType._expr[2]._op" value="in"/>
	                        </td>
	                    </tr>
	                </table>
	                <table style="width:100%;margin-top: 10px;">
	                    <tr>
	                        <td style="width:20%;" align="center">
	                            <a class="nui-button" iconCls="icon-search" onclick="query()"> 查询</a>
	                            <a class="nui-button" iconCls="icon-reload" style="margin:0 20px;" onclick="reset()">重置</a>
	                            <a class="nui-button" iconCls="icon-folder" style="margin-right: 5px;" onclick="refreshOK">刷新缓存</a>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	            <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	                <table>
	                    <tr>
	                        <td>
	                            <a class="nui-button" iconCls="icon-add" onclick="add()">新增</a>
	                            <a class="nui-button" iconCls="icon-edit" onclick="edit()">修改</a>
	                            <a class="nui-button" iconCls="icon-remove" onclick="del()">删除</a>
	                            
	                        </td>
	                    </tr>
	                </table>
	            </div> 
	            <div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;"  allowResize="true"
	                url="org.gocom.abframe.tools.newDict.newQueryDict.biz.ext" dataField="dictTypeLists" oncellclick="view"
	                multiSelect="false" pageSize="10" sizeList="[10,20,30,50]" allowAlternating="true" multiSelect="true">
	                <div property="columns" >
	                	<div type="checkcolumn"></div>
	                    <div field="dicttypeid" width='100' allowSort="true" headerAlign="center" >类型代码</div>
	                    <div field="dicttypename" width='100' allowSort="true" headerAlign="center" align='left'>类型名称</div>
	                    <div field="parentid" width='60' allowSort="true" headerAlign="center" align='left'>父字典ID</div>
	                    <div field="dicttype" width='80' allowSort="true" headerAlign="center" align='left' renderer="dicttype">业务字典类型</div>
	                    <div field="rank" width='40' allowSort="true" headerAlign="center" align='center'>层级</div>
	                    
	                    <%--<div field="operate" width='50' allowSort="true" headerAlign="center" align='center' renderer="edittt">操作</div>--%>
	                </div>
	            </div>
	            <!-- 左边 -->
	        </div>
	        <!-- 右边-->
	        <div size="100"  showCollapseButton="true" > 
	            <div style="width:100%;">
	                <div class="nui-toolbar" style="borborder-bottom:0;padding:0px;">
	                    <table style="width:100%;">
	                        <tr>
	                            <td style="width:20%;">
	                            	数据字典树
	                            </td>
	                        </tr>
	                     </table>           
	                </div>
	            </div> 
	            <!-- 机构树展现  start-->
	            <ul id="tree1" class="nui-tree" style="width:100%;height: 30%;padding:5px;" resultAsTree ="false" ondrawnode="setIcon"
	                showTreeIcon="true" textField="dicttypename" dataField="eosEntrys"  onnodeclick="click" idField="treeid" 
	                parentField="treeparentid" contextMenu="#treeMenu" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
	                expandOnLoad="0">      
	            </ul>
	            
	            <!-- 机构树操作  start-->
	            <ul id="treeMenu" class="nui-contextmenu"  onbeforeopen="onBeforeOpen">
	                <li name="add" iconCls="icon-add" id="onAddTopOrg"  onclick="onAddTopOrg">新增字典类型项</li>
	                <li name="edit" iconCls="icon-edit" id="onEditNode"  onclick="onEditNode">修改字典类型项</li>
	                <li name="remove" iconCls="icon-remove" id="onRemoveNode" onclick="onRemoveNode">删除字典类型项</li>
	                <li name="reload" iconCls="icon-reload" id="refresh"  onclick="refresh">刷新</li>
	            </ul>
	            <div style="width:100%;">
	                <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	                    <table style="width:100%;">
	                        <tr>
	                            <td align="left">
                            		数据字典项详细
	                            </td>
	                        </tr>
	                     </table> 
	                </div>
	                <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	                    <table style="width:100%;">
	                        <tr>
	                            <td align="left">
					                <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
				                </td>
	                        </tr>
	                     </table> 
	                </div>
	            </div>
	            <div id="datagrid2" class="nui-datagrid" style="width:100%;height:280px;" url="org.gocom.abframe.tools.DictManager.queryNewDictType.biz.ext" dataField="dictTypeList"
                   sortMode="client" showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" >
                    <div property="columns">
                    	<div field="parentid" width='50px' allowSort="true" align='left' headerAlign="center" >父类型项代码</div>
                        <div field="dictid" width='40px' allowSort="true" align='left' headerAlign="center" >类型项代码</div>
                        <%--<div field="dictname" width='150px' allowSort="true" align='left' headerAlign="center" align='center'></div>--%>
                        <div field="dictname" width="50px" align="center"  headerAlign="center">类型名称
							<input property="editor" class="nui-textbox" width="100%"/>
						</div>
						<div field="filter1" width="50px" align="center"  headerAlign="center">业务参数1
							<input property="editor" class="nui-textbox" width="100%"/>
						</div>
						<div field="filter2" width="50px" align="center"  headerAlign="center">业务参数2
							<input property="editor" class="nui-textbox" width="100%"/>
						</div>
						<div field="note" width="50px" align="left"  headerAlign="center">备注说明
							<input property="editor" class="nui-textbox" width="100%"/>
						</div>
						<div field="sortno" width="20px" align="center" allowSort="true"  headerAlign="center">排序
							<input property="editor" class="nui-textbox" width="100%"/>
						</div>
                        <%--<div field="sortno" width='50px' allowSort="true" headerAlign="center" align='center'>排序</div>--%>
                    </div>
                 </div>
	        </div>
	    </div>
	</div>
<script type="text/javascript">
	nui.parse();
    //获取树节点
    var tree = nui.get("tree1");
    var freshNode = null;
    var addNode = null;
    var rootNode = tree.getRootNode();
    var grid = nui.get("datagrid1");
    var grid2 = nui.get("datagrid2");
    init();
    function init(){
        grid.load();
    }
    //查询业务字典
    function query() {
        var form = new nui.Form("#form1");
        var data = form.getData(); //获取表单JS对象数据
        grid.load(data); //datagrid加载数据
    }
    <%--//操作
    function edittt(e){
        return '<a href="javascript:void(0)" onclick="view()" class="nui-button" iconCls="icon-edit">查看</a>'
    }--%>
    //增加业务字典(type)
    function add(){
        var addUrl = "<%=request.getContextPath() %>/abframe/tools/newDict/newDictModal.jsp";
        nui.open({
            url: addUrl,
            title: "新增业务字典", 
            width: 400, 
            height: 250,
            onload: function () {
                
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	query();
                	 tree.loadList("","treeid","treeparentid");
	            }
            }
        });
    }
    //修改业务字典(type)
    function edit(){
        var selectRow = grid.getSelected();
        if(!selectRow){
            nui.alert('请选择要修改的的业务字典类型！');
            return;
        }else{
            var editUrl = "<%=request.getContextPath() %>/abframe/tools/newDict/newDictModal.jsp?dicttypeid="+selectRow.dicttypeid+"&dicttypename="+selectRow.dicttypename+"&dicttype="+selectRow.dicttype;
            nui.open({
                url: editUrl,
                title: "修改业务字典", 
                width: 500, 
                height: 300,
                onload: function () {
                    <%--var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);--%>
                },
                ondestroy: function (action) {
                	if(action == "save"){
                		//nui.get("dicttypeid").setValue(selectRow.dicttypeid);
                		tree.loadList("","treeid","treeparentid");
                		query();
                	}
                    
                }
            });
        }
    }
    //删除业务字典(type)
    function del(){
        var selectRow = grid.getSelected();
        if(!selectRow){
            nui.alert('请选择要删除的业务字典项！');
            return;
        }else{
            //确认是否删除
            var c=confirm("您确认删除该业务字典项吗？");
            if(c!=true){
                return;
            }
            var json ={dicttypeid:selectRow.dicttypeid};
            nui.ajax({
                url: "org.gocom.abframe.tools.newDict.newDelDicType.biz.ext",
                type: 'POST',
                data:json,  
                contentType: 'text/json',
                success: function (data) {
                    if(data.reCode==1){
                        nui.alert('删除成功！');
                        query();
                         tree.loadList("","treeid","treeparentid");
                    }else{
                        nui.alert('删除失败！请联系信息技术部。');
                    }
                }
            });
        }
    }
    //查看业务字典
    //定义传参变量
    var parentids='';
    function view(){
    	//保证变量没有被污染
        parentids='';
        var selectRow = grid.getSelected();
        var json = {dicttypeid:selectRow.dicttypeid};
        parentids = selectRow.parentid;
        nui.ajax({
            url: "org.gocom.abframe.tools.newDict.queryEosEntry.biz.ext",
            type: 'POST',
            data:json,
            contentType: 'text/json',
            success: function (data) {
                var data = data.eosEntrys;
                tree.loadList(data,"treeid","treeparentid");
            }
        })
        var json1 = {dicttypeid:selectRow.dicttypeid,dictid:null,isParent:1};
        if(parentids == null || parentids == "" || parentids == "null"){
        	viewTypeInfo(json1,1);
        }else{
        	viewTypeInfo(json1,2);
        }
    }
    
    //保存业务字典项
    function onOk(){
    	var selectRow = grid2.getChanges("modified");
    	if(selectRow.length == 0){
    		return false;
    	}
     	var data = {update:selectRow};
    	nui.ajax({
            url: "org.gocom.abframe.tools.newDict.newSaveDict.biz.ext",
            type: 'POST',
            data:data,
            contentType: 'text/json',
            success: function (text) {
               if(text.reCode == '1'){
               		nui.alert("保存成功！","提示",function(e){
               			view();
               		});
               }else{
               		nui.alert("保存失败！");
               }
            }
        });
    }
    //重置
    function reset(){
        var form = new nui.Form("#form1");
        form.reset();
        grid.load();
    }
    //是否刷新缓存
    function refreshOK(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否刷新缓存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow){
            return window.CloseOwnerWindow(action);
        } else {
            window.close(); 
            refreshCache();      
        }
    }
    //刷新缓存
    function refreshCache(){
    	var a = nui.getDictText('AME_SYSCONF','AME1Domain');
    	var b = nui.getDictText('AME_SYSCONF','AME1PORT');
    	var json = {Ip:a,port:b};
        nui.ajax({
            url: "org.gocom.abframe.tools.DictManager.reloadDictType.biz.ext",
            type: 'POST',
            data:json,
            contentType: 'text/json',
            success: function (data) {
                if(data.reCode==1){
                	 nui.alert("刷新业务字典成功！");
                }else{
                    nui.alert("刷新业务字典失败！");
                }
            }
        });
    }
    //点击字典项展示详情页面
    function click(e){
        var isLeaf = e.isLeaf;
        var grid2 = nui.get("datagrid2");
        if(e.node.dicttypename == "业务字典类型项"){
    		var json = {dicttypeid:e.node.dicttypeid,dictid:"",isParent:1};
    		viewTypeInfo(json,1);
        }else{
        	if(isLeaf){
	        	var json = {dicttypeid:e.node.dicttypeid,dictid:e.node.dictid,isParent:1};
        		viewTypeInfo(json,1);
	        }else{
	        	var json = {dicttypeid:e.node.dicttypeid,dictid:e.node.dictid,isParent:2};
        		viewTypeInfo(json,2);
	        }
        }
        <%--if(!isLeaf||parentId==null){
            //是父亲节点 加载该节点下的所有孩子
            var data = e.node.children;
            var parid = e.node.dictid;
            if(parid=='dictid'){
            	viewTypeInfo(,1);
            }else{
            	viewTypeInfo(,2);
            }
        }else{
        	var parid = e.node.parentid;
	 		if(parid=='dictid'){
            	viewTypeInfo(,1);
            }else{
            	viewTypeInfo(,2);
            }
        }--%>
    }
    
    function viewTypeInfo(data,type){
	 	var grid2 = nui.get("datagrid2");
        var json = data;
        if(type == 1){
        	grid2.hideColumn(0);
        }else if(type == 2){
        	grid2.showColumn(0);
        }
        grid2.load(json);
    }
    
    //设置图片
    function setIcon(e){
    	var isLeaf= e.isLeaf;
    	var nodeName = e.node.dicttypename;
    	if(nodeName=='业务字典类型项'){
    		e.iconCls = "icon-expand";
    	}else if(!isLeaf){
            e.iconCls = "icon-organization";
        }else{
            e.iconCls = "icon-collapse";
        }
    }
    //右键菜单
    function onBeforeOpen(e) {
        var menu = e.sender;
        var node = tree.getSelectedNode();
        tree.selectNode(node);
        if (!node) {
	        e.cancel = true;
	        return;
	    }
        if(node.parentid==null){
            nui.get("onAddTopOrg").show();
            nui.get("onEditNode").hide();
            nui.get("refresh").show();
            nui.get("onRemoveNode").hide();
        }else{
            nui.get("onAddTopOrg").show();
            nui.get("onEditNode").show();
            nui.get("refresh").show();
            nui.get("onRemoveNode").show();
        }
        e.htmlEvent.preventDefault();
    }
    /**
    *新增业务字典类型项
    */
    function onAddTopOrg(e){
        var node = tree.getSelectedNode();
        if(!node){
    		nui.alert("请选中所要新增的父业务字典项。");
    		return;
    	}
        nui.open({
            url: "<%=request.getContextPath() %>/abframe/tools/newDict/addDictHighest.jsp",
            title: "新增业务字典", 
            width: 400,
            height: 350,
            allowResize:false,
            onload: function () {
                 var iframe = this.getIFrameEl();
                 var data = {dictid:node.dictid,parentid:node.parentid,parentids:parentids,dicttypeid:node.dicttypeid};
                 iframe.contentWindow.setData(data,0);
            },
            ondestroy: function (action) {
                view();
            }
        });
    }
    /**
    *删除业务字典类型项
    */
    function onRemoveNode(e){
        var node = tree.getSelectedNode();
        if(!node){
    		nui.alert("请选中所要删除的业务字典项。");
    		return;
    	}
        //确认是否删除
        var c=confirm("您确认删除该业务字典项吗？");
        if(c!=true){
            return;
        }
        var json = {dictid:node.dictid,dicttypeid:node.dicttypeid};
        nui.ajax({
            url: "org.gocom.abframe.tools.newDict.newDelDicEntry.biz.ext",
            type: 'POST',
            data:json,
            contentType: 'text/json',
            success: function (data) {
                if(data.reCode==1){
                    nui.alert("删除业务字典项成功！");
                    view();
                }else{
                    nui.alert("删除业务字典项失败！");  
                }
            }
        });
    }
    //修改业务字典
    function onEditNode(){
    	var node = tree.getSelectedNode();
    	if(!node){
    		nui.alert("请选中所要修改的业务字典项。");
    		return;
    	}
        nui.open({
            url: "<%=request.getContextPath() %>/abframe/tools/newDict/addDictHighest.jsp",
            title: "修改业务字典", 
            width: 400,
            height: 350,
            allowResize:false,
            onload: function () {
                 var iframe = this.getIFrameEl();
                 var data = {dictid:node.dictid,sortno:node.sortno,dicttypename:node.dicttypename,parentid:node.parentid,
                 dicttypeid:node.dicttypeid,filter1:node.filter1,filter2:node.filter2,note:node.note};
                 iframe.contentWindow.setData(data,1);
            },
            ondestroy: function (action) {
                view();
                if (action == "save") {
                	var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
	            }else{
	            	return;
	            }
	           	change(data);
            }
        });
    }
    
    //修改之后插值
    function change(data){
		//修改之后插值
        var grid2 = nui.get("datagrid2");
        var node1 = tree.getSelectedNode();
        node1.dicttypeid = data.dicttypeid;
        node1.dictid = data.eosDictEntry.dictid;
        node1.dicttypename = data.eosDictEntry.dictname;
        if(data.parentid==null){
        	node1.parentid = "dictid";
        }else{
        	node1.parentid = data.eosDictEntry.parentid;
        }
        node1.sortno = data.eosDictEntry.sortno;
        var arr= [];
    	arr.push(node1);
        grid2.setData(arr);
        if(node1.parentid=='dictid'){
        	grid2.hideColumn(0);
        }else{
        	grid2.showColumn(0);
        }
    }
    
    //刷新业务字典项
    function refresh(){
        view();
    }
    
    //回车触发事件
    function onKeyEnter(){
    	query();
    }
    
    //dicttype的引用业务字典显示
    function dicttype(e) {
    	return nui.getDictText("AME_DICTTYPE",e.value);
    }
</script>
</body>
</html>