<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuan
  - Date: 2019-03-22 15:11:04
  - Description:
-->
<head>
<title>我申请的会议（可以操作）</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>

<style>
	.right8{
		margin-right:8px;
	}
</style>
<% 
	UserObject user = (UserObject)session.getAttribute("userObject");
	String nowuserid = user.getUserId();
	String nowusername = user.getUserName();
	Map attr = user.getAttributes();
	DataObject[] roles = (DataObject[]) attr.get("roles");
	Boolean isAllControl = false;
	Boolean isMicroControl = false;
	for(int i=0;i<roles.length;i++){
		String rolesTemp = roles[i].getString("roleid");
		if(rolesTemp.equals("COO")||rolesTemp.equals("prodGeneral")||rolesTemp.equals("ORGMANAGER")||rolesTemp.equals("general")||rolesTemp.equals("eosadmin")){
			isAllControl=true;
		}else if(rolesTemp.equals("commerce")||rolesTemp.equals("assistant")||rolesTemp.equals("sale_assistant")||rolesTemp.equals("viceGeneral")){
			isMicroControl=true;
		}
	}
%>
<body>
	<div class="mini-panel" title="我的会议申请" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<input class="nui-hidden" name="criteria._entity" value="com.primeton.eos.ame_dailyoffice.hygl.AmeHysq"/>
				<input class="nui-hidden" name="criteria._expr[8].fqrid" value="<%=nowuserid %>"/>
				<table style="width:100%;">
					<tr>
						<td align="right"><span>会议主题：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="hyzt"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
																	
						<td align="right"><span>会议类型：</span></td>
		            	<td align="left">
		            		<input style="width:220px;" showNullItem="true" class="nui-dictcombobox" value="" name="criteria._expr[2]._value" dictTypeId="HYGL_HYSQ_HYLX" />
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="hylx"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right"><span>会议室：</span></td>
		            	<td align="left">
						    <input style="width:220px;" showNullItem="true" class="nui-dictcombobox" value="" name="criteria._expr[3]._value"
										 dataField="hysxxList" textField="hysmc" valueField="hysid" url="com.primeton.eos.ame_dailyoffice.Hysxx.queryHysxxList.biz.ext" 
										 />
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="hysid"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
					</tr>
					
					<tr>
						<td align="right"><span>开始日期：</span></td>
		            	<td align="left">
						    <input class="mini-datepicker" style="width:220px;" nullValue="null" format="yyyy-MM-dd" 
							showTime="false" showClearButton="false" name="criteria._expr[4]._value"/>
							<input class="nui-hidden" name="criteria._expr[4]._property" value="hykssj"/>
						    <input  class="nui-hidden" name="criteria._expr[4]._op" value=">="/>
						</td>	
						<td align="right"><span>结束日期：</span></td>
		            	<td align="left">
						    <input class="mini-datepicker" style="width:220px;" nullValue="null" format="yyyy-MM-dd" 
							showTime="false" showClearButton="false" name="criteria._expr[7]._value"/>
							<input class="nui-hidden" name="criteria._expr[7]._property" value="hyjssj"/>
						    <input  class="nui-hidden" name="criteria._expr[7]._op" value="<="/>
						</td>	
					</tr>	
					<tr>
						<td align="right"><span>主持人：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-textbox"  style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="zcrmc"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
						<td align="right"><span>申请人所在部门：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-combobox" id="orgid2" textField="orgname" valueField="orgid" dataField="orgs" showNullItem="true" allowInput="true" style="width:220px;"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="fqrjgid"/>
						</td>
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;" id="BtnControl">
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="cancelMeetings()">批量取消会议</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:320px;" allowResize="true" dataField="data"
	    url="com.primeton.eos.ame_dailyoffice.Hysxx.queryHycxList.biz.ext" sizeList="[10,20,50,100,200,500,1000]"  idField="hysqid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="6"></div> 
				<div type="indexcolumn" align="center" headerAlign="center" width="6">编号</div>
				<div align="center" headerAlign="center" width="12" renderer="getSelect">操作</div>
				<div field="hyzt" width="12" align="center" headerAlign="center" allowSort="true" renderer="getDetail">会议主题</div>
				<div field="hykssj" width="12" align="center" headerAlign="center" allowSort="true" renderer="onBirthdayRenderer">会议开始时间</div>
				<div field="hyjssj" width="12" align="center" headerAlign="center" allowSort="true" renderer="onBirthdayRenderer">会议结束时间</div>	
				<div field="fqrmc" width="12" align="center" headerAlign="center" allowSort="true">发起人</div>		
				<div field="fqrjgmc" width="12" align="center" headerAlign="center"allowSort="true">发起部门</div>
				<div field="hysmc" width="12" align="center" headerAlign="center"allowSort="true" >会议室</div>		
				<div field="hylx" width="12" align="center" headerAlign="center" allowSort="true" renderer="hyType">会议类型</div>
				<div field="hysqsj" width="12" align="center" headerAlign="center" allowSort="true">会议发起日期</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    	nui.parse();
    	
    	var isAllControl = <%=isAllControl %>;
    	var isMicroControl = <%=isMicroControl %>;
    	var userid = "<%=nowuserid %>";
 		<!--document.getElementById("BtnControl").style.display="none";	-->
		
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	grid.load(form.getData());
    	
    	//会议类型业务字典
    	function hyType(e) {	
			return nui.getDictText('HYGL_HYSQ_HYLX',e.value);//设置业务字典值		
		}
    	
    	init();
    	function init(){
    		var userid = "<%=nowuserid %>";
    		//初始化有权的机构
			//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"queryPurRequest","map":{"property":"status","op":"=","value":"running"}};
    		//初始化事业部
			nui.ajax({
                url: "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
                type: "post",
                cache: false,
                data:json,
                contentType: 'text/json',
                success: function (text) {
                	if(text.orgs){
						nui.get("orgid2").setData(text.orgs);
                	}
	    		}
	    	});
		}
    		
    		
    		
    		
		function dictyzlx(e) {
			return nui.getDictText('AME_YZSQ',e.value);//设置业务字典值
		}
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data);
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load(form.getData());
		}
		function add() {        	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/createSealUse.jsp",
                title: "新增会议使用单", 
				width: 1100,
	            height: 600,
                onload: function () {
               	 //页面提供“发起采购合同流程”按钮
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.init(data);
                },
                ondestroy: function (action) {
                    grid.load({fqrid:userid});
                }
            });
        }

        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        
        function getSelect(e){
        	// 如果当前时间大于会议结束时间 则表示会议已结束  如果会议开始时间大于当前时间 则会议还没开始
            var dKsTime = new Date(e.row.hykssj).getTime();
            var dJsTime = new Date(e.row.hyjssj).getTime();
			var dateTime = new Date().getTime();
			var str="<a class='right8' href='javascript:void(0)' onclick='cancelMeetting("+JSON.stringify(e.row)+");'>取消会议</a>"+
					"<a href='javascript:void(0)' onclick='endMeetting("+JSON.stringify(e.row)+");'>结束会议</a>";
			
			// 会议结束时间小于当前时间 则不显示按钮
			if(dateTime>=dJsTime){
				str="";
			}else if(dateTime <= dKsTime){ // 会议开始时间大于当前时间 则只显示“取消会议”按钮
				str="<a class='right8' href='javascript:void(0)' onclick='cancelMeetting("+JSON.stringify(e.row)+");'>取消会议</a>";
			}
        
        	return str;
        }
        
        function checkDetail(){
	 		var selectRow = grid.getSelected();//127.0.0.1:8080/default/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp
			var executeUrl = "<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp?hysqid=" + selectRow.hysqid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			nui.open({
	            url: executeUrl,
	            title: "会议信息", 
				width: 1100,
	            height: 600,
	            onload: function () {
	            },
	            ondestroy: function (action) {
	            	//window.location.reload();
	            }
	        });
			//window.open(executeUrl, "申请单详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
	    }
	    
	    // 格式化日期
	    function onBirthdayRenderer(e) {
            var value = e.value;
            if (value) return nui.formatDate(value, 'yyyy-MM-dd HH:mm');
            return "";
        }
        //批量取消会议
        function cancelMeetings(){
        	var rows = grid.getSelecteds();
        	if(rows.length == 0){
        		alert("未选择会议，请重新选择！");
        		return;
        	}
        	nui.confirm("确定取消这些会议？","",function(action){
        		if(action=="ok"){
        			var flag = true;
		        	for(var i = 0; i < rows.length; i++){
		        		var row = rows[i];
		        		var d_ks_time = new Date(row.hykssj).getTime();
		        		var d_js_time = new Date(row.hyjssj).getTime();
		        		var d_cur_time = new Date().getTime(); 
		        		if(d_ks_time < d_cur_time ){
		        			flag = false;break;
		        		}
		        	}
		        	if(flag){
		            var param={hysq:rows};
		        	nui.ajax({
		                url: "com.primeton.eos.ame_dailyoffice.Hysxx.deleteHysq.biz.ext",
		                type: "post",
		                data: param, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	if(text.flag ==true){
			                	nui.alert("取消成功！");
			                	grid.reload();
		                	}else{
		                		nui.alert("取消失败！");
		                	}
		                },
		                error: function () {
		                	nui.alert("取消失败！");
		                }
		             });
		        	}else{
		        		alert("您所定的会议中，会议时间已过，请重新选择。");
		        	}
        		}
	         });
        }
        
        // 取消会议
        function cancelMeetting(e){
            nui.confirm("确定取消这条会议？","",function(action){
	            if(action=="ok"){
	                var hysqid=e.hysqid;
		            var param={hysq:{hysqid:hysqid}};
		        	nui.ajax({
		                url: "com.primeton.eos.ame_dailyoffice.Hysxx.deleteHysq.biz.ext",
		                type: "post",
		                data: param, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	if(text.flag ==true){
			                	nui.alert("取消成功！");
			                	grid.reload();
		                	}else{
		                		nui.alert("取消失败！");
		                	}
		                },
		                error: function () {
		                	nui.alert("取消失败！");
		                }
		             });
	              }
	           });
        }
        
        // 结束会议
        function endMeetting(e){
        	// 会议开始时间要小于系统当前时间
            var dKsTime = new Date(e.hykssj).getTime();
			var date = new Date().getTime();
			if(date <= dKsTime){
				nui.alert("请取消会议，或者等待开始会议！");
				return;
			}
        
            var hysqid=e.hysqid;
            var param={hysqid:hysqid};
            
            nui.confirm("确定结束此会议？", "确定？",
	            function (action) {
	                if (action == "ok") {
	                    nui.ajax({
			                url: "com.primeton.eos.ame_dailyoffice.Hysxx.updateHyjssj.biz.ext",
			                type: "post",
			                cache: false,
			                data:param,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.flag ==true){
				                	nui.alert("结束成功！");
				                	grid.reload();
			                	}else{
			                		nui.alert("结束失败！");
			                	}
			                },
			                error: function () {
			                	nui.alert("结束失败！");
		                    }
			            });
	                } 
	            }
	        );
        }
  </script>
</body>
</html>