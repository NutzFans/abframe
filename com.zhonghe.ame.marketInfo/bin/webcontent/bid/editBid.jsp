
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>投标信息修改</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="投标信息修改" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>投标信息</legend>
				<form id="form_expRei" method="post">
					
			
					<input id="empid" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 100px">投标牵头部门：</td>
								<td style="width: 210px;"><input name="orgid" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 250px;" /></td>
								<td align="right" style="width: 100px">定标日期：</td>
								<td style="width: 130px"><input name="opentime"
									id="openTime" class="nui-datepicker" required="true"
									style="width: 250px" /></td>
								<td align="right" style="width: 100px">填报人:</td>
								<td style="width: 210px;"><input name="creatUserid"
									id="creatUserid" class="nui-hidden" style="width: 100%" /> <input
									id="createUsername" class="nui-textbox"
									enabled="false" style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">内协外联：</td>
								<td><input id="externalType" name="externalType"
									class="nui-dictcombobox" dictTypeId="EXTERNAL_TYPE"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">甲方全称：</td>
								<td><input name="partyName" id="partyName" onbuttonclick="selectCustmer"
									class="nui-buttonedit" style="width: 250px" allowInput="true"
									required="true" /></td>
								<td align="right" style="width: 100px">项目名称：</td>
								<td><input name="projectName" id="projectName" class="nui-textbox"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">投资额/万：</td>
								<td><input name="investmentAmount" class="nui-textbox"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">标的额：</td>
								<td><input id="matterAmount" name="matterAmount"
									class="nui-dictcombobox" dictTypeId="MATTER_AMOUNT"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">项目地点：</td>
								<td><input name="projectlocal" id="projectlocal" class="nui-textbox"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">集团内外：</td>
								<td><input id="headquarterGroup" name="headquarterGroup"
									class="nui-dictcombobox" dictTypeId="HEADQUARTER_GROUP"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">特点：</td>
								<td><input id="characteristics" name="characteristics"
									class="nui-dictcombobox" dictTypeId="CHARACTERISTICS"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">工程类型：</td>
								<td><input id="serviceType" name="serviceType"
									class="nui-dictcombobox" dictTypeId="SERVICE_TYPE"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类型：</td>
								<td><input id="major" name="major"
									class="nui-dictcombobox" dictTypeId="BID_MAJOR"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">服务范围：</td>
								<td><input id="scopeService" name="scopeService"
									class="nui-dictcombobox" dictTypeId="SCOPE_SERVICE"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">主要项目特征：</td>
								<td><input name="features" class="nui-textbox"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">合同类型：</td>
								<td><input id="contractType" name="contractType"
									class="nui-dictcombobox" dictTypeId="CONTRACT_TYPE"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">采购方式：</td>
								<td><input id="procurementType" name="procurementType"
									class="nui-dictcombobox" dictTypeId="BIDPROCUREMENT_TYPE"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">价格模式：</td>
								<td><input id="priceModel" name="priceModel"
									class="nui-dictcombobox" dictTypeId="PRICE_MODEL"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">折合万/人月</td>
								<td><input name="equivalent" class="nui-textbox"
									style="width: 250px" required="true" /></td>
								<td align="right" style="width: 100px">中标结果：</td>
								<td><input id="bidResult" name="bidResult"
									class="nui-dictcombobox" dictTypeId="BID_RESULT"
									style="width: 250px" required="true" /></td>
							</tr>
							<tr>
							<td align="right" style="width: 120px">备注:</td>
							<td colspan="5"><input name="remake" class="nui-textarea"
								style="width: 100%" /></td>
						</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset style="border: solid 1px #aaa;padding: 3px;width: 1100px;">
			    <legend>其他单位投标信息</legend>
			<div class="nui-toolbar" style="border-bottom: 0;padding: 0px;" id="button_inorgid1">
	            <table style="width: 100%;">
	            	<tr>
	                    <td style="width: 20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="bidCom" class="nui-datagrid"  style="width: 100%;height: auto;" allowCellSelect="true" 
	    		url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getBidComInfo.biz.ext" dataField="bidCom"
	    		showPager="false" allowCellEdit="true" multiSelect="true" ondrawcell="setColor">
	            <div property="columns">
	              
	              
	               <div name="temp123" type="checkcolumn" valueField="competId"></div>
	               <div field="competId" displayField="custName" width="130" align="center" headerAlign="center"  renderer="getValue">其他投标单位
	                	<input property="editor" class="nui-combobox" required="true"
	                			url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getAllCompetitor.biz.ext" filterType="like" 
								textField="custname" valueField="custid" dataField="allCom" valueFromSelect="true" 
								allowInput="true"/>
	                </div> 
	                
	                <div field="comBidPrice" width="100" align="center" headerAlign="center" renderer="onViewL" >投标金额
	                	<input property="editor" class="nui-textbox" vtype="maxLength:100"/>
	                </div> 
	            </div>
	        </div>
		
			</fieldset>
			
			<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
				<legend>投标信息附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>
		
		
			
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		
		<a class="nui-button" onclick="edit()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">取消</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");
	   		Boolean isAdmin = false;//是否行政
			for(int i=0;i < roles.length;i++){
				if(roles[i].getString("roleid").equals("admin") || roles[i].getString("roleid").equals("finance")){
					isAdmin = true;
				}
			}
	    %>
	    var isAdmin = <%=isAdmin %>;
        //报销记录
	  	var form_expRei = new nui.Form("form_expRei");
	  	//报销明细
		var grid_expReidetail = nui.get("grid_expReidetail");
		//报销受益
		var grid_expReibenef = nui.get("grid_expReibenef");
		var grid_traveldetail = nui.get("grid_traveldetail");//行程列表
		
		var bidCom = nui.get("bidCom");
		//借款表
		var grid_beilist = nui.get("grid_beilist");
		
		var bidid=<%=request.getParameter("id")%>;
		
		var bidComId = "";
		
		var  yf="";
		
		//原报销单类型
		var expTypeOld;
        init();
        function init(){
        	
		
		  	var json = {id : bidid};   
		  	nui.ajax({	
					url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryBidByid.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (bidInfo) {
			       	  	var bidData = bidInfo.bidDetail;
			       	  	var form = new nui.Form("form_expRei");
						form.setData(bidData);
			       	  	nui.get("orgId").setText(bidData.orgname);
			       	  	nui.get("openTime").setValue(bidData.opentime);
			       	  	nui.get("creatUserid").setValue(bidData.creatUserid);
			       	  	nui.get("createUsername").setValue(bidData.empname);
			       	  	nui.get("partyName").setText(bidData.partyName);
			       	  	nui.get("matterAmount").setValue(bidData.matterAmount);
			       	  	nui.get("projectlocal").setValue(bidData.projectlocal);
			       	  	if(bidData.bidstatus == 1){
			       	  		nui.get("bidStatus").setText("是");
			       	  		nui.get("bidStatus").setValue(1);
			       	  	}else if(bidData.bidstatus == 0){
							nui.get("bidStatus").setText("否");
							nui.get("bidStatus").setValue(0);
			       	  	}
			       	  	
			       	  	
			       	  	/*  nui.get("startTime").setValue(bidData.startTime);
			       	  	nui.get("stopTime").setValue(bidData.stopTime); */
			       	  	 $('#startTime').val(bidData.startTime);
			       	  	  $('#stopTime').val(bidData.stopTime);
			       	  	  var grid_0 = nui.get("grid_0");
					grid_0.sortBy("fileTime","desc");
	            	grid_0.load({"groupid":"bidInfoFJ","relationid":bidid});
			       	  	getHTZQforinit(bidData);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    });   
				bidCom.load(json)
				
        }
        
         function getHTZQforinit(bidData){
        		/* form_expRei.validate();
    			var bidInfo = form_expRei.getData(); */
    			 $('#contractcycle').val(yf);
       	 }
       	 
        
        
         function getHTZQ(){
        		form_expRei.validate();
    			var bidInfo = form_expRei.getData();
    			/* var startTime =bidInfo.startTime;
    			var stopTime =bidInfo.stopTime; */
    			 $('#contractcycle').val(yf);
       	 }
       	 
       	 
        
        /**
		 * 在选择受益项目之前，根据受益部门筛选受益项目列表
		 */
		var projects = [];
	    function OnCellBeginEditBenef(e) {        
			var grid = e.sender;
		    var record = e.record;
		    var field = e.field;
		    var value = e.value;
		    var editor = e.editor;
		    var row = grid.getSelected();
		    //受益客户
		    if (field == "benefcustid") {
	        	var orgid = record.beneforgid;
	            var json=nui.encode({"orgid": orgid});
		        nui.ajax({	
					url: "com.primeton.eos.ame_common.ame_common.getCust.biz.ext",
					type: 'POST',
					data: json,
					success: function (text) {
			       	  	var custs = text.custs;
			       	  	editor.setData(custs);
					},
					error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
					}
			    });
	        }
		    //受益项目
	        if (field == "benefprojno") {
	        	var orgid = record.beneforgid;
        		var custid = record.benefcustid;
            	var json=nui.encode({"orgid": orgid,"custid":custid});
		        nui.ajax({	
					url: "com.primeton.eos.ame_fee.ReimbApply.queryBenProRei.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (text) {
			       	  	projects = nui.clone(text.projects);
			       	  	editor.setData(projects);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    });
	        }

	    }
	    
	    
	    
	    
	    //选择所投项目
	    function selectProjectList(){
        	//var allpurProj = purProjOutper_grid.getData();
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
                title: "选择项目",
                width: 850,
                height: 420,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.projectId);
                            btnEdit.setText(data.projectName);
                         
                        }
                    }
                }
            });
        }
	    
	    /**
	     * 选择受益部门后
	     */
	    function OnCellEndEditBenef(e){
	    	var grid = e.sender;
		    var record = e.record;
		    var field = e.field, value = e.value;
		    var editor = e.editor;
		    var row = grid.getSelected();
		    //受益部门
		    if (field == "beneforgid") {
	        	var orgid = record.beneforgid;
	            var json=nui.encode({"orgid": orgid});
		        nui.ajax({	
					url: "com.primeton.eos.ame_common.ame_common.getCust.biz.ext",
					type: 'POST',
					data: json,
					success: function (text) {
			       	  	var custs = nui.clone(text.custs);
			       	  	//如果客户只有一个的话，就默认选择这一个。
			       	  	if(1 == custs.length){
			       	  		var rowData = {"custjc": custs[0].custjc,"benefcustid": custs[0].custid};
					   	    grid.updateRow(row, rowData);
					   	    changeCustGrid("update");
			       	  	}
					},
					error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
					}
			    });
	        }
	        //受益项目
		    if (field == "benefprojno") {
		    	var orgid = record.beneforgid;
		    	var custid = record.benefcustid;
		    	var jsonPro = nui.encode({"orgid": orgid,"custid": custid});
		        nui.ajax({	
					url: "com.primeton.eos.ame_fee.ReimbApply.queryBenProRei.biz.ext",
					type: 'POST',
			    	data: jsonPro,
			    	success: function (textPro) {
			       	  	var projects1 = nui.clone(textPro.projects);
			       	  	if(1 == projects1.length){
				       	  	var rowData2 = {"benefprojno": projects1[0].projno,"projectName": cuprojects1sts[0].projName,
				       	  		"projno": projects1[0].projno};
			   	    		grid.updateRow(row, rowData2);
			       	  	}
			     	},
					error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
					}
			    });
		    }
	    }
		
		 function getValue(e){
		 	if(e.row.custName==undefined){
		 		return e.row.orgname
		 	}else{
		 		return e.row.custName;
		 	}
        	
        
        }
        function click1(){
        	console.log(1);
        }
		
        /**
         * 编辑报销明细前
         */
        function OnCellBeginEditDetail(e) {        
			var grid = e.sender;
		    var record = e.record;
		    var field = e.field, value = e.value;
		    var editor = e.editor;

	    }
    
    	function edit(){
    	
    			var bidInfo = form_expRei.getData();
    			var bidCompetitor=bidCom.getData();
    			
    			
    			var json = nui.encode({"bid":bidInfo,"bidid":bidid,"bidComId":bidComId,"bidCompetitor":bidCompetitor});
		  		
				if(!confirm("是否修改？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.editBitInfo.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               		 nui.alert("修改成功",null,function(){
		               		 window.CloseOwnerWindow("save"); 
		               		//CloseWindow("ok");
            					
            				});
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
		            }
    	
    	
    	
    	}
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
    	function onOk(e) {
    		/* if(!form_expRei.validate() || !form_expReibenef.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		} */
    		//验证
			/* if(!onOkCheck()){
				return;
			}else{ */
	    		//nui.get("eStatus").setValue(e);
	        	
		        	nui.confirm("请检查银行帐号是否填写正确！市内交通/招待费/通讯费等费用是否超标！<br/>"+
        		"超标费用请在补充说明栏说明原因并选择特批，否则按照限额报销！<br/>感谢您配合我们的工作。——财务部","操作提示",function(o){
		        		if("ok" == o){
		        			nui.get("creatReimbProcess").disable();
							nui.get("saveReimbProcess").disable();
		        			document.getElementById("fileCatalog").value="ExpRei";
				        	form2.submit();
		        		}else{
		        			
		        		}
		        	});
	        	
			}
        /* } */
        
        /**
         * 保存数据
         */
        function SaveData() {
        	form_expRei.loading("发起流程中...");
        	//报销记录
		  	var data_expRei = form_expRei.getData();
		  	//报销总金额
		  	data_expRei.expRei.total = nui.get("total").getValue();
		  	//核销总金额
		  	data_expRei.expRei.hxamt = nui.get("hxamt").getValue();
		  	//报销明细
			var data_expReidetail = grid_expReidetail.getData();
			//报销受益
			var data_expReibenef;
			//借款核销
			var data_grid_beilist = grid_beilist.getData();
			var data_grid_beilist_all = grid_beilist.getData();
			for(var i = 0;i < data_grid_beilist_all.length;i ++){
				//如果费用等于0，则提交的核销借款记录中剔除掉此条记录
				if(data_grid_beilist_all[i].expbmon > 0){
				}else{
					data_grid_beilist.remove(data_grid_beilist_all[i]);
				}
			}
			
			//多受益是否需要审批
			var isneedbenef = nui.get("isneedbenef").getValue();
			//是否多收益赋值
			var ismulti = nui.get("ismulti").getValue();
			data_expRei.expRei.isneedbenef = isneedbenef;
			data_expRei.expRei.ismulti = ismulti;
			if("1" == ismulti){	//多收益
				if("0" == isneedbenef){	
					data_expRei.benefFlag = 0;	//多受益无需审批
				}else{
					data_expRei.benefFlag = 1;	//多受益需要审批
				}
				//报销受益(多收益)
				data_expReibenef = grid_expReibenef.getData();
			}else{
				data_expRei.benefFlag = 1;	//单受益需要审批
				//报销受益(单收益)
				data_expReibenef = form_expReibenef.getData().expReibenef;
			}
			var data_opioion = opioionform.getData();
			//附件ID赋值
			data_expRei.expRei.fileids = nui.get("fileids").getValue();
			//流程关注
			data_expRei.expRei.guanzhu = nui.get("guanZhuButton").getValue();
	        var json = nui.encode({"expRei": data_expRei.expRei,"benefFlag": data_expRei.benefFlag,
	        	"expReidetails": data_expReidetail,"expReibenefs": data_expReibenef,
	        	"misOpinion": data_opioion.misOpinion,"expBeiReis": data_grid_beilist});
            nui.ajax({
                url: "com.primeton.eos.ame_fee.nonCostReiApply.creatReimbApply.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
                   	var eStatus = nui.get("eStatus").getValue();
	              	if(returnJson.result == "success"){
	              		form_expRei.unmask();
	    				if(eStatus==1){
		                   	nui.alert("发起流程成功！","系统提示",function (){
		                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
		                   	});
	    				}else if(eStatus==0){
	    					nui.alert("暂时保存成功！","系统提示",function (){
	    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
	    						form_expRei.unmask();
	    					});
	    				}
	              	}else if(returnJson.result == "-2"){
	              		form_expRei.unmask();
                   		nui.get("creatReimbProcess").enable();
						nui.get("saveReimbProcess").enable();
	    				if(eStatus==1){
		                   	nui.alert("发起流程失败！失败原因：未设置受益部门机构主管，请立即联系信息技术部！");
	    				}else if(eStatus==0){
	    					nui.alert("暂时保存失败！失败原因：未设置受益部门机构主管，请立即联系信息技术部！");
	    				}
                   	}else{
                   		form_expRei.unmask();
						nui.get("creatReimbProcess").enable();
						nui.get("saveReimbProcess").enable();
	    				if(eStatus==1){
		                   	nui.alert("发起流程失败！");
	    				}else if(eStatus==0){
	    					nui.alert("暂时保存失败！");
	    				}
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
       	}
    	
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        //选择招标人
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择服务客户",
		    width: 650,
		    height: 380,
		    ondestroy: function (action) {
		        if (action == "ok") {
		            var iframe = this.getIFrameEl();
		            var data = iframe.contentWindow.GetData();
		            data = nui.clone(data);    //必须
		            if (data) {
		                btnEdit.setValue(data.text);
		                btnEdit.setText(data.text);
		            }
		        }
		    }
	    });
	}
        
        
        
	    /**
	     * 增加报销明细行
	     */
	    function addExpReidetail() {    
	    	//增加报销明细时，弹出页面进行新增。
	    /* 	var exptype = nui.get("exptype").getValue();
	    	if(!exptype){
	    		nui.alert("请选择报销单类型！");
	    		return;
	    	} */
	    	//var feeseq = nui.get("exptype").getSelected().feeseq;
	    	nui.open({
	            url: "<%=request.getContextPath() %>/ame_fee/ReimbApply/addExpReidetail.jsp",
                title: "增加报销明细",
                width: 900,
                height: 445,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {"action": "new","exptype": exptype,"feeseq": feeseq,"isNoneReimb":true};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {//.
                        	for(var i = 0;i < data.length;i ++){
								var newRow = { name: "New Row",
								findate: data[i].expReidetail.findate,
								ticfintype: data[i].expReidetail.ticfintype,
								ticfintype2name: data[i].expReidetail.ticfintype2name,
								
								fintype: data[i].expReidetail.fintype,
								fintype2name: data[i].expReidetail.fintype2name,
								purcontid: data[i].expReidetail.purcontid,
								isrelatepur: data[i].expReidetail.isrelatepur,
								
								finmon: data[i].expReidetail.finmon,
								tictype: data[i].expReidetail.tictype,
								ticnum: data[i].expReidetail.ticnum,
								ticdate: data[i].expReidetail.ticdate,
								ticmon: data[i].expReidetail.ticmon,
								ticmonnet: data[i].expReidetail.ticmonnet,
								isspecial: data[i].expReidetail.isspecial,
								ticcomp: data[i].expReidetail.ticcomp,
								explain: data[i].expReidetail.explain,
								city: data[i].expReidetail.city,
								tictax: data[i].expReidetail.tictax };
	        					grid_expReidetail.addRow(newRow);
	        					ismultiSumfinmon();
                        	}
                        }
                    }
                }
            });
	    }
	    
	    /**
	     * 增加明细未关闭新增页面的情况下的回调函数
	     */
	    function addRowDetailInfo(data){
            data = nui.clone(data);    //必须
            if (data) {
            	for(var i = 0;i < data.length;i ++){
					var newRow = { name: "New Row",
					findate: data[i].expReidetail.findate,
					ticfintype: data[i].expReidetail.ticfintype,
					ticfintype2name: data[i].expReidetail.ticfintype2name,
					
					fintype: data[i].expReidetail.fintype,
					fintype2name: data[i].expReidetail.fintype2name,
					purcontid: data[i].expReidetail.purcontid,
					isrelatepur: data[i].expReidetail.isrelatepur,
					
					finmon: data[i].expReidetail.finmon,
					tictype: data[i].expReidetail.tictype,
					ticnum: data[i].expReidetail.ticnum,
					ticdate: data[i].expReidetail.ticdate,
					ticmon: data[i].expReidetail.ticmon,
					ticmonnet: data[i].expReidetail.ticmonnet,
					isspecial: data[i].expReidetail.isspecial,
					ticcomp: data[i].expReidetail.ticcomp,
					explain: data[i].expReidetail.explain,
					city: data[i].expReidetail.city,
					tictax: data[i].expReidetail.tictax };
					grid_expReidetail.addRow(newRow);
					ismultiSumfinmon();
            	}
            }
	    }
	    
	    
	    /**
	     * 编辑报销明细行
	     */
	    function editExpReidetail(){
	    	var exptype = nui.get("exptype").getValue();
	    	var feeseq = nui.get("exptype").getSelected().feeseq;
	    	var row = grid_expReidetail.getSelected();
	    	if(row){
		    	nui.open({
		            url: "<%=request.getContextPath() %>/ame_fee/ReimbApply/addExpReidetail.jsp",
	                title: "编辑报销明细",
	                width: 900,
	                height: 445,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {"action": "edit","exptype": exptype,"feeseq": feeseq,"expReidetail": row,"isNoneReimb":true};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {//.
	                        	for(var i = 0;i < data.length;i ++){
									var newRow = { name: "New Row",
									findate: data[i].expReidetail.findate,
									//yearMonth: data[i].expReidetail.yearMonth,
									ticfintype: data[i].expReidetail.ticfintype,
									ticfintype2name: data[i].expReidetail.ticfintype2name,
									
									fintype: data[i].expReidetail.fintype,
									fintype2name: data[i].expReidetail.fintype2name,
									purcontid: data[i].expReidetail.purcontid,
									isrelatepur: data[i].expReidetail.isrelatepur,
									
									finmon: data[i].expReidetail.finmon,
									tictype: data[i].expReidetail.tictype,
									ticnum: data[i].expReidetail.ticnum,
									ticdate: data[i].expReidetail.ticdate,
									ticmon: data[i].expReidetail.ticmon,
									ticmonnet: data[i].expReidetail.ticmonnet,
									isspecial: data[i].expReidetail.isspecial,
									ticcomp: data[i].expReidetail.ticcomp,
									explain: data[i].expReidetail.explain,
									city: data[i].expReidetail.city,
									tictax: data[i].expReidetail.tictax };
		        					grid_expReidetail.updateRow(row,newRow);
		        					ismultiSumfinmon();
	                        	}
	                        }
	                    }
	                }
	            });
	    	}else{
	    		nui.alert("请至少选择一条记录！");
	    	}
	    }
	    /**
         * 删除报销明细行
         */
		function removeExpReidetail() {
	    	var rows = grid_expReidetail.getSelecteds();
	        if (rows.length>0) {
	            grid_expReidetail.removeRows(rows, true);
	            ismultiSumfinmon();
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	    }
	    
		//汇总金额处理
		function doCountSum(e){        	
	        if (e.field == "money") {//未签署采购金额
	            e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
	        }
	    }
	    
	    /**
	     * 汇总报销明细金额
	     */
	    function onDrawExpReidetailGrid(e){
	    	if(e.field == "finmon"){
	        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        	var total= parseFloat(e.value).toFixed(2);
	        	nui.get("total").setValue(total);
	        }
	        if(e.field == "ticmon" || e.field == "ticmonnet"){
	        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	    }
	    
	    /**
	     * 当选择列时
	     */
        function selectionChanged(){
            var rows = grid_expReidetail.getSelecteds();
            if(rows.length>1){
                nui.get("editbtn").disable();
            }else{
                nui.get("editbtn").enable();
            }
        }
        
        /**
         * 报销明细列变化统计单收益总费用
         */
        function ismultiSumfinmon(e){
        	var rowData = grid_expReidetail.getData();
        	var sumfinmon = 0;
        	for(var i = 0;i < rowData.length;i ++){
        		sumfinmon += rowData[i].finmon;
        	}
        	//如果是单收益
        	var ismulti = nui.get("ismulti").getValue();
        	if(0 == ismulti){
        		nui.get("benefmon").setValue(sumfinmon);
        	}
        }
	    
		/**
	     * 增加报销受益行
	     */
	    function addExpReibenef() {    
	    	var newRow = { name: "New Row",
					orgname: "<%=userOrgName %>",
					eforgid: "<%=userOrgId %>"};
	        grid_expReibenef.addRow(newRow);
	    }
	    
	    /**
	     * 删除报销受益行
	     */
	    function removeExpReibenef() {
	    	var rows = grid_expReibenef.getSelecteds();
	        if (rows.length>0) {
	            grid_expReibenef.removeRows(rows, true);
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	    }
	    
	   
        
        /**
         *	选择报销单送递人
         */
        function selectSenderuser(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择纸质报销单送递财务人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            nui.get("senderusername").setValue(data.empname);
                            /* nui.get("exporgid").setValue(data.orgid);
                            nui.get("exporgid").setText(data.orgname);
                            nui.get("expusername").setValue(data.empname); */
                        }
                    }

                }
            });
        }
        /**
         * 是否特批
         */
        function dictMisYn(e) {
			return nui.getDictText('MIS_YN',e.value);//设置业务字典值
		}
		
		/**
		 * 发票类型
		 */
        function dictTictype(e) {
			return nui.getDictText('MIS_MA_INVOICETYPE',e.value);//设置业务字典值
		}
		
		/**
		 * 发票费用类型
		 */
        function dictTicfinType(e) {
			return nui.getDictText('AME_BEITYPE',e.value);//设置业务字典值
		}
		
		/**
		 * 费用类型
		 */
		function dictFinType(e){
			return nui.getDictText('AME_BEITYPE',e.value);//设置业务字典值
		}
		
		
		/**
		 * 付款类型
		 */
		function getDictExptype(e){
	    	return nui.getDictText('EXP_EXPTYPE',e.value);//设置业务字典值
	    }
	    
	    /**
	     * 核销对应科目
	     */
	    function getDictHxdykm(e){
	    	return nui.getDictText('EXP_HXU8',e.value);//设置业务字典值
	    }
	    
	    /**
	     * 核销借款状态
	     */
	    function getDictExpstatus(e){
	    	return nui.getDictText('EXP_CHECKFLAG',e.value);//设置业务字典值
	    }
	    
	    //设置日期格式
		function onDealDate(e){
			if(typeof(e.value) == "string"){
				return e.value.substring(0,10);
			}else if (typeof(e.value) == "object"){
				var yearvalue = e.value.getFullYear();
				var monthvalue = e.value.getMonth()+1;
				var dayvalue = e.value.getDate();
				if(monthvalue < 10){
					return yearvalue+"-0"+monthvalue+"-"+dayvalue;
				}else{
					return yearvalue+"-"+monthvalue+"-"+dayvalue;
				}
			}
		}
		
		/**
		 * 借款详情
		 */
		function onExpno(e){
			if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkDetail(){
	 		var selectRow = grid_beilist.getSelected();
			var executeUrl = "/default/ame_fee/PaymentApply/PayApplyDetail.jsp?expid=" + selectRow.expid;
			window.open(executeUrl, "付款申请明细", "fullscreen=1");
	    }
		
		/**
		 * 选择项目
		 */
		function selectProject(){
        	var btnEdit = this;
        	nui.open({
                url: "<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
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
	                            btnEdit.setValue(data.projectno);
	                            btnEdit.setText(data.projectName);
                        	}
                        }
                    }
                }
            });
        }
        
        /**
         * 选择银行账号
         */
        function chooseBank(){
        	var empid = "<%=empid %>";
           var expusername = nui.get("expusername").getValue();
			nui.open({
		        url: "<%=request.getContextPath() %>/ame_pur/settlepay/selectBankInfo.jsp?empid="+empid,
		        title: "查询银行信息", 
		        width: 650, 
		        height: 420,
		        onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = {expusername:expusername};
	            iframe.contentWindow.SetData(data); 
	            },
		        ondestroy: function (action) {//弹出页面关闭前
		            if (action == "ok") {
		                var iframe = this.getIFrameEl();
		                var data = iframe.contentWindow.GetData();
		                data = nui.clone(data);    //必须
		                if (data) {
		                	if(data.username){
		                        nui.get("companyname").setValue(data.username);
		                	}
		                    nui.get("bankname").setValue(data.bankname);
		                    nui.get("bankacct").setValue(data.bankacct);
		                }
		            }
		        }
		    });
	    }
	    
	    /**
	     * 在选择受益项目之前，根据受益部门筛选受益项目列表
	     */
	    function OnCellBeginEdit(e) {        
			var grid = e.sender;
		    var record = e.record;
		    var field = e.field, value = e.value;
		    var editor = e.editor;
	        if (field == "benefprojno") {
	        	var orgid = record.beneforgid;
	            var json=nui.encode({"orgid": orgid});
		        nui.ajax({	
				      url: "com.primeton.eos.ame_fee.ReimbApply.queryBenProRei.biz.ext",
				      type: 'POST',
			          data: json,
			          success: function (text) {
			       	  	var projects = nui.clone(text.projects);
			       	  	editor.setData(projects);
			          },
				      error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				      }
			    });
	        }
	    }
    
	    /**
	     * 受益部门改变时清空对应受益项目
	     */
	    function changeOrgGrid(e){
			var row = grid_expReibenef.getSelected();
			var rowData = {"benefprojno": "","projectName": "","projno" : "","custjc": "","benefcustid": "","contnum": ""};
	   	    grid_expReibenef.updateRow(row,rowData);
	    }
	    
	    function closecustGrid(e){
	    	var row = grid_expReibenef.getSelected();
			var rowData = {"benefprojno": "","projectName": "","projno" : "","custjc": "","benefcustid": "","contnum": ""};
	   	    grid_expReibenef.updateRow(row,rowData);
	   	    nui.get("clearcustid").setValue("");
	   	    nui.get("clearcustid").setText("");
	    }
	    
	    /**
	     * 选择客户
	     */
	    function changeCustGrid(e){
	    	var row = grid_expReibenef.getSelected();
	    	var orgid = row.beneforgid;
	    	var custid;
	    	if("update" == e){
	    		custid = row.benefcustid;
	    	}else{
	    		custid = nui.get("clearcustid").getValue();
	    	}
	    	var jsonPro = nui.encode({"orgid": orgid,"custid": custid});
	        nui.ajax({	
				url: "com.primeton.eos.ame_fee.ReimbApply.queryBenProRei.biz.ext",
				type: 'POST',
		    	data: jsonPro,
		    	success: function (textPro) {
		       	  	var projects1 = nui.clone(textPro.projects);
		       	  	if(1 == projects1.length){
			       	  	var rowData2 = {"benefprojno": projects1[0].projectno,"projectName": projects1[0].projectName,
			       	  		"projno": projects1[0].projectno};
		   	    		grid_expReibenef.updateRow(row, rowData2);
		       	  	}
		     	},
				error: function (jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.responseText);
				}
		    });
	    }
	    
	    /** 
	     * 受益部门改变时清空对应受益项目(表单)
	     */
	    /* function changeOrgForm(e){
	    	nui.get("benefprojno").setValue("");
	   	   	nui.get("projno").setValue("");
	   	   	nui.get("custjc").setValue("");
	   	    var json=nui.encode({"orgid": e.value});
	        nui.ajax({	
				url: "com.primeton.eos.ame_common.ame_common.getCust.biz.ext",
				type: 'POST',
				data: json,
				success: function (text) {
		       	  	var custs = text.custs;
		       	 	nui.get("custjc").setData(custs);
		       	  	if(1 == custs.length){
		       	  		nui.get("custjc").select(0);
		       	  		changeCustForm();
		       	  	}
				},
				error: function (jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.responseText);
				}
		    });
	    } */
	    
	    /**
	     * 修改客户（表单）
	     */
	    function changeCustForm(e){
	   	    nui.get("benefprojno").setValue("");
	   	   	nui.get("projno").setValue("");
	   	   	var beneforgid = nui.get("beneforgid").getValue();
	   	    var custid = nui.get("custjc").getValue();
	   	    var json = nui.encode({"orgid": beneforgid,"custid": custid});
	        nui.ajax({	
			      url: "com.primeton.eos.ame_fee.ReimbApply.queryBenProRei.biz.ext",
			      type: 'POST',
		          data: json,
		          success: function (text) {
		       	  	var projects1 = text.projects;
		       	 	nui.get("benefprojno").setData(projects1);
		       	 	if(1 == projects1.length){
		       	 		nui.get("benefprojno").select(0);
		       	 		if(0 != projects1[0].projectno){
		       	 			nui.get("projno").setValue(projects1[0].projectno);
		       	 		}
		       	 	}
		          },
			      error: function (jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.responseText);
			      }
		    });
		}
		
		function clearCust(e){
	    	nui.get("custjc").setValue("");
	    	nui.get("custjc").setText("");
	    	nui.get("benefprojno").setValue("");
	    	nui.get("benefprojno").setText("");
	   	   	nui.get("projno").setValue("");
	   	   	nui.get("contnum").setValue("");
	    }
	    
	    function selectMisCustinfo(e) {
	        var btnEdit = this;	
	        var lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
	        nui.open({
				url:"<%=request.getContextPath()%>"+lookupUrl,
				title: "选择客户",
				width: 600,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
		                	var json=nui.encode({"custid": data.id});
					        nui.ajax({	
							      url: "com.primeton.eos.ame_fee.paymentApply.queryCustPro.biz.ext",
							      type: 'POST',
						          data: json,
						          success: function (text) {
						       	    var	projects1 = text.projects;
						       	 	nui.get("benefprojno").setData(projects1);
						       	 	nui.get("projno").setValue("");
						          },
							      error: function (jqXHR, textStatus, errorThrown) {
							        alert(jqXHR.responseText);
							      }
						    });
						}
					}
				}
			});
		}
		
	    
	    /**
	     * 受益项目改动自动填充项目编号，所属客户
	     */
	    function changePrjForm(e){
	    	if(0 != nui.get("benefprojno").getSelected().projectno){
		    	nui.get("projno").setValue(nui.get("benefprojno").getSelected().projectno);
		    	var projno = nui.get("benefprojno").getSelected().projectno;
		    	var json=nui.encode({"projectno": projno});
		    	nui.ajax({	
				      url: "com.primeton.eos.ame_fee.nonCostReiApply.getProjContnum.biz.ext",
				      type: 'POST',
			          data: json,
			          success: function (text) {
			       	  	var contnum = text.contnum;
		       	 		nui.get("contnum2").setValue(contnum);
			          },
				      error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				      }
			    });
	    	}else{
	    		nui.get("projno").setValue("");
	    		nui.get("contnum2").setValue("");
	    	}
	    	nui.get("contnum").setValue(nui.get("benefprojno").getSelected().contnum);
	    }
	    
	    /**
	     * 清空受益项目时清空对应项目编号
	     */
	    function clearproject(){
	    	nui.get("benefprojno").setValue("");
			nui.get("benefprojno").setText("");
	    	nui.get("projno").setValue("");
	    	nui.get("contnum").setValue("");
	    }
	    
	    /**
	     * 付款类型为差旅申请等时，受益项目改动自动填充项目编号，所属客户
	     */
	    function changePrjGrid(e){
	    	var grid = e.sender;
		    var value = e.value;
		    var row = grid_expReibenef.getSelected();
		    var json=nui.encode({"projectno": e.value});
	    	nui.ajax({	
			      url: "com.primeton.eos.ame_fee.nonCostReiApply.getProjContnum.biz.ext",
			      type: 'POST',
		          data: json,
		          success: function (text) {
		       	  	var contnum = text.contnum;
		       	 	var rowData = {"projno": e.value,"contnum": contnum};
   	    			grid_expReibenef.updateRow(row,rowData);
		          },
			      error: function (jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.responseText);
			      }
		    });
	    }
	    
	    /**
	     * 报销受益样式
	     */
	   /*  grid_expReibenef.on("drawcell", function (e) {
            var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式   
            if("beneforgid" == field || "benefprojno" == field || "benefmon" == field || "benefregion" == field 
            	|| "fintype" == field || "benefcustid" == field){
            	e.cellStyle = "background: yellow";
            }
        }); */
	    
	    /**
	     * 汇总报销总金额
	     */
	    function onDrawExpReibenefGrid(e) {
	        if(e.field == "benefmon"){
	        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	    }
	    
	    function ondrawExpReibenefcell(e){
	    	var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式   
            if("projno" == field){
            	if("0" == value){
            		e.cellHtml = "";
            	}
            }
	    }
	    
	    /**
	     * 借款核销样式
	     */
	    /* grid_beilist.on("drawcell", function (e) {
            var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式   
            if("expbmon" == field){
            	e.cellStyle = "background: yellow";
            }
        });
	     */
	    /**
	     * 汇总核销借款 
	     */
	    
	    function drawsummaryBeilistGrid(e){
	    	var record = e.record;
	    	if(e.field == "confamt" || e.field == "expbmon"){
	        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if(e.field == "surplusexpbmon"){
	        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        	expbmon = e.value;
	        }
	        
	    }
	    
	    /**
	     * 选择核销借款记录
	     */
	    function selectBeilist(e){
	    	return;
	    	var rows = grid_beilist.getData();
	    	var hxamt = 0;
	    	for(var i = 0;i < rows.length;i ++){
	    		if(rows[i].expbmon){
		    		hxamt += rows[i].expbmon;
	    		}
	    	}
	    	nui.get("hxamt").setValue(hxamt);
	    }
	    
	    /**
	     * 编辑核销借款记录
	     */
	    function oncellendeditBeilist(e){
	    	var row = grid_beilist.getRow(e.rowIndex);
	    	//付款金额
	    	var confamt = 0;
	    	//本次核销金额
        	var expbmon = 0;
        	//剩余核销金额
        	var surplusexpbmon = 0;
        	//原核销金额
	    	var surplusexpbmonold = 0;
        	if(row.confamt){
	        	confamt = row.confamt;
	        }
        	if(row.expbmon){
        		expbmon = row.expbmon;
        	}
        	if(row.surplusexpbmon){
        		surplusexpbmon = row.surplusexpbmon;
        	}
    		if(row.surplusexpbmonold){	
        		surplusexpbmonold = row.surplusexpbmonold; 
    		}
    		if(expbmon < 0){
    			nui.alert("本次核销金额不能小于0");
    			var rowData = {expbmon: 0,surplusexpbmon: surplusexpbmonold};
				grid_beilist.updateRow(row,rowData);
				var rows = grid_beilist.getData();
		    	var hxamt = 0;
		    	for(var i = 0;i < rows.length;i ++){
		    		if(rows[i].expbmon){
			    		hxamt += rows[i].expbmon;
		    		}
		    	}
		    	nui.get("hxamt").setValue(hxamt);
    			return;
    		}
        	surplusexpbmon = (parseFloat(surplusexpbmonold) - parseFloat(expbmon)).toFixed(2);
        	if(surplusexpbmon < 0){
        		nui.alert("本次核销金额已超额！","操作提示",function(){
        			var rowData = {expbmon: 0,surplusexpbmon: surplusexpbmonold};
					grid_beilist.updateRow(row,rowData);
					var rows = grid_beilist.getData();
			    	var hxamt = 0;
			    	for(var i = 0;i < rows.length;i ++){
			    		if(rows[i].expbmon){
				    		hxamt += rows[i].expbmon;
			    		}
			    	}
			    	nui.get("hxamt").setValue(hxamt);
	        		return;
        		});
        	}else{
		    	//赋值剩余核销
	        	var rowData = {surplusexpbmon: surplusexpbmon};
				grid_beilist.updateRow(row,rowData);
		    	var rows = grid_beilist.getData();
		    	var hxamt = 0;
		    	for(var i = 0;i < rows.length;i ++){
		    		if(rows[i].expbmon){
			    		hxamt += rows[i].expbmon;
		    		}
		    	}
		    	nui.get("hxamt").setValue(hxamt);
        	}
	    }
	    
	    
	    /**
	     * 报销单改变前
	     */
	    var exptypeOld;
	    function beforechanged(){
	    	exptypeOld = nui.get("exptype").getValue();
	    }
	    /**
	     * 报销单类型改变
	     */
	    function changeexptype(){
	    	var exptype = nui.get("exptype").getValue();
	    	if(!isAdmin){
    			nui.get("creatReimbProcess").enable();
				nui.get("saveReimbProcess").enable();
	    	}else{
	    		nui.get("creatReimbProcess").enable();
				nui.get("saveReimbProcess").enable();
	    	}
	    	//切换报销单类型提示。
	    	var detailRows = grid_expReidetail.getData();
	    	var benefRows = grid_expReibenef.getData();
    		var ismulti = nui.get("ismulti").getValue();
	    	if(detailRows.length > 0){
	    		if("0" == ismulti){	//单收益
	    			if(confirm("切换报销单类型将会清空已填写的报销明细和受益，请确定是否切换吗？")){
		    			grid_expReidetail.clearRows();
		    			form_expReibenef.clear();
		    		}else{
		    			nui.get("exptype").setValue(exptypeOld);
		    			return;
		    		}
	    		}else if("1" == ismulti){	//多收益
	    			if(benefRows.length > 0){
		    			if(confirm("切换报销单类型将会清空已填写的报销明细和受益，请确定是否切换吗？")){
			    			grid_expReidetail.clearRows();
			    			grid_expReibenef.clearRows();
			    		}else{
			    			nui.get("exptype").setValue(exptypeOld);
			    			return;
		    			}
		    		}
	    		}
	    	}else{
	    		if("1" == ismulti){	//多收益
	    			if(benefRows.length > 0){
		    			if(confirm("切换报销单类型将会清空已填写的报销明细和受益，请确定是否切换吗？")){
			    			grid_expReidetail.clearRows();
			    			grid_expReibenef.clearRows();
			    		}else{
			    			nui.get("exptype").setValue(exptypeOld);
			    			return;
		    			}
		    		}
	    		}
	    	}
	    }
	    
	    
	    /**
	     * 选择付款方式
	     */
	    function changePaymode(e){
	    	var paymode = nui.get("paymode").getValue();
	    	if(paymode == "2"){	//付款方式为网银转账，则显示银行账号、银行名称、收款单位和单位电话
	    		document.getElementById("bankinfo").style.display = "";
	    		document.getElementById("companyinfo").style.display = "";
	    	}else if("1" == paymode){	//付款方式为现金，不显示银行账号、银行名称、收款单位和单位电话
	    		document.getElementById("bankinfo").style.display = "none";
	    		document.getElementById("companyinfo").style.display = "none";
	    	}else{
	    		document.getElementById("bankinfo").style.display = "none";
	    		document.getElementById("companyinfo").style.display = "";
	    	}
	    	
	    }
	    
	    /**
	     * 是否多受益
	     */
	  /*   function changeIsmulti(e){
	    	var ismulti = nui.get("ismulti").getValue();
	    	if("1" == ismulti){
	    		document.getElementById("grid_expReibenef_tool").style.display = "";
	    		document.getElementById("expReibenefForm").style.display = "none";
	    		$("#isneedbenef").show();
	    		$("#upload").show();
	    		$("#ts").show();
	    	}else{
	    		document.getElementById("grid_expReibenef_tool").style.display = "none";
	    		document.getElementById("expReibenefForm").style.display = "";
	    		$("#isneedbenef").hide(0.001);
	    		$("#upload").hide(0.001);
	    		$("#ts").hide(0.001);
	    		//单收益，算费用
	    		ismultiSumfinmon();
	    	}
	    } */
	    
	    /**
	     * 选择费用类型
	     */
	    function onCloseClick(e) {
            var obj = e.sender;
            obj.setText("");
            obj.setValue("");
        }
        function beforenodeselect(e) {
            //禁止选中父节点
            if (e.isLeaf == false) e.cancel = true;
        }
        
        function onOkCheck(){
        	var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j = 0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	//报销明细总金额
        	var expReidetailTotalMoney = 0;
        	//报销受益总金额
        	var expReibenefTotalMoney = 0;
        	//报销明细
			var data_expReidetail = grid_expReidetail.getData();
			//报销受益
			var data_expReibenef = grid_expReibenef.getData();
			//是否多收益
			var ismulti = nui.get("ismulti").getValue();
			
        	//判断报销明细是否为空
			if(data_expReidetail == null || data_expReidetail == ""){
				nui.alert("报销明细不能为空！");
				nui.get("creatReimbProcess").enable();
				nui.get("saveReimbProcess").enable();
				return false;
			}else{
				for(var i = 0;i < data_expReidetail.length;i ++){
					expReidetailTotalMoney += data_expReidetail[i].finmon;
					if(data_expReidetail[i].finmon <= 0){
						nui.alert("报销明细费用必须大于0！");
						nui.get("creatReimbProcess").enable();
						nui.get("saveReimbProcess").enable();
						return false;
					}
				}
			}
			//报销受益(报销受益分为单收益和多受益，如果是多收益，列表不能为空，如果是单收益，表单不能为空)
			if("1" == ismulti){	//是多收益
				if(data_expReibenef == null || data_expReibenef == ""){
					nui.alert("报销受益不能为空！");
					nui.get("creatReimbProcess").enable();
					nui.get("saveReimbProcess").enable();
					return false;
				}else{
					for(var i = 0;i < data_expReibenef.length;i ++){
						//报销受益的受益部门和受益项目不能为空
						if(!data_expReibenef[i].beneforgid){
							nui.alert("报销受益的受益部门不能为空！");
							return false;
						}
						if(!data_expReibenef[i].benefprojno){
							nui.alert("报销受益的受益项目不能为空！");
							return false;
						}
						expReibenefTotalMoney += data_expReibenef[i].benefmon;
						if(data_expReibenef[i].benefmon <= 0){
							nui.alert("报销受益费用必须大于0！");
							nui.get("creatReimbProcess").enable();
							nui.get("saveReimbProcess").enable();
							return false;
						}
					}
				}
				
				//----------接来下是要判断报销明细和报销受益的相同类型的金额是否相等问题----------------
				var data_expReidetail = grid_expReidetail.getData();
	    		var data_expReibenef = grid_expReibenef.getData();
	    		//报销明细数组
	        	var expReidetailArray = new Array();
	        	for(var i = 0;i < data_expReidetail.length;i ++){
	        		expReidetailArray[i] = [data_expReidetail[i].fintype,data_expReidetail[i].finmon];
	        	}
	        	var expReidetailArray1 = nui.clone(expReidetailArray);
	        	var expReidetailArray2 = new Array();
	        	expReidetailArray1.sort();
                var expReidetailIndex = 0;
                var expReidetailTypes="";
                //用于判断类型重复
                for(var i = 0;i < expReidetailArray1.length;i ++){
					var t_type = expReidetailArray1[i][0];
					var t_value= 0;
					var check_type="_"+t_type+"_";
					if(expReidetailTypes.indexOf(check_type)>-1){
						continue;
					}
					for(var j = 0;j < expReidetailArray1.length;j ++){
						var c_type= expReidetailArray1[j][0];
						var c_value= expReidetailArray1[j][1];
						if(t_type==c_type){
							t_value = t_value+c_value;
						}else{
							continue;
						}
					}
					if(expReidetailArray2.length>0){
						for(var k=0;k<expReidetailArray2.length;k++){
							var f_type= expReidetailArray2[k][0];
							if(t_type==f_type){
								break;
							}else{
								expReidetailArray2[expReidetailIndex] = [t_type,t_value];
								expReidetailTypes = expReidetailTypes+check_type;
							}
						}
					}else{
						expReidetailArray2[0] = [t_type,t_value];
                  		expReidetailTypes = check_type;
					}
					expReidetailIndex ++;
                }
	        	//报销受益数组
	        	var expReibenefArray = new Array();
	        	for(var i = 0;i < data_expReibenef.length;i ++){
	        		expReibenefArray[i] = [data_expReibenef[i].fintype,data_expReibenef[i].benefmon];
	        	}
	        	var expReibenefArray1 = nui.clone(expReibenefArray);
	        	var expReibenefArray2 = new Array();
	        	expReibenefArray1.sort();
                var expReibenefIndex = 0;
                var expReibenefTypes="";
                //用于判断类型重复
                for(var i = 0;i < expReibenefArray1.length;i ++){
					var t_type = expReibenefArray1[i][0];
					var t_value= 0;
					var check_type="_"+t_type+"_";
					if(expReibenefTypes.indexOf(check_type)>-1){
						continue;
					}
					for(var j = 0;j < expReibenefArray1.length;j ++){
						var c_type= expReibenefArray1[j][0];
						var c_value= expReibenefArray1[j][1];
						if(t_type==c_type){
							t_value = t_value+c_value;
						}else{
							continue;
						}
					}
					if(expReibenefArray2.length>0){
						for(var k=0;k<expReibenefArray2.length;k++){
							var f_type= expReibenefArray2[k][0];
							if(t_type==f_type){
								break;
							}else{
								expReibenefArray2[expReibenefIndex] = [t_type,t_value];
								expReibenefTypes = expReibenefTypes+check_type;
							}
						}
					}else{
						expReibenefArray2[0] = [t_type,t_value];
                  		expReibenefTypes = check_type;
					}
					expReibenefIndex++;
                }
	    		if(expReidetailArray2.length != expReibenefArray2.length){
	    			nui.alert("报销明细的各实际费用类型对应的费用与报销受益各费用类型对应的费用不相等！");
	    			nui.get("creatReimbProcess").enable();
					nui.get("saveReimbProcess").enable();
	    			return false;
	    		}
	    		for(var i = 0;i < expReidetailArray2.length;i ++){
	    			for(var j = 0;j < expReibenefArray2.length;j ++){
	    				if(expReidetailArray2[i][0] == expReibenefArray2[i][0]){
	    					if(parseFloat(expReidetailArray2[i][1]).toFixed(2) != parseFloat(expReibenefArray2[i][1]).toFixed(2)){
	    						nui.alert("报销明细的各实际费用类型对应的费用与报销受益各费用类型对应的费用不相等！");
	    						nui.get("creatReimbProcess").enable();
								nui.get("saveReimbProcess").enable();
	    						return false;
	    					}
	    				}
	    			}
	    		}
			}else if("0" == ismulti){	//是单受益
				expReibenefTotalMoney = nui.get("benefmon").getValue();
			}
			
			//判断报销明细总金额与报销受益总金额是否相等
			if(parseFloat(expReidetailTotalMoney).toFixed(2) != parseFloat(expReibenefTotalMoney).toFixed(2)){
				nui.alert("报销明细总金额与报销受益总金额不相等！");
				nui.get("creatReimbProcess").enable();
				nui.get("saveReimbProcess").enable();
				return false;
			}
			
			//判断核销总金额是否小于报销总金额
			var hxamt = nui.get("hxamt").getValue();
			var total = nui.get("total").getValue();
			if(parseFloat(total).toFixed(2) < parseFloat(hxamt).toFixed(2)){
				nui.alert("核销总金额不能大于报销总金额！");
				nui.get("creatReimbProcess").enable();
				nui.get("saveReimbProcess").enable();
				return false;
			}
			var bankacct = nui.get("bankacct").getValue();
			var companyname = nui.get("companyname").getValue();
			var bankname = nui.get("bankname").getValue();
			if(bankacct == null || bankacct==""){
				nui.alert("银行账号不能为空！");
				return false;
			}
			if(companyname == null || companyname==""){
				nui.alert("收款单位不能为空！");
				return false;
			}
			if(bankname == null || bankname==""){
				nui.alert("收款单位不能为空！");
				return false;
			}
			return true;
        }
        
        function changeValue(){
        	var bankacct = nui.get("bankacct").getValue();
        	var a = bankacct.replace(/\s/g, "");
        	nui.get("bankacct").setValue(a);
        }
         
    function addTicket(){
    	var rowS = {competBidPrice: "New Row"} 
		bidCom.addRow(rowS);
    	<%--var row = grid_traveldetail.getData();
    	if(row.length==0){
    		var rowS = {name: "New Row"} 
    		grid_traveldetail.addRow(rowS);
    	}else{
    		var rowS = {name: "New Row",bookingregion:row[0].bookingregion};
    		grid_traveldetail.addRow(rowS);
    	}--%>
    }
    
	//删除行程明细
	function removeTicket(){
		var rows = bidCom.getSelecteds();
        if (rows.length>0) {
        
        	if(rows[0].id==undefined){
        	  	bidCom.removeRows(rows, true);
        	}else{
        		if(bidComId==""){
        			bidComId = bidComId+rows[0].id;
        		}else{
        			bidComId = bidComId+","+rows[0].id;
        		}
        		bidCom.removeRows(rows, true);
        	}
        	
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	
	function setColor(e){
		var row = e.record;
	    if (e.field == "traffictype") {
	        if(e.value == "2" || e.value == "4"){
		         e.cellStyle = "background:yellow";
    		}
	    }
	    if(e.field == "timequantums" || e.field == "timequantume" ||e.field == "bookingregion" ){
	    	if(row.bookingtype == "2"){
	    		e.value = "";
	    		e.cellHtml = "";
	    		row.timequantums = "";
	    		row.timequantume = "";
	    		row.bookingregion = "";
	    	}
	    }
	}
    </script></body>
</html>
