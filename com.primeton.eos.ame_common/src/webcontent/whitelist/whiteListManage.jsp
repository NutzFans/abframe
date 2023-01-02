<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): 黄宇琪
  - Date: 2018-08-20 14:17:54
  - Description:
-->
<head>
	<title>白名单管理</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:;
	    }
	</style>
</head>
<body>
	<div class="nui-panel" title="白名单管理" style="width:100%;">
    	<div id="whform1">
    		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">        		
            	<table align="center" border="0" width="100%" class="form_table">	            
		        	<tr>
	          			<td class="form_label" align = "right">员工:</td>
			            <td colspan="1">
	          		    <input class="nui-hidden" name="criteria._expr[0]._property" value="userid"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="aaa"/>
			            <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="bbb"/>
			            <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
				        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
				        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname"/>
				        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="whitelistuser"  style="width:175px;"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>			  		         
	          			</td>	
			            <td class="form_label" align = "right">有效开始日期:</td>
			            <td colspan="1">
		           		<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px" id = "startdate"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="startdate"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
			          	</td>		          			          
			          	<td class="form_label" align = "right">所属部门:</td>
			          	<td colspan="1">
				            <input name="criteria._expr[1]._value" class="nui-combobox" textField="orgname" valueField="orgseq" 
				            dataField="orgs" showNullItem="true" allowInput="true"  style="width:170px;" id="orgid" />
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="orgseq"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="end"/>
						    
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[6]._value" id="orgids"/>
			            </td>
      		    	</tr>	
		      		<tr>
		      	  		<td class="form_label" align = "right">业务类型:</td>
		          		<td colspan="1">
		            	<input name="criteria._expr[7]._value" class="nui-dictcombobox"  multiSelect="true" dictTypeId="AME_WHITE_BUSI" shownullItem="true" style="width:175px;"  />
				    	<input class="nui-hidden" name="criteria._expr[7]._property" value="code"/>
				    	<input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
	          			</td>	
			          	<td class="form_label" align = "right">有效结束日期:</td>
			          	<td colspan="1">
			           	<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px" id = "enddate"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="enddate"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
			          	</td>
			          	<td class="form_label" align = "right">白名单状态:</td>
			          	<td colspan="1">
			            <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="ABF_STATUS" shownullItem="true"  style="width:170px;" id="state" />
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="state"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
			            </td>			 			      
		      		</tr>	
		      		<tr>
		      			<td class="form_label" align = "right">员工状态:</td>
			          	<td colspan="1">
			            <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="ABF_EMPSTATUS" shownullItem="true"  style="width:170px;" id="empstatus" />
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="empstatus"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
			            </td>	
		      		</tr>	      			  			          
			      	<tr>
				        <td colspan="8" align="center">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
		    		</tr>
        		</table>
  			</div>
  		</div>
		<div style="width:100%;">
    		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            	<table style="width:100%;">
	            	<tr>
		                <td style="width:20%;">                   			           
				            <a class="nui-button" id="add"  iconCls="icon-add" onclick="addwhitelist()">新增</a>
				            <a class="nui-button" id="edit" iconCls="icon-edit" onclick="editwhitelist()">修改</a>
				            <a class="nui-button" id="delete" iconCls="icon-remove" onclick="deletewhitelist()">删除</a>
				        </td>
	            	</tr>
            	</table>           
        	</div>
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true" dataField="whitelist" 
	        	 url="com.primeton.eos.ame_common.ameWhitelist.queryWhitelist.biz.ext"  idField="whitelistid" multiSelect="true"
	        	 allowSortColumn=true  sortMode="client">
				<div property="columns">
	            	<div type="checkcolumn"></div>                           
	                <div field="username" width="60" align="center" headerAlign="center" allowSort="true" >员工</div>
	                <div field="empstatus" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictGetEmpStatus">员工状态</div>
	                <div field="syqname" width="60" align="center" headerAlign="center" allowSort="true" >一级部门</div>
	                <div field="sybname" width="60" align="center" headerAlign="center" allowSort="true" >二级部门</div>
	                <div field="orgname" width="60" align="center" headerAlign="center" allowSort="true" >所属部门</div>               				
	                <div field="state" width="60" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">白名单状态</div>
	                <div field="code" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetCode" >业务类型</div>
	                <div field="startdate" width="100" align="center" headerAlign="center" allowSort="true" >有效开始日期</div>
	                <div field="enddate" width="100" align="center" headerAlign="center" allowSort="true" >有效结束日期</div>
	            </div>
        	</div>
		</div>
	</div>
	<script type="text/javascript">    	
		nui.parse();
    	var grid = nui.get("datagrid1");
    	
		
    	init();
    	
    	function init(){
    		<% 
	    		UserObject user = (UserObject)session.getAttribute("userObject");
	    		String nowuserid = user.getUserId();
	    		String nowusername = user.getUserName();
	    		String userorgid=user.getUserOrgId();
			%>
    		//机构权限初始化
    		//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"whiteListManage","map":{"property":"status","op":"=","value":"running"}};
			nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("whitelistuser").setValue('<%=nowusername %>');
							nui.get("whitelistuser").setReadOnly(true);
						}
						var isall;//是否拥有全公司的权限
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.getbyName("criteria._expr[6]._op").setValue("=");
	        				nui.getbyName("criteria._expr[6]._value").setValue("");
						}else{
							nui.get("orgids").setValue(text.orgids);
						}
						nui.get("orgid").setData(text.orgs);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("whitelistuser").setValue('<%=nowusername %>');
							nui.get("whitelistuser").setReadOnly(true);
					}
					search();
				}
			});
    	}
       	
        //状态
		function dictGetStatus(e){
			return nui.getDictText('ABF_STATUS',e.value);
		}
		
		//业务类型
		function dictGetCode(e){
			return nui.getDictText('AME_WHITE_BUSI',e.value);
	  	}
	  	//人员状态
	  	function dictGetEmpStatus(e){
	  	return nui.getDictText('ABF_EMPSTATUS',e.value);
	  	
	  	}
		
		//查询数据
		function search() {
			if(nui.get("whitelistuser").getValue()==""||nui.get("whitelistuser").getValue()==null){
				nui.get("aaa").setValue("=");
				nui.get("bbb").setValue("");
			}else{
				nui.get("aaa").setValue("in");
				nui.get("bbb").setValue("1");
			}
			var form = new nui.Form("#whform1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
		//重置
		function reset(){
			var form = new nui.Form("#whform1");
			form.reset();
			grid.load();
		}  		
			
		//回车触发
		function onKeyEnter(){
			search();
		}
				
		//将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
		function ondealdate(e){
			if(e.value){
		  		var now  = e.value;
		  		var year = now.getFullYear();     
         	    var month = now.getMonth()+1;
	            var day = now.getDate();     
          		var hours = now.getHours();     
          		var minutes = now.getMinutes();     
          		var seconds = now.getSeconds();
          		var curDateTime = year;
          		if(month>9){
					curDateTime = curDateTime +"-" + month;
		  		}else{
		  			curDateTime = curDateTime+"-" + "0" + month;
		  		}
    	  		if(day>9){
					curDateTime = curDateTime+"-" + day;
		  		}else{
					curDateTime = curDateTime+"-" + "0" + day;
		  		}
			  	if(hours>9){
					curDateTime = curDateTime+"   " + hours;
			  	}else{
					curDateTime = curDateTime+"   " + "0" + hours;
			  	}
		  		if(minutes>9){
					curDateTime = curDateTime+":" + minutes;
		  		}else{
					curDateTime = curDateTime+":" + "0" + minutes;
		  		}
		  		if(seconds>9){
					curDateTime = curDateTime+":" + seconds;
		  		}else{
					curDateTime = curDateTime+":" + "0" + seconds;
		  		}     
          		return curDateTime;     
        	}
    	}	
	
		/**
		 * 新增白名单
		 */
		function addwhitelist() {        	
      		nui.open({
      			url: "<%= request.getContextPath() %>/ame_common/whitelist/WhitelistInput.jsp",
      			title: "新增白名单",
      			width: 500,
      			height: 350,
      			onload: function () {//弹出页面加载完成
      				var iframe = this.getIFrameEl();
      				var data = {action: "new"};;//传入页面的json数据
      				iframe.contentWindow.setFormData(data);
      			},
      			ondestroy: function (action) {//弹出页面关闭前
	      			if(action=="saveSuccess"){
	      				grid.reload();
	  				}
    			}
    		});
      	}	
      	      
		/**
		 * 修改白名单
		 */
		 function editwhitelist() {
    	 	var row = grid.getSelected();
	        var row1 = grid.getSelecteds();
	        if (row) {
		    	if(row1.length<2) {
		    		var whitelistid=row.whitelistid;
		    		nui.open({
				        url: "<%=request.getContextPath() %>/ame_common/whitelist/WhitelistUpdate.jsp?whitelistid="+whitelistid,
				        title: "编辑白名单",
				        width: 500,
				        height: 350,
				        onload: function () {
			          		var iframe = this.getIFrameEl();
			          		var data = {action: "edit",record:{whitelist:row}};
				          	//直接从页面获取，不用去后台获取
				          	iframe.contentWindow.setFormData(data);
			          	},
			          	ondestroy: function (action) {                
		               		if(action=="saveSuccess"){
	          	   				grid.reload();
		          	   		}
			          	}
		       		});
		    	}else{
		    		nui.alert("只能选中一条记录","提示");
		    	}
            }else{
	              nui.alert("请选中一条记录","提示");
    		}
    	}                            
		/**
		 * 删除白名单
		 */
		function deletewhitelist() {
	 		var rows = grid.getSelecteds();
     		if(rows.length > 0){
     		nui.confirm("确定删除选中记录？","系统提示",
         	function(action){
            	if(action=="ok"){
              		var json = nui.encode({whitelist:rows});
                  	grid.loading("正在删除中,请稍等...");
                  	nui.ajax({
                    	url:"com.primeton.eos.ame_common.ameWhitelist.deleteWhitelist.biz.ext",
	                    type:'POST',
	                    data:json,
	                    cache: false,
	                    contentType:'text/json',
	                    success:function(text){
                      		var returnJson = nui.decode(text);
                      		if(returnJson.exception == null){
	                        	grid.reload();
	                        	nui.alert("删除成功", "系统提示", function(action){});
	                        }else{
                          		grid.unmask();
                          		nui.alert("删除失败", "系统提示");
	                        }
                      	}
                    });
                }
            });
            }else{
             	nui.alert("请选中一条记录！");
      		}
        }
        
	</script>
</body>
</html>