<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@include file="/ame/clipview/common.jsp"%>
<html lang="en" class="no-js">
<!-- 
  - Author(s): xupc
  - Date: 2020-02-10 16:52:13
  - Description:
-->
<head>
    <title>招聘专员面板</title>
<!-- <style type="text/css">
.fs-wrap{position:absolute;display:inline-block;width:160px;margin: -30px 0px 0px 53.5%;font-size:12px;padding:4;line-height:1}
</style> -->
</head>
<body>
<div >
<div style="background-color: white;padding-left:25px;padding-top:10px;padding-bottom:10px;padding-right: 25px;" >
	<div class="row" id="windowContent"></div>
</div>		
</div>	

<script src="assets/js/main.js"></script>
<script src="assets/js/bootstrap-tab.js"></script>
<script src="assets/js/sidebar-menu.js"></script>
<script src="assets/js/tasklist.js"></script>
<script src="assets/js/fast-menu.js"></script>
<script src="assets/js/bootstrap-table.min.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<script src="assets/js/bootstrap-table-mobile.min.js"></script>
<script src="assets/plugins/fullcalendar/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript">
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
		Map attr = user.getAttributes();
		DataObject[] roles = (DataObject[])attr.get("roles");
		
		Boolean isRecruit_buss_syq = false;	//是否业务线招聘（事业群）
		Boolean isRecruit_buss_syb = false; //是否业务线招聘（事业部）
		Boolean isRecruitteam = false; //是否招聘组
		
		for(int i=0;i < roles.length;i++){
			if(roles[i].getString("roleid").equals("recruitteam")){
				isRecruitteam = true;
			} 
			if(roles[i].getString("roleid").equals("recruit_buss_syq")){
				isRecruit_buss_syq = true;
			}
		   	if( roles[i].getString("roleid").equals("recruit_buss_syb")){
				isRecruit_buss_syb = true;
			}
		 }
	%>
	var isRecruitteam = "<%=isRecruitteam %>"; 
	var isRecruit_buss_syq = "<%=isRecruit_buss_syq %>";
	var isRecruit_buss_syb = "<%=isRecruit_buss_syb %>";
	
	var RecruitRole;
	if(isRecruitteam == 'true'){
	    var RecruitRole = "recruitteam,recruit_buss_syq,recruit_buss_syb";
	} 
	if(isRecruit_buss_syq == 'true'){
	    var RecruitRole =  "recruit_buss_syq";
	}
	if(isRecruit_buss_syb == 'true'){
	    var RecruitRole = "recruit_buss_syb";
	}
	if(isRecruitteam != 'true' && isRecruit_buss_syb != 'true' && isRecruit_buss_syq != 'true'){
	    var RecruitRole = "recruitteam,recruit_buss_syq,recruit_buss_syb";
	}
	var jiazai_flag = true;
	var date = formatDate(new Date());
	var nowusername = '<%=nowusername %>';
	var nowuserid = '<%=nowuserid %>';
	$(document).ready(function() {
	    Main.init(); 
	});
    loadWindow();
	function loadWindow(){
    	var data = [
    	            {windowname:"招聘日历 ",windowtype:"workTt",windowurl:"/ame/clipview/recruitWorkt.jsp",windowwidth:"col-sm-6"},
    	            {windowname:"当日的面试和入职人员名单",windowtype:"myInterview_Intendjoin",windowurl:"/ame/clipview/myInterview_Intendjoin.jsp",windowwidth:"col-sm-6"},
	    			{windowname:"由我负责的招聘需求",windowtype:"myRecruit",windowurl:"/ame/clipview/myrecruit.jsp",windowwidth:"col-sm-6"},
	    			{windowname:"招聘待办列表",windowtype:"myRecruitTask",windowurl:"/ame/clipview/myRecruitTask.jsp",windowwidth:"col-sm-6"},
	    			{windowname:"员工内推简历",windowtype:"ReferrerResume",windowurl:"/ame/clipview/empReferrerResume.jsp",windowwidth:"col-sm-12"}
    			   ];
    	 if (data.length > 0){
				$.each(data,function(i){
		    		loadIndexMenu(data[i]);
		    	});
    	 }
    }
    //加载首页窗口
	function loadIndexMenu(data){
		var type = data.windowtype;
		var html = "";
		html += '<div class="'+data.windowwidth+' remove">';
		html += '<div class="panel panel-default"><div class="panel-heading">';
		if(type == 'workTt'){
			html += '<i class="clip-calendar" ></i>'+data.windowname+ '<select id="recruiter" class="recruiter"  onChange="selectRecruiters()"> </select>';
			getOpeatorSelectAuth("recruiter");
		}else if(type == "myRecruitTask"){
			html += '<i class="fa fa-list-ol"></i>'+data.windowname;
		}else if(type == "myInterview_Intendjoin"){
			html += '<i class="fa fa-list-ol"></i><div id="Interview_Intendjoin">'+data.windowname+'</div>';
		}else if(type == "myRecruit"){
			html += '<i class="fa fa-list-ol"></i>'+data.windowname;
		}else if(type == "ReferrerResume"){
		    html += '<i class="fa fa-list-ol"></i>'+data.windowname;
		}
		html += '<div class="panel-tools">';
		html += '<a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a>';
		html += '</div></div>';
		html += '<div class="panel-body panel-scroll" id="'+type+'" style="padding: 0;margin: 10px;height:400px;"></div></div></div>';
		var src = "<%=request.getContextPath()%>"+data.windowurl;
		$("#windowContent").append(html);
		if(type == 'workTt'){
			var str = '<iframe src="'+src+'" id="ifrmid" frameborder="0" width="100%" height="400px"></iframe>' 
			$("#"+type).html(str).attr("class","panel-body");//取消滚动条
		}else{
			$("#"+type).load(src,data,function(result){
				if(type == "myRecruitTask"){
					loadMytask();
					//每五分钟刷新一次待办任务
					window.setInterval(loadMytask,300000);
				}else if(type == 'myInterview_Intendjoin'){
					loadMyinterview_intendjoin(date,nowuserid);
				}else if(type == 'myRecruit'){
					loadMyrecurit();
				}else if(type == 'ReferrerResume'){
				    loadempReferrerResume();
				}
			});
		}
	}
	function formatDate(date){
	    var y = date.getFullYear();
	    var m = date.getMonth()+1;
		var d = date.getDate();
		if(m<10) m = "0" + m;
		if(d<10) d = "0" + d;
		return y+"-"+m+"-"+d
	}
	function selectRecruiter(classname){
	$("."+classname).ySelect(
				          {
				            placeholder: '招聘专员筛选',
				            searchText: '搜索',
				            showSearch: true,
				            numDisplayed: 4,
				            overflowText: '已选中 {n}个招聘专员',
				            isCheck:false
				          }
				      );
	}
	//查招聘组成员
    function getRecruiters(){
        var json =  nui.encode({criteria:{_expr:[{_property:"roleid",_op:"in",_value:RecruitRole}]},sortField:'operatorname',sortOrder:'asc'});
        $.ajax({
            url:"org.gocom.abframe.rights.role.AssignRoleOperator.queryNewOperators.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var data = text.operList;
            	var h = "";  
                $.each(data, function(key, value) {
                    h += "<option value='" + value.userid + "'>" + value.operatorname //下拉框序言的循环数据
                    + "</option>";  
                }); 
                $('#recruiter').attr("multiple","multiple");//弱化页面的渲染导致的不美观
                $("#recruiter").append(h);//append 添加进去并展示
                $("#recruiter option[value= '" +nowuserid +"']").attr('selected', true);
                selectRecruiter('recruiter');
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
     }
     //查询招聘组成员数据   
     function selectRecruiters(){
             /*var items = new Array();
             var strArr = '';
             var string;
              items = $("#recruiter option:selected");
             for(var i = 0;i<items.length;i++){
			    itemTitle = items[i].value + ',';
			    var strArr = strArr + itemTitle;
	         }
	         var userids = strArr.substring(0, strArr.lastIndexOf(',')); 
	         if(userids == null || userids == ''){
	            return;
	         } */
	         var userids = $('#recruiter').val() == null?null:$('#recruiter').val().join(","); 
	         if(jiazai_flag){
	         
		         }else{
		            var app = document.getElementById('ifrmid').contentWindow.app;
		            app.userid = userids;
		            app.dataa(app.currentYear,app.currentMonth,app.userid); 
		            loadMyinterview_intendjoin(date,app.userid);
		          /*  app.pickNext(app.currentYear,app.currentMonth,userids); */
		     }
		     jiazai_flag = false;
    }
    /////获取操作按钮权限
	function getOpeatorSelectAuth(funccode){
		var json = {funccode:funccode};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getOperatorButtonAuth.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.authfunc.length == 0){
					 getRecruiters(); 
				}else{
					 $("#recruiter").hide(); 
					     
				}
			}
		})
	}
</script>
</body>
</html>