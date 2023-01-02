<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2019-03-05
  - Description:
-->
<head>
	<title>招聘日报</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:100px;">需求编号 :</td>
	            		<td style="width:150px;" align="left" id="recruitno1">    
	                		
	            		</td>
	            		<td align="right" style="width:100px;">招聘职位:</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="recruit.recpositionname" id="recpositionname"  class="nui-textbox" />
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:100px;">招聘部门:</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="recruit.orgname" id="orgname"  class="nui-textbox" />
	            		</td>
	            		
	            		<td align="right" style="width:100px;">一级部门:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="recruit.syqname" id="syqname"  class="nui-textbox" />
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:100px;">主考官:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="recruit.interempname" id="interempname"  class="nui-textbox" />
	            		</td>
	            		<td align="right" style="width:100px;">招聘人数:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="recruit.recnum" id="recnum" class="nui-textbox" />
	            		</td>
					</tr>
					<tr>
					    <td align="right" style="width:100px;">累计推送:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="recruit.recommendnums" id="recommendnums" class="nui-textbox" />
	            		</td>
	            		<td align="right" style="width:100px;">累计筛选:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="recruit.feedbacknums" id="feedbacknums" class="nui-textbox" />
	            		</td>
					</tr>
				</table>
			</div>
		</fieldset>
	   <!--  <fieldset style="border:solid 1px #aaa;padding:3px;">
	        <input name="record.recruitno" id="recordrecruitno" class="nui-hidden"/>
			<legend >本次推送</legend>	
			<table style="width:100%;">
			    <tr>
            		<td align="right" style="width:100px;">推送数量:</td>
            		<td align="left" style="width:150px;">    
                		<input name="record.recommendnum" id="recommendnum"  class="nui-textbox" onblur="validate('recommendnum')"/>
            		</td>
            		<td align="right" style="width:100px;">推送日期:</td>
            		<td align="left" style="width:150px;">    
                		<input name="record.recommenddate" id="recommenddate" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
            		</td>
				</tr>
				<tr>
				    <td align="right" style="width:100px;">筛选数量:</td>
            		<td align="left" style="width:150px;">    
                		<input name="record.feedbacknum" id="feedbacknum" class="nui-textbox" onblur="validate('feedbacknum')"/>
            		</td>
            		<td align="right" style="width:100px;">筛选日期:</td>
            		<td align="left" style="width:150px;">    
                		<input name="record.feedbackdate" id="feedbackdate"  class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
            		</td>
				</tr>
			</table>
	</fieldset> 	 -->
	<fieldset style="border:solid 1px #aaa;padding:3px;">
	<legend id="recordsList">推荐记录列表</legend>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		    <table style="width:100%;">
		        <tr>
		            <td align="left">
		                <a class="nui-button" iconCls="icon-add" onclick="addRow()">增加</a> 
		                <a class="nui-button" iconCls="icon-remove" onclick="reMoveRow('grid')">删除</a>
		                <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk2()">保存</a>
		            </td>
		        </tr>
		     </table> 
	</div>
	<div id="records" class="nui-datagrid"  allowResize="true" showSummaryRow="true" allowCellSelect="true" allowAlternating="true" allowCellEdit="true" 
				style="margin-top:0px;width: auto;height:auto;" dataField="records" sizeList="[10,20,50,100]" ondrawsummarycell="onDrawSummaryCell"
				url="org.gocom.abframe.org.recruit.queryOmRecruitRecordss.biz.ext" 
				pageSize="10" showPager="true">
				  <div property="columns">
				    <div type="checkcolumn"></div>
					<div field="recommendnum" width="50" align="right" headerAlign="center"summaryType="sum" >推送数量
					   <input property="editor" class="nui-textbox"  id="recommendnum2" onblur="validate('recommendnum2')"/>
					</div>
					<div field="feedbacknum" width="50" align="right" headerAlign="center"  summaryType="sum" >筛选数量
					   <input property="editor" class="nui-textbox" id="feedbacknum2" onblur="validate('feedbacknum2')"/>
					</div>
					<div field="recommenddate" width="85" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:ss" renderer="dealdate1">推送时间
					   <input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd HH:ss"/>
					</div>
					<div field="feedbackdate" width="85" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:ss" renderer="dealdate1">筛选时间
					   <input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd HH:ss"/>
					</div>
					<div field="recordempname" width="50" align="center" headerAlign="center">记录者
					</div>
					<div field="createdate" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:ss" renderer="dealdate">创建时间
					</div> 
				</div>
		</div>
	</fieldset>		
  </form>	
