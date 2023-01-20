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
    <title>项目考核流程</title>
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
    <div class="mini-panel" title="项目考核流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="rdprojcheck.projcheckid" id="projcheckid" class="nui-hidden"/>
			<input name="rdprojcheck.fileids" id="fileids" class="nui-hidden"/>
			<input name="project.projectIds" id="projectIds" class="nui-hidden"/>
		     <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		       <legend>项目基本信息</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">项目名称：</td>
							<td id="projectname" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">项目编号：</td>
							<td id="projectno" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">客户名称：</td>
							<td id="custname" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">受益销售：</td>
							<td id="orgname" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">相应合同编号：</td>
							<td id="contnum" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">实施责任部门：</td>
							<td id="managerdeptname" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">项目经理：</td>
							<td id="manager" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">考核预算版本：</td>
							<td id="cbversion" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目开始日期：</td>
							<td id="startdate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">预计完成日期：</td>
							<td id="expenddate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">项目考核发起日期：</td>
							<td id="checkDate" class="asLabel" style="width:150px"></td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		       <legend>预算情况</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">产品合同额：</td>
							<td id="prodmon" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">服务合同额：</td>
							<td id="servmon" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:140px;">合同总额：</td>
							<td id="contmon" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">产品不含税收入：</td>
							<td id="prodincomenet" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">服务不含税收入：</td>
							<td id="servincomenet" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">合同毛收入：</td>
							<td id="grossincome" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">产品退税：</td>
							<td id="prodtaxback" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">合同净收入：</td>
							<td id="netincome" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">预算总成本：</td>
							<td id="budget" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">项目外部采购：</td>
							<td id="outbuy" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">预算总成本(不含外购)：</td>
							<td id="budgetcost" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">已确认成本：</td>
							<td id="assessmentcost" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">预计后续成本：</td>
							<td id="followupcost" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">预算转换系数：</td>
							<td id="budgetratio" class="asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核毛利下限：</td>
							<td id="jiangyouA" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">预算毛利：</td>
							<td id="projgross" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">预算毛利率：</td>
							<td id="projgrossrate" class="asLabel" style="width:150px;"></td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		       <legend>考核方案</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">考核项目类型：</td>
							<td>
								<input name="rdprojcheck.projecttype" required="true" id="projecttype" class="nui-dictcombobox" dictTypeId="RD_CHECK_TYPE" style="width:150px" shownullItem="true" />
							</td>
							<td align="right" style="width:120px;">对应收入确认年月：</td>
							<td>
								<input name="rdprojcheck.checkincomeym" required="true" id="checkincomeym" class="nui-monthpicker" style="width:150px" format="yyyy-MM"/>
							</td>
							<td align="right" style="width:120px;">奖金提成比例：</td>
							<td>
								<input name="rdprojcheck.bonusrate" required="true" id="bonusrate" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px"  />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目经理分配比例：</td>
							<td>
								<input name="rdprojcheck.managerrate" id="managerrate" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px"  required="true"/>
							</td>
							<td align="right" style="width:120px;">奖金发放时机：</td>
							<td >
								<input name="rdprojcheck.bonustime" id="bonustime" class="nui-textbox" style="width:100%;" required="true" />
							</td>
							<td align="right" style="width:120px;">目标奖金：</td>
							<td colspan="3">
								<input name="rdprojcheck.targetbonus" id="targetbonus" format="n2" class="nui-spinner" style="width:100%; "inputStyle="text-align: right" allowLimitValue="false" changeOnMousewheel="false" showbutton="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核时机及主要约定：</td>
							<td colspan="5">
								<input name="rdprojcheck.checktime" id="checktime" class="nui-textarea" style="width:100%;" required="true"  />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核附加说明：</td>
							<td colspan="5">
								<input name="rdprojcheck.checkmemo" id="checkmemo" class="nui-textarea"  style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="center" style="width:120px;"><div class="nui-button" onclick="startKm">考核模拟</div></td>
							<td></td>
							<td></td>
						</tr>
					</table>
		     </fieldset>
		     <fieldset id="field51" style="border:solid 1px #aaa;padding:3px;">
		       <legend>考核方案</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">考核项目类型：</td>
							<td id="projecttype1" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">对应收入确认年月：</td>
							<td id="checkincomeym1" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">奖金提成比例：</td>
							<td id="bonusrate1" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目经理分配比例：</td>
							<td id="managerrate1" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:120px;">奖金发放时机：</td>
							<td id="bonustime1" class="asLabel"></td>
							<td align="right" style="width:120px;">目标奖金：</td>
							<td id="targetbonus1" class="asLabel" colspan="3"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核时机及主要约定：</td>
							<td id="checktime1" class="asLabel" colspan="5" height=50px></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核附加说明：</td>
							<td id="checkmemo1" class="asLabel" colspan="5"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="center" style="width:120px;"><div class="nui-button" onclick="startKm">考核模拟</div></td>
							<td></td>
							<td></td>
						</tr>
					</table>
		     </fieldset>
		</form>
		<fieldset id="field55" style="border:solid 1px #aaa;padding:3px;">
	       <legend>核查要点信息</legend>
	       <jsp:include page="/ame_common/csIncomecheck/showIncomeCheck.jsp"/>	
       </fieldset>
		 <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>项目考核附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
 		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">  
		<a class="nui-button" onclick="onOk" id="submitReimbProcess" style="width: 60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
	
		nui.parse();
		
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("opioionform");
		initMisOpinion({auditstatus:"1"});
		document.getElementById("field51").style.display="none";
	  	<%
	  		long workItemID=(Long)request.getAttribute("workItemID");
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
		init();
		function init(){
        	form.mask("数据加载中...");
        	//流程提示信息
			promptInit({workItemID: <%=workItemID %>});
			var json=nui.encode({workItemID: <%=workItemID %>});
			nui.ajax({
				url: "com.primeton.rdmgr.project.examineToProject.queryProjectCheck.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"rdprojcheck","relationid": o.rdprojcheck.projcheckid});
            		
            		var rdprojcheck = o.rdprojcheck;
            		var project = o.project;
            		var simulation = o.simulation;
            		var workitem = o.workitem;
            		var checkincomeym = rdprojcheck.checkincomeym;
            		document.getElementById("budgetratio").innerHTML = rdprojcheck.budgetratio;
            		if(workitem.activityDefID == 'manualActivity4'){
            			document.getElementById("field5").style.display="none";
            			document.getElementById("field5").style.display="none";
            			document.getElementById("field55").style.display="none";
            			document.getElementById("field51").style.display="";
            			document.getElementById("projecttype1").innerHTML = nui.getDictText('RD_CHECK_TYPE',rdprojcheck.projecttype);
            			document.getElementById("checkincomeym1").innerHTML = rdprojcheck.checkincomeym;
            			document.getElementById("bonusrate1").innerHTML = rdprojcheck.bonusrate;
            			document.getElementById("managerrate1").innerHTML = rdprojcheck.managerrate;
            			document.getElementById("checktime1").innerHTML = rdprojcheck.checktime;
            			document.getElementById("bonustime1").innerHTML = rdprojcheck.bonustime;
            			document.getElementById("checkmemo1").innerHTML = rdprojcheck.checkmemo;
            			document.getElementById("targetbonus1").innerHTML = rdprojcheck.targetbonus;
            		}
					//基本信息
					document.getElementById("projectname").innerHTML = rdprojcheck.projectname;
					var lj;
					if(rdprojcheck.projectno){
						var projectno = rdprojcheck.projectno;
						var projectId = project.projectIds;
						var projectnos = projectno.split(",");
						var projectIds = projectId.split(",");
						if(projectnos.length==1){
							lj="<a href='javascript:void(0)' onclick='checkProjectName("+projectId+");' title='点击查看'>" + projectno + "</a>"
						}else{
							for(var i=0;i<projectnos.length;i++){
								if(i==0){
									lj="<a href='javascript:void(0)' onclick='checkProjectName("+projectIds[0]+");' title='点击查看'>" + projectnos[0] + "</a>"
								}else{
									lj=lj+","+"<a href='javascript:void(0)' onclick='checkProjectName("+projectIds[i]+");' title='点击查看'>" + projectnos[i] + "</a>"
								}
							}
						}
					}
					document.getElementById("projectno").innerHTML = lj;
					document.getElementById("contnum").innerHTML = rdprojcheck.contnum;
					document.getElementById("custname").innerHTML = project.custname;;
					document.getElementById("orgname").innerHTML= project.orgname;
					document.getElementById("manager").innerHTML= project.managername;
					document.getElementById("managerdeptname").innerHTML = project.managerdeptname;
					document.getElementById("startdate").innerHTML = project.startdate == null ?"":ondealdate(project.startdate);
					document.getElementById("expenddate").innerHTML = project.expenddate == null ?"":ondealdate(project.expenddate);
					document.getElementById("cbversion").innerHTML = project.cbversion;
					document.getElementById("checkDate").innerHTML = rdprojcheck.checkstartdate;
					nui.get("projcheckid").setValue(rdprojcheck.projcheckid);
					nui.get("projectIds").setValue(project.projectIds);
                    //预算信息
                    document.getElementById("prodmon").innerHTML = formatNumber(rdprojcheck.prodmon);
                    document.getElementById("servmon").innerHTML = formatNumber(rdprojcheck.servmon);
                    document.getElementById("prodincomenet").innerHTML = formatNumber(rdprojcheck.prodincomenet);
                    document.getElementById("servincomenet").innerHTML = formatNumber(rdprojcheck.servincomenet);
                    document.getElementById("prodtaxback").innerHTML = formatNumber(rdprojcheck.prodtaxback);
                    document.getElementById("assessmentcost").innerHTML = formatNumber(rdprojcheck.assessmentcost);
                    document.getElementById("budget").innerHTML = formatNumber(rdprojcheck.budget);
                    document.getElementById("budgetcost").innerHTML = formatNumber(rdprojcheck.budgetcost);
                    document.getElementById("contmon").innerHTML = formatNumber(rdprojcheck.contmon);
                    document.getElementById("netincome").innerHTML = formatNumber(rdprojcheck.netincome);
                    document.getElementById("grossincome").innerHTML = formatNumber(rdprojcheck.grossincome);
                    document.getElementById("followupcost").innerHTML = formatNumber(rdprojcheck.followupcost);
                  	document.getElementById("jiangyouA").innerHTML = formatNumber(project.jiangyouA);
                   	document.getElementById("projgross").innerHTML = formatNumber(rdprojcheck.projgross);
                    document.getElementById("projgrossrate").innerHTML = formatNumber(rdprojcheck.projgrossrate,3);
                    document.getElementById("outbuy").innerHTML = formatNumber(rdprojcheck.outbuy);
					//项目考核方案
					nui.get("projecttype").setValue(rdprojcheck.projecttype);
					if(checkincomeym!=null&&checkincomeym!=""){
						var year = checkincomeym.substring(0,4);
						var month = checkincomeym.substring(4,6);
						checkincomeym = year + "-" + month;
					}
                    nui.get("checkincomeym").setValue(checkincomeym);
                    nui.get("bonusrate").setValue(rdprojcheck.bonusrate);
                    nui.get("managerrate").setValue(rdprojcheck.managerrate);
                    nui.get("checktime").setValue(rdprojcheck.checktime);
                    nui.get("bonustime").setValue(rdprojcheck.bonustime);
                    nui.get("checkmemo").setValue(rdprojcheck.checkmemo);
                    nui.get("targetbonus").setValue(rdprojcheck.targetbonus);
					//checklist所需参数processInstID、activityInstID、incomeType、checkObj
		        	showIncomeCheck(workitem.processInstID);
					
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("auditstatus").setValue("1");
	               	nui.get("auditopinion").setValue("同意。");
	               	nui.get("backTo").setData(o.rdprojcheck.backList);
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
		
		//项目编号链接
		function checkProjectName(e){
			var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + e;
			window.open(executeUrl);
		}
       
		//发起流程
		function SaveData(){
			var data = form.getData();
			var data_opioion = opioionform.getData();
			var rdprojcheck = data.rdprojcheck;
			var checkincomeym = rdprojcheck.checkincomeym;
			if(checkincomeym!=null){
				var year =  checkincomeym.getFullYear();
				var month = checkincomeym.getMonth()+1;
				if(month<10){
					month = "0" + month;
				}
				rdprojcheck.checkincomeym = year + "" + month;
			}
			var project = data.project;
			var json = nui.encode({"project":project,"rdprojcheck":rdprojcheck,"misOpinion": data_opioion.misOpinion});
			 nui.ajax({
                url: "com.primeton.rdmgr.project.examineToProject.makeFinceProjmb.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.result == "success"){
	              		form.unmask();
	                   	nui.alert("流程提交成功！");
	                   	CloseWindow("ok");
	              	}else{
                   		form.unmask();
						nui.get("submitReimbProcess").enable();
						nui.get("closeWin").enable();
	                   	nui.alert("流程提交失败！");
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		function onOk(){
			if(!form.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		}
        	nui.confirm("是否提交流程?","操作提示",function(o){
        		if("ok" == o){
        			nui.get("submitReimbProcess").disable();
					nui.get("closeWin").disable();
					SaveData();
        		}else{
        			
        		}
        	});
	    }
    
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
        
        //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
	    
	    //日期格式化
	    function ondealdate(e){
		    var date = e.substring(0,10);
		    return date;
		}
		
		function startKm(){
			var budget = document.getElementById("budgetcost").innerHTML;
			var managerrate = nui.get("managerrate").getValue();
			var bonusrate = nui.get("bonusrate").getValue();
			var data = {"budget":budget,"managerrate":managerrate,"bonusrate":bonusrate};
			nui.open({
				url:"<%=request.getContextPath() %>/project/examineToProject/simulationCheck.jsp",
                title: "考核模拟",
                width: 580,
                height: 200,
                onload: function () {
			        var iframe = this.getIFrameEl();
			        iframe.contentWindow.setData(data);
			    },
                ondestroy: function (action) {
                    if (action == "ok") {
                    	
                    }
                }
			});
		}
		
	function formatNumber(num,cent) {
		if(cent==null||cent==""){
			cent = 2;
		}
		if(num){
		num = num.toString().replace(/\$|\,/g,'');
		 }
		
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
	</script>
</body>
</html>