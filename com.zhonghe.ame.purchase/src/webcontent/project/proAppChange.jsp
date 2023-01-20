<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购计划立项申请 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>采购立项</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right">立项名称：</td>
								<td>
									<input name="proAppName"  class="nui-textbox" style="width: 300px" required="true"/>
									<input name="planId" id="planId" class="nui-hidden" style="width: 100%" required="true"/>
									<input name="putunder" id="putunder" class="nui-hidden" style="width: 100%" required="true"/>
								</td>
								<td align="right" style="width: 140px">分公司职能部门经办人：</td>
								<td  >
									<input name="proAppAgentUserid" id="proAppAgentUserid"  class="nui-buttonedit" 
										onbuttonclick="selectOmEmployee" style="width: 170px"  />
									<input name="proAppCode" readonly="readonly" class="nui-hidden" required="true"/>
								</td>
							<td align="right" style="width: 120px">立项单位：</td>
								<td >
									<input
										name="proAppOrgId" id="proAppOrgId" class="nui-combobox"  value="<%=userOrgId %>"
										url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
										filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true"
										style="width: 300px;" enabled="false" />
									<input name="proAppOrgName" value="<%=userOrgName %>" class="nui-hidden" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">所属项目名称：</td>
									<td><input name="projectId"  class="nui-textbox" required="true" style="width: 100%" /></td>
								<td align="right" style="width: 100px">立项申请金额(万元)：</td>
								<td>
									<input name="proAppApplyPrice"  id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 100%"  required="ture"/>
								</td>
								<td align="right" style="width:160px">项目拟实施日期：</td>
								<td>
									<input name="proAppImplTime"  class="nui-datepicker" style="width: 300px"/>
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right" style="width:120px;">立项类型：</td>
			                    <td >    
			                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" visible="true" style="width:100%;"/>
			                    </td>
								<td align="right" style="width: 100px">费用来源：</td>
									<td><input name="costFrom"  class="nui-radiobuttonlist"  data="[{id: '1', text: '公司自筹资金'}, {id:'2', text: '中央预算内资金'}]" required="ture"/></td>
								<td align="right" style="width:160px">立项对象类别：</td>
									<td><input name="proAppObjType"  class="nui-radiobuttonlist"  data="[{id: '1', text: '工程'}, {id:'2', text: '物资'}, {id:'3', text: '服务'}]" required="ture"/></td>
							</tr>
							<tr id="one111">
              		<td class="form_label"  align="right" style="width:120px;">立项范围说明：</td>
                    <td colspan="7">    
                        <input style="width:100%;height: 40px;" name="proAppRange" class="nui-textarea"  id="technologyNeed" />
                    </td>
              	</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset  style="height:80%; border:solid 1px #aaa;padding:3px;">
		     <div class="fieldset-body"  style="width:100%; height:auto; margin: 0px auto">
		    		 <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a> 
		            <a class="nui-button" id="delbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a> 
			    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
			    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ" >
			           <div property="columns">
		       				<div  type="checkcolumn"></div>
			           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
			           		<div  field="code" width="110" align="center" headerAlign="center" >计划编号</div>
			                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  >采购物项名称 </div>
			                <div field="budgetAmount"  width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
			                <div field="sumamount"  width="110" align="center" headerAlign="center" vtype="required">可立项金额(万元)</div>
			                <div field="amount"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">立项金额(万元)
			                	<input property="editor" class="nui-spinner" minValue="0"  maxValue="999999999" name="amount" visible="true"/>
			                </div>
			                <div field="needOrgName"  width="60" align="center" headerAlign="center" >采购单位</div> 
			                <div field="contractamount"  width="100" align="center" headerAlign="center" vtype="true" visible="false">拟签合同金额(元)
			                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
			                </div>
			            </div>
			        </div>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>费用估算证明附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
				<jsp:include page="/ame_common/addFiles.jsp"/>
			</fieldset>
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>立项支持材料附件</legend>
				<jsp:include page="/ame_common/detailFile2.jsp"/>
				<jsp:include page="/ame_common/addFiles1.jsp"/>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	    var id = <%=request.getParameter("id")%>;
		var form = new nui.Form("#form1");
		var gridDtl = nui.get("grid_detail");
		init();
        function init(){
        	var json = nui.encode({"id":id});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 var result=o.proApp[0]
						 form.setData(result);
						 clog(result)
						  nui.get("proAppAgentUserid").setText(result.agentempname)
						  gridDtl.load({"pid":result.id})
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"proAppCost","relationid":result.id});
						 grid_0.sortBy("fileTime","desc");
						 var grid_1 = nui.get("grid_1");
        				 grid_1.load({"groupid":"proAppSup","relationid":result.id});
						 grid_1.sortBy("fileTime","desc");
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
		}
		
		function  addTicket(){
			var type =  nui.get("type").getValue()
			var putunder =  nui.get("putunder").getValue()
			var num = gridDtl.getData().length;
				if(type==2&&num>0){
					showTips("二级集采只能增加一个计划","danger")
					return;
				}
			
			if(!type){
				showTips("请先选择立项类型","danger")
				return;
			}else{
				var btnEdit = this;
	        	nui.open({
	                url: "/default/purchase/plan/procurementPlanListForCopy.jsp?type="+type+"&putunder="+putunder,
	                title: "采购计划列表",
	                width: '75%',
	                height: '56%',
	                allowResize: false,
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                    	var tempData;
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data); 
	                          if(data&&data.length>0){
				            	var index = 0;
				            	var rows = gridDtl.getData();
				                if(rows){
				                   index = gridDtl.indexOf(rows[rows.length-1]);
				                   index = index+1;
				                }
				                for(var i=0;i<data.length;i++){
				                	data[i].planCode = data[i].code
				                	data[i].planName = data[i].name
				                }
				            	gridDtl.addRows(data, index);
				            	nui.get("planId").setValue(data[0].planId);
				            	nui.get("putunder").setValue(data[0].putunder);
				            	if(gridDtl.getData().length>0){
				            		nui.get("type").setReadOnly(true)
				            	}
				            }
	                    }
	                }
	            });
            }
		}
		
		//删除行
	   function removeTicket(){
			var rows = gridDtl.getSelecteds();
	        if (rows.length>0) {
	            gridDtl.removeRows(rows, true);
	            if(gridDtl.getData().length==0){
            		nui.get("type").setReadOnly(false);
            		nui.get("planId").setValue("");
            		nui.get("putunder").setValue("");
            	}
	        }else{
	        	showTips("请至少选中一条记录！");
	        }
		}
		
	  function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "立项单位经办人",
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
                        nui.get("proAppAgentUserid").setValue(data.userid);
                        nui.get("proAppAgentUserid").setText(data.empname);
                       
                        }
                    }

                }
            });
        }
        
		
    	function onOk(e){
    		istype = e;
			if(!form.validate()){
				nui.alert("请检查表单的完整性!");
				return;
			}
			(e==1)? info="提交":info = "保存";
			gridDtl.validate();
			if (gridDtl.isValid() == false) {
				var error = gridDtl.getCellErrors()[0];
				gridDtl.beginEditCell(error.record, error.column);
				return;
			} 
			if(isExist()){
    			var proAppApplyPrice = nui.get("proAppApplyPrice").getValue();
    				if(proAppApplyPrice>=50){
		    			showTips("项监部发起则立项金额需要小于50w","danger");
		    			return
    				}
    		}
    		var grid_0 = nui.get("grid_0").getData();
    		
    		var filePaths = document.getElementsByName("uploadfile").length;
    		var filePaths1 = document.getElementsByName("uploadfile1").length;
    		if(filePaths==0&&grid_0.length<1){
    			showTips("费用估算证明附件不可以为空","danger");
    			return;
    		}else{
    			for(var j=0;j<filePaths;j++){
			      var a=document.getElementsByName("remarkList")[j].value;
				      if(a==null||a==""){
				       showTips("费用估算证明附件不可以为空","danger");
				       	nui.get("saveReimbProcess").enable();
						nui.get("creatReimbProcess").enable();	
				       return;
				      }
			     }
    		}
    		if(filePaths1==0&&grid_1.length<1){
    			nui.alert("立项支持材料附件不可以为空");
    			return;
    		}else{
    			for(var j=0;j<filePaths1;j++){
			      var a=document.getElementsByName("remarkList1")[j].value;
				      if(a==null||a==""){
				      showTips("立项支持材料附件不可以为空","danger");
				       
				       nui.get("saveReimbProcess").enable();
						nui.get("creatReimbProcess").enable();	
				       
				       return;
				      }
			     }
    		}
			document.getElementById("fileCatalog1").value="proAppSup";
	    	nui.confirm("确定"+info+"单据","系统提示",
	        function(action){
	            if(action=="ok"){
		    		form4.submit();
				}
			})
	    }
	    
	    function SaveData1(){
	    	document.getElementById("fileCatalog").value="proAppCost";
			form2.submit();
	    }
	    
	    
    	function SaveData(){
			//debugger;
    			var data = form.getData();
    			var proAppDtl = gridDtl.getData();
    			data.judge = getJudge();
				data.istype = istype;
				data.files = nui.get("fileids").getValue();
				data.files1=nui.get("fileids1").getValue();
    			var json = nui.encode({'proApp':data,'id':id});
    			var json = nui.encode({"proApp":data,"proAppDtl":proAppDtl,"misOpinion":{"auditstatus":3}});
				clog(json)	
		    	ajaxCommon({
	                url: "com.zhonghe.ame.purchase.purchaseProApp.changeProApp.biz.ext",
	                data: json,
	                success: function (text) {
		                if(text.result == "1"){
		               		 showTips(info+"成功")
		               		 closeOk();
		                }else{
		     			  	showTips(info+"失败","danger")
		               		 /* closeOk(); */
		                }
	                }
	            }); 
    	}
		function getHTZQ(e){
    		var row = e.row;
    		if(e.value>row.sumamount){
				showTips("立项金额大于剩余可立项金额","danger")
    			gridDtl.updateRow(row,{"amount":""})
    			return;
    		}
        	if(e.field == "amount"){
	        	var tempData = nui.get(grid_detail).data;
	        	var a=tempData.length;
	        	var b=0;
	        	for(var i=0;i<a;i++){
	        		if(tempData[i].amount!=undefined){
			    		/* b+=tempData[i].amount; */
			    		b = addFloat(b,tempData[i].amount);
	        		}else{
	        			var x = 0;
	        			b+=x;
	        		}
		    	}
		    	 nui.get("proAppApplyPrice").setValue(b)
        	}
       	  }
    	
    	
        function onButtonEdit(e) {
            var btnEdit = this;
            mini.open({
                url: "/default/purchase/plan/procurementPlanListForCopy.jsp",
                title: "采购计划列表",
                width: '90%',
                height: '90%',
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.id);
                            btnEdit.setText(data.purchaseNumber);
                            btnEdit.doValueChanged();
                        }
                    }
                }
            });

        }
        
		function onCancel(e) {
            CloseWindow("cancel");
        } 
        //判断是否是项监部
	    function isExist(){
	    	var bool;
			var json = nui.encode({org:{"branch":"5","orgid":userOrgId}});
		      $.ajax({
		        url:"com.zhonghe.ame.purchase.common.queryOrgByOrgId.biz.ext",
		        type:'POST',
		        data:json,
		        cache:false,
		        async:false,
		        contentType: 'text/json',
		        success:function(text){
	        		bool = !$.isEmptyObject(text.res);
		        }
		      });
	      return bool;
	    }
	    
	    function selectProjectList(){
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
    	// 是否存在计划
		function hasThePlan(code) {
			if(!code) {
				return false;
			}
			var data = gridDtl.getData();
			
			for(var i = 0; i < data.length; ++i) {
				if(data[i].code == code) {
					return true;
				}
			}
			return false;
		}
		
		function onSumamount(e){
		
			clog(e)
		}

    </script></body>
</html>
