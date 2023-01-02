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
<title>招聘简历推送记录查询与维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<legend>招聘简历推送记录查询与维护</legend>
			<div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="form1">
			    <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        	    <td align="right" nowrap="nowrap" style="width:90px;">需求编号</td>
		            	<td align="left" nowrap="nowrap">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="recruitno"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right">招聘职位:</td>
						<td align="left">
					        <input name="criteria._expr[3]._value" style="width:150px;" class="nui-textbox" allowInput="true" />
			            	<input class="nui-hidden" name="criteria._expr[3]._property" value="recpositionname"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
		        		<td  align = "right">招聘专员:</td>
				        <td align="left">
					       <!--  <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:150px;"/>
							<input class="nui-hidden" name="criteria._expr[2]._property" value="recempname"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/> -->
							
							<input class="nui-hidden" name="criteria._expr[2]._property" value="recuserid" />
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in" />
					        <input  id="recempname" class="mini-textboxlist"  name="criteria._expr[2]._value" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext" value="" text=""
							textField="EMPNAME" valueField="USERID" required="true" width="150px"/>
				        </td>
						 <td align="right" nowrap="nowrap">需求所属部门:</td>
		            	<td align="left" nowrap="nowrap">
						  	<input name="criteria._expr[1]._value" id="orgid" class="nui-combobox" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" 
							filterType="like" textField="orgname" valueField="orgseq" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:200px;" >
							<input class="nui-hidden" name="criteria._expr[1]._property" value="orgseq"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						</td>
					</tr>
					<tr>
					    <td  align = "right">招聘状态:</td>
				        <td align="left">
					        <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="RECRUIT_STATUS" shownullItem="true" multiSelect="true" style="width:120px;" value="0,1,5"/>
							<input class="nui-hidden" name="criteria._expr[4]._property" value="status"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
				        </td>
			          	<td align = "right">累计推送数量:</td>
			         	<td align="left">
							<input class="nui-textbox" name="criteria._expr[6]._min" style="width:72px"/>-<input class="nui-textbox" name="criteria._expr[6]._max" style="width:72px"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="recommendnums"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
			          	</td>
			          	<td align = "right">累计筛选数量:</td>
			         	<td align="left">
							<input class="nui-textbox" name="criteria._expr[7]._min" style="width:72px"/>-<input class="nui-textbox" name="criteria._expr[7]._max" style="width:72px"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="feedbacknums"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
			          	</td>
			          	<td align = "right">需求提出时间:</td>
			         	<td align="left">
							<input class="nui-datepicker" name="criteria._expr[5]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[5]._max" style="width:98px"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="propdate"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[5]._pattern" value="yyyy-MM-dd"/>
			          	</td>
					</tr>
					<tr>
					<td  align = "right">岗位级别:</td>
				        <td align="left">
					        <input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="JOB_LEVEL" shownullItem="true" multiSelect="true" style="width:120px;"/>
							<input class="nui-hidden" name="criteria._expr[8]._property" value="joblevel"/>
							<input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
				        </td>
				    </tr>    
					<tr>
					   <td align="center" colspan="15">
		            	<a class="nui-button" iconCls="icon-search" onclick="search()">查询</a>
		            	<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		     		   </td>
                    </tr>
	            </table>  
	       </div>
		   <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			    <table style="width:100%;">
			        <tr>
			            <td align="left">
			                <!-- <a  id="addbutton" class="nui-button" iconCls="icon-add" onclick="addRecord()">新增简历推送记录</a> -->
			                <a class="nui-button" id="editRecord" iconCls="icon-add" onclick="editRecord()">新增简历推送记录</a>
			                <a class="nui-button"  iconCls="icon-download" onclick="expqueryRecord()">导出推送记录明细</a>
			            </td>
			        </tr>
			     </table> 
			</div>
		    <div id="records" class="nui-datagrid"  allowResize="true" showSummaryRow="true" allowCellSelect="true" allowAlternating="true" allowCellEdit="true" 
				style="margin-top:0px;width: 100%;height:410px;" dataField="records" sizeList="[10,20,50,100,200,500]" frozenStartColumn="0" frozenEndColumn="5"
				url="org.gocom.abframe.org.recruit.queryOmRecruitRecords.biz.ext" ondrawsummarycell="onDrawSummaryCell"
				pageSize="20" showPager="true">
				  <div property="columns">
				  <div type="checkcolumn"></div>	
					<div field="recruitno" width="70" headerAlign="center" align="center" renderer="getDetail" allowSort="true">需求编号</div>
					<div field="joblevel" width="80" align="center" headerAlign="center" allowSort="true" renderer="getJoblevel">岗位级别</div>
					<div field="recpositionname" width="120" align="left" headerAlign="center" allowSort="true">招聘职位名称</div>
					<div field="recnum" width="60" align="right" headerAlign="center" allowSort="true">招聘数量</div>
					<div field="recommendnums" width="80" align="right" headerAlign="center"summaryType="sum" allowSort="true">累计推送数量</div>
					<div field="feedbacknums" width="80" align="right" headerAlign="center"  summaryType="sum" allowSort="true">累计筛选数量</div>
					
					<div field="prefirstinterviewnums" width="80" align="right" headerAlign="center" summaryType="sum" allowSort="true">预约初试人数</div>
					<div field="firstinterviewnums" width="75" align="right" headerAlign="center"   summaryType="sum" allowSort="true">初试人数</div>
					<div field="prereinterviewnums" width="80" align="right" headerAlign="center" summaryType="sum" allowSort="true">预约复试人数</div>
					<div field="reinterviewnums" width="75" align="right" headerAlign="center"  summaryType="sum" allowSort="true">复试人数</div>
					<div field="sendoffers" width="75" align="right" headerAlign="center"   summaryType="sum" llowSort="true">发出offer</div>
					<div field="acceptoffers" width="75" align="right" headerAlign="center" summaryType="sum" allowSort="true">接受offer</div>
					<div field="refuseoffers" width="75" align="right" headerAlign="center" summaryType="sum" allowSort="true">拒绝offer</div>
					<div field="giveupoffers" width="75" align="right" headerAlign="center" summaryType="sum" allowSort="true">放弃录用</div>
					<div field="intendjoins" width="75" align="right" headerAlign="center"  summaryType="sum" allowSort="true">已入职人数</div>
					<div field="preintendjoins" width="75" align="right" headerAlign="center" summaryType="sum" allowSort="true">待入职人数</div>
					<div field="refuseintendjoins" width="75" align="right" headerAlign="center" summaryType="sum" allowSort="true">放弃入职人数</div>
					<div field="unfinishnum" width="75" align="right" headerAlign="center"  summaryType="sum" allowSort="true">未完成人数</div>
					
					
					<div field="propdate" width="80" align="center" allowSort="true" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">需求提出时间</div>
					<!-- <div field="recommendnum" width="60" align="right" headerAlign="center"summaryType="sum" >推送数量
					   <input property="editor" class="nui-textbox" onblur="validate('recommendnum')"/>
					</div>
					<div field="feedbacknum" width="60" align="right" headerAlign="center"  summaryType="sum" >筛选数量
					   <input property="editor" class="nui-textbox" onblur="validate('feedbacknum')"/>
					</div>
					<div field="recommenddate" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:ss" renderer="dealdate1">推送时间
					   <input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd HH:ss"/>
					</div>
					<div field="feedbackdate" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:ss" renderer="dealdate1">筛选时间
					   <input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd HH:ss"/>
					</div>
					<div field="createdate" width="100" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:ss" renderer="dealdate">创建时间
					   <input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd HH:ss"/>
					</div> -->
					<div field="syqname" width="90" align="left" headerAlign="center" allowSort="true" allowSort="true">一级部门</div>
					<div field="orgname" width="120" align="left" headerAlign="center" allowSort="true">招聘部门</div>
					<div field="recempname" width="80" align="center" headerAlign="center" allowSort="true">招聘专员</div>
					<div field="interempname" width="80" align="center" headerAlign="center" allowSort="true">主考官</div>
					<div field="status" width="60" align="center" headerAlign="center" renderer="getStatus" allowSort="true">招聘状态</div>
					
				  </div>
				</div>  
			</div>
	  </div>	
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form> 	  
</body>
<script type="text/javascript">
	nui.parse();
	var grid=nui.get("records");
	var form = new nui.Form("#form1"); 
	search();
	function search(){
	    var data = form.getData();
        grid.load(data);
        grid.sortBy("propdate","desc");
	}
	function reset(){
		form.reset();
		search();
	}
    //新增简历推荐记录
	function addRecord(){
		nui.open({
            url: "/default/abframe/org/recruit/omRecruitRecommendRecord.jsp",
            title: "新增简历推荐记录", 
            width: 800,
			height: 540,
            onload: function () {
            },
            ondestroy: function (action) {
        		grid.reload();
            }
        });
	}
	//简历推荐记录编辑
	function editRecord(){
        var row = grid.getSelected();
        if(row){
		    nui.open({
		        url : "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitRecommendRecord.jsp?id=" + row.recruitid,
		        title: "编辑简历推荐记录", 
		        width: 800,
				height: 540,
		        onload: function () {
		           var iframe = this.getIFrameEl();
		        },
		        ondestroy: function (action) {
		    		grid.reload();
		        }
		    });
		 }else{
		    	nui.alert("请选中一条记录","提示");
		 }
	}
	function getStatus(e){
		return nui.getDictText('RECRUIT_STATUS',e.value);
	}
	function getJoblevel(e){
		return nui.getDictText('JOB_LEVEL',e.value);
	}
	function onDrawSummaryCell(e){
		var result = e.result;
	    var grid = e.sender;
	    if (e.field == "recommendnums"||e.field=="feedbacknums" ||e.field == "prefirstinterviewnums"||e.field=="firstinterviewnums" ||e.field=="prereinterviewnums" ||e.field == "reinterviewnums"|| e.field=="sendoffers" || e.field=="acceptoffers" ||e.field=="refuseoffers" || e.field=="giveupoffers" ||e.field=="intendjoins" ||	e.field=="preintendjoins"  || e.field == "refuseintendjoins" || e.field=="unfinishnum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
	function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getOmRecruitDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
	//导出明细查询
	function expqueryRecord(){
		var data = form.getData(); //获取表单JS对象数据
		var json = nui.encode(data); //序列化成JSON	
		form.loading("操作中，请稍后......");
		nui.ajax({
	        url: "org.gocom.abframe.org.recruit.expqueryRecord.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		form.unmask();
	        	var filePath = o.downloadFile;
	        	var fileName = "招聘简历推送记录明细";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
					}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	alert("error");
	        }
	    });	
    }
</script>
</html>