<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张雅兰
  - Date: 2019-05-15 16:21:16
  - Description:
-->
<head>
<title>费用类型详情信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
 <style type="text/css">
    .asLabel .mini-textbox-border,
    .asLabel .mini-textbox-input,
    .asLabel .mini-buttonedit-border,
    .asLabel .mini-buttonedit-input,
    .asLabel .mini-textboxlist-border
    {
        border:0;background:none;cursor:default;
    }
    .asLabel .mini-buttonedit-button,
    .asLabel .mini-textboxlist-close
    {
        display:none;
    }
    .asLabel .mini-textboxlist-item
    {
        padding-right:8px;
    }   
    </style>
</head>
<body>
	<div id="feetypeform">
   		<input class="nui-hidden" name="feetypes.comexptypeid" id="comexptypeid"/>
   		<fieldset  style="border:solid 1px #aaa;padding:3px;">
   			<legend>基本信息</legend>
   			<div>
   				<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:70%;table-layout:fixed;">
		   			<tr>
		   				<td style="width:200px" align="right">公共费用类型编码:</td>
		   				<td style="width:200px" align="left">
		   					<input id="comexptypeid"  class="nui-textbox"  name="feetypes.comexptypeid" required="true" />
		   				</td>
		   				<td style="width:200px" align="right">状态:</td>
		   				<td style="width:200px" align="left">
		   					<input id="status" style="width:100%"  class="nui-dictcombobox" dictTypeId="MIS_YN" required="true" />
		   				</td>
		   			</tr>
		   			<tr>
		   				<td style="width:200px" align="right">上级部门费用类型:</td>
		   				<td style="width:200px" align="left">
		   					<input id="comgrouptypename"  class="nui-textbox"  name="feetypes.comgrouptypename" required="true" />
		   				</td>
		   				<td style="width:200px" align="right">公共费用类型名称:</td>
		   				<td style="width:200px" align="left">
		   					<input id="comexptypename" style="width:100%" class="nui-textbox"  name="feetypes.comexptypename" required="true" />
		   				</td>
		   			</tr>
		   			<tr class="count">
		   				<td style="width:200px" align="right">是否统计:</td>
		   				<td style="width:200px" align="left">
		   					<input id="iscount" style="width:100%" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" required="true" />
		   				</td>
		   			</tr>
   				</table>
   			</div>
   		</fieldset>	
   </div>
   <br/><br/>
   
   <div id="relation">
	   <div>公共费用类型与报销类型对应关系：</div>
	   <div class="nui-toolbar" style="border-bottom:0;padding:0px;width:100%;" id="button_inorgid1">
		    <table style="width:100%;">
		    	<tr>
		            <td style="width:100%;">
		                <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow()">增加</a>
		                <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="removeRow()">删除</a>
		                <span class="separator"></span>
	                    <a class="nui-button" iconCls="icon-save" onclick="saveData()" plain="true">保存</a>
		            </td>
		        </tr>
		     </table>           
		</div>
	   <div id="datagrid1"  sizeList="[10,20,50,100]" showPager="false" dataField="comtypess" 
	    	showSummaryRow="true"  sortMode="client"  allowCellEdit="true" allowCellSelect="true"
	    	class="nui-datagrid" style="width:100%;height:350px;" url="com.primeton.eos.common.commClassifyType.getCommonRelation.biz.ext" 
	    	multiSelect="true" allowSortColumn="true">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	            <div field="comexptypeid" align="center" headerAlign="center" allowSort="true">公共费用类型编码
	            </div>
	            <div field="comexptypename" align="center" headerAlign="center" allowSort="true">公共费用类型名称
	            </div>
	            <div field="exptypeid" align="center" headerAlign="center" allowSort="true" >报销费用类型编码
	            	<input property="editor" class="nui-treeselect"  url="com.primeton.eos.ame_fee.feeTypeTree.getFeeTypeTree.biz.ext" 
		            	textField="feetypename" valueField="feetypecode" parentField="parentfeetypeid" dataField="feetypes" 
		            	showTreeIcon="true" valueFromSelect="true" onvaluechanged="changes" onbeforenodeselect="beforenodeselect" allowInput="true" style="width:100%;" />
	            </div>
	            <div field="feetypename" align="center" headerAlign="center" allowSort="true">报销费用名称
	            </div>
	        </div>
	    </div>
    </div>
