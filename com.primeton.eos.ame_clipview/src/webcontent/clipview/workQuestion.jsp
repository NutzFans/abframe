<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<%-- 
  - Author(s): 张一博
  - Date: 2017-09-22 11:25:47
  - Description:首页工时疑问查询
--%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>首页工时疑问查询</title>
</head>
<body>
	<table class="table table-striped table-hover table-responsive" id="quest">
		<thead>
			<tr>
				<th data-field="userName" data-align="center">填报人</th>
				<th data-field="orgname" data-width="90px" data-align="center">受益部门</th>
				<th data-field="benefconfq" data-align="left" data-halign = "center">受益确认疑问</th>
				<th data-field="benefconfr" data-align="left" data-halign = "center">受益疑问反馈</th>
				<th data-field="laborDate" data-width="90px" data-formatter ="view" data-align="center">填报日期</th>
			</tr>
		</thead>
		<tbody class = "left">
			
		</tbody>
	</table>
</body>
<script type="text/javascript">
	//加载我的工时疑问
 	function myQuestion(){
 		//遮罩
 	    var el = $('#quest').parents(".panel");
        el.block({
			overlayCSS: {
            backgroundColor: '#fff'
            },
            message: '<img src="assets/images/loading.gif" /> Just a moment...',
            css: {
            	border: 'none',
            	color: '#333',
                background: 'none'
            }
        });
 		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String nowuorgname = user.getUserOrgName();
    		Map attr = user.getAttributes();
    		Map map = new HashMap();
    		Boolean rolesroleids = false;	//是否是事业部助理
    		Boolean sybsorgids = false;		//是否事业部领导
    		Boolean isPMO = false; //是否PMO
    		Boolean isSales = false; //是否销售
    		Boolean isFin = false; //是否财务
    		//角色
    		DataObject[] roles = (DataObject[])attr.get("roles");
			for(int i=0;i < roles.length;i++){
				if(roles[i].getString("roleid").equals("assistant") || 
					roles[i].getString("roleid").equals("HDJRZL") ){
					rolesroleids = true;
				}
				if(roles[i].getString("roleid").equals("PMO")){
					isPMO = true;
				}
				if(roles[i].getString("roleid").equals("sales")){
					isSales = true;
				}
				if(roles[i].getString("roleid").equals("general") || 
				   roles[i].getString("roleid").equals("viceGeneral")){
				   	sybsorgids = true;
			   	}
			   	if(roles[i].getString("roleid").equals("finance")){
					isFin = true;
				}
			}
    	%>
    	//人员id
    	var userid = "<%=nowuserid %>";
    	//人员姓名
    	var username = "<%=nowusername %>";
    	//所属部门
    	var orgname = "<%=nowuorgname %>";
    	//是否事业部助理
    	var rolesroleids = "<%=rolesroleids %>";
    	if(rolesroleids=='true'){
    		$("#headText").text('本部门的疑问工时');
    		$("panel-body").parents("workQ").show();
    		var data = {userid:userid};
	        var json1 = nui.encode(data);
	        var syblist='';
	        //查询自己所在的事业部
	        nui.ajax({
				type:"POST",
				data:json1,
				async:false,
				url:'com.primeton.rdmgr.labor.queryRdLaborDetail.getSYB.biz.ext',
				success:function(data){
					if(data.syb.length > 0){
	    				for(var i=0;i<data.syb.length;i++){
	    					if(i == 0){
	    						syblist = data.syb[i].orgid;
	    					}else{
	    						syblist = syblist+','+data.syb[i].orgid;
	    					}
	    				}
	            	}else{
	            		syblist=userid;
	            	}
				},error:function(data){}
			});
    		var json = ({
    					"criteria":{"_expr[0]":{"_property":"status","_op":"=","_value":2},
	        						 "_expr[1]":{"_property":"orgid","_op":"in","_value":syblist}
	        						},
					  	 sortField:'benefconftime',sortOrder:'desc'
						});
	        request(json,el);					  
    	}else{
    		$("#headText").text('我的疑问工时');
    		var json = ({
    					"criteria":{"_expr[0]":{"_property":"userId","_op":"=","_value":userid},
	        						 "_expr[1]":{"_property":"status","_op":"=","_value":2}},
	        			sortField:'benefconftime',sortOrder:'desc'
	        			});
	       	request(json,el);
		}
		
	}
	//数据请求
	function request(aaa,bbb){
		 nui.ajax({
			type:"POST",
			data:aaa,
			url:'com.primeton.rdmgr.labor.input.rdlabordetailbiz.queryRdLaborDetails.biz.ext',
			success:function(data){
		   		var datalist = data.rdlabordetails;
		     	$('#quest').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist,   //datalist 即为需要的数据
					dataType:'json',
			      	data_locale:"zh-US",  //转换中文 但是没有什么用处
			      	pagination: false,
			      	pageList:[],
			      	pageNumber:1,
			      	paginationLoop:false,
		     	});
			    $('#menutask').empty();
			    $('#menutask').task({
					//data:nui.encode(o.data)
					data:data.tasks
				})
				//遮罩消失
				bbb.unblock();
			},error:function(data){}
		});
	}
	//给日期添加链接
	function view(e,row){
		return "<a href='javascript:void(0)' onclick='openWindow("+row.laborDetailId+");' title='点击查看'>" + e + "</a>";
	}
	function openWindow(data){
		var url = "<%=request.getContextPath() %>/labor/queryRdLaborDetail/editDoubtfulRdLaborDetail.jsp?laborDetailId="+data;
		nui.open({
            url: url,
            title: "工时编辑信息", 
            width: 1000, 
            height: 500,
            onload: function () {

            },
            ondestroy: function () {
        		myQuestion();
            }
        });
	}
</script>
</html>