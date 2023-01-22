<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zhengquan
  - Date: 2019-05-06 14:25:42
  - Description:
-->
<head>
<title>分公司用章使用详情</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .mini-grid-rows-view {
	    	height: auto !important;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
	<div class="mini-panel" title="武大吉奥分公司印章使用审批单" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div class="nui-toolbar">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<form id="fgsyzglSealUse">
					<!--隐藏域-->
					<input name="fgsyzgl.ywid" class="nui-hidden" />
					<input name="fgsyzgl.fileids" id="fileids"  class="nui-hidden"/>
					<input name="fgsyzgl.yzglid" class="nui-hidden"/>
					<input name="purstatus" class="nui-hidden"/>
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">单号：</td>
								<td style="width:150px;"><input name="fgsyzgl.dh" class="nui-textbox" allowInput="false" style="width:100%" /></td>
								<td align="right" style="width:120px;">印章申请日期：</td>
								<td style="width:150px;">
	                    			<input name="fgsyzgl.yzsqrq" class="nui-datepicker"  style="width:100%" />
	               				</td>	
							</tr>
							<tr>
								<td align="right" style="width:120px;">用印部门：</td>
								<td style="width:150px;"><input id="yybmView" name="fgsyzgl.orgname" class="nui-textbox" style="width:100%" allowInput="false"/>
								 						 <input id="yybmEdit"  name="fgsyzgl.orgname" style="width:162px;" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"
															filterType="like"  textField="orgname" valueField="orgseq"  dataField="orgs" valueFromSelect="true"  showNullItem="true" allowInput="true"/>
														 <input name="fgsyzgl.orgid" class="nui-hidden" /></td>
								<td align="right" style="width:120px">申请人：</td>
								<td style="width:150px;"><input id="jbrView" name="fgsyzgl.username" class="nui-textbox" style="width:100%" allowInput="false"/>
														 <input id="jbrEdit" name="fgsyzgl.username" class="nui-textboxlist" searchField="name" style="width:215px" required="true"
									        				   url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpOrgRoleByName.biz.ext" value="" text="" textField="EMPNAME" valueField="USERID"  />
														 <input name="fgsyzgl.userid" class="nui-hidden" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">用章类型：</td>
								<td colspan="4" class = "asLabel">
									<div name="fgsyzgl.yzlx" id="yzlx" class="mini-checkboxlist" repeatItems="4" repeatLayout="table" textField="text" valueField="id">
  									</div>
  									<div>
  										<input class="nui-checkbox" text="其他章" name="fgsyzgl.qtz" onvaluechanged="yzlxchange(this)">
  										<input name="fgsyzgl.qtzmc" class="nui-textbox" required="true" requiredErrorText="其他章名称不能为空！" style="display:none">
  									</div>
								</td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">印章所属单位：</td>
								<td  style="width:410px;" colspan="3">
									<input name="fgsyzgl.yzssdw" class="nui-dictcombobox" dictTypeId="FGS_NAME" required="true" requiredErrorText="印章所属单位不能为空！"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">用印事由及文件名称：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.yysyyjwjmc" class="nui-textarea" vtype="rangeChar:0,2000" required="true" requiredErrorText="用印事由及文件名称不能为空！" style="width:100%" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">备注：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.bz" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
						</table>
					</div>
				</form>
				<div class="hidden-dom" id="addFiles">
					<jsp:include page="/ame_common/addFiles.jsp"/>
				</div>
				<div class="hidden-dom" id="detailFile">
					<jsp:include page="/ame_common/detailFile.jsp"/>
				</div>
				</fieldset>
			</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar" id="btnDiv">
		<a class="nui-button" onclick="onOk()" name="createSealUse" style="width:80px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="CloseWindow(close)" name="saveSealUse"style="width:80px;margin-right:20px;">取消</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
    var processInstId='<%=request.getParameter("processInstID") %>';
    var contextPath = '<%=contextPath %>'
    var yzglid = '<%=request.getParameter("yzglid") %>';
    var form = new nui.Form("fgsyzglSealUse");
    var $addFiles = $('#addFiles');
    var $detailFile = $('#detailFile');
    var type,username,userid;
	
	function init(){
		var dataYzlx = [{"id": "frz","text": "法人章"},{"id": "gz","text": "公章"},{"id": "htz","text": "合同章"},{"id": "xmzyz","text": "项目专用章"}];
		nui.get("yzlx").setData(dataYzlx);
		
		if(type == "add"){
			firstLoad();
		}else if(type == "update"){
			loadData();
		}else if(type == "view"){
			$("#btnDiv").remove()
			form.setEnabled();
			loadData();
		}
	} 
	
	function yzlxchange(e){
		var qtzmc = nui.getbyName("fgsyzgl.qtzmc");
		if(e.checked){
			qtzmc.show();
		}else{
			qtzmc.hide();
			qtzmc.setValue("");
		}
	}
	
	//标准方法接口定义
	function CloseWindow(action) {           
	    if (action == "close" && form.isChanged()) {
	        if (confirm("数据被修改了，是否先保存？")) {
	            return false;
	        }
	    }
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}
	
	function loadData(){
		$("#yybmEdit").remove();
		$("#jbrEdit").remove();
		$addFiles.empty();
		$detailFile.show();
		form.mask("数据加载中...");
		var json = nui.encode({yzsy : {"yzglid" : yzglid}});
		nui.ajax({
			url: "com.primeton.eos.ame_dailyoffice.yzglHandle.queryYzsyData.biz.ext",
			type: "post",
			data: json,
			contentType: "text/json",
			success: function (o){
				form.unmask();
				o = nui.clone(o);
				o.fgsyzgl = o.yzgl;
				form.setData(o);
				//如果勾选了其他章选项的时候，显示其他章名称
				if(o.fgsyzgl.qtz == "true"){
					nui.getbyName("fgsyzgl.qtzmc").show();
				}
				//加载附件设置参数
				nui.get("grid_0").load({"groupid":"fgsyzsy","relationid": o.fgsyzgl.dh},function(){});
			}
		});
	}
	
	function firstLoad(){
		$("#yybmView").remove();
		$("#jbrView").remove();
		$addFiles.show();
		$detailFile.empty();
	    nui.getbyName("fgsyzgl.yzsqrq").setValue(new Date());
	    var nui_dh = nui.getbyName("fgsyzgl.dh");
	    var text = nui_dh.getValue();
	    if(!text) {
	    	var dh = createDh();
	    	nui_dh.setValue(dh);
	    }
	}
	
	/**
	 * 生成单号
	 * @returns {String}
	 */
	function createDh() {
		var dh = "YZ" + nui.formatDate(new Date(), "yyyyMMddHHmmssfff");
		return dh;
	}
	/**
	 * @author zhengquan
	 * @time 2019年4月11日18点39分
	 * @description 通过userid获取部门信息
	 * @param userid
	 * @returns
	 */
	function queryOrgDataByUserid(userid){
		var org_data = null;
		if(userid){
			var json = {userid:userid};
			nui.ajax({
	            url: "com.primeton.eos.ame_dailyoffice.sealCommon.queryOrgData.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            async:false,
	            contentType: 'text/json',
	            success: function (text) {
	            	org_data = text.orgdata;
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
		}
		return org_data;
	}
	
	function onOk(){
		if(form.validate()){
			//印章类型必填校验
			var nui_yzlx = nui.getbyName("fgsyzgl.yzlx").getValue();
			var nui_qtz = nui.getbyName("fgsyzgl.qtz").getValue();
			var nui_qtzmc = nui.getbyName("fgsyzgl.qtzmc").getValue();
			if(nui_yzlx == ""){
				if(nui_qtz == "true"){
					if(nui_qtzmc == ""){
						alert("其他章类型必填！");
						return;
					}
				}else{
					alert("用章类型必填！");
					return;
				}
			}
	    	if(confirm("确认保存案件？")){
				document.getElementById("fileCatalog").value="yzsy";
	        	form2.submit();
	    		}
		}else{
			nui.alert("请检查表单是否有未完成部分！");
		}
	}
	
	function SaveData(){
		var formData = form.getData(false,true);
    	if(type == "add"){
	    	formData.fgsyzgl.lclx = "fgsyzgl";
	    	formData.fgsyzgl.lclxmc = "分公司印章使用流程";
	    	var nui_userViso = nui.getbyName("fgsyzgl.username");
	    	var nui_orgViso = nui.getbyName("fgsyzgl.orgname");
	    	formData.fgsyzgl.username = strSplit1(nui_userViso.text,"(");
	    	formData.fgsyzgl.userid = nui_userViso.value;
	    	formData.fgsyzgl.orgname = strSplit(nui_orgViso.text,"-");
	    	formData.fgsyzgl.orgid = getOrgid(nui_orgViso);
    	}
    	
    	//获取印章名称
    	var nui_yzlx = nui.getbyName("fgsyzgl.yzlx");
    	var nui_qtzmc = formData.fgsyzgl.qtzmc;
    	formData.fgsyzgl.yzlxmc = getYzmc(nui_yzlx,nui_qtzmc);
    	
        var json = {yzsyData:formData.fgsyzgl};
        form.loading("保存中，请稍候...");
        nui.ajax({
            url: "com.primeton.eos.ame_dailyoffice.yzglHandle.saveYzsyDataOnly.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	form.unmask();
            	var returnData = nui.clone(text);
            	if(returnData != "-1"){
            		CloseWindow();
            		if(type == "add"){
            			nui.alert("保存成功！");
            		}else if(type == "update"){
            			nui.alert("修改成功！");
            		}
            	}else{
            		nui.alert("操作失败");
            	}
            }
        });
	}
	//截取symbol后面的字符串
	function strSplit(str,symbol){
		var arr = str.split(symbol);
		return arr[1];
	}
	
	//截取symbol前面的字符串
	function strSplit1(str,symbol){
		var arr = str.split(symbol);
		return arr[0];
	}
	
	//通过部门对象获取部门id
	function getOrgid(orgViso){
		var allData = orgViso.data;
		var value = orgViso.value;
		var orgid = '';
		for(var i=0;i<allData.length;i++){
			if(allData[i].orgseq == value){
				orgid = allData[i].orgid;
			}
		}
		return orgid;
	}
	//获取印章名称
	function getYzmc(nui_yzlx,nui_qtzmc){
		var selecteds = nui_yzlx._selecteds;
		var yzlxmc = '';
		for(var i=0;i<selecteds.length;i++){
			yzlxmc = yzlxmc + selecteds[i].text + ",";
		}
		if(nui_qtzmc){
			yzlxmc = yzlxmc + "其他章";
		}else{
			yzlxmc = yzlxmc.substring("0",yzlxmc.length-1);
		}
		return yzlxmc;
	}
</script>
</html>