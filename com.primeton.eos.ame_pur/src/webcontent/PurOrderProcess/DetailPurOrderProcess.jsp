<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wlq
  - Date: 2016-06-02 18:18:37
  - Description:
-->
<head>
	<title>订单流程业务信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div id="custname">&nbsp;</div>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购合同基本信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file" >
					<tr>
						<td align="right" style="width:120px">合同名称：</td>
						<td id="purcontname" style="width:305px"></td>
						<td align="right" style="width:120px">我方申请人：</td>
						<td id="ouroper" style="width:100px"></td>
						<td align="right" style="width:120px">签订日期：</td>
						<td style="width:120px;" id="signdate"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">有效开始日期：</td>
						<td id="startdate" style="width:100px"></td>
						<td align="right" style="width:120px">有效截止日期：</td>
						<td style="width:120px;" id="enddate" ></td>
						<td align="right" style="width:120px">合同编号：</td>
						<td id="purcontnum" style="width:200px"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目：</td>
						<td id="projectnoCont" style="width:280px"></td>
						<td align="right" style="width:120px">财务对应合同编码：</td>
						<td id="outcontnum" style="width:120px;" ></td>
						<td align="right" style="width:120px">成本类型：</td>
						<td id="costtype" style="width:200px"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">合同关键内容信息：</td>
						<td colspan="5" id="contKeyinfo"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">说明：</td>
						<td colspan="5" id="comment"></td>
					</tr>
				</table>
			</div>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购订单基本信息</legend>
			<form id="form3" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
				<input name="purOrder.last" id="last" class="nui-hidden" />	
				<input name="purOrder.fileids" id="fileids1" class="nui-hidden" />
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" readonly="readonly" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" readonly="readonly" valueField="projectno" textField="projectName" allowInput="false"  style="width:200px" /></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:100px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" readonly="readonly" onbuttonclick="selectOmEmployee"  allowInput="false" vtype="rangeChar:2,30" style="width:80px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议签订日期：</td>
							<td><input name="purOrder.signdate" id="orderSigndate" class="nui-datepicker" readonly="readonly" vtype="date:yyyy-MM-dd" style="width:100px" /></td>
							<td align="right" style="width:120px">采购订单编号：</td>
							<td colspan="3"><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" readonly="readonly" vtype="rangeChar:0,30" style="width:180px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textbox" allowInput="true" vtype="rangeChar:0,50" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" allowInput="true" vtype="rangeChar:0,2000" style="width:100%"/></td>
						</tr>
					</table>
					<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
							<div field="fileName"width="50" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
							<div field="fileType" width="50" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
							<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
							<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
						</div>
					</div>
				</form>
			</fieldset>
			<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
				<legend>协议书人员</legend>
				<div id="grid_outper" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purOrderOutpers" 
			    	url="com.primeton.eos.ame_pur.purContractProcess.queryOutperByOrder.biz.ext" 
			    	idField="appid" multiSelect="true" allowAlternating="true" onselectionchanged="selectionChanged" showPager="false">
					<div property="columns">
						<div field="purOutperson.outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
						<div field="purOutperson.outpername" width="60" align="center" headerAlign="center"renderer="getDetail">姓名</div>	
						<div field="workunit" width="90" align="center" dataType="currency" headerAlign="center" renderer="dictOutperType" allowSort="true">工作量计量单位</div>	
						<div field="price" width="90" align="center" dataType="currency" headerAlign="center" allowSort="true">人月单价(元)</div>	
						<div field="startdate" width="90" align="center" headerAlign="center" allowSort="true">服务开始日期</div>	
						<div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>	
						<div field="projectName" width="120" align="center" headerAlign="center">项目</div>
						<div field="managername" width="70" align="center" headerAlign="center">汇报人</div>	
						<div field="pcprotype" width="90" align="center" headerAlign="center" renderer="onFileRendererway">电脑提供方式</div>	
						<div field="comment" width="90" align="center" headerAlign="center">说明</div>	
					</div>
				</div>
			</fieldset>
			<!-- <form id="form5" method="post">
			<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
				<legend>送递信息列表</legend>
				<div id="postgrid" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" allowCellWrap="true" sortMode="client" url="com.primeton.eos.ame_pur.purContractProcess.queryPostServices.biz.ext" dataField="postServices" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
					<div property="columns">
						<div field="postorname" headerAlign="center" width="20" >送递人</div>
						<div field="postway" width="30" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="onFileRendererway" align="center">送递方式</div>
						<div field="postdate" width="30" renderer="" align="center" headerAlign="center" >送递日期</div>
						<div field="postno" width="45" headerAlign="center" align="center">快递公司邮寄单</div>
						<div field="receivername" width="30" headerAlign="center" align="center">收件人</div>
						<div field="receiverlinktel" width="50" headerAlign="center" align="center">联系电话</div>
						<div field="postaddress" width="70" headerAlign="center" align="center">邮寄地址</div>
						<div field="postcontent" width="70" headerAlign="center" align="center">邮寄内容</div>
					</div>
				</div>
			</fieldset>
		</form> -->
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<form id="form5" method="post">
				<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
					<legend>送递信息</legend>
					<table>
						<tr>
							<td align="right" style="width:150px">送递人：</td>
							<td><input name="amePostservice[0].postorname" id="postorname" class="nui-textbox" required="false" readonly="readonly"  style="width:100px"/></td>
							<td align="right" style="width:150px">送递方式：</td>
							<td><input name="amePostservice[0].postway" id="postway" class="nui-dictcombobox" dictTypeId="AME_POSTWAY" readonly="readonly"  style="width:100px" showNullItem="true" nullItemText=""/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">送递日期：</td>
							<td><input name="amePostservice[0].postdate" id="postdate" class="nui-datepicker" required="false" readonly="readonly"  style="width:100px"/></td>
							<td align="right" style="width:150px">快递单号：</td>
							<td><input name="amePostservice[0].postno" id="postno" class="nui-textbox" required="false" readonly="readonly"   style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">收件人：</td>
							<td><input name="amePostservice[0].receivername" id="receivername" class="nui-textbox" required="false" readonly="readonly"  style="width:100px"/></td>
							<td align="right" style="width:150px">联系电话：</td>
							<td><input name="amePostservice[0].receiverlinktel" id="receiverlinktel" class="nui-textbox" required="false" readonly="readonly"  style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">邮寄地址：</td>
							<td colspan="5"><input name="amePostservice[0].postaddress" id="postaddress" class="nui-textbox" required="false" readonly="readonly"  style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">邮寄内容：</td>
							<td colspan="3"><input name="amePostservice[0].postcontent" id="postcontent" class="nui-textbox" required="false" readonly="readonly"  style="width:100%"/></td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
		nui.parse();
	  	var form3 = new nui.Form("form3");
	  	var form5 = new nui.Form("form5");
	  	var opioionform = new nui.Form("opioionform");
		<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>	
		function onFileRendererway(e){
			return nui.getDictText('AME_POSTWAY',e.value);
		}
		var outcontnum;
		loadData();
		function loadData(){
				document.getElementById("opinionHide").style.display="none";
				var data={processInstID:<%=processInstID %>,noQueryBack:"1", getOutpersonAndPost:"2"};
				var json=nui.encode(data);
				nui.ajax({
					url:"com.primeton.eos.ame_pur.purOrderProcess.queryPurOrderWorkItem.biz.ext",
					type:"post",
					data:json,
					contentType:"text/json",
					success:function (o){
						//合同信息
						form3.setData(o);
						document.getElementById("custname").innerText="供应商：" + o.purContract.purSupplier.custname;
						document.getElementById("purcontnum").innerHTML = o.purContract.purcontnum == null ?"":o.purContract.purcontnum;
		                document.getElementById("purcontname").innerHTML = o.purContract.purcontname == null ?"":o.purContract.purcontname;
		                document.getElementById("ouroper").innerHTML = o.purContract.ouroper == null ?"":o.purContract.ouroper;
		                document.getElementById("signdate").innerHTML = o.purContract.signdate == null ?"":o.purContract.signdate;
		                document.getElementById("startdate").innerHTML = o.purContract.startdate == null ?"":o.purContract.startdate;
		                document.getElementById("enddate").innerHTML = o.purContract.enddate == null ?"":o.purContract.enddate;
		                document.getElementById("contKeyinfo").innerHTML = o.purContract.contKeyinfo == null ?"":o.purContract.contKeyinfo;
		                document.getElementById("comment").innerHTML = o.purContract.comment == null ?"":o.purContract.comment;
		                document.getElementById("projectnoCont").innerHTML = o.purContract.projectName == null ?"":o.purContract.projectName;
		                outcontnum =o.purContract.outcontnum;
		                document.getElementById("outcontnum").innerHTML = o.purContract.outcontnum == null ?"":"<a href='javascript:void(0)' onclick='javascript:lookCsContract()' title='点击查看合同信息'>" + o.purContract.outcontnum + "</a>";
		                document.getElementById("costtype").innerHTML =  nui.getDictText('AME_CONTCOSTTYPE',o.purContract.costtype); 
						//合同附件
						var grid_0 = nui.get("grid_0");
						grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
						grid_0.sortBy("fileTime","desc");
						//订单信息
						nui.get("userid").setText(o.purOrder.custname);
	                    nui.get("projectno").setText(o.purOrder.projectName);	
	                    nui.get("signuserid").setText(o.purOrder.empname);
	                    //订单附件
						var grid_1 = nui.get("grid_1");
						grid_1.load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
						grid_1.sortBy("fileTime","desc");
						<%-- var postgrid = nui.get("postgrid");
						postgrid.load({processInstID:<%=processInstID %>}); --%>
						//设置邮寄内容
						form5.setData(o);
						//归档更改状态
						nui.get("last").setValue("1");
						//设置审核意见基本信息
						nui.get("processinstid").setValue(o.workitem.processInstID);
		               	nui.get("processinstname").setValue(o.workitem.processInstName);
		               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
		               	nui.get("workitemname").setValue(o.workitem.workItemName);
						nui.get("workitemid").setValue(<%=processInstID %>);
		               	nui.get("isshow").setValue("1");
// 		               	nui.get("edit").setValue("1");
		            	//查询审核意见及审核附件
						var grid = nui.get("datagrid1");
						grid.load({processInstID:<%=processInstID %>});
						grid.sortBy("time", "desc");
		            	//查询订单人员
		            	var purorderid = nui.get("purorderid").getValue();
						var grid_outper = nui.get("grid_outper");
						grid_outper.load({purOrder:{purorderid:purorderid}});
						grid_outper.sortBy("purOutperson.outperno", "desc");
					},
					error:function(){}
				});
		}
		//附件下载
        function getdetail1(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail1(){
        	var grid = nui.get("grid_1");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url, '_self');
        }
		//人员订单关系表，计算单位
		function dictOutperType(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
		}
		function lookCsContract(){
			//为了公用 页面只能传过去contractid
			nui.ajax({
    			url:"com.primeton.eos.ame_income.csReveForeProcess.queryContByContnum.biz.ext",
    			data: {contnum:outcontnum},
    			type:"post",
    			contentType:"text/json",
    			success:function(data){
    				var contractid = data.csContract.contractid;
    				if(contractid){
						var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+contractid;
						window.open(executeUrl, "合同查看", "fullscreen=1");
    				}
    			}
    		});
	  	}
	</script>

</body>
</html>