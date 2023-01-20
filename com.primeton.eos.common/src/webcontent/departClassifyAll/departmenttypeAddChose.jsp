<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 张雅兰
  - Date: 2019-05-20 14:25:16
  - Description:
-->
<head>
<title>新增部门费用类型</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
<style type="text/css">
	tr{
		line-height:25px;
	}
</style>
</head>
<body>
	<div id="budgetOrgform">
   		<fieldset  style="border:solid 1px #aaa;padding:3px;">
   			<legend>基本信息</legend>
   			<div>
   				<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:80%;table-layout:fixed;">
   					<tr>
   						<td style="width: 100px" align="right">
   							部门费用类型编码:
   						</td>
   						<td style="width: 200px;" align="left">
		   					<input id="exptypeid" style="width:100%" class="nui-textbox"  name="departfeetype.deptexptypeid" required="true" /> 
		   				</td>
		   				<td class="a" style="width: 100px" align="right">
   							状态:
   						</td>
   						<td class="a" style="width: 200px;" align="left">
		   					<input id="sortno" style="width:100%"  name="departfeetype.status"  class="nui-dictcombobox" dictTypeId="MIS_YN"/> 
		   				</td>
   					</tr>
		   			<tr>
		   				<td style="width: 100px" align="right">
		   					上级部门费用类型:
		   				</td>
		   				<td align="left" style="width: 200px;">
		   					<input id="exptypename" style="width:100%" class="nui-textbox"  name="departfeetype.erprptTDeptgrouptype.deptgrouptypename" enabled="false"/> 
		   					<input class="nui-hidden" name="departfeetype.erprptTDeptgrouptype.deptgrouptypeid" id="parentfeetypeid"/>
		   				</td>
		   				
		   				<td align="right" style="width: 100px">
		   					<span style="color:red">*</span>部门费用类型名称:
		   				</td>
		   				<td align="left" style="width: 200px;">
		   					<input id="exptypename1" style="width:100%" class="nui-textbox"  name="departfeetype.deptexptypename" required="true"/> 
		   				</td>
		   			</tr>
   				</table>
   				<div class="nui-toolbar" style="padding:0px;" borderStyle="border:0;">
				    <table width="100%">
				      <tr>
				        <td style="text-align:center;">
				          <a class="nui-button" iconCls="icon-save" onclick="saveData">保存</a>
				          <span style="display:inline-block;width:25px;"></span>
				          <a class="nui-button" iconCls="icon-cancel" onclick="onCancel">关闭</a>
				        </td>
				      </tr>
				    </table>
			 	</div>
   			</div>
   		</fieldset>
   </div>
   
    <!-- 预算组织机构选择 -->
   <div id="moveWindow" title="选择组织机构" class="nui-window" style="width:320px;height:230px;"
        showModal="true" showFooter="true" allowResize="true">
		<ul id="tree1" class="nui-tree" url="com.primeton.eos.common.departmentClassifyType.departmentCls.biz.ext" 
				style="width:100%;padding:5px;" expandOnLoad="0" showRadioButton="true" showFolderCheckBox="true"
			    showTreeIcon="true" idField="exptypeid" textField="exptypename"  dataField="departtypes" parentField="parexptypeid" 
			    showArrow="true"  resultAsTree ="false"  expandOnDblClick="false" ondrawnode="setIcon"
		     checkRecursive="false" autoCheckParent="false" >      
		</ul>
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
	//机构树
	var tree = nui.get("tree1");
	//机构选择窗口
	var moveWindow = nui.get("moveWindow");
	var form = new nui.Form("#budgetOrgform");
	var type1="";
	var deptexptype;
	//初始化数据
	function SetData(exptypeid,type,exptypename){
		nui.get("exptypename").setValue(exptypename);
		nui.get("parentfeetypeid").setValue(exptypeid);
		type1=type;
		if(type=='0'){
			$(".a").css('visibility','hidden');
		}else{
			$(".a").css('visibility','visible');
		}
	}
	
	//选择机构，显示机构选择窗口
	function choseOrg(){
		moveWindow.show();
	}
	
	//设置节点图片
	function setIcon(e){
	    	e.iconCls = "icon-organization";
	}
	
	//取消
     function onCancel(){
     	CloseWindow("close");
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

    var fee ;
     function saveData(){
    	//校验必填项
    	form.validate();
		if (form.isValid() == false) {
			nui.alert("请检查必填项!");
			return;
		}
        var code = nui.get("exptypeid").getValue();
        var name = nui.get("exptypename1").getValue();
        var json = nui.encode({exptypename:name,exptypeid:code,type:type1});
        
        if(code.length > 6){
        	nui.alert("费用类型编码过长，最长为六位字符。");
        	return;
        }
    	$.ajax({
            url: "com.primeton.eos.common.departmentClassifyType.checkDeparttypeName.biz.ext",
            type: 'POST',
            data: json,
            cache: false,
            contentType:'text/json',
            success: function (text) {
                var returnJosn = nui.decode(text);
                var status = returnJosn.status;
                if(status=="0"){
                	var data = form.getData(false, true);
					var addJson = nui.encode({departfeetype:data.departfeetype,type:type1});
			        $.ajax({
			            url: "com.primeton.eos.common.departmentClassifyType.addDepartmentType.biz.ext",
			            type: 'POST',
			            data: addJson,
			            contentType:'text/json',
			            cache: false,
			            success: function (text) {
			            	deptexptype = text.departfeetype.deptexptypeid;
			            	nui.alert("增加成功", "系统提示",function(){
			              	CloseWindow("SUCC");
							});
			            }
			     	}); 
                }else if(status=="2"){
                	nui.alert("费用类型编码为:"+code+"已存在！","提示");
                }else{
                	nui.alert("费用类型已存在该费用类型,请进行选择新增","提示");
                }
            }
     	}); 
    	
    
    }
    
    function getData(){
    	return deptexptype;
    }
    
    function onCheck(e){
    	var node = tree.getSelectedNode();
    }
	
</script>
</html>