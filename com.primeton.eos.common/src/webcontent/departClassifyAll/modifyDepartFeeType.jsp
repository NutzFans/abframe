<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-01 09:15:32
  - Description:
-->
<head>
<title>修改预算组织机构树</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body >
   <div id="feetypeform">
   <fieldset  style="border:solid 1px #aaa;padding:3px;height:185px">
   		<legend>基本信息</legend>
   		<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:70%;table-layout:fixed;">
		  	<tr>
   				<td style="width: 100px" align="right">部门费用类型编码:</td>
   				<td style="width: 200px;" align="left">
   					<input id="exptypeid" style="width:100%" class="nui-textbox"  name="deptexptype.deptexptypeid" required="true" readonly/> 
   				</td>
   				<td class="a" style="width: 100px" align="right">状态:</td>
   					<td class="a" style="width: 200px;" align="left">
   					<input id="sortno" style="width:100%"  name="deptexptype.status"  class="nui-dictcombobox" dictTypeId="MIS_YN"/> 
	   			</td>
   			</tr>
   			<tr>
   				<td style="width: 100px" align="right">上级部门费用类型:</td>
   				<td align="left" style="width: 200px;">
   					<input id="exptypename" style="width:100%" class="nui-textbox"  name="deptexptype.erprptTDeptgrouptype.deptgrouptypename" enabled="false"/> 
   					<input class="nui-hidden" name="deptexptype.erprptTDeptgrouptype.deptgrouptypeid" id="parentfeetypeid"/>
   				</td>
   				<td align="right" style="width: 100px">
   					<span style="color:red">*</span>部门费用类型名称:
   				</td>
   				<td align="left" style="width: 200px;">
   					<input id="exptypename1" style="width:100%" class="nui-textbox"  name="deptexptype.deptexptypename" required="true"/> 
   				</td>
   			</tr> 			
   		</table>
	    <table width="100%">
	      <tr>
	        <td style="text-align:center;">
	          <a class="nui-button" iconCls="icon-save" onclick="saveData">保存</a>
	          <span style="display:inline-block;width:25px;"></span>
	          <a class="nui-button" iconCls="icon-cancel" onclick="onCancel">取消</a>
	        </td>
	      </tr>
	    </table>
	    </fieldset>
	 </div>
   </div>
	  <!-- 预算组织机构选择 -->
   <div id="moveWindow" title="选择组织机构" class="nui-window" style="width:320px;height:230px;"
        showModal="true" showFooter="true" allowResize="true">
		<div property="footer" style="padding:5px;">
            <table style="width:100%">
                <tr>
                    <td style="width:120px;text-align:right;">
                        <input type="button" value="确定" onclick="okWindow()"/>
                        <input type="button" value="取消" onclick="hideWindow()"/>
                    </td>
                </tr>            
            </table>
        </div>
  </div>
   
</body> 
<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#feetypeform");
		var tree = nui.get("tree1");
		//机构选择窗口
		var moveWindow = nui.get("moveWindow");
		var exptypeid = '<%=request.getParameter("exptypeid")%>';
		var type = '<%=request.getParameter("type")%>';
		var parentfeetypeid="";
		var form = new nui.Form("feetypeform");
		var type1="";
		var deptexptype; 
	       //设置图片
	    function setIcon(e){
	    	e.iconCls = "icon-organization";
		}
	    
	     //取消
	     function onCancel(){
	     	CloseWindow("close");
	     }
     
	     
	     function SetData(deptexptypeid,type,exptypename){
	     	type1 = type;
			var json = nui.encode({'deptexptypeid':deptexptypeid,'type':type});
			$.ajax({
	            url: "com.primeton.eos.common.departmentClassifyType.getDepartmenttypeById.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                form.setData(returnJosn);               
	            }
	     	}); 
		}
	     
	     
	     //保存
	     function saveData(){
	        var data = form.getData(false, true);
			var updateJson = nui.encode({departfeetype:data.deptexptype,type:type1});
	        $.ajax({
	            url: "com.primeton.eos.common.departmentClassifyType.updateDepartFeeType.biz.ext",
	            type: 'POST',
	            data: updateJson,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                deptexptype = text.departfeetype.deptexptypeid;
	                nui.alert("修改成功", "系统提示",function(){
					       CloseWindow("SUCC");
					});
	            }
	     	}); 
	     }
	     
	     function getData(){
	    	return deptexptype;
	    }
	     //取消
	     function onCancel(){
	     	CloseWindow("close");
	     }
	     
	     //选择机构，显示机构选择窗口
		function choseOrg(){
			moveWindow.show();
		}
	     	 //关闭窗口
		function CloseWindow(action){
	      if(action=="close"){
	      	CloseWindow("cance");
	      }else if(window.CloseOwnerWindow) 
	        return window.CloseOwnerWindow(action);
	      else
	        return window.close();
	    }
	    
	   //隐藏机构选择窗口
	   function hideWindow(){
	     	moveWindow.hide();
	   }
	    
	   function okWindow(){
    	var node = tree.getSelectedNode();
    	if(node){
	    	var json = nui.encode({deptexptypeid:node.deptexptypeid});
			$.ajax({
		            url: "com.primeton.eos.common.departmentClassifyType.getDepartmenttypeById.biz.ext",
		            type: 'POST',
		            data: json,
		            cache: false,
		            contentType:'text/json',
		            cache: false,
		            success: function (text) {
		                var returnJosn = nui.decode(text);
		                var feetype = returnJosn.deptexptypeid;
		                nui.get("exptypeid").setValue(deptexptype.deptexptypeid);
		                nui.get("deptgrouptypeid").setValue(deptexptype.deptgrouptypeid);
		                nui.get("deptexptypename").setValue(deptexptype.deptexptypename);
		                //如果选择的是根节点
		               if(departfeetype.exptypeid=="0"){
		                	nui.get("exptypeid").setValue(deptexptype.deptexptypeid);
		                }
		            }
		     }); 
	    	moveWindow.hide();
    	}else{
    		nui.alert("请选择一个费用类型","提示");
    	}
    }
</script>
</html>