</div>	
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<!-- <a class="nui-button" onclick="onOk()" id="saveExpRei" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">提交</a>  -->
	<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
    <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	var recruitid = '<%=request.getParameter("id") %>';
	nui.parse();
	var form = new nui.Form("form1");
	var grid = nui.get("records");
	search();
	function search(){
		if(recruitid == 'null' || recruitid == null){
             document.getElementById("recruitno1").innerHTML =  '<input name="recruit.recruitno" id="recruitno"  class="nui-buttonedit" onbuttonclick="showRecruitno" required="true"/>';
	    }else{
	         document.getElementById("recruitno1").innerHTML =  '<input name="recruit.recruitno" id="recruitno" class="nui-textbox"/>';
	         var json = {recruitid:recruitid};
		     nui.ajax({
		     url: "org.gocom.abframe.org.recruit.queryOmRecruitRecord.biz.ext",
		     type: "post",
		     data: json, 
		     cache: false,
		     contentType: 'text/json',
		     success: function (text) {
		          form.setData(text);
		          nui.get("recruitno").setReadOnly(true);
		          nui.get("recpositionname").setReadOnly(true);
		          nui.get("orgname").setReadOnly(true);
		          nui.get("syqname").setReadOnly(true);
		          nui.get("interempname").setReadOnly(true);
		          nui.get("recnum").setReadOnly(true);
		          nui.get("recommendnums").setReadOnly(true);
		          nui.get("feedbacknums").setReadOnly(true);
		          document.getElementById("recordsList").innerHTML = text.recruit.recruitno + '的推荐记录列表';
		          /* nui.get("recordrecruitno").setValue(text.recruit.recruitno);  */
		          grid.load({recruitid:recruitid});
			 },
			 error: function () {}
		     });
	    }
	}
	function onOk(){
	       var  record = form.getData();
	       var json = nui.encode(record);
	       var recommendnum = nui.get("recommendnum").getValue();
	       var feedbacknum = nui.get("feedbacknum").getValue();
	       if((recommendnum == "" || recommendnum == null) && (feedbacknum == "" || feedbacknum == null)){
				nui.alert("推送数量和筛选数量不能同时为空");
				return ;
			}
		   nui.confirm("确定要记录本次推荐简历信息？","推荐简历信息提示",function(action){
				  if(action=="ok"){
		            form.mask("推荐简历记录信息正在录入，请稍等...");
		            nui.ajax({
		                url:"org.gocom.abframe.org.recruit.saveOmRecruitRecord.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
		                success: function (o){
		                    form.unmask();
		                	if(o.result == 0){
		                		nui.alert("新增失败，重新操作！");
		                		return;
		                	}else{
		                	    nui.alert("新增成功！","推荐简历信息提示",function (action){
			                            if(action == "ok"){
			                                   CloseWindow("ok")
			                               }
	                            })
		                	} 
		                }
		            });
		     }
		 })    
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
	function CloseWindow(action){
		if (action == "close" && form.isChanged()){
			if (confirm("招聘日报被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	//检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(obj == ''|| obj == null){
		     return;
		 }else{
		     if(!reg.test(obj)){  
		     	nui.alert("请输入数字!");
		     	nui.get(e).setValue("");    
		     }
		 }  
	} 
	function showRecruitno(e){
		var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/abframe/org/recruit/SelectRecruitno.jsp",
			title: "选择招聘需求编号",
			width: 820,
			height: 480,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);   //必须
					btnEdit.setValue(data.recruitno);
		            btnEdit.setText(data.recruitno);
		            nui.get("orgname").setValue(data.orgname);
		            nui.get("interempname").setValue(data.interempname);
		            nui.get("recpositionname").setValue(data.recpositionname);
		            nui.get("recnum").setValue(data.recnum);
		            nui.get("syqname").setValue(data.syqname);
	                /* nui.get("recordrecruitno").setValue(data.recruitno); */
	                recruitid = data.recruitid;
	                var json = {recruitid:data.recruitid};
				    nui.ajax({
					     url: "org.gocom.abframe.org.recruit.queryOmRecruitRecord.biz.ext",
					     type: "post",
					     data: json, 
					     cache: false,
					     contentType: 'text/json',
					     success: function (text) {
					          nui.get("recommendnums").setValue(text.recruit.recommendnums);
					          nui.get("feedbacknums").setValue(text.recruit.feedbacknums);
					          nui.get("recommendnums").setReadOnly(true);
					          nui.get("feedbacknums").setReadOnly(true);
					          grid.load({recruitid:text.recruit.recruitid});
					          document.getElementById("recordsList").innerHTML = text.recruit.recruitno + '的推荐记录列表';
						 },
						 error: function () {}
				     });
				}
			}
		});
	}
 	//新增行
	function addRow(){
	    var recruitno = nui.get("recruitno").getValue();
	    if(recruitno == "" || recruitno == null){
				nui.alert("请先选择需求编号");
				return ;
		}
		var newRow = {recruitno:recruitno};
		grid.addRow(newRow);
	} 
	//删除行
	function reMoveRow(t){
	   if(t == 'grid'){
		    var rows = grid.getSelecteds();
	        if (rows.length>0){
	            grid.removeRows(rows, true);
	            view();
	         }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	   }
	}
	
	//保存招聘简历推送记录
    function onOk2(){
        var editList = grid.getChanges('modified');
		 var addList = grid.getChanges('added');
		var removeList = grid.getChanges('removed');
		if(addList.length >0 ){
			if(!check(addList)){
				return false;
			}
		}
		if(editList.length >0 ){
			if(!check(editList)){
				return false;
			}
		}
		if(addList.length == 0  && editList.length == 0  && removeList.length == 0){
			nui.alert("请调整之后再做保存。");
			return;
		}
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '保存中...'
        });
		var json = {addList:addList,editList:editList,removeList:removeList};
		nui.ajax({
			url:"org.gocom.abframe.org.recruit.updateOmRecruitRecords.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
					nui.unmask();
					if(text.result == '1'){
	               		nui.alert("保存成功！","提示",function(e){
	               		    grid.load({recruitid:recruitid});
	               		});
	               }else{
	               		nui.alert("保存失败！");
	               }
            },
			error: function (jqXHR, textStatus, errorThrown) {
	        }
		 });
    }
    function check(data){
		var bolen = true;
		$.each(data,function(i,v){
			if((v.recommendnum == "" || v.recommendnum == null) && (v.feedbacknum == "" || v.feedbacknum == null)){
				bolen = false;
				nui.alert("推送数量和筛选数量不能同时为空");
				return false
			}
		})
		return bolen;
	}
	function dealdate(e){
		var date = e.value;
		if(date){
			return e.cellHtml.substring(0,16);
		}
	}
	function dealdate1(e){
		var date = e.value;
		if(date){
			return e.cellHtml.substring(0,10);
		}
	}
	/* //检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[1-9]*[1-9][1-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(obj == ''|| obj == null){
		     return;
		 }else{
		     if(!reg.test(obj)){  
		     	nui.alert("请输入数字!");
		     	nui.get(e).setValue("");    
		     }
		 }  
	} */ 
	function onDrawSummaryCell(e){
		var result = e.result;
	    var grid = e.sender;
	    if (e.field == "recommendnum"||e.field=="feedbacknum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
</script>
</html>