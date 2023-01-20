
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>重点任务投票排序报表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js"type="text/javascript"></script>
<style type="text/css">
	    	html, body{
		        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
		    } 
		    <!--.nui-radiobuttonlist-item{
		    	float: left;
			    margin-left: 200px;
			    color: pink;
			 }-->
    </style>
</head>
<body>
<div class="nui-panel" title="重点任务投票排序报表" style="width:100%;height: 100%">
    <div id="form1">
        <div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
            <table align="center" border="0" width="100%" class="form_table">
                <tr>
                    <td class="form_label" align="center">投票名称:
                        <input id="combo1" class="nui-combobox" textField="keytask_name" valueField="id" required="true" />
                    </td>
                    <td> 年度: 
                        <input class="nui-spinner"  name="year" id="year" value="2021" minValue="2010" maxValue="2080" style="width:90px" onValueChanged="jw"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="queryVote()">查询</a> 
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
        <table>
            <tr>
                <td style="width: 20%;">
                    <a class="nui-button" id="exportCsContBack" iconCls="icon-download" onclick="exportExcel()">导出</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="nui-fit">
        <div id="datagrid1" dataField="votes" class="nui-datagrid"
             sizeList="[10,20,50,100]" showPager="true" dataField="data" sortMode="client" style="width: 100%; height: 100%;"
             url="com.zhonghe.ame.imptask.keyTaskVote.orderByKeytask.biz.ext">
            <div property="columns">
                <div field="ranking2" align="center" headerAlign="center">排行</div>
                <div field="keytask_name" align="center" headerAlign="center">投票名称</div>
                <div field="by_voting_name" align="center" headerAlign="center">重点任务名称</div>
                <div field="ranking" width="100" align="center"headerAlign="center" allowSort="true">排序投票平均值</div>
                <div field="functions" width="100" align="center" headerAlign="center"allowSort="true">职能部门负责人投票平均值</div>
                <div field="pros" width="80" align="center" headerAlign="center"allowSort="true">生产单位负责人投票平均值</div>
                <div field="leadres" width="120" align="center"headerAlign="center">公司领导投票平均值</div>
            </div>
        </div>
    </div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
    <input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
    <input type="hidden" name="downloadFile" filter="false" />
    <input type="hidden" name="fileName" filter="false" />
</form>
		<%
			UserObject user = (UserObject) session.getAttribute("userObject");
			String userName = user.getUserName();
			String orgName = user.getUserOrgName();
		%>
		<script type="text/javascript">
			nui.parse();
			var form = new nui.Form("#form1");
			var grid = nui.get("datagrid1");
			init();
			function init(){
				var year = nui.get("year").getValue();
				if(!!year){
					jw();
				}
			}
			
			function queryVote() {
				var id = nui.get("combo1").getValue();
				// grid.load({
				// 	"voteId" : id
				// });
				nui.ajax({
                    url: "com.zhonghe.ame.imptask.keyTaskVote.orderByKeytask.biz.ext",
                    type: "post",
                    data: nui.encode({"voteId" : id}),
                    success: function (data) {
                    	var jsonList = data.votes;
                    	
	                    var prescore = 0;//预定义分数
						var ranking2 = 0;//排名
						 
						jsonList.forEach((item,index)=>{
						    if(item.ranking==prescore){
						        item.ranking2 = ranking2;
						    }else{
						        ranking2++;
						        prescore = item.ranking;
						        item.ranking2 = ranking2;
						    }
						}) 
                        grid.setData(jsonList);         
                    }
                });
			}
			
			function jw() {
				var year = nui.get("year").getValue();
				var bnc = nui.get("combo1");
				nui.ajax({
					url:"com.zhonghe.ame.imptask.keyTaskVote.queryKeytaskNames.biz.ext",
					type:"post",
					data:nui.encode({"year" : year}),
					success: function(data) {
						var datas = nui.decode(data);
						bnc.setData(datas.votes);
					}
				});
			}

			function exportExcel() {
				if (!confirm("是否确认导出？")) {
					return;
				}
				var data = new nui.Form("#datagrid1").getData();
				var id = nui.get("combo1").getValue();
				var json = nui.encode({data,"voteId" : id});
				nui.ajax({
							url : "com.zhonghe.ame.imptask.keyTaskVote.exportKeyTasks.biz.ext",
							type : "post",
							data : json,
							cache : false,
							contentType : 'text/json',
							success : function(o) {
								nui.unmask();
								var filePath = o.downloadFile;
								var fileName = "重点任务投票报表";
								var myDate = new Date();
								var year = myDate.getFullYear();
								var month = myDate.getMonth() + 1;
								var day = myDate.getDate();
								var hours = myDate.getHours();
								var minutes = myDate.getMinutes();
								var seconds = myDate.getSeconds();
								var curDateTime = year;
								if (month > 9) {
									curDateTime = curDateTime + "" + month;
								} else {
									curDateTime = curDateTime + "0" + month;
								}
								if (day > 9) {
									curDateTime = curDateTime + day;
								} else {
									curDateTime = curDateTime + "0" + day;
								}
								if (hours > 9) {
									curDateTime = curDateTime + hours;
								} else {
									curDateTime = curDateTime + "0" + hours;
								}
								if (minutes > 9) {
									curDateTime = curDateTime + minutes;
								} else {
									curDateTime = curDateTime + "0" + minutes;
								}
								if (seconds > 9) {
									curDateTime = curDateTime + seconds;
								} else {
									curDateTime = curDateTime + "0" + seconds;
								}
								fileName = fileName + "_" + curDateTime
										+ ".xls";
								var frm = document.getElementById("viewlist1");
								frm.elements["downloadFile"].value = filePath;
								frm.elements["fileName"].value = fileName;
								frm.submit();
							},
							error : function() {
								alert("error");
							}
						});
			}

			function reset() {
				var form = new nui.Form("#form1");
				form.reset();
				grid.load();
			}
		</script>
</body>
</html>