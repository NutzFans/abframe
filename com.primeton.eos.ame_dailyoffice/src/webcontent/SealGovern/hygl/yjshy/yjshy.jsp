<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@include file="/coframe/tools/skins/common.jsp"%>
<html>
<!-- 
  - Author(s): chen_guang
  - Date: 2017-08-15 17:15:32
  - Description:未批件查询
-->

<!-- 2017-12-22 wuguang  获取当前用户信息-->
<% 
	UserObject userObject = (UserObject)request.getSession().getAttribute("userObject");
%>

<head>
<title>已结束会议</title>
<%@include file="/index/base/bootstrap.jsp"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link href="<%=request.getContextPath()%>/style/queryPage-<%=theme%>.css" rel="stylesheet" type="text/css">
<style type="text/css">
	html,body{
		font-size:16px!important;
	}
	.mainContent label {
	    color: #333;
	    font-weight: 500;
	    font-size: 0.875rem;
	    vertical-align: middle;
	    margin: 0px;
	    width: 70px;
	    text-align: justify;
	    text-align: center;
	    text-align: justify;
	    text-justify: distribute-all-lines;
	    text-align-last: justify;
	}
	#resultListHead{
		position:fixed;
		top:0;
		z-index:9;
		display:none;
	}
	#resultListHead th{
		border-bottom:solid 1px #ddd;
	}
	
	#resultListHead th div{
		text-align:center;
	}
	
	.showFoot{
		position:fixed;
		bottom:0;
		background:#fff;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="mainContent">
			<div class="searchInfo">
				<div class="title">已结束会议</div>
				<!-- wuguang,2017-11-23,将搜索交互方式改成统一的样式 -->
				<div class="inner-box normal">
					<div class="normalSearch">
						<label for="search-input">搜索：</label> 
						<input id="search-input" placeholder="请输入主题关键字">
						<span class="search-btn active" onclick="keywordSearch()">
							<img src="<%=request.getContextPath()%>/index/officialDocument/officeQuery/images/ic_search_n.png">搜索
						</span>
					</div>
					<span class="search-btn" onclick="showDetailSearch(this)" style="float: left;">高级搜索</span>
				</div>
				<div id="keywordForm" class="nui-form" align="center" style="height: 100%">
					<!-- 数据实体的名称 -->
					<input class="nui-hidden" name="criteria/_entity" value="com.geostar.gtgh.oa.officeaffairs.affairsdataset.myHysq">
					<input name="criteria/_expr[7]/hyzt" class="nui-hidden"/>
				    <input class="nui-hidden" name="criteria/_expr[7]/_op" value="like"/>
				    <input  class="nui-hidden" name="criteria/_expr[7]/_likeRule" value="all"/> 
				</div>
				<div id="approvePendForm" class="nui-form" align="center" style="height: 100%">
					<div class="inner-box searchDetail">
						<!-- 数据实体的名称 -->
						<input class="nui-hidden" name="criteria/_entity" value="com.geostar.gtgh.oa.officeaffairs.affairsdataset.myHysq">
						<input type="hidden" class="nui-hidden" id="hideValue" name="" value="">
						<!-- 条件查询start -->
						<div class="search-box">
						<label for="search-input1">会议主题：</label> 
						<input name="criteria/_expr[1]/hyzt" class="nui-textbox"/>
				        <input class="nui-hidden" name="criteria/_expr[1]/_op" value="like"/>
				        <input  class="nui-hidden" name="criteria/_expr[1]/_likeRule" value="all"/> 
						</div>
						<div class="search-box">
						<label for="search-input2">会议室：</label> 
						<input class="nui-combobox"  url="com.geostar.gtgh.oa.officeaffairs.hysxx.queryHysxxList.biz.ext" name="criteria/_expr[2]/hysmc" 
									valueField="hysmc" emptyText="请选择会议室" textField="hysmc" showNullItem="true" nullItemText="全部" dataField="hysxxList"/>
								<input  class="nui-hidden" name="criteria/_expr[2]/_op" value="like"/>
								<input  class="nui-hidden" name="criteria/_expr[2]/_likeRule" value="all"/> 
						</div>
						<div class="search-box">
						<label for="search-input3">开始时间：</label> 
						<input class="mini-datepicker"  nullValue="null" 
        format="yyyy-MM-dd" showTime="false" showClearButton="false" name="criteria/_expr[3]/hykssj"/>
								<input  class="nui-hidden" name="criteria/_expr[3]/_op" value=">="/>
						</div>
						<div class="search-box">
						<label for="search-input3">结束时间：</label> 
						<input class="mini-datepicker"  nullValue="null"
        format="yyyy-MM-dd" showTime="false" showClearButton="false" name="criteria/_expr[4]/hyjssj"/>
								<input  class="nui-hidden" name="criteria/_expr[4]/_op" value="<="/>
						</div>
						
						<!-- wuguang,2017-11-23,已结束会议不需要根据审批状态查询 -->
						<!--<div class="search-box">
						<label for="search-input3">状态：</label> 
						<input class="nui-dictcombobox" name="spzt" valueField="dictID" emptyText="请选择审批状态" textField="dictName" showNullItem="true" nullItemText="全部" dictTypeId="RCBG_HYSQ_SPZT"/>
						</div>
						
						<input class="nui-hidden" name="criteria/_expr[5]/spzt"/>
								<input  class="nui-hidden" name="criteria/_expr[5]/_op" value="="/>
						<input name="criteria/_expr[6]/lczt" class="nui-hidden"/>
				        <input class="nui-hidden" name="criteria/_expr[6]/_op" value="="/>	-->			        
						<!-- 如果再添加条件下标请从7开始 -->
						<!-- 条件查询end-->
						<!-- 新增查询条件，_expr[]下标从7开始 -->
							
						<!-- <div class="search-box">
						<label for="search-input3">参会人：</label> 
						<input name="criteria/_expr[7]/hyzt" class="nui-textbox"/>
				        <input class="nui-hidden" name="criteria/_expr[7]/_op" value="like"/>
				        <input  class="nui-hidden" name="criteria/_expr[7]/_likeRule" value="all"/> 
						</div> -->	
										
						<div class="search-box">
							<!-- 条件查询end -->
							<a href="#" onclick="searchApprovePend();" class="searchBtn">查询</a> 
							<!-- wuguang,2017-11-23,将搜索交互方式改成统一的样式 -->
							<a href="#" onclick="reset()" class="resetBtn" style="background-color:#e4e4e4;">重置</a>
							<a href="#" class="resetBtn" onclick="returnSearch(this)">返回</a>
						</div>
					</div>
					
					
				</div>
			</div>
			<div class="searchTable">
				<div class="tableTitle">已结束会议</div>
				<div class="tableFixedHead bootstrap-table">
					<table id="resultListHead" class="table fixed-table-container" style="font-size: 0.9rem !important;width:100%;">
						<thead>
						</thead>
					</table>
				</div>
				<table id="resultList" style="font-size: 0.9rem !important; width:100%;"></table>
				<div id="tfootDiv" class="showFoot" style="display:none;"></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var contextPath='<%= request.getContextPath() %>';
		<!-- 2017-12-22 wuguang 获取当前登录用户id -->
		var userid = '<%= userObject.getUserId() %>';		 
	</script>
	 <script src="<%=request.getContextPath() %>/officeaffairs/hygl/yjshy/yjshy.js" type="text/javascript"></script>
</body>
</html>