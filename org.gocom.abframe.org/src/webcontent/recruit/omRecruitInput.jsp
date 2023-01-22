<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-05-14 10:17:55
  - Description:
-->
<head>
	<title>招聘需求维护</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>招聘需求维护</legend>
			 	<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
			 	<input id="recruitno_old" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width:90px;">员工属性：</td>
		                	<td align="left" style="width:145px;">    
		                    	<input name="omRecruit.position" id="position" class="nui-dictcombobox" required="true" dictTypeId="EMP_TYPE" onvaluechanged="valuechanged" width="100%"/>
		                	</td>
							<td align="right" style="width:95px;">需求编号：</td>
		                	<td align="left" style="width:145px;">    
		                    	<input name="omRecruit.recruitno" id="recruitno" class="nui-textbox" required="true" width="100%"/>
		                	</td>
							<td align="right" style="width:95">招聘部门：</td>
							<td align="left" style="width:180px;">
								<input class="nui-combobox"name="omRecruit.orgid" id="orgid" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
								textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
								allowInput="true"  required="true" width="100%">
							</td>
		                	<td align="right"style="width:95px;">人员性质：</td>
							<td align="left" style="width:170px;">
								<input name="omRecruit.jobtype" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" required="true" width="100%"/>
							</td>
						</tr>
						<tr>
							<td align="right">主考官：</td>
							<td align="left">
								<input id="interviewer" class="mini-textboxlist"  name="omRecruit.interviewer" searchField="name"
								url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
								textField="empname" valueField="userid" required="true" width="100%"/>
							</td>
							<td align="right">招聘数量：</td>
							<td align="left">
								<input name="omRecruit.recnum" class="nui-textbox"  required="true" vtype="int" width="100%"/>
							</td>
		                	<td align="right">招聘职位分类：</td>
							<td align="left">
								<input name="omRecruit.recposition" id="recposition" class="nui-dictcombobox" onvaluechanged="setPositionName" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO" required="true" width="100%"/>
							</td>
							<td align="right">招聘职位名称：</td>
							<td align="left">
								<input name="omRecruit.recpositionname" id="recpositionname" class="nui-textbox" width="100%" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right">优先级别：</td>
							<td align="left">
								<input name="omRecruit.priority" class="nui-dictcombobox" required="true" dictTypeId="MIS_EMERLEVEL" width="100%"/>
							</td>
							<td align="right">工作地点：</td>
		                	<td align="left">    
		                    	<input name="omRecruit.workplace" class="nui-dictcombobox" required="true" multiSelect="true"  dictTypeId="AREA4CLRY" width="100%"/>
		                	</td>
							<td align="right">期望入职时间：</td>
							<td align="left">
								<input name="omRecruit.hopedate" class="nui-datepicker" width="100%"/>
							</td>
							<td align="right">提出时间：</td>
							<td align="left">
								<input name="omRecruit.propdate" class="nui-datepicker" required="true" onvaluechanged="changedate" width="100%"/>
							</td>
						</tr>
						<tr >
							<td align="right">招聘状态：</td>
							<td align="left">
								<input class="nui-dictcombobox" name="omRecruit.status" required="true" dictTypeId="RECRUIT_STATUS" id="status"  width="100%"/>
							</td>
							<td align="right">是否采用猎头：</td>
							<td align="left">
								<input name="omRecruit.isheadhunting" class="nui-dictcombobox" dictTypeId="MIS_YN"  width="100%"/>
							</td>
							<td align="right">确认时间：</td>
							<td align="left">
								<input name="omRecruit.confirmdate" id="confirmdate" class="nui-datepicker"  width="100%"/>
							</td>
							<td align="right">招聘专员：</td>
							<td align="left">
								<input id="recuserid" class="mini-textboxlist"  name="omRecruit.recuserid" searchField="name"
								url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
								textField="empname" valueField="userid" required="true"  width="100%"/>
							</td>
						</tr>
						<tr>
							<td align="right">申请人：</td>
							<td align="left">
								<input name="omRecruit.applyuserid" id="applyuserid" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" allowInput="false"  width="100%"/>
							</td>
							<td align="right" id="hctype">HC类型：</td>
							<td align="left" >
								<input name="omRecruit.hctype" required="true"id="hctype1" class="nui-dictcombobox" dictTypeId="RECRUIT_HCTYPE"  width="100%"/>
							</td>
							<td align="right">是否支持内推：</td>
							<td align="left">
								<input name="omRecruit.isreferrer" id="isreferrer" class="nui-dictcombobox" dictTypeId="MIS_YN"  width="100%" onvaluechanged="selectRefferexpmouldno"/>
							</td>
							<td align="right" id="refferexpmouldnoname" style='display:none'>内推奖励模板：</td>
							<td align="left">
								<input name="omRecruit.refferexpmouldno" id="refferexpmouldno" class="nui-buttonedit" onbuttonclick="showRefferexpmouldno" showClose="false" allowInput="false"  width="100%" required="true"  style='display:none'/>
							</td>
						</tr>
						<tr>
							<td align="right">工作职责描述：</td>
		                	<td colspan="7">    
		                    	<input name="omRecruit.workduties" id="workduties" class="nui-hidden"/>
		                    	<textarea id="ke" name="content1" style="width:100%;height:200px;visibility:hidden;"></textarea>
		                	</td>
						</tr>
		                <tr>
		                	<td></td>
					   		<td colspan="5">
					   		<span class="word_surplus"></span>
					   		</td>
					   	</tr>
						<tr>
							<td align="right">招聘要求描述：</td>
		                	<td colspan="7">    
		                    	<input name="omRecruit.recdesc" id="recdesc" class="nui-hidden" />
		                    	<textarea id="ke" name="content2" style="width:100%;height:200px;visibility:hidden;"></textarea>
		                	</td>
						</tr>
		                <tr>
		                	<td></td>
					   		<td colspan="5">
					   		<span class="word_surplus2"></span>
					   		</td>
					   	</tr>
						<tr>
		                	<td align="right">需求背景：</td>
		                	<td colspan="7">    
		                    	<input name="omRecruit.recbackground" class="nui-textarea" style = "width:100%;height:60px" maxLength="500">
		                	</td>
						</tr>
						<tr>
							<td align="right">备注：</td>
		                	<td colspan="7">    
		                    	<input name="omRecruit.remark" class="nui-textarea" style = "width:100%;height:30px" maxLength="200">
		                	</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</div>
		<div style="text-align:center;padding:10px;">               
            <a class="nui-button" onclick="onOk" iconCls="icon-ok"  id="okbutton" style="width:60px;margin-right:20px;">保存</a>       
            <a class="nui-button" onclick="onCancel('cancel')"  iconCls="icon-cancel" style="width:60px;">关闭</a>       
        </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var save="add";
	var recruitid=null;
	<% 
	UserObject user = (UserObject)session.getAttribute("userObject");
	String nowuserid = user.getUserId();
	String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	function SetData(data){
		if(data.action=="new"){
			var recuserid = nui.get("recuserid");
			recuserid.setValue(nowuserid);
			recuserid.setText(nowusername);
		}else{
			save="edit";
			recruitid=data.recruitid;
			var json = nui.encode({recruitid:recruitid});
			nui.ajax({
	            url: "org.gocom.abframe.org.recruit.getReruit.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	o = nui.decode(o);
	                form.setData(o);
	                nui.get("interviewer").setText(o.omRecruit.intername);
	                nui.get("applyuserid").setText(o.omRecruit.applyname);
	                nui.get("recuserid").setText(o.omRecruit.recusername);
	                nui.get("recruitno_old").setValue(o.omRecruit.recruitno);
	                if(o.omRecruit.isreferrer ==1){
	                    document.getElementById("refferexpmouldnoname").style.display="";
	                    document.getElementById("refferexpmouldno").style.display=""; 
	                    nui.get("refferexpmouldno").setValue(o.omRecruit.refferexpmouldno);
	                    nui.get("refferexpmouldno").setText(o.omRecruit.refferexpmouldno);
	                }
                	editor1.html(o.omRecruit.workduties);
                	editor2.html(o.omRecruit.recdesc);
                	nui.get("position").setReadOnly(true);
	                form.setChanged(false);
				}
	     	});
		}
	}
	
	function setPositionName(e){
		//var recposition = e.value;
		var recposition = nui.get("recposition").getText();
		nui.get("recpositionname").setValue(recposition);
	}
	
	function onOk(){
		if(form.validate()){
			var recruitno = nui.get("recruitno").getValue();
			var recruitno_old = nui.get("recruitno_old").getValue();
			if(recruitno_old != recruitno){
				if(!confirm("需求编号被修改了，是否保存？")){
    				return;
    			}else{
    				var json = nui.encode({recruitno: recruitno});
		            nui.ajax({
		                url: "org.gocom.abframe.org.recruit.checkRecruitNum.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
		                success: function (o) {
		                	if(o.result != 0){
		                		nui.alert("这个需求编号已经被使用了！");
		                		return;
		                	}else{
								nui.get("okbutton").disable();
		                		checkstatus();
		                	}
		                }
		            });
    			}  
			}else{
				if(!confirm("是否保存？")){
    				return;
    			}else{
					nui.get("okbutton").disable();
	    			checkstatus();
				}
			}
		}else{
			nui.alert("请检查表单的完整性!");
			return;
		}
	}
    function checkstatus(){
	     if(save == "edit"){
	     var data = form.getData();
	     var recruitid = data.omRecruit.recruitid;
	     var json = nui.encode({recruitid:recruitid});
	     	nui.ajax({
	            url: "org.gocom.abframe.org.recruit.checknum.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	o = nui.decode(o);
	            	var arrJoins = o.omIntendJoins;
		        	var arrRec = o.omRecruits;
		        	if(arrJoins){
		        	    var arrlen = arrJoins.length;
		        	}
		        	if(arrRec){
		        	    var recnum = arrRec.recnum;
		        	}
                    var status = nui.get("status").getValue();
                    //根据拟入职人员数量做判断
                    if(arrlen > 0 ){
                        //有拟入职人员信息的需求对"取消"和"暂停"的处理状态做处理
			            if(status == '3' || status == '4'){
			               nui.alert("招聘需求已经有拟入职人员，需求状态无法改成取消或暂停","系统提示",function(){
			                        nui.get("okbutton").enable();
			                        return;
			                        });
			            }else{
			                   //拟入职人数小于需求中的招聘人数的并不等于0，需求不能改为已完成
				               if(arrlen < recnum && status == '2'){
				                    nui.alert("拟入职人数没达到需求中的招聘人数，需求处理状态不能改成已完成","系统提示",function(){
				                         nui.get("okbutton").enable();
				                         return;
				                         });
				               }
						       else{
						            saveData();
						       }
			            }
                    }else{    
                              //拟入职人数等于0时候，需求不能改为已完成
                              if(status == '2'){
				                    nui.alert("拟入职人数没达到需求中的招聘人数，需求处理状态不能改成已完成","系统提示",function(){
				                         nui.get("okbutton").enable();
				                         return;
				                         });
				               }
						       else{
						            saveData();
						       }
                    }
				  }
	     	   });
	        }else{
	                        saveData();
	       }
	}	
	function valuechanged(e){
		var renttype=e.value;
		var tempType = "";
		if(renttype=="1"){//正式员工
			tempType = "R";
		}else if(renttype=="2"){//实习员工
			tempType = "T";
		}else{
			tempType = "O";
		}
		var myDate = new Date();
		var tempType = myDate.getFullYear() + "-" + tempType;
		form.loading("租房存档编号生成中...");
		nui.ajax({
            url: "org.gocom.abframe.org.recruit.getRecruitNo.biz.ext",
			type: 'POST',
			data: {firstPart: tempType},	
			contentType: 'text/json',
            success: function (o) {
            	form.unmask();
                nui.get("recruitno_old").setValue(o.recruitNo);
                nui.get("recruitno").setValue(o.recruitNo);
            }
        });
	}
	
	function saveData(){
    	var text = editor1.html();
		nui.get("workduties").setValue(text);
    	var text2 = editor2.html();
		nui.get("recdesc").setValue(text2);
		var data = form.getData();
		var omRecruit = data.omRecruit;
		var json = nui.encode({"omRecruit":omRecruit,"save":save});
		nui.ajax({
			url: "org.gocom.abframe.org.recruit.omRecruitInput.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
		    	if(o.result == '1'||o.result == 1){
		    		nui.alert("保存成功！","系统提示",function(){
		    			CloseWindow("ok");
		    		});
		    	}else{
		    		nui.alert("保存失败！","系统提示",function(){
			    		nui.get("okbutton").enable();
		    		});
		    	}
	        }
		});
	}
	function changedate(e){
		if(e.value){
			nui.get("confirmdate").setValue(e.value);
		}
	}
	function showEmployee(e){
		var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择人员",
			width: 600,
			height: 400,
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
    var editor1 = null;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="content1"]', {
		cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		},
		afterChange : function() {
		    $('.word_count1').html(this.count()); //字数统计包含HTML代码
		    var a = this.count();
		    var a1 = this.count('text');
		    var limitNum = 1000;  //设定限制字数
		    var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		    $('.word_surplus').html(pattern); //输入显示
		    if(a > limitNum) {
			    pattern = ('字数超过限制，请适当删除部分内容');
			    //超过字数限制自动截取
			    var strValue = editor1.text();
			    strValue = strValue.substring(0,limitNum);
			    editor1.text(strValue);      
		    } else {
		      	//计算剩余字数
		      	var result = limitNum - this.count(); 
		      	pattern =  "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
	      	}
	      	$('.word_surplus').html(pattern); //输入显示
		} 
		});
		prettyPrint();
	});
    
    var editor2 = null;
	KindEditor.ready(function(K) {
		editor2 = K.create('textarea[name="content2"]', {
		cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		},
		afterChange : function() {
		    $('.word_count2').html(this.count()); //字数统计包含HTML代码
		    var a = this.count();
		    var a1 = this.count('text');
		    var limitNum = 1000;  //设定限制字数
		    var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		    $('.word_surplus2').html(pattern); //输入显示
		    if(a > limitNum) {
			    pattern = ('字数超过限制，请适当删除部分内容');
			    //超过字数限制自动截取
			    var strValue = editor1.text();
			    strValue = strValue.substring(0,limitNum);
			    editor1.text(strValue);      
		    } else {
		      	//计算剩余字数
		      	var result = limitNum - this.count(); 
		      	pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
	      	}
	      	$('.word_surplus2').html(pattern); //输入显示
		} 
		});
		prettyPrint();
	});
    
    function CloseWindow(action){
		if (action == "close" && form.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function selectRefferexpmouldno(e){
	      if(e.value == 1){
	          document.getElementById("refferexpmouldnoname").style.display="";
	          document.getElementById("refferexpmouldno").style.display=""; 
	      }else{
	          document.getElementById("refferexpmouldnoname").style.display="none";
	          document.getElementById("refferexpmouldno").style.display="none"; 
	          nui.get("refferexpmouldno").setValue(null);
	          nui.get("refferexpmouldno").setText(null);
	      }
	}
	function showRefferexpmouldno(){
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/abframe/org/recruit/SelectrefferExpMould.jsp",
				title: "选择内推费用管理模板",
				width: 800,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);  
						btnEdit.setValue(data.refferexpmouldno); 
						btnEdit.setText(data.refferexpmouldno);
					}
				}
			})
	}
</script>
</html>