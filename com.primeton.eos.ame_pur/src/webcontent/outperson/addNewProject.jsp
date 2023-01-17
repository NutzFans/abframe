<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
	UserObject user = (UserObject) session.getAttribute("userObject");
   	String username = user.getUserName();
   	String userno = user.getUserId();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2017-01-09 19:29:31
  - Description:
-->
<head>
	<title>外包人员项目变更-增加新项目</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<!-- 增加新服务项目，增加一笔人员项目对应关系记录，并允许对原有服务中项目调整投入比重（调整投入比重也将产生一笔新的项目人员投入关系记录，
	以便能实现准确计提） -->
	<div class="nui-fit">
		<form id="form1" method="post">
			<input class="nui-hidden" name="newPurProjOutper.outperno" id="outperno" />
			<input class="nui-hidden" id="outpername" />
			<!-- 原项目的开始服务日期 -->
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>原项目</legend>
				<input class="nui-hidden" name="oldPurProjOutper.projoutid" id="oldprojoutid" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">项目名称：</td>
							<td id="oldprojectname" style="width: 220px"></td>
							<td align="right" style="width:100px;">所属客户：</td>
							<td id="oldmiscustname" style="width: 220px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">服务开始日期：</td>
							<td id="oldstartdate"></td>
							<td align="right" style="width:100px;">预计结束日期：</td>
							<td id="oldexpenddate"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">投入比重：</td>
							<td>
								<input name="oldPurProjOutper.inputratio" id="oldinputratio" class="nui-spinner" minValue="0" 
									maxValue="2" changeOnMousewheel="false" showButton="false" inputStyle="text-align: right" 
									style="width: 50px" required="true" onValuechanged="changeoldInputratio" />
							</td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>新增项目</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" width="100px">项目名称：</td>
							<td>
								<input name="newPurProjOutper.projectno" id="projectno" class="nui-buttonedit" 
									emptyText="请选择服务项目"  onbuttonclick="selectProjectList" allowInput="false" style="width:200px" required="true" />
							</td>
							<td align="right" style="width:100px;">汇报对象：</td>
							<td>
								<input name="newPurProjOutper.manager" id="manager" class="nui-buttonedit" 
									emptyText="请选择汇报对象" onbuttonclick="selectOrgname" allowInput="false" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">入场日期：</td>
							<td>
								<input name="newPurProjOutper.startdate" id="startdate" onblur="blurStartdate()" class="nui-datepicker" style="width: 100px;" required="true" />
							</td>
							<td align="right" style="width:100px;">预计离场日期：</td>
							<td>
								<input name="newPurProjOutper.expenddate" id="expenddate" onblur="blurExpenddate()" class="nui-datepicker" style="width: 100px;" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">投入比重：</td>
							<td>
								<input name="newPurProjOutper.inputratio" id="inputratio" class="nui-spinner" minValue="0" 
									maxValue="2" changeOnMousewheel="false" showButton="false"inputStyle="text-align: right" 
									style="width: 50px" required="true" onValuechanged="changeInputratio" />
							</td>
							<td></td><td></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		form.setChanged(false);
		//原项目投入比重。
		var dataInputratio;
		var suppliersname = "";
		//新增项目（无原项目）
		var newProject = false;
		
		function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "addNewProject"){
	    		//该外包人员没有在服务的项目或所有项目都是已离场
	    		if(data.dataRow == 0){
	    			newProject = true;
	    			document.getElementById("field2").style.display = "none";
	    		}else{
			    	nui.get("oldprojoutid").setValue(data.projoutid); 
			    	nui.get("expenddate").setValue(data.expenddate);
			    	nui.get("oldinputratio").setValue(data.inputratio);
			    	document.getElementById("oldstartdate").innerHTML = data.startdate;
			    	document.getElementById("oldexpenddate").innerHTML = data.expenddate;
			    	dataInputratio = data.inputratio;
		        	document.getElementById("oldprojectname").innerHTML= data.projectname == null ? "" : data.projectname;
		        	document.getElementById("oldmiscustname").innerHTML= data.custname == null ? "" : data.custname;
	    		}
		    	nui.get("outperno").setValue(data.outperno);
		    	nui.get("outpername").setValue(data.outpername);
	        	suppliersname = data.suppliersname;
    		}
    	}
    	
    	/**
    	 * 选择项目
    	 */
    	function selectProjectList(){
        	var btnEdit = this;
        	nui.open({
        		//2017年03月14去掉过滤条件?preSettle=preSettle（PS：项目变更时，想更换至别人负责的项目时被限制了，所以去掉。）
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
                title: "选择项目",
                width: 860,
                height: 490,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	if(data.projectStatus == "N"){
                        		nui.alert("不能选择状态为【结项关闭】的项目！");
                        		return;
                        	}else{
                        		nui.get("manager").setValue(data.userid);
                        		nui.get("manager").setText(data.manager);
	                            btnEdit.setValue(data.projectno);
	                            btnEdit.setText(data.projectName);
	                        }
                        }
                    }
                }
            });
        }
        
        /**
         * 选择汇报对象
         */
        function selectOrgname(){
	    	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择汇报对象",
                width: 850,
                height: 410,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                        }
                    }
                }
            });
	    }
	    
	    /**
	     * 入场日期
	     */
	    function blurStartdate(){
	    	//入场日期
	    	var startdate = nui.get("startdate").getValue();
	    	//预计离场日期
	    	var expenddate = nui.get("expenddate").getValue();
	    	//原项目的开始服务日期
	    	var oldstartdate = document.getElementById("oldstartdate").innerHTML;
	    	if(startdate && oldstartdate){
		    	if(startdate < oldstartdate){
		    		nui.alert("新项目的入场日期不能小于原项目的服务开始日期！",null,function(){
			    		nui.get("startdate").setValue("");
		    		});
		    		return;
		    	}
		    }
	    	if(startdate && expenddate){
		    	if(startdate > expenddate){
		    		nui.alert("预计离场日期必须大于入场日期！",null,function(){
			    		nui.get("expenddate").setValue("");
		    		});
		    	}
	    	
	    	}
	    }
	    
	    /**
	     * 预计离场日期
	     */
	    function blurExpenddate(){
	    	//入场日期 
	    	var startdate = nui.get("startdate").getValue();
	    	//预计离场日期
	    	var expenddate = nui.get("expenddate").getValue();
	    	if(expenddate <= startdate){
	    		nui.alert("预计离场日期必须大于入场日期！");
	    		nui.get("expenddate").setValue("");
	    	}
	    }
	    
	    /**
	     * 修改原项目投入比重
	     */
		function changeoldInputratio(){
			//新项目投入比重
    		var inputratio = nui.get("inputratio").getValue();
    		//原项目投入比重
    		var oldinputratio = nui.get("oldinputratio").getValue();
    		if((inputratio+oldinputratio) > dataInputratio){
    			nui.alert("修改后的原项目比重"+oldinputratio+"与新项目比重"+inputratio+"之和不能大于修改前的原项目比重"+dataInputratio+"！");
    			nui.get("oldinputratio").setValue(dataInputratio);
    			nui.get("inputratio").setValue(0);
    			return;
    		}
		}
		
		/**
		 * 修改新项目投入比重
		 */
		function changeInputratio(e){
			//新项目投入比重
    		var inputratio = nui.get("inputratio").getValue();
    		//有原项目
    		if(!newProject){
				if(inputratio < dataInputratio){
	    			//设置原项目投入比重
		    		nui.get("oldinputratio").setValue(parseFloat(dataInputratio-inputratio).toFixed(2));
				}else{
					nui.alert("新项目的投入比重"+inputratio+"只能小于原项目的原比重"+dataInputratio);
					nui.get("inputratio").setValue(0);
					return;
				}
    		}
		}
	    
	    /**
	     * 保存
	     */
	    function onOk(){
	    	if(form.validate()){
				//新项目投入比重
    			var inputratio = nui.get("inputratio").getValue();
	    		var o = form.getData();
				var oldPurProjOutper = o.oldPurProjOutper;
				var updateMessage = "";
				var json = "";
				var outperno = nui.get("outperno").getValue();
				var outpername = nui.get("outpername").getValue();
				//新项目名称
				var projectname = nui.get("projectno").getText();
				//新项目入场日期
				var startdate = nui.get("startdate").getFormValue();
				//新项目预计离场日期
				var expenddate = nui.get("expenddate").getFormValue();
				//新项目汇报对象
				var manager = nui.get("manager").getText();
				var newPurProjOutper = o.newPurProjOutper;
	    		//有原项目
    			if(!newProject){
		    		//原项目投入比重
		    		var oldinputratio = nui.get("oldinputratio").getValue();
		    		//计算小数加法
		    		var sumInputratio = accAdd(inputratio,oldinputratio);
		    		if(sumInputratio > dataInputratio){
		    			nui.alert("修改后的原项目比重"+oldinputratio+"与新项目比重"+inputratio+"之和不能大于修改前的原项目比重"+dataInputratio+"！");
		    			return;
		    		}
		    		if(inputratio > dataInputratio){
		    			nui.alert("新项目的投入比重"+inputratio+"只能小于原项目的原比重"+dataInputratio);
						return;
					}
					//原项目名称
					var oldprojectname = document.getElementById("oldprojectname").innerHTML;
					//原项目投入比重
					var oldinputratio = nui.get("oldinputratio").getValue();
					//原项目离场日期=新项目的入场日期-一天
					var oldactenddate = nui.get("startdate").getValue();
					oldactenddate = nui.clone(oldactenddate);
					var lastdate = oldactenddate;
			    	lastdate.setTime(oldactenddate.getTime()-24*60*60*1000);
			    	var lastdate = lastdate.getFullYear()+"-" + (lastdate.getMonth()+1) + "-" + lastdate.getDate();
			    	//设置原项目的离场日期
					oldPurProjOutper.actenddate = lastdate;
					//变更信息
					updateMessage = "合作伙伴【"+ suppliersname +"】的外包人员【"+outpername+"】新增项目【"+projectname+"】，入场日期是："+startdate+
						"，预计离场日期是："+expenddate+"，投入比重是："+inputratio+"，汇报对象是："+manager+"，原项目【"+oldprojectname+
						"】的投入比重是："+oldinputratio+ "。";
					updateMessage += "操作者是" + "<%=username %>" + "。";
			    	json = nui.encode({"outperno": outperno,"outpername": outpername,"oldPurProjOutper": oldPurProjOutper,
			    		"newPurProjOutper": newPurProjOutper,"updateMessage": updateMessage,"newProject": newProject});
				}else{
					//变更信息
					updateMessage = "合作伙伴【"+ suppliersname +"】的外包人员【"+outpername+"】新增项目【"+projectname+"】，入场日期是："+startdate+
						"，预计离场日期是："+expenddate+"，投入比重是："+inputratio+"，汇报对象是："+manager+ "。";
					updateMessage += "操作者是" + "<%=username %>" + "。";
			    	json = nui.encode({"outperno": outperno,"outpername": outpername,
			    		"newPurProjOutper": newPurProjOutper,"updateMessage": updateMessage,"newProject": newProject});
				}
				nui.get("sureButton").setEnabled(false);
		    	nui.confirm("确认增加新服务项目？", "确定？",
		            function (action) {            
		                if (action == "ok") {
					    	form.loading("数据处理中...");
				        	nui.ajax({
				        		url: "com.primeton.eos.ame_pur.outperson.addNewProject.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	form.unmask();
				                	var returnJson = nui.decode(o);
									if(returnJson.exception == null){
				                		nui.alert("保存成功！","操作提示",function(){
				                			CloseWindow("ok");
				                		});
				                	}else{
				                		nui.get("sureButton").setEnabled(true);
				                		if(returnJson.exception == "exceptionNoSearch"){
				                			nui.alert("该外包人员还未在任何项目服务过，请报备！");
				                		}else{
					                		nui.alert("保存失败！");
				                		}
				                	}
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                    CloseWindow();
				                }
				        	});
				        }
				    }
				);
	    	}else{
	    		return;
	    	}
	    }
	    
	    
	    function onCancel(e) {
        	if(form.isChanged()){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action == "yes"){
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
            if (action == "close" && form.isChanged()) {
            	if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        
        //精确小数的加减乘除
        /**
		 ** 加法函数，用来得到精确的加法结果
		 ** 说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
		 ** 调用：accAdd(arg1,arg2)
		 ** 返回值：arg1加上arg2的精确结果
		 **/
        function accAdd(arg1, arg2) {
		    var r1, r2, m, c;
		    try {
		        r1 = arg1.toString().split(".")[1].length;
		    }
		    catch (e) {
		        r1 = 0;
		    }
		    try {
		        r2 = arg2.toString().split(".")[1].length;
		    }
		    catch (e) {
		        r2 = 0;
		    }
		    c = Math.abs(r1 - r2);
		    m = Math.pow(10, Math.max(r1, r2));
		    if (c > 0) {
		        var cm = Math.pow(10, c);
		        if (r1 > r2) {
		            arg1 = Number(arg1.toString().replace(".", ""));
		            arg2 = Number(arg2.toString().replace(".", "")) * cm;
		        } else {
		            arg1 = Number(arg1.toString().replace(".", "")) * cm;
		            arg2 = Number(arg2.toString().replace(".", ""));
		        }
		    } else {
		        arg1 = Number(arg1.toString().replace(".", ""));
		        arg2 = Number(arg2.toString().replace(".", ""));
		    }
		    return (arg1 + arg2) / m;
		}
        /**
		 ** 减法函数，用来得到精确的减法结果
		 ** 说明：javascript的减法结果会有误差，在两个浮点数相减的时候会比较明显。这个函数返回较为精确的减法结果。
		 ** 调用：accSub(arg1,arg2)
		 ** 返回值：arg1减去arg2的精确结果
		 **/
		function accSub(arg1, arg2) {
		    var r1, r2, m, n;
		    try {
		        r1 = arg1.toString().split(".")[1].length;
		    }
		    catch (e) {
		        r1 = 0;
		    }
		    try {
		        r2 = arg2.toString().split(".")[1].length;
		    }
		    catch (e) {
		        r2 = 0;
		    }
		    m = Math.pow(10, Math.max(r1, r2)); //last modify by deeka //动态控制精度长度
		    n = (r1 >= r2) ? r1 : r2;
		    return ((arg1 * m - arg2 * m) / m).toFixed(n);
		}
		
		/**
		 ** 乘法函数，用来得到精确的乘法结果
		 ** 说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
		 ** 调用：accMul(arg1,arg2)
		 ** 返回值：arg1乘以 arg2的精确结果
		 **/
		function accMul(arg1, arg2) {
		    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
		    try {
		        m += s1.split(".")[1].length;
		    }
		    catch (e) {
		    }
		    try {
		        m += s2.split(".")[1].length;
		    }
		    catch (e) {
		    }
		    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
		}
		
		/** 
		 ** 除法函数，用来得到精确的除法结果
		 ** 说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
		 ** 调用：accDiv(arg1,arg2)
		 ** 返回值：arg1除以arg2的精确结果
		 **/
		function accDiv(arg1, arg2) {
		    var t1 = 0, t2 = 0, r1, r2;
		    try {
		        t1 = arg1.toString().split(".")[1].length;
		    }
		    catch (e) {
		    }
		    try {
		        t2 = arg2.toString().split(".")[1].length;
		    }
		    catch (e) {
		    }
		    with (Math) {
		        r1 = Number(arg1.toString().replace(".", ""));
		        r2 = Number(arg2.toString().replace(".", ""));
		        return (r1 / r2) * pow(10, t2 - t1);
		    }
		}
        
	</script>
</body>
</html>