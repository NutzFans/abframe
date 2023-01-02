<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <title>用章申请流程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="业务部门审批" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="seal.sealid" id="sealid" class="nui-hidden"/>
			<input name="seal.fileids" id="fileids1" class="nui-hidden"/>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>基本信息</legend>
	       		<table style="table-layout:fixed;" id="seal1">
					<tr>
						<td align="right" style="width:120px;">申请人：</td>
						<td style="width:150px;" id="applyname" class="asLabel"></td>
						<td align="right" style="width:120px;">用章类型：</td>
						<td style="width:150px;" id="sealname" class="asLabel"></td>
						<td align="right" style="width:120px;" id="showRelDate">用章日期：</td>
						<td style="width:150px;" id="sealdate" class="asLabel"></td>
						<td style="display: none;" id="showdate">
							<input name="seal.sealdate" class="nui-datepicker" required="true" style="width:150px" id="sealdate1" onvaluechanged="checkDate" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">受益部门：</td>
						<td style="width:150px;" id="orgname" class="asLabel"></td>
						<td align="right" style="width:120px;">文件接收单位：</td>
						<td colspan="3">
							<input name="seal.misCustinfo.custid" id="custid" onbuttonclick="selectCustmer" class="nui-buttonedit" style="width:100%" allowInput="false" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">文件类型：</td>
						<td style="width:150px;" id="filetype" class="asLabel"></td>
						<td align="right" style="width:120px;">文件数量：</td>
						<td style="width:150px;" id="filenum" class="asLabel"></td>
						<td style="display: none;" id="showfilenum">
							<input name="seal.filenum" class="nui-textbox" required="true" style="width:150px"  />							
						</td>
						<td align="right">金额：</td>
		                <td style="width:150px;" id="money" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">用章地点：</td>
						<td style="width:150px;" id="sealaddress" class="asLabel"></td>
						<td align="right" style="width:120px;">用章主体：</td>
						<td style="width:150px;" id="subject" class="asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">用章事由：</td>
						<td colspan="5" id="memo" class="asLabel"></td>
					</tr>
				</table>
			</fieldset>
		</form>
		 <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>用章申请附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<form id="opioionform" method="post">
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>处理意见列表</legend>
		        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
					    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
					    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
					    <div property="columns">
					    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
					        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
					        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
					        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
					        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
					        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
					        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
					        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
					    </div>
					</div>
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr id="salesEdit">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                    <td style="width:366px;" align="right" colspan="2">  
		                    	<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
		                    </td>
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:250px;" colspan="3">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;height:auto;" align="right">处理意见：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height: 40px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </fieldset>
	    </form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
   	<a class="nui-button" onclick="onOk" style="width: 60px;margin-right:20px;" id="appButton" iconCls="icon-upload">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<script type="text/javascript">
	
		nui.parse();
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("opioionform");
		nui.get("auditopinion").setValue("同意。");
	    document.getElementById("choosehide").style.display="none";
	    initMisOpinion({auditstatus:"1"});
	    <%
	  		long workItemID=(Long)request.getAttribute("workItemID");
	    %>
	    
	    //初始化
		init();
		function init(){
        	form.mask("数据加载中...");
        	//流程提示信息
			promptInit({workItemID: <%=workItemID %>});
			var json=nui.encode({workItemID: <%=workItemID %>});
			nui.ajax({
				url: "com.primeton.eos.ame_common.seal.getSealApplication.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					var seal = o.seal;//流程业务数据
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"seal","relationid": seal.sealid});
            		form.setData(o);
            		setTable("seal1",seal);
            		nui.get("custid").setText(seal.custname);
                    nui.get("custid").setValue(seal.custno);
            		var workitem = o.workitem;
            		if(workitem.activityDefID == 'manualActivity2'){
            			document.getElementById("showdate").style.display = "";
            			document.getElementById("sealdate").style.display = "none";
            			document.getElementById("showRelDate").innerHTML="实际用章日期";
            			document.getElementById("showRelDate").style.color = "red";
            			document.getElementById("showRelDate").style.fontWeight = "bold";
            			document.getElementById("showfilenum").style.display = "";
            			document.getElementById("filenum").style.display = "none";
            			
            			
            		}
            		//特殊字段处理
            		document.getElementById("filetype").innerHTML = seal.filetype == null ?"":nui.getDictText('MIS_FILETYPE',seal.filetype);
            		document.getElementById("subject").innerHTML = seal.subject == null ?"":nui.getDictText('company',seal.subject);
            		document.getElementById("sealaddress").innerHTML = seal.sealaddress == null ?"":nui.getDictText('AREA4SEAL',seal.sealaddress);
            		document.getElementById("money").innerHTML=seal.money==null ? "":formatNumber(seal.money);
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("auditstatus").setValue("1");
	               	nui.get("backTo").setData(seal.backList);
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.sortBy("time", "desc");
						grid.load({processInstID: o.workitem.processInstID},function(){
							form.unmask();
						});
					}
				},
				error: function(){}
			});
        }
       
		//提交流程
		function SaveData1(){
			var data = form.getData();
			var data_opioion = opioionform.getData();
			var seal = data.seal;
			seal.guanzhu = nui.get("guanZhuButton").getValue();
			var backTo = nui.get("backTo").getValue();
			//回退信息
    		if(backTo == 'manualActivity'){
    		  seal.backflag = "2";
    		}
    		else if(backTo == 'manualActivity3' || backTo == 'manualActivity4'){
    		  seal.backflag = "3";
    		}
    		else if(backTo == 'manualActivity1'){
    		  seal.backflag = "1";
    		}
			var json = nui.encode({"seal":seal,"misOpinion": data_opioion.misOpinion});
			nui.ajax({
                url: "com.primeton.eos.ame_common.seal.submitProcessSeal.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.result == "success"){
	              		form.unmask();
	                   	nui.alert("提交流程成功！","系统提示",function (){
	                   		CloseWindow("ok");
	                   	});
	              	}else{
                   		form.unmask();
						nui.get("appButton").enable();
	                   	nui.alert("提交流程失败！");
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		function onOk(e){
			if(!form.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		}
        	nui.confirm("是否提交流程?","操作提示",function(o){
	    		if("ok" == o){
	    			nui.get("appButton").disable();
	    			document.getElementById("fileCatalog1").value="seal";
		        	form4.submit();
	    		}else{
	    			
	    		}
	    	});
	    }
	    
		//关闭
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
        
        //向table中设值
		function setTable(tableid,data){//table的id及输出的数据对象，td需要赋值id，id必须与输出的数据对象的属性保持一致
	    	var tb = document.getElementById(tableid); 
			var rows = tb.rows;
			for(var i=0;i<rows.length;i++){
				 var sst = rows[i].getElementsByTagName("td")
				 for(var k = 0; k < sst.length; k++){// 遍历该行的 td
				 	var ids = sst[k].id;
				 	if(ids!=null&&ids!=""){
					 	if(data[ids] != null && data[ids] != ""){
						 	document.getElementById(ids).innerHTML=data[ids]== null ?"":data[ids];
					 	}
				 	}
				 }
			}
		 }
		 
		 //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
		 
		 //格式化千分位
		function formatNumber(num,cent) {
			if(cent==null||cent==""){
				cent = 2;
			}
			num = num.toString().replace(/\$|\,/g,'');  
	        // 检查传入数值为数值类型  
	         if(isNaN(num))  
	          num = "0";  
	        // 获取符号(正/负数)  
	        sign = (num == (num = Math.abs(num)));  
	        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
	        cents = num%Math.pow(10,cent);       // 求出小数位数值  
	        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
	        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
	       
	        // 补足小数位到指定的位数  
	        while(cents.length<cent)  
	         cents = "0" + cents;  
	         // 对整数部分进行千分位格式化.  
	         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
	          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
	        return (((sign)?'':'-') + num + '.' + cents); 
		}
        
        <!------------------------------------------------------- 审批意见 ----------------------------------------------------------->
        
        function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		function initMisOpinion(data){
			//初始化处理意见
			var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
			nui.get("auditstatus").setData(dataStatus);
			nui.get("auditstatus").setValue(data.auditstatus);
		}
	    //审核结果触发
	    function show(){
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus=='0'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			}else if(auditstatus=='1'){
				if(auditopinion==""){
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		
		function showNone(){
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
		
		//意见附件信息
		function onFileRenderer(e) {
		    var tempSrc = "";
			//长度为1，不换行
			if(e.record.files.length == 1){
		    	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
			}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a><br/>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
		    		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
			}
		   	return tempSrc;
		}
	     
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}
    	
    	 function checkDate(e){
       		 var sealdate = nui.get("sealdate1").getValue();
       		 var json={sealdate:sealdate}
		        nui.ajax({
		                url: "com.primeton.eos.common.misisworkdaybiz.isOrNotWorkdays.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                   	var returnJson = nui.decode(text);
			              	if(returnJson.out1 =="false"){
			              	nui.alert("您所选择的时间为非工作日，请重新选择工作日为用章日期!")
			              	 nui.get("sealdate").setValue("");
			              	
			              	return;
			              	}
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
		        
        
        }
        
        //选择用章单弹窗
		function selectCustmer(){
			var btnEdit = this;
			nui.open({
				url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
			    title: "选择用章单位",
			    width: 650,
			    height: 380,
			    ondestroy: function (action) {
			        if (action == "ok") {
			            var iframe = this.getIFrameEl();
			            var data = iframe.contentWindow.GetData();
			            data = nui.clone(data);    //必须
			            if (data) {
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
			            }
			        }
			    }
		    });
		}
	</script>
</body>
</html>