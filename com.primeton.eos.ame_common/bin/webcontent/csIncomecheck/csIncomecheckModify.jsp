<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>核查要点修改</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div title="核查要点修改">
	 	<form id="form1" method="post" >
	 		<input id="checklistid" name="csIncomechecklist.checklistid" class="nui-hidden">
	 		<input id="parentid" name="csIncomechecklist.parentid" class="nui-hidden">
	 		<input id="pSeq" name="csList.seq" class="nui-hidden">
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:120px">父核查要点名称：</td>
					<td>
						<input class="nui-textbox" name="csList.checklistname" id="upchecklistname" style="width:150px" readonly="readonly">
					</td>
					<td align="right" style="width:100px">父核查要点序号：</td>
					<td>
						<input class="nui-textbox" name="csList.checklistseq" id="upchecklistseq" style="width:150px" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:120px">核查要点说明：</td>
					<td colspan="3">
						<input name="csIncomechecklist.checklistshowname" id="checklistshowname" class="nui-textarea" style="width:400px;height:60px;" required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:120px">核查要点描述：</td>
					<td colspan="3">
						<input name="csIncomechecklist.checklistname" id="checklistname" class="nui-textarea" style="width:400px;height:60px;" required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:120px">核查要点序号：</td>
					<td>
						<input name="csIncomechecklist.checklistseq" id="checklistseq" class="nui-textbox" style="width:150px"  required="true" />
					</td>
					<td align="right" style="width:100px">是否可以审核：</td>
					<td>
						<input class="nui-dictcombobox" dictTypeId="MIS_YN" name="csIncomechecklist.iscancheck" id="iscancheck" style="width:150px" shownullItem="false" required="true" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:120px">显示顺序：</td>
					<td>
						<input class="nui-textbox" name="csIncomechecklist.sortno" id="sortno" style="width:150px" onValuechanged="checkNumber"/>
					</td>
					<td align="right" style="width:100px">层次：</td>
					<td>
						<input class="nui-textbox" name="csIncomechecklist.level" id="level" style="width:150px" readonly="readonly">
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="saveIc" id="a" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="kos">关闭</a>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var checklistid = '<%=request.getParameter("checklistid") %>';
    	var pName = '<%=request.getParameter("pName") %>';
    	var addURL ="com.primeton.eos.ame_common.csIncomecheck.addCsIncomecheck.biz.ext";
    	var updateURL ="com.primeton.eos.ame_common.csIncomecheck.updateCsIncomecheck.biz.ext";
    	var start;
    	if(checklistid!='null'&&checklistid!=""){
    		start = '1';
    		document.getElementById('kos').style.display="none"
    		init();
    	}
    	
    	function saveIc(){
    		if(!form.validate()){
				alert("请检查表单的完整性!");
				return;
			}
			var checklistseq = nui.get("checklistseq").getValue();
			var json = nui.encode({"checklistseq":checklistseq});
			nui.ajax({
				url:'com.primeton.eos.ame_common.csIncomecheck.checkSeq.biz.ext',
		        type:'post',
		        data:json,
		        contentType: 'text/json',
		        success:function(o){
		        	if(o.result=='1'){
		        		if (confirm("序号已存在，请确认是否继续新增？")==false){
		        			nui.get("checklistseq").setValue("");
		        			return;
		        		}
		        	}
		        	var data = form.getData();
					var checklistid = nui.get("checklistid").getValue();
					if(checklistid==null||checklistid==""){
						var json = nui.encode({"csIncomechecklist":data.csIncomechecklist,"csList":data.csList});
						nui.ajax({
					        type:'post',
					        data:json,
					        async:false,
					        contentType: 'text/json',
					        url:addURL,
					        success:function(o){
					        	var result = o.result;
					        	if(result=='1'){
					        		alert("保存成功！");
					        		onCancel("ok");
					        	}else{
					        		alert("保存失败！");
					        	}
					        }
						});
					}else{
						var json = nui.encode({"csIncomechecklist":data.csIncomechecklist});
						nui.ajax({
					        type:'post',
					        data:json,
					        async:false,
					        contentType: 'text/json',
					        url:updateURL,
					        success:function(o){
					        	var result = o.result;
					        	if(result=='1'){
					        		alert("保存成功！");
					        		onCancel("ok");
					        	}else{
					        		alert("保存失败！");
					        	}
					        }
						});    		
					}
		        }
			});
    	}
    	
    	function init(){
    		var json = nui.encode({"menu":{"checklistid":checklistid}});
			nui.ajax({
				url:'org.gocom.abframe.rights.menu.MenuManager.expandMenuFillFuncname.biz.ext',
		        type:'post',
		        data:json,
		        contentType: 'text/json',
		        success:function(o){
		        	var k = {"acmenu":o.menu};
		        	form.setData(k);
		        	if(pName!='null'&&pName!=""){
		        		nui.get("menulabel").setValue(pName);
		        	}
		        	if(k.acmenu.imagepath!=null&&k.acmenu.imagepath!=""){
		        		nui.get("imagepath").setText(k.acmenu.imagepath);
	    				nui.get("imagepath").setValue(k.acmenu.imagepath);
		        	}
	    			if(k.acmenu.funcname!=null&&k.acmenu.funcname!=""){
	    				nui.get("funccode").setText(k.acmenu.funcname);
	    				nui.get("funccode").setValue(k.acmenu.funccode);
	    			}
	    			if(k.acmenu.isleaf=="n"){
	    				nui.get("isleaf").setReadOnly(true);
	    				nui.get("funccode").setReadOnly(true);
	    				nui.get("openmode").setReadOnly(true);
	    			}
		        }
			});
    	}
    	
    	function SetData(data){
    		if(data.pName!=null){
    			nui.get("upchecklistname").setValue(data.pName);
    		}
    		if(data.pId!=null){
    			nui.get("parentid").setValue(data.pId);
    		}
    		if(data.checklistid!=null){
    			nui.get("checklistid").setValue(data.checklistid);
    		}
    		if(data.checklistname!=null){
    			nui.get("checklistname").setValue(data.checklistname);
    		}
    		if(data.sortno!=null){
    			nui.get("sortno").setValue(data.sortno);
    		}
    		if(data.level!=null){
    			nui.get("level").setValue(data.level);
    		}
    		if(data.upchecklistseq!=null){
    			nui.get("upchecklistseq").setValue(data.upchecklistseq);
    		}
    		if(data.checklistseq!=null){
    			nui.get("checklistseq").setValue(data.checklistseq);
    		}
    		if(data.pSeq!=null){
    			nui.get("pSeq").setValue(data.pSeq);
    		}
    		if(data.iscancheck!=null){
    			nui.get("iscancheck").setValue(data.iscancheck);
    		}
    		if(data.checklistshowname!=null){
    			nui.get("checklistshowname").setValue(data.checklistshowname);
    		}
    	}
    	
    	function checkNumber(e){
	        if (!isNumber(e.value)) {
	            alert("请输出正确的数字!") ;
	            nui.get("displayorder").setValue("");
	        }
	    }
	    
	    function CloseWindow(action) {            
	        if (action == "close" && form.isChanged()) {
	            if (confirm("数据被修改了，是否先保存？")) {
	                return false;
	            }
	        }
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
	
	    function onCancel(e) {
	        CloseWindow(e);
	    }
   	</script>
</body>
</html>