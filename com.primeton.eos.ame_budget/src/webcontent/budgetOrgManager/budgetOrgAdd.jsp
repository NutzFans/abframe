<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-07 16:00:46
  - Description:
-->
<head>
<title>新增预算机构</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
	<div id="budgetOrgform">
   		<fieldset  style="border:solid 1px #aaa;padding:3px;">
   			<legend>基本信息</legend>
   			<div>
   				<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:70%;table-layout:fixed;">
		   			<tr>
		   				<td style="width:80px" align="right">
		   					上级机构:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="parentorgName" style="width:100%" class="nui-textbox"  name="parentorgName"/> 
		   					<input class="nui-hidden" name="budgetOrg.parentorgid" id="parentorgid"/>
		   					<input class="nui-hidden" name="budgetOrg.parentbudyear" id="parentBudYear"/>
		   					<input class="nui-hidden" name="budgetOrg.orglevel" id="orglevel"/>
		   					<input class="nui-hidden" name="budgetOrg.orgseq" id="orgseq"/>
		   					<input class="nui-hidden" name="budgetOrg.isleaf" id="isleaf" value="y"/>
		   				</td>
		   				
		   				<td style="width:80px" align="right">
		   					预算制定人员:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="managerid" class="mini-textboxlist"  name="budgetOrg.managerid" searchField="name" style="width:100%"
        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" value="" text=""
        						textField="EMPNAME" valueField="EMPID" />
		   				</td>
		   				
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					<span style="color:red">*</span>&nbsp;机构名称:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="orgName" style="width:100%" class="nui-textbox"  name="budgetOrg.orgname" required="true"/> 
		   				</td>
		   				<td style="width:80px" align="right">
		   					<span style="color:red">*</span>&nbsp;预算年份:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input class="nui-textbox"  width="100%" name="budgetOrg.budgetYear" id="budgetYear" required="true"  vtype="int"/>
		   				</td>
		   				
		   				
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					机构类型:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input class="nui-dictcombobox" dictTypeId="ABF_ORGTYPE" width="100%" name="budgetOrg.orgtype" id="orgtype" />
		   				</td>
		   				<td style="width:80px" align="right">
		   					机构等级:
		   				</td>
		   				<td style="width:25%" align="left">
		   				<input class="nui-dictcombobox" dictTypeId="BUD_ORGDEGREE" width="100%" name="budgetOrg.orgdegree" id="orgdegree"  />
		   				</td>
		   				
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					机构状态:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input class="nui-dictcombobox" dictTypeId="ABF_ORGSTATUS" width="100%" name="budgetOrg.status" id="status"/>
		   				</td>
		   				
		   				<td style="width:80px" align="right">
		   					所属区域:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="area" style="width:100%" class="nui-textbox"  name="budgetOrg.area"/> 
		   				</td>
		   			</tr>
		   			<tr>
		   				<td style="width:80px" align="right">
		   					排列顺序:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="sortno" style="width:100%" class="nui-textbox"  name="budgetOrg.sortno"/> 
		   				</td>
		   				<td style="width:80px" align="right">
		   				实际对应机构:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="actorgname" style="width:75%" class="nui-textbox"  readonly="readonly"/> 
		   					<input id="actorgid" name="budgetOrg.actorgid" class = "nui-hidden"/>
		   					<a class="nui-button"  onclick="choseOrg1">选择</a>
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
    <!-- 组织机构选择 -->
   <div id="moveWindow1" title="选择组织机构" class="nui-window" style="width:320px;height:230px;"
        showModal="true" showFooter="true" allowResize="true"
        >
        <!-- 组织机构树-->
		<ul id="tree2" class="nui-tree" url="com.primeton.eos.ame_budget.budgetOrgManager.getOrgTree.biz.ext" 
			style="width:300px;padding:5px;"  expandOnLoad="0" showRadioButton="true" showFolderCheckBox="true"
		    showTreeIcon="true" textField="ORGNAME" idField="ORGID"  parentField="PARENTORGID" dataField="orgs"
		     showArrow="true"  resultAsTree ="false"  expandOnDblClick="false" ondrawnode="setIcon"
		     checkRecursive="false" autoCheckParent="false" >        
		</ul>
		<div property="footer" style="padding:5px;">
            <table style="width:100%">
                <tr>
                    <td style="width:120px;text-align:right;">
                        <input type="button" value="确定" onclick="okWindow1()"/>
                        <input type="button" value="关闭" onclick="hideWindow1()"/>
                    </td>
                </tr>            
            </table>
        </div>
  </div> 
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#budgetOrgform");
	var tree2 = nui.get("tree2");
	var moveWindow1 = nui.get("moveWindow1");
	function SetData(orgid,budgetYear,orgseq,level,pName){
		if(budgetYear==null){
			var d=new Date();
			budgetYear = d.getFullYear()+1;
		}
		nui.get("parentorgid").setValue(orgid);
		nui.get("parentBudYear").setValue(budgetYear);
		nui.get("orgseq").setValue(orgseq);
		nui.get("budgetYear").setValue(budgetYear);
		nui.get("orglevel").setValue(level+1);
		nui.get("parentorgName").setValue(pName);
	}
	
	function SetRootData(){
		nui.get("orgseq").setValue(".1.");
		nui.get("orgName").setValue("普元");
		nui.get("orgName").setReadOnly(true);
		
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
    var org;
    function getData(){
    	return org;
    }
    
    function saveData(){
    	//校验必填项
    	form.validate();
		if (form.isValid() == false) {
			nui.alert("请检查必填项!");
			return;
		}
        var name = nui.get("orgName").getValue();
        var year = nui.get("budgetYear").getValue();
        if(year!=null){
			var d=new Date();
			var cYear = d.getFullYear();//当前年份
			var byear = d.getFullYear()+1;//预算年份
			if(year<cYear){
				nui.alert("预算年份不能小于今年","提示");
			}
			var parentBudgetYear = nui.get("parentBudYear").getValue();
			if(parentBudgetYear!=null && parentBudgetYear !=year){
				nui.alert("当前机构预算年份与上级机构的预算年份不一致,请检查!","提示");
				return;
			}
		}
        var json = nui.encode({orgName:name,budgetYear:year});
    	$.ajax({
            url: "com.primeton.eos.ame_budget.budgetOrgManager.checkOrgName.biz.ext",
            type: 'POST',
            data: json,
            cache: false,
            contentType:'text/json',
            cache: false,
            success: function (text) {
                var returnJosn = nui.decode(text);
                var status = returnJosn.status;
                if(status=="0"){
                	var data = form.getData(false, true);
					var addJson = nui.encode(data);
			        $.ajax({
			            url: "com.primeton.eos.ame_budget.budgetOrgManager.addBudgetOrg.biz.ext",
			            type: 'POST',
			            data: addJson,
			            cache: false,
			            contentType:'text/json',
			            cache: false,
			            success: function (text) {
			                var returnJosn = nui.decode(text);
			                org = returnJosn.budgetOrg;
			                //window.parent.initNode(org);
			            	nui.alert("增加成功", "系统提示",function(){
					              		CloseWindow("SUCC");
								});
			            }
			     	}); 
                }else if(status=="1"){
                	nui.alert("预算年份为"+year+",已存在该预算组织机构,不需要增加","提示");
                }else{
                	nui.alert("组织机构已存在该组织机构,请进行选择新增","提示");
                }
            }
     	}); 
    	
    
    }
    //选择机构，显示机构选择窗口
		function choseOrg1(){
			moveWindow1.show();
		}
	   //隐藏机构选择窗口
	   function hideWindow1(){
	     	moveWindow1.hide();
	   }
	   
	   function okWindow1(){
	    	var node = tree2.getSelectedNode();
	    	if(node){
	    		  //将父级机构的ID，预算年月，还有seq,等级
	    		 var actorgid = node.ORGID;
	    		 var actorgname = node.ORGNAME;
	    		 nui.get("actorgid").setValue(actorgid);
	    		 nui.get("actorgname").setValue(actorgname);
		    	 moveWindow1.hide();
	    	}else{
	    		nui.alert("请选择一个机构","提示");
	    	}
	    }
	        //设置图片
	    function setIcon(e){
	    	e.iconCls = "icon-organization";
		}
	
</script>
</html>