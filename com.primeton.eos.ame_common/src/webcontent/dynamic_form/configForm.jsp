<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2019-04-24 16:30:56
  - Description:
-->
<head>
	<title>配置动态表单</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    }
	    fieldset {
			border:solid 1px #aaa;padding:3px;
		} 
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset>
		<legend>业务信息</legend>
			<div id="dyform">
				<input class = "nui-hidden" name="bussform.bussformid" id="bussformid">
				<table>
					<tr>
						<td>业务代码：</td>
						<td style ="width: 100px">
							<input class = "nui-textbox" name="bussform.busform" id="busform" required="true" style ="width: 90%">
						</td>
						<td>业务描述：</td>
						<td style ="width: 200px">
							<input class = "nui-textbox" name="bussform.busformname" style ="width: 90%">
						</td>
						<td>业务类型代码：</td>
						<td style ="width: 100px">
							<input class = "nui-textbox" name="bussform.buscode" id="buscode" required="true" style ="width: 90%">
						</td>
						<td>业务类型名称：</td>
						<td style ="width: 150px">
							<input class = "nui-textbox" name="bussform.buscodename" id="buscodename" style ="width: 90%">
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset>
		<legend>配置动态表单</legend>
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="button_inorgid1">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="remove()">删除</a>
	                        <a class="nui-button" id="copybutton" iconCls="icon-addnew" onclick="copy()">复制选中记录</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="grid_conForm" class="nui-datagrid" style="width:100%;height:auto;" allowCellSelect="true" 
	        	 showPager="false"  allowCellEdit="true" allowSortColumn="true" multiSelect="true">
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	                <div field="fiedisplayname" width="80" align="left" headerAlign="center">单元显示名称
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="fieldname" width="80" align="left" headerAlign="center">字段属性
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="fieldtype" width="60" align="center" headerAlign="center" renderer="getDict1">单元类型
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_CELLTYPE"/>
	                </div>
	                <div field="isrequired" width="50" align="center" renderer="getDict" headerAlign="center">是否必填
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" "/>
	                </div>
	                <div field="defaultvalue" width="50" align="left" headerAlign="center">默认值
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="fwidth" width="65" align="center" headerAlign="center">单元宽度(px)
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="frow" width="40" align="center" headerAlign="center">所在行
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="sortno" width="50" align="center" headerAlign="center">显示顺序
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="allowinput" width="50" align="center" renderer="getDict" headerAlign="center">是否允许输入
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" "/>
	                </div>
	                <div field="isreadonly" width="50" align="center" renderer="getDict" headerAlign="center">是否只读
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN" "/>
	                </div>
	                <div field="valuechangefun" width="80" align="left" headerAlign="center">值改变时触发事件
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="explains" width="100" align="center" headerAlign="center">解释说明
	                	<input property="editor" class="nui-textarea"/>
	                </div>
	                <div field="maxlength" width="80" align="left" headerAlign="center">文本长度
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="dicttype" width="80" align="left" headerAlign="center">业务字典代码
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	                <div field="accuracy" width="50" align="center" headerAlign="center">数值精度
	                	<input property="editor" class="nui-textbox"/>
	                </div>
	            </div>
	        </div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" id="savebtn" onclick="onOk" style="width:60px;margin-right:20px;">保存</a>
		<a class="nui-button" id="viewbtn" onclick="preView" style="width:60px;margin-right:20px;">预览</a>
		<a class="nui-button"  id="closebtn" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("grid_conForm");
	var form1 = new nui.Form("#dyform");
	
	function setData(data){
		var data=nui.clone(data);
		if(data.action!="add"){
			var json = {bussformid:data.bussformid};
			nui.ajax({
	            url: "com.primeton.eos.ame_common.ameFormConfig.getDyForm.biz.ext",
	            type: "post",
	            data: json,
	            cache: false,
	            contentType: 'text/json',
	            success: function (o) {
	            	form1.setData(o);
	            	grid.setData(o.confform);
	            	if(data.action=="copy"){//如果是复制则清空id,业务类型，业务类型名称
	            		nui.get("bussformid").setValue("");
	            		nui.get("buscode").setValue("");
	            		nui.get("buscodename").setValue("");
	            	}
	            },
	            error: function () {
	            	alert("error");
	            }
	        });
		}
	}
	//新增一行
	function add(){
		var row = {name: "New Row"};
        grid.addRow(row);
	}
	
	//删除一行记录
	function remove() {
    	var rows = grid.getSelecteds();
        if (rows) {
        	for(var i=0; i<rows.length;i++){
                grid.removeRow(rows[i], true);
        	}
        }else{
        	nui.alert("请 至少选中一条记录！");
        }
    }
    
     //复制选中记录
    function copy(){
    	var rows = grid.getSelecteds();
    	for(var i = 0;i<rows.length;i++){
    		//必须要clone，否则修改的是内存地址，也就是rows数组的数据
    		var row = nui.clone(rows[i]);
    		row.formconfigid = null;
        	grid.addRow(row);
    	}
    }
    
    function getDict(e){
    	return nui.getDictText("MIS_YN",e.value);//业务字典
    }
    function getDict1(e){
    	return nui.getDictText("AME_CELLTYPE",e.value);//业务字典
    }
    
    //关闭
    function onCancel(e) {
        CloseWindow("cancel");
    }
	//标准方法接口定义
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    //保存
    function onOk(){
		if(!form1.validate()){
			nui.alert("表单信息填写不完整，请确认必输项是否填写！");
			return;
		}
		var rowData = grid.getData();
		if(rowData.length==0){
			nui.confirm("未配置表单信息，请确认是否保存？","提示",function(action){
				if(action=="cancel"){
					return;
				}else{
					saveData();
				}
			})
		}else{
			for(var i=0;i<rowData.length;i++){
				if(rowData[i].fiedisplayname==null){
					nui.alert("单元格显示名称不能为空，请检查并填写！");
					return;
				}
				if(rowData[i].fieldname==null){
					nui.alert("字段属性不能为空，请检查并填写！");
					return;
				}
				if(rowData[i].fieldtype==null){
					nui.alert("单元类型不能为空，请检查并填写！");
					return;
				}
				if(rowData[i].isrequired==null){
					nui.alert("是否必填不能为空，请检查并填写！");
					return;
				}
				if(rowData[i].fwidth==null){
					nui.alert("单元格宽度不能为空，请检查并填写！");
					return;
				}
				if(rowData[i].frow==null){
					nui.alert("所在行不能为空，请检查并填写！");
					return;
				}
				if(rowData[i].sortno==null){
					nui.alert("显示顺序不能为空，请检查并填写！");
					return;
				}
				
				if(rowData[i].fieldtype=="nui-dictcombobox" && (rowData[i].dicttype==null || rowData[i].dicttype=="")){
					nui.alert("类型为业务字典时，业务字典代码必填，请检查并填写！");
					return;
				}
				if(rowData[i].fieldtype=="nui-spinner" && (rowData[i].accuracy===null || rowData[i].accuracy==="")){
					nui.alert("类型为数值时，精度必填，请检查并填写！");
					return;
				}
			}
			saveData();
		} 		 
    }
    
    function saveData(){
    	var bussform = form1.getData();
		var confform = grid.getData();
		nui.get("savebtn").disable();//保存成功之前禁掉按钮
		var json={bussform:bussform.bussform,confform:confform};
		nui.ajax({
            url: "com.primeton.eos.ame_common.ameFormConfig.saveFormConfig.biz.ext",
            type: "post",
            data: json,
            cache: false,
            contentType: 'text/json',
            success: function (o) {
            	if(o.result=="1"){
            		nui.alert("保存成功","提示",function(){
	            		CloseWindow("ok");
            		});
            	}else{
            		nui.alert("保存失败，请联系信息技术部！");
            	}
            },
            error: function () {
            	alert("error");
            }
        });
    }
    
    //预览
    function preView(){
    	nui.open({
            url: "<%=request.getContextPath() %>/ame_common/dynamic_form/formPreview.jsp",
            title: "业务表单预览",
            width: 900,
            height: 450,
            onload: function () {
              var iframe = this.getIFrameEl();
              var formdata =grid.getData();
              formdata.sort(sortFrow);//先按行排序
              formdata.sort(sortNo);//再按sortno排序
              var data = {formdata:formdata  };
              iframe.contentWindow.setData(data);
            },
            ondestroy: function (action) {
            }
        });
    }
    
    function sortFrow(a,b){  
       return a.frow-b.frow  
    }
    
    function sortNo(a,b){  
       return a.sortno-b.sortno  
    }
</script>
</html>