<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2019-12-18 14:07:03
  - Description:
-->
<head>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<title>面试评价设置</title>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit" >
	<!-- <fieldset id="field1" style="border: none;margin-top: 30px">
		<div>
			<div id='form1'>
				<table style="table-layout:fixed;">
					<tr>
						<td style="width:20%;" align="right">模板名称：</td>
		            	<td style="width:20%;" align="left">
							<input class="nui-textbox" name="mouldname" id="mouldname" style="width: 150px;"/>
						</td>
					</tr>
					<tr style="margin-top: 20px">
						<td style="width:20%;" align="right">职位分类：</td>
		            	<td style="width:20%;" align="left">
							<input class="nui-dictcombobox" name="position" id="position" showNullItem="true"  
							url="com.primeton.eos.ame_permanage.ame_interview.QueryMouldPositons.biz.ext"  multiSelect="true"  textField="dictname"
							 valueField="dict" dataField="mouldPositons" valueFromSelect="true" allowInput="true" style="width: 150px;"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset> -->
	<ul id="tree1" class="nui-tree" style="width:100%;height: 100%;padding:5px;" resultAsTree ="false" ondrawnode="setIcon"
	                showTreeIcon="true" textField="dicttypename" dataField="eosEntrys"  idField="treeid"  showCheckBox="true"
	                parentField="treeparentid"  allowDrop="true" allowLeafDropIn="true"
	                expandOnLoad="true">      
	</ul>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var tree = nui.get("tree1");
	var grid1_data;
	function init(data){
        var evaluations = data.evaluations;
        grid1_data = data.grid1_data;
        tree.loadList(evaluations,"treeid","treeparentid");
	}
	function setIcon(e){
    	var isLeaf= e.isLeaf;
    	var nodeName = e.node.dicttypename;
    	if(nodeName=='面试评价项'){
    		e.iconCls = "icon-expand";
    	}else if(!isLeaf){
            e.iconCls = "icon-organization";
        }else{
            e.iconCls = "icon-collapse";
        } 
        
    } 
    function onDrawNode(e) {
        var tree = e.sender;
        var node = e.node;
    }
    function GetData() {
		var value = tree.getValue(false);
        if(value==""||value==null){
    		var func =null;
        }else{
    		var func = tree.getCheckedNodes(false);
        }
		return func;
	}
    function onOk(){
        var data = GetData();
        var ch1 = nui.clone(data);
        if (ch1){
           var bolen = true;
           var messages = '';
           for(var i=0;i<ch1.length;i++){
                 if(ch1[i].dicttypeid == "AME_EVALUATION_SUB"){
                     var new_evaluationsubtype = ch1[i].dictid;
		             var new_evaluationsubtypename = ch1[i].dicttypename;
		             for(var j=0;j<grid1_data.length;j++){
                        var evaluationsubtype =  grid1_data[j].evaluationsubtype; 
                        if(new_evaluationsubtype == evaluationsubtype){
                          var bolen = false;
                          var messages = messages + '"'+ new_evaluationsubtypename + '"' + ',';
                        } 
                     }
                 }else{
                     CloseWindow("ok"); 
                 }
           }
           if(bolen == false){
                var messages = messages + "评价项小类重复，请重新选择";
                nui.alert(messages);
           }else{
                CloseWindow("ok");
           }
		}else{
		     CloseWindow("ok");
		} 
    }
    //关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    } 
	<%--var evaluationmouldid = '<%=request.getParameter("evaluationmouldid")%>';
	var mouldname = '<%=request.getParameter("mouldname")%>';
	var position = '<%=request.getParameter("position")%>';
	var positionname = nui.getDictText("AME_POSITION_MEMO",position);
	//判断是新增还是修改
	if(mouldname!='null'|| position!='null'){
		nui.get("mouldname").setValue(mouldname);
		nui.get("position").setValue(position);
		nui.get("position").setText(positionname);
		nui.get("position").setMultiSelect(false);
	}
	function onOk(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		if(data.mouldname==""){
			nui.alert('请输入模板名称！');
			return;
		}
		if(data.position==""){
			nui.alert('请输入职位分类！');
			return;
		}
		if(mouldname!='null'||position!='null'){
			add(data,1);
		}else{
			add(data,0);
		}
	}
	//增加面试评价模板
	function add(data,a){
		if(a==0){
			//新增
			var mouldname = data.mouldname;//模板名称
			var position = data.position;//职位分类
		    var json = {moulds:{mouldname:mouldname,position:position}};
			nui.ajax({
				url: "com.primeton.eos.ame_permanage.ame_interview.newInsertMould.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.reCode==1){
	            		nui.alert("新增成功！");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增失败！请联系信息技术部。");
	            	}
	            }
			})
		}else if(a==1){
			//修改
			var mouldname = data.mouldname;//模板名称
			var position = data.position;//职位分类
		    var json = {mould:{evaluationmouldid:evaluationmouldid,mouldname:mouldname,position:position}};
			nui.ajax({
				url: "com.primeton.eos.ame_permanage.ame_interview.editMould.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.reCode==1){
	            		nui.alert("修改成功！");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("修改失败！请联系信息技术部。");
	            	}
	            }
			})
		}
	}--%>
</script>
</html>