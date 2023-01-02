<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-03-08 14:06:02
  - Description:
-->
<head>
	<title>外包人员微信企业号账号查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="外包人员微信企业号账号查询" width="100%">
		   <form id="form1" method="post" style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">姓名：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="outpername"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						     <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right">用户帐号：</td>
						<td>
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="userid"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right">绑定状态：</td>
						<td>
							<input name="criteria._expr[0]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="AME_WXSTATUS" style="width:150px;" multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="a11"/>
						</td>
						<td align="right">是否考勤：</td>
						<td>
							<input name="criteria._expr[7]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="MIS_YN" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="whetherattendance"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right">供应商：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							<input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right">项目编号：</td>
						<td>
							<input name="criteria._expr[5]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							<input class="nui-hidden" name="criteria._expr[5]._property" value="projectno"/>
							<input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
						<td align="right">汇报对象：</td>
						<td>
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
							<input class="nui-hidden" name="criteria._expr[4]._property" value="empname"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
						</td>
						<td align="right">服务状态：</td>
						<td>
							<input name="criteria._expr[6]._value" class="nui-combobox" style="width:150px;" textField="name" valueField="id" id="state" shownullItem="true"/>
							<input class="nui-hidden" name="criteria._expr[6]._property" value="state"/>
							<input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
							<a class="nui-button" iconCls="icon-expand" id="inits" onclick="inits()" >Ame+与企业号同步数据初始化</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </form>
	 <div style="width:100%;"> 
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addWXBtn" iconCls="icon-add" onclick="addWXQYZH()">生成微信企业号账号</a>
		                        <a class="nui-button" id="updateWXBtn" iconCls="icon-edit" onclick="updateWXQYZH()">更新微信企业号账号</a>
		                        <a class="nui-button" id="deleteWXBtn" iconCls="icon-remove" onclick="deleteWXQYZH()">删除微信企业号账号</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		<!-- 考勤统计信息列表
		-->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:330px;"  url="com.primeton.eos.ame_common.ameAttendance.queryOutPersonWxList.biz.ext" 
	         dataField="datas" pageSize="10" sizeList="[10,20,50,100]" showPager="true" multiSelect="true" allowAlternating="true">
			<div property="columns">
				<div type="checkcolumn" width="30"></div>
				<div field="outpername" width="100" align="center"  headerAlign="center" allowSort="true">人员姓名</div>
				<div field="userid" width="100" align="center"  headerAlign="center" allowSort="true">用户账号</div>
				<div field="mobileno" width="100" align="center"  headerAlign="center" allowSort="true">手机号码</div>
				<div field="oemail" width="100" align="center"  headerAlign="center" allowSort="true">邮箱</div>
				<div field="weixinid" width="100" align="center"  headerAlign="center" allowSort="true">企业号账号</div>
				<div field="mobile" width="100" align="center"  headerAlign="center" allowSort="true">企业号登记手机</div>
				<div field="email" width="50" align="center"  headerAlign="center" allowSort="true" >企业号登记邮箱</div>
				<div field="status" width="70" align="center" headerAlign="center" renderer="getdict"  allowSort="true">绑定状态</div>	
			</div>
	   </div>
	   </div>	
	</div>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	nui.get("state").setData([{"id": "1","name": "服务中"},{"id": "0","name": "已离场"}]);
	init();
	function init(){
	//考勤统计详细页面传参
		grid.load();
		grid.sortBy("outpername","desc");
	}
		
	//考勤查询
	function search(){
		var data = form.getData(); 
		grid.load(data);
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
    function getdict(e){
    	return nui.getDictText('AME_WXSTATUS',e.value);//设置业务字典值
    }
    function inits(){
    	var json = "";
    	form.loading("数据初始化中。。。。。");
    	if(confirm("是否确定初始化微信人员数据？")){
    		nui.ajax({
                url: "com.primeton.eos.ame_common.ameAttendance.initOutPersonWxList.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		if(o.result == "1"){
             			alert("数据初始化失败！");
             			form.unmask();
             			return;
             		}else{
             			alert("数据初始化成功！");
             			grid.load();
             			form.unmask();
             		}
             	},
         		error: function () {
                	alert("error");
                	form.unmask();
                }
            })
    	}else{
			form.unmask();    	
    	}
    }
    
    
    /**
	     * 生成微信企业号账号
	     */
	    function addWXQYZH(){
	    	var rows = grid.getSelecteds();
	    	var outpernos = "";
	    	for(var i = 0;i < rows.length;i ++){
	    		if(outpernos){
	    			if(outpernos.indexOf(rows[i].outperno) > -1){
	    			}else{
	    				outpernos = outpernos +","+ rows[i].outperno;
	    			}
	    		}else{
	    			outpernos = rows[i].outperno + "";
	    		}
	    	}
	    	//var projectnos = nui.getbyName("criteria._expr[1]._value").getValue();
	    	if(outpernos != ""){
	    		var titleName = "";
	    		var winxinNo="";
    			titleName = "确定要生成微信企业号账号吗？";
	    		nui.confirm(titleName,"操作提示",function(action){
	    			if(action == "ok"){
	    				for(var j = 0;j < rows.length;j ++){
	    					if(rows[j].weixinid){
	    						winxinNo=1;
	    					}
	    					if(rows[j].status=='1'){
	    						winxinNo=1;
	    					}
	    				}
	    				if(winxinNo == 1){
	    					nui.alert('不能对已有企业号的用户进行生成操作！');
	    					return;
	    				}else{
	    					nui.get("addWXBtn").disable();
			    			var json = nui.encode({"outpernosTemp": outpernos});
	    					form.loading("微信企业号账号生成中...");
				    		nui.ajax({
			        			url: "com.primeton.eos.ame_pur.outpersonFiling.outpersonInitToAcoperator.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		form.unmask();
			                		o = nui.clone(o);
			                		if(o.resultInfo=="0"){
			                			nui.alert("没有可生成微信企业号账号的人员数据！","系统提示",function(){
				                			nui.get("addWXBtn").enable();
				                		});
			                		}else{
			                			nui.alert("生成完成！","系统提示",function(){
				                			nui.get("addWXBtn").enable();
				                		});
			                		}
			                	},
			                	error: function (jqXHR, textStatus, errorThrown) {
			                    	alert(jqXHR.responseText);
			                    	CloseWindow();
			                	}
			        		});
	    				}
	    			}
	    		});
	    	}else{
	    		nui.alert("请选择记录！");
	    	}
	    	
	    }
	    
	    
	function updateWXQYZH(){
			var rows = grid.getSelecteds();
	    	if(rows != "" && rows != null){
	    		var titleName = "";
	    		var winxinNo="";
    			titleName = "确定要更新微信企业号账号吗？";
	    		nui.confirm(titleName,"操作提示",function(action){
	    			if(action == "ok"){
	    				for(var j = 0;j < rows.length;j ++){
	    					if(!rows[j].weixinid){
	    						winxinNo=1;
	    					}
	    					if(rows[j].status=='3'){
	    						winxinNo=1;
	    					}
	    				}
	    				if(winxinNo == 1){
	    					nui.alert('不能对未绑定的用户进行更新操作！');
	    					return;
	    				}else{
	    					nui.get("updateWXBtn").disable();
			    			var json = nui.encode({"Wx": rows});
	    					form.loading("微信企业号账号更新中...");
				    		nui.ajax({
			        			url: "com.primeton.eos.ame_common.ameAttendance.updateOutPersonWx.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.result == "1"){
             							alert("数据更新失败！");
             							nui.get("updateWXBtn").enable();
             							form.unmask();
             							return;
             						}else{
             							alert("数据更新成功！");
             							nui.get("updateWXBtn").enable();
             							grid.load();
             							form.unmask();
             						}
             					},
         						error: function () {
                					alert("error");
                					form.unmask();
                				}
                			});
	    				}
	    			}
	    		});
	    	}else{
	    		nui.alert("请选择记录！");
			}
		}
		
		
		
	function deleteWXQYZH(){
			var rows = grid.getSelecteds();
	    	if(rows != "" && rows != null){
	    		var titleName = "";
	    		var winxinNo="";
    			titleName = "确定要删除微信企业号账号吗？";
	    		nui.confirm(titleName,"操作提示",function(action){
	    			if(action == "ok"){
	    				for(var j = 0;j < rows.length;j ++){
	    					if(!rows[j].weixinid){
	    						winxinNo=1;
	    					}
	    					if(rows[j].status=='3'){
	    						winxinNo=1;
	    					}
	    				}
	    				if(winxinNo == 1){
	    					nui.alert('不能对未绑定的用户进行删除操作！');
	    					return;
	    				}else{
	    					nui.get("deleteWXBtn").disable();
			    			var json = nui.encode({"Wx": rows});
	    					form.loading("微信企业号账号删除中...");
				    		nui.ajax({
			        			url: "com.primeton.eos.ame_common.ameAttendance.deleteOutPersonWx.biz.ext",
			                	data: json,
			                	type: 'POST',
			                	cache: false,
			                	contentType: 'text/json',
			                	success: function (o) {
			                		if(o.result == "1"){
             							alert("数据删除失败！");
             							nui.get("deleteWXBtn").enable();
             							form.unmask();
             							return;
             						}else{
             							alert("数据删除成功！");
             							nui.get("deleteWXBtn").enable();
             							var json = "";
										nui.ajax({
							                url: "com.primeton.eos.ame_common.ameAttendance.initOutPersonWxList.biz.ext",
							                type: "post",
							                data: json,
							                cache: false,
							                contentType: 'text/json',
							                success: function (o) {
							             		if(o.result == "1"){
							             			alert("数据初始化失败！");
							             			form.unmask();
							             			return;
							             		}else{
							             			alert("数据初始化成功！");
							             			search();
							             			form.unmask();
							             		}
							             	},
							         		error: function () {
							                	alert("error");
							                	form.unmask();
							                }
							            });
             						}
             					},
         						error: function () {
                					alert("error");
                					form.unmask();
                				}
                			});
	    				}
	    			}
	    		});
	    	}else{
	    		nui.alert("请选择记录！");
			}
		}	
		
		
		
		
		
</script>
</body>
</html>