</body>
<script type="text/javascript">
		nui.parse();
		
	    var grid = nui.get("datagrid1");
		var comexptypeid = '<%=request.getParameter("comexptypeid")%>';
		var type = '<%=request.getParameter("type")%>';
		if(comexptypeid == null){
			comexptypeid = 1;
		}
		var feet = null;
		var form = new nui.Form("feetypeform");
		var json = nui.encode({"exptypeid":comexptypeid,"type":type});
		$.ajax({
	            url: "com.primeton.eos.common.commClassifyType.getCommontypeById.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                feet = returnJosn.exptype;
	                nui.get("comexptypeid").setValue(feet.comexptypeid);
	                nui.get("comexptypename").setValue(feet.comexptypename);
	                nui.get("iscount").setValue(feet.iscount)
	                if(type =="1"){
		                nui.get("status").setValue(feet.status);
		                nui.get("comgrouptypename").setValue(feet.erprptTCommgrouptype.comgrouptypename);
	                }else{
	                	$('#relation').hide();
	                	$('.count').hide();
	                }
	                setToText();
	                //加载公共费用类型与报销类型对应关系
	                grid.load({
	                	"comexptypeid":comexptypeid
	                },function(e){
	                	comtypess =e.data;
	                });	               
	            }
	     }); 
	     
    	function setToText(){
    		var fields = form.getFields();                
            for (var i = 0, l = fields.length; i < l; i++) {
                var c = fields[i];
                if (c.setReadOnly) c.setReadOnly(true);     //只读
                if (c.addCls) c.addCls("asLabel");          //增加asLabel外观
            }
    	
    	}
    function changes(e){
    	var row = grid.getSelected();
    	var rowData = {feetypename: e.sender.text};
        grid.updateRow(row,rowData);	
    }	
    	
    //增加关联关系
    function addRow() {   
	    var newRow = { name: "New Row",comexptypeid:comexptypeid,comexptypename:nui.get("comexptypename").getValue()};
	    grid.addRow(newRow, 0);
	  } 
	  //删除关联关系
    function removeRow() {
            var rows = grid.getSelecteds();
            if (rows.length > 0) {
                grid.removeRows(rows, true);
            }
        }	
    function beforenodeselect(e){//只能选择叶子节点
        if (e.isLeaf == false) {
        	e.cancel = true;
        }
	}
	 var types; 
	 var aa;  
	//保存修改了的数据 
    function saveData() {
        var json = nui.encode({"comexptypeid":comexptypeid});
        nui.ajax({
            url: "com.primeton.eos.common.commClassifyType.getCommonRelation.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
                var returnJosn = nui.decode(text);
                types = returnJosn.comtypess;
                aa =grid.getChanges();
                var isbb=false;
                for(var i = 0; i <types.length; i++){
                	for(var j = 0; j<aa.length; j++){
	            		if(types[i].exptypeid == aa[j].exptypeid && aa[j]._state != "removed"){
	            			isbb=true;
	            		}
                	}
                }
                if(isbb){
                	alert("编码重复，不能保存");
                	return;
                }else{
               //编辑成功，保存
               		var comexptypes = nui.clone(grid.getData());
               		for(var k=0;k<comexptypes.length;k++){
               			if(comexptypes[k].exptypeid == null || comexptypes[k].exptypeid == ""){
               				nui.alert("费用类型为空，请确认");
               				return;
               			}
               		}
               		var json1 = nui.encode({"comexptypeid":comexptypeid,"comexptypes":comexptypes});
                	nui.ajax({
                		url: "com.primeton.eos.common.commClassifyType.saveCommonRelation.biz.ext",
                		type: 'POST',
			            data: json1,
			            success: function (text) {
			            	var returnJosn = nui.decode(text);
			            	if(returnJosn.result == "success"){
				            	nui.alert("保存成功","提示",function(){
				            		grid.reload()
				            	});
			            	}else{
			            		nui.alert("保存失败","提示",function(){
			            			grid.reload();
			            			return;
			            		})
			            	}
			            }
                	})
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    } 
</script>
</html>