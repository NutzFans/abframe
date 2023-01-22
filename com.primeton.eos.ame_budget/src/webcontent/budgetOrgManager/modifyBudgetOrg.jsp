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
   <div id="budgetOrgform">
   		<input class="nui-hidden" name="budgetOrg.orgid" id="orgid"/>
   		<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:70%;table-layout:fixed;">
		   			<tr>
		   				<td style="width:80px" align="right">
		   					上级机构:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="parentorgName" style="width:75%" class="nui-textbox"  name="parentorgName"/> 
		   					<a class="nui-button"  onclick="choseOrg">选择</a>
		   					<input class="nui-hidden" name="budgetOrg.parentorgid" id="parentorgid"/>
		   					<input class="nui-hidden" name="budgetOrg.parentbudyear" id="parentBudYear"/>
		   					<input class="nui-hidden" name="budgetOrg.orglevel" id="orglevel"/>
		   					<input class="nui-hidden" name="budgetOrg.orgseq" id="orgseq"/>
		   					<input class="nui-hidden" name="changeParent" id="changeParent"/>
		   				</td>
		   				
		   				<td style="width:80px" align="right">
		   					预算制定人员:
		   				</td>
		   				<td style="width:25%" align="left">
		   					<input id="lookup2" class="mini-textboxlist"  name="budgetOrg.managerid" searchField="name" style="width:100%"
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
		   					<input class="nui-textbox"  width="100%" name="budgetOrg.budgetYear" id="budgetYear" required="true"  vtype="int" enabled="false"/>
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
		   					<input id="actorgname" name="budgetOrg.actorgname" style="width:75%" class="nui-textbox"  readonly="readonly"/> 
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
	          <a class="nui-button" iconCls="icon-cancel" onclick="onCancel">取消</a>
	        </td>
	      </tr>
	    </table>
	 </div>
   </div>
	  <!-- 预算组织机构选择 -->
   <div id="moveWindow" title="选择组织机构" class="nui-window" style="width:320px;height:230px;"
        showModal="true" showFooter="true" allowResize="true">
		<ul id="tree1" class="nui-tree" url="com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgTree.biz.ext" 
				style="width:100%;padding:5px;" expandOnLoad="0" showRadioButton="true" showFolderCheckBox="true"
			    showTreeIcon="true" idField="orgid" textField="orgname"  dataField="orgs" parentField="parentorgid" 
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
		
		var tree = nui.get("tree1");
		var tree1 = nui.get("tree2");
		//机构选择窗口
		var moveWindow = nui.get("moveWindow");
		var moveWindow1 = nui.get("moveWindow1");
	
		//预算机构ID
		var orgid = <%=request.getParameter("orgid")%>
		//预算年份
		var budgetYear= <%=request.getParameter("budgetYear")%>
		//初始化预算机构树
		loadTree(budgetYear);
		
		var parentOrgId="";
		var form = new nui.Form("budgetOrgform");
		nui.get("budgetYear").setValue(budgetYear);
		var json = nui.encode({orgId:orgid,budgetYear:budgetYear});
		$.ajax({
	            url: "com.primeton.eos.ame_budget.budgetOrgManager.getbudgetOrgByID.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                 var org = returnJosn.budgetOrg;
	                initEmp(org.managerid);
	                //nui.get("lookup2").setValue(org.managerid);
	                nui.get("orgtype").setValue(org.orgtype);
	                nui.get("orgtype").setText(nui.getDictText('ABF_ORGTYPE',org.orgtype));
	                nui.get("orgdegree").setValue(org.orgdegree);
	                nui.get("orgdegree").setText(nui.getDictText('BUD_ORGDEGREE',org.orgdegree));
	                nui.get("status").setValue(org.status);
	                nui.get("status").setText(nui.getDictText('ABF_ORGSTATUS',org.status));
	                nui.get("area").setValue(org.area);
	                nui.get("orgName").setValue(org.orgname);
	                nui.get("orgid").setValue(org.orgid);
	                nui.get("sortno").setValue(org.sortno);
	                nui.get("actorgid").setValue(org.actorgid);
	                nui.get("actorgname").setValue(org.actorgname);
	            }
	     });  
	     
	       //设置图片
	    function setIcon(e){
	    	e.iconCls = "icon-organization";
		}
	    
	    function initEmp(empId){
		    if(empId){
		    	var json = nui.encode({empId:empId});
				$.ajax({
			            url: "com.primeton.eos.ame_budget.budgetOrgManager.getEmpInfoByEmpId.biz.ext",
			            type: 'POST',
			            data: json,
			            cache: false,
			            contentType:'text/json',
			            cache: false,
			            success: function (text) {
			                var returnJosn = nui.decode(text);
			                var empids = returnJosn.empids;
			                var names= returnJosn.names
			                
			                nui.get("lookup2").setValue(empids);
			                nui.get("lookup2").setText(names);
			            }
			     }); 
	    	}
    	}
	     
		
		function SetData(orgid,budgetYear,orgseq,level,pName){
			parentOrgId = orgid;
			nui.get("parentorgid").setValue(orgid);
			nui.get("parentBudYear").setValue(budgetYear);
			nui.get("orgseq").setValue(orgseq);
			nui.get("orglevel").setValue(level);
			nui.get("parentorgName").setValue(pName);
		}
	     
	    
	     //取消
	     function onCancel(){
	     	CloseWindow("close");
	     }
     
	     
	     //保存
	     function saveData(){
	        var data = form.getData(false, true);
	        var year = nui.get("budgetYear").getValue();
			var json = nui.encode(data);
	        $.ajax({
	            url: "com.primeton.eos.ame_budget.budgetOrgManager.updateBudgetOrg.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                nui.alert("修改成功", "系统提示",function(){
					       CloseWindow("SUCC");
					});
	            }
	     	}); 
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
	   
	   //选择机构，显示机构选择窗口
		function choseOrg1(){
			moveWindow1.show();
		}
	   //隐藏机构选择窗口
	   function hideWindow1(){
	     	moveWindow1.hide();
	   }
	   
	   function okWindow1(){
	    	var node = tree1.getSelectedNode();
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
	    
	   function okWindow(){
    	var node = tree.getSelectedNode();
    	if(node){
    		  //将父级机构的ID，预算年月，还有seq,等级
    		 var porgid = node.orgid;
    		 //说明换了父级机构
    		 if(porgid!=null && porgid!=parentOrgId){
    		 	nui.get("changeParent").setValue("true");
    		 }
	    	 nui.get("parentorgid").setValue(porgid);
	    	 nui.get("parentorgName").setValue(node.orgname);
	    	 nui.get("parentBudYear").setValue(budgetYear);
	    	 nui.get("orglevel").setValue(node.orglevel+1);
	    	 var orgId = nui.get("orgid").getValue();
	    	 nui.get("orgseq").setValue(node.orgseq+orgId+".");
	    	 moveWindow.hide();
    	}else{
    		nui.alert("请选择一个预算机构","提示");
    	}
    }
    
    //重新初始化树
		function loadTree(year){
			var json = nui.encode({year:year});
			nui.ajax({
            	url: "com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgTree.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.orgs;
						//重新加载数据
						tree.loadList(data, "orgid", "parentorgid");
						//设置树的展开
						var nodes=tree.getChildNodes(tree.getRootNode());
	    				tree.expandNode(nodes[0]);
	              	}else{
	                	
	                }  
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });

		}
</script>
</html>