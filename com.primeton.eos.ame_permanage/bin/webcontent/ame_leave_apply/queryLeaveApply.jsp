<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-09-18 17:20:00
  - Description:
-->
<head>
<title>离职申请查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
    <div style="width:100%;height:100%;padding:0px;margin:0px;" >
       <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	离职申请查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="form1">
        		<table align="center" border="0" width="100%">
        			<tr>
        			    <td align="right" style="width:100px;">姓名:</td>
						<td align="left">					        
			            	<input class="nui-hidden" name="criteria._expr[0]._property" value="empname" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-textbox" name="criteria._expr[0]._value" style="width:120px;" id="emp" />
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="userid" />	
							<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
							<input class="nui-hidden" name="criteria._expr[1]._value" id="userid" />						
						</td>
						<td align="right" style="width:100px;" ><span>部门:</span></td>
						<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-combobox" style="width: 200px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" 
							    allowInput="true" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="orgseq"/>
				 		 	<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				 		 	<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="end"/>
		                    
		                    <input class="nui-hidden" name="criteria._expr[3]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[3]._value" id="orgids"/>
						</td>
						<td  align = "right" >离职状态:</td>
				        <td align="left">		        
							<input class="nui-hidden" name="criteria._expr[4]._property" value="status"/>
							<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
							<input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="OUT_STATUS"  multiSelect="true" shownullItem="true" style="width:120px;"/>
				        </td>
						
        			</tr>
        			<tr>
				        <td align = "right" style="width:60px;">离职类型:</td>
			         	<td align="left" >
			         	    <input class="nui-hidden" name="criteria._expr[5]._property" value="outtype"/>
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
							<input class="nui-dictcombobox" name="criteria._expr[5]._value" id="outtype"  dictTypeId="OUT_TYPE" multiSelect="true" shownullItem="true" style="width:120px;"/>
			          	</td>
			          	<td align = "right" >离职日期:</td>
			         	<td align="left" >
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="outdate" id="outdate"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
						    <input class="nui-datepicker" name="criteria._expr[6]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[6]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd"/>
			          	</td>
			          	<td align="right">员工属性：</td>
		            	<td align="left" >
		                    <input class="nui-dictcombobox"  name="criteria._expr[7]._value"  style="width: 120px" dictTypeId="EMP_TYPE"  multiSelect="true" shownullItem="true"/>
				 		 	<input class="nui-hidden" name="criteria._expr[7]._property" value="emptype"/>
		                    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
				        </td>
        			</tr>
        			<tr>
        			<td align="right">人员性质：</td>
            	    <td align="left" >
	                    <input class="nui-dictcombobox"  name="criteria._expr[8]._value"  style="width: 120px" dictTypeId="AME_EMPTYPE2" multiSelect="true" shownullItem="true"/>
			 		 	<input class="nui-hidden" name="criteria._expr[8]._property" value="nature"/>
	                    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
        			</td>
		          	</tr>
        			<tr>
			        <td colspan="6" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			            <a class="nui-button" id="export" iconCls="icon-download" onclick="exportLeavePeople()">导出离职申请员工信息</a>
			        </td>
			        </tr>
        		</table>
        	</div>
          </div>
    <div style="width:100%;">
        <div class="nui-toolbar" id="isFinance" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="editOutDate" iconCls="icon-edit" onclick="edit()">更新离职日期</a>
                    </td>
                </tr>
             </table>
        </div>
    </div>
    <div id="datagrid1"   sizeList="[10,20,50,100,1000]"  showPager="true" dataField="queryLeaveApplys" frozenStartColumn="0" frozenEndColumn="5"
    	showSummaryRow="true" class="nui-datagrid" style="width:100%;height:330px;" 
    	url="com.primeton.eos.ame_permanage.ame_leave_apply.queryLeaveApply.biz.ext"  multiSelect="true"  >
       		<div property="columns" >
       		    <div type="checkcolumn"></div> 
    	        <div field="processinstid" width="70" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
    	        <div field="company" width="100" headerAlign="center" align="center" renderer="company" allowSort="true">所属公司</div>
                <div field="emptype" width="60" headerAlign="center" align="center" renderer="emptype" allowSort="true">员工属性</div> 
                <div field="empcode" width="60" headerAlign="center" align="center" allowSort="true">员工工号</div>
                <div field="empname" width="60" align="center" headerAlign="center"  allowSort="true">姓名</div>
                <div field="orgname" width="105" align="center" headerAlign="center"  allowSort="true">部门</div>
                <div field="outdate" width="90" align="center" headerAlign="center" allowSort="true">离职日期</div>
                <div field="dealoutdate" width="90" align="center" headerAlign="center" allowSort="true">办理离职日期</div>
                <div field="nature" width="60" headerAlign="center" align="center" renderer="getNature" allowSort="true">人员性质</div>
                <div field="status" width="60" align="center" headerAlign="center" allowSort="true" renderer="getleaveApplyStatus">状态</div>
                <div field="outtype" width="80" align="center" allowSort="true" headerAlign="center"  renderer="getleaveApplyType">离职类型</div>
                <div field="outplace" width="90" align="center" allowSort="true" headerAlign="center"  renderer="getleaveApplyPlace">办理离职地点</div>
                <!-- <div field="vacdealtype" width="110" align="center" allowSort="true" headerAlign="center"  renderer="getleaveApplyVac">年假处理方式</div> -->
                <div field="handname" width="70" align="center" allowSort="true" headerAlign="center">交接人</div>
                <div field="handremark" width="140" align="left" allowSort="true" headerAlign="center" >交接说明</div>
                <div field="outagentname" width="80" align="center" allowSort="true" headerAlign="center">离职经办人</div>
                <div field="outoffsetmon" width="90" align="center" headerAlign="center" allowSort="true">离职补偿金额</div>
                <div field="outoffsetdesc" width="100" align="center" headerAlign="center" allowSort="true">离职补偿说明</div>
                <div field="isreturnvisit" width="130" align="center" allowSort="true" headerAlign="center"  renderer="getleaveApplyYn">是否需要离职回访</div>
                <div field="issignconf" width="130" align="center" allowSort="true" headerAlign="center"  renderer="getleaveApplyYn">是否需要签署保密协议</div>
                <div field="handrequire" width="140" align="left" allowSort="true" headerAlign="center">工作交接要求</div>
                <div field="remark" width="140" align="left" allowSort="true" headerAlign="center" >离职备注</div>
                <!-- <div field="outmemo" width="140" align="left" allowSort="true" headerAlign="center" >离职原因</div> -->
                <div field="applyempname" width="70" align="center" allowSort="true" headerAlign="center" >申请人</div>
                <div field="leaveprovedate" width="120" align="center" allowSort="true" headerAlign="center" >离职证明开具日期</div>
                <div field="applydate" width="100" align="center" allowSort="true" headerAlign="center" >发起申请日期</div>
                <div field="mailretain" width="90" align="center" allowSort="true" headerAlign="center" renderer="getmailretain">邮箱处理方式</div>
                <div field="mailretaindate" width="90" align="center" headerAlign="center" allowSort="true">邮箱保留日期</div>
                <div field="mailproxiesname" width="80" align="center" allowSort="true" headerAlign="center" >邮件代管人</div>
                <div field="recipientname" width="120" align="center" allowSort="true" headerAlign="center" >离职证明收件人</div>
                <div field="telephone" width="120" align="center" allowSort="true" headerAlign="center" >离职证明联系方式</div>
                <div field="leaveaddress" width="140" align="left" allowSort="true" headerAlign="center" >离职证明地址</div>
                <!-- <div field="revisitremark" width="140" align="left" allowSort="true" headerAlign="center" >离职回访备注</div> -->
                <div field="isthird" width="80" align="center" allowSort="true" headerAlign="center" renderer="getleaveApplyYn" >是否涉及三方</div>
                <div field="thirdmark" width="120" align="left" allowSort="true" headerAlign="center" >三方备注</div>
                <div field="poutreason" width="120" align="left" allowSort="true" headerAlign="center" renderer="getleaveApplyReason">员工自设离职原因</div>
                <div field="outreason" width="120" align="left" allowSort="true" headerAlign="center"  renderer="getleaveApplyReason">主管设定离职原因</div>
                <div field="revisitreason" width="120" align="left" allowSort="true" headerAlign="center" renderer="getleaveApplyReason">HR回访离职原因</div>
            </div>
         </div>
      </div>
	  <div id="win1" class="nui-window" title="离职日期" style="width:100px;height:120px;" 
		   showMaxButton="true" showCollapseButton="true" showShadow="true"
		   showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="outdate" id="outdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="sureDate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
	  </div> 
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form>      
</body>
<script type="text/javascript">
	nui.parse();	
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	init();
    function init(){
    	 //按钮权限的控制
	   		getOpeatorButtonAuth("editOutDate");//操作按钮权限初始化
	    	var json = {"code":"queryLeaveApply","map":{"property":"status","op":"=","value":"running"}};
	    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("userid").setValue('<%=nowuserid %>');
							nui.get("emp").setReadOnly(true);
						}
						var isall;//是否拥有全公司的权限
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.getbyName("criteria._expr[3]._op").setValue("=");
	        				nui.getbyName("criteria._expr[3]._value").setValue("");
						}else{
							nui.get("orgids").setValue(text.orgids);
						}
						nui.get("orgseq").setData(text.orgs);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("emp").setValue('<%=nowusername %>');
							nui.get("userid").setValue('<%=nowuserid %>');
							nui.get("emp").setReadOnly(true);
					}
					search();
				}
			});
    }
    function search() { 
            var data = form.getData(); //获取表单JS对象数据
            grid.sortBy("outdate","desc");
            grid.load(data); //datagrid加载数据
    }
    function reset(){
		form.reset();
		init();
	}
   function onActionRenderer(e) {
        var record = e.record;
    	var leaveid=e.record.leaveid;
    	var processinstid = e.record.processinstid;
    	var s;
    	if(processinstid){
			s = " <a  href='javascript:void(0)' onclick='getdetailLeaveApply(" + leaveid +")' title='点击查看'>明细</a>"+" "+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}else{
    		s = " <a  href='javascript:void(0)' onclick='getdetailLeaveApply(" + leaveid +")' title='点击查看'>明细</a>";
    	}
        return s;
    }   
    function getdetailLeaveApply(leaveid){
		var executeUrl = "<%= request.getContextPath() %>/ame_permanage/ame_leave_apply/omLeaveaLook.jsp?leaveid=" + leaveid;
		window.open(executeUrl);
	} 
	function feeView(){
        var selectRow = grid.getSelected();
        var processInstID=selectRow.processinstid;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
		var title = "流程图查看";
		var width=1000;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
    }
    
    //批量更新离职日期
    var chooseRow = "";
    function  edit(){
		var rows = grid.getSelecteds();
		if(rows.length==1){
			var row = grid.getSelected();
			if(nui.get("outdate").getValue() == ""){
	        	nui.get("outdate").setValue(new Date());
        	}
        	chooseRow=row;
        	showAtPos();
		}else{
			nui.alert("只能选中一条记录");
		}
    }
    
    //记账日期
    function showAtPos() {
        var win = nui.get("win1");
        win.showAtPos("center", "middle");
    }
    function hideWindow() {
        var win = nui.get("win1");
        win.hide();
    }
    function sureDate(){
    	hideWindow();
    	sureAcct(chooseRow);
    } 
    function sureAcct(row){
    	if (confirm("确定修改离职日期？")) {
            var json = nui.encode({leaveid: row.leaveid,outdate: nui.get("outdate").getValue(),userid:row.userid});
            grid.loading("操作中，请稍后......");
            nui.ajax({//
    			url:"com.primeton.eos.ame_permanage.ame_leave_apply.updateOmLeave.biz.ext",
    			data: json,
    			type:"post",
    			contentType:"text/json",
    			success:function(o){
    				if(o.result=="1"){
    					nui.alert("修改成功！");
    					grid.reload();
    				}else{
    					nui.alert("修改失败！");
    				}
				},
			    error: function (jqXHR, textStatus, errorThrown) {
			       alert(jqXHR.responseText);
			    }
				
			});	   
         }
    }
    
    
    //离职状态
	function getleaveApplyStatus(e){
		return nui.getDictText('OUT_STATUS',e.value);
	}
	//离职类型
	function getleaveApplyType(e){
		return nui.getDictText('OUT_TYPE',e.value);
	}
	//离职原因
	function getleaveApplyReason(e){
		return nui.getDictText('OUT_REASON',e.value);
	}
	//办理离职地点
	function getleaveApplyPlace(e){
	    return nui.getDictText('AREA4CLRY',e.value);
	}
	//年假处理方式
	function getleaveApplyVac(e){
	    return nui.getDictText('OM_LEAVE_VAC',e.value);
	}
	//是否需要离职回访、是否需要签署保密协议
	function getleaveApplyYn(e){
	    return nui.getDictText('MIS_YN',e.value);
	}
	//邮箱保留设置
	function getmailretain(e){
	    return nui.getDictText('OM_LEAVE_MAIL',e.value);
	}
	//所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	//类型，人员性质
	function emptype(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	//人员性质
	function getNature(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	
	function exportLeavePeople(){
		if(!confirm("是否确认根据查询条件导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_leave_apply.exportLeavePeople.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "员工离职信息";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	alert("error");
	        }
		});
	}
</script>
</html>