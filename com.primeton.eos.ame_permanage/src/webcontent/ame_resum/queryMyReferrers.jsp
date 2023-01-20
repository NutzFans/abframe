<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-03-04 
  - Description:
-->
<head>
<title>我的内推人员信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<legend>我的内推</legend>
			<div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
			    <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td align="right" nowrap="nowrap">姓名:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[0]._value" id = "username">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="empname">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like">
							
							<input class="nui-hidden" name="criteria._expr[6]._property" value="referrer" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="="/>	
							<input class="nui-hidden" name="criteria._expr[6]._value" id="referrer" />
		        		</td>
		        		<td align="right" nowrap="nowrap">推荐日期:</td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-datepicker" id="min1" name="criteria._expr[1]._min" style="width:100px" dateFormat="yyyy-MM-dd H:mm:ss"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[1]._max" style="width:100px"  dateFormat="yyyy-MM-dd H:mm:ss"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="applydate"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td align="right" nowrap="nowrap">简历状态:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[2]._value" style="width:125px" id="jobscatagory" showNullItem="true"  dictTypeId="INTERVIEW_STATUS_OUT" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[2]._property" value="interviewstatus">
							<input class="nui-hidden" name="criteria._expr[2]._op"  value="in">
						</td>
					<tr>
		        		<td align="right" nowrap="nowrap">联系电话:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[3]._value" id = "tel">
							<input class="nui-hidden" name="criteria._expr[3]._property" value="tel">
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like">
		        		</td>
		        		<td align="right" nowrap="nowrap">期望职位名称:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[4]._value" id = "applyoccupation" style="width:204px">
							<input class="nui-hidden" name="criteria._expr[4]._property" value="applyoccupation">
							<input class="nui-hidden" name="criteria._expr[4]._op" value="like">
		        		</td>
		        		<td align="right" nowrap="nowrap">期望工作地点:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[5]._value" id = "announcecity">
							<input class="nui-hidden" name="criteria._expr[5]._property" value="announcecity">
							<input class="nui-hidden" name="criteria._expr[5]._op" value="like">
		        		</td>
					</tr>
	            	<tr>
	                    <td colspan="9" align="center">
				            <a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
							<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
				        </td>
	                </tr>
	            </table>  
	         </div>
		    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="resume_addBtn" iconCls="icon-add" onclick="addResume()" plain="true">我要内推</a>
		                        <a class="nui-button" id="resume_addBtn" iconCls="icon-search" onclick="queryRefferRecruits()" plain="true">查看当前内推岗位</a>
		                    </td>
		                </tr>
		             </table>           
		    </div>
		    <div id="searchResume" class="nui-datagrid"  allowResize="true" showSummaryRow="true"   ondrawsummarycell="onDrawSummaryCell"
				style="margin-top:0px;width: 100%;height:410px;" dataField="queryResume" sizeList="[10,20,50,100,200,500]" 
				url="com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext" 
				allowAlternating="true" pageSize="20" showPager="true" multiSelect="true">
					<div property="columns">
					<div field="empname" headerAlign="center" align="center" allowSort="true" width="50">被推荐人</div>
					<div field="tel" headerAlign="center" align="center" allowSort="true" width="100">联系电话</div>
					<div field="referrerstatus" headerAlign="center" align="center"width="85" renderer="ongenderreferrerStatus">HR是否确认</div>
					<div field="interviewstatus" headerAlign="center" align="center"width="80" renderer="ongenderinterviewStatus">简历状态</div>
					<div field="applyoccupation" headerAlign="center" align="center" allowSort="true" width="80">期望职位名称</div>
					<div field="announcecity" headerAlign="center" align="center" allowSort="true" width="90">期望工作地点</div>
					<div field="applydate" headerAlign="center" align="center" allowSort="true" width="80">推荐日期</div>
					<!--<div field="beneforgname" width="80" align="left" headerAlign="center" allowSort="true" >受益部门</div>-->
					<div field="totalrewardmoney" headerAlign="center" align="right" allowSort="true" width="70" dataType="currency" summaryType="sum" renderer="rewardmoneydetail">内推奖励</div>
					<div field="paymoney" headerAlign="center" align="right" allowSort="true" width="80" dataType="currency" summaryType="sum" >已发放金额</div>
					<div field="files1" renderer="onFileRenderer" width="250" align="left" headerAlign="center">附件</div>
				</div>
			</div>
		</div>	
   </div>  			
</body>
<script type="text/javascript">
	nui.parse();
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var grid=nui.get("searchResume");
	var form = new nui.Form("#form1"); 
	
	search();
	function search(){
	    nui.get("referrer").setValue('<%=nowuserid %>');
	    var data = form.getData();
        grid.load(data);
        grid.sortBy("lastupdate", "desc");
	}
	function reset(){
		form.reset();
		search();
	}
	//日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,18);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
		}
	}
	function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files1==null){
    		return;
    	}
    	if(e.record.files1.length == 1){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[0].fileId + "'>" + e.record.files1[0].fileName + "</a>";
    	}else{
	        for(var i=0;i<e.record.files1.length;i++){
	        	//长度大于1小于长度length换行
	        	if(i< e.record.files1.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[i].fileId + "'>" + e.record.files1[i].fileName + "</a>&nbsp;&nbsp;";
	        	}
	        	//最后一个不换行
        		if(i == e.record.files1.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[i].fileId + "'>" + e.record.files1[i].fileName + "</a>";
	        	}
	        }
    	}
       	return tempSrc;
     }
     function addResume(){
		nui.open({
            url: "<%=request.getContextPath() %>/ame_permanage/ame_resum/addResumByMyReferrers.jsp",
            title: "新增被推荐人信息", 
            width: 800, 
            height: 410,
            onload: function () {
            },
            ondestroy: function (action) {
        		grid.reload();
            }
        });
	}
    function ongenderinterviewStatus(e){
		return nui.getDictText('INTERVIEW_STATUS_OUT',e.value);//设置业务字典值
	}
	function ongenderreferrerStatus(e){
		return nui.getDictText('REFFER_STATUS',e.value);//内推简历是否确认
	}
	function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail(){
    	var row = grid.getSelected();
		var executeUrl = "/default/ame_permanage/ame_resum/detailofResume.jsp?action='update'&resumeid=" + row.resumeid;
		var iWidth=1200; //弹出窗口的宽度;
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    }
	function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    /* if (e.field == "beneforgname") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    } */
		    if (e.field == "totalrewardmoney") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "paymoney") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
	}
	//查看奖励金额明细
	function rewardmoneydetail(e){
	   if(e.value){
	      return "<a href='javascript:void(0)' onclick='getRewardmoneyDetail();' title='点击查看'>" + e.cellHtml + "</a>";
	   }else{
	      return 0;
	   }   
	}
	function getRewardmoneyDetail(resumeid){
	        var selectRow = grid.getSelected();
			nui.open({
                url: "/default/ame_permanage/ame_resum/queryRefferRewardmoneyDetail.jsp",
                title: "内推奖励金额明细", width: 600, height: 300,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {"resumeid": selectRow.resumeid,"empname":selectRow.empname};
                    iframe.contentWindow.setData(data); 
                },
                ondestroy: function (action) {
                }
            });
	} 
	function queryRefferRecruits(){
			nui.open({
                url: "/default/ame_permanage/ame_resum/queryRefferRecruits.jsp",
                title: "当前内推岗位列表", width: 980, height: 500,
                ondestroy: function (action) {
                }
            });
	}
</script>
</html>