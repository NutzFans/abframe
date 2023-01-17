<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-05-22 16:51:18
  - Description:
-->
<head>
<title>请假查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fix">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        		<table align="center" border="0" width="100%">
        			<tr>
        			    <td align="right" style="width:100px;">姓名:</td>
						<td align="left">					        
			            	<input class="nui-hidden" name="criteria._expr[0]._property" value="empname" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-textbox" name="criteria._expr[0]._value" style="width:100px;" id="emp" />
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							<input class="nui-hidden" name="criteria._expr[6]._property" value="userid" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="="/>	
							<input class="nui-hidden" name="criteria._expr[6]._value" id="userid" />						
						</td>
						<td align="right" style="width:100px;" ><span>部门：</span></td>
						<td align="left">
						     <input name="criteria._expr[4]._value" class="nui-combobox" style="width: 200px" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" 
							    allowInput="true" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="orgseq"/>
				 		 	<input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
				 		 	<input class="nui-hidden" name="criteria._expr[4]._likeRule" value="end"/>
		                    
		                    <input class="nui-hidden" name="criteria._expr[5]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[5]._value" id="orgids"/>
						</td>
						<td align = "right" >申请日期:</td>
			         	<td align="left" >
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="applydate" id="applydate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						    <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
			          	</td>
        			</tr>
        			<tr>
        				<td  align = "right" >请假类型:</td>
				        <td align="left">		        
							<input class="nui-hidden" name="criteria._expr[1]._property" value="leavetype"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
							<input name="criteria._expr[1]._value" class="nui-combobox" url="com.primeton.eos.ame_permanage.ame_leavepro.getLeaveType.biz.ext" valueField="leavetypeid" textField="leavetype" dataField="leavetypes" multiSelect="true" shownullItem="true" style="width:100px;"/>
				        </td>
				        <td align = "right" style="width:60px;">休假日期:</td>
			         	<td align="left" >
			         	    <input class="nui-hidden" name="criteria._not[0]._expr[7]._property" value="leavedetailid"/>
					        <input class="nui-hidden" name="criteria._not[0]._expr[7]._op" value="in" id="tempcond1"/>
					        <input class="nui-hidden" name="criteria._not[0]._expr[7]._ref" value="1" id="tempcond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.ame_permanage.ame_permanage.AmeLeavedetail"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="leavedetailid"/>							
						    <input class="nui-datepicker" id="xjdate1" style="width:100px" />-<input class="nui-datepicker" id="xjdate2" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[0]._property" value="startdate"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[0]._op" value=">"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[0]._pattern" value="yyyy-MM-dd"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[0]._value" id="startdate"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[1]._property" value="enddate"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[1]._op" value="<"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[1]._pattern" value="yyyy-MM-dd"/>
						    <input class="nui-hidden" name="criteria._ref[0]._or[0]._expr[1]._value" id="enddate"/>
			          	</td>
			          	<td align = "right" >HR确认日期:</td>
			         	<td align="left" >
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="confirdate"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
						    <input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
			          	</td>
        			</tr>
        			<tr>
        			<td  align = "right" >审批状态:</td>
				        <td align="left" >		        
							<input class="nui-hidden" name="criteria._expr[2]._property" value="status"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
							<input class="nui-dictcombobox" name="criteria._expr[2]._value" id="status"  dictTypeId="AME_LEAVESTATUS" multiSelect="true" shownullItem="true" style="width:100px;"/>
				        </td>
        			</tr>
        			<tr>
			        <td colspan="6" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
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
			                <a class="nui-button"  iconCls="icon-download" onclick="expqueryLeave()">导出明细</a>
			                <a id="surebutton" class="nui-button" iconCls="icon-ok" onclick="surepre()">HR确认</a>
			                <a id="addbutton" class="nui-button" iconCls="icon-add" onclick="addpre('add')">补充请假记录</a>
			                <a id="editbutton" class="nui-button" iconCls="icon-edit" onclick="addpre('edit')">修改请假记录</a>
			                <a class="nui-button" iconCls="icon-leavecounts2" onclick="openBar()" id="leavecounts">休假人数图形统计</a>
				        </td>
	                </tr>
	            </table>           
	       </div>
    <div id="datagrid1"   sizeList="[10,20,50,100,1000]"  showPager="true" dataField="queryLeaves" 
    	showSummaryRow="true" class="nui-datagrid" style="width:100%;height:330px;" ondrawcell="ondrawqueryLeave"
    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeave.biz.ext"  multiSelect="true"  >
       		<div property="columns" >
       		    <div type="checkcolumn"></div>
    	        <div field="processinstid" width="80" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
                <div field="empname" width="60" align="center" headerAlign="center"  allowSort="true">姓名</div>
                <div field="leavetypename" width="60" align="center" headerAlign="center" allowSort="true">请假类型</div>
                <div field="status" width="60" align="center" headerAlign="center" allowSort="true" renderer="getleaveStatus">审批状态</div>
                <div field="totaldays" width="60" align="center" allowSort="true" headerAlign="center" >请假天数</div>
                <div field="qjdate" width="250" align="center" allowSort="true" headerAlign="center">请假时间</div>
                <div field="orgname" name="orgname" width="80" align="center" headerAlign="center" allowSort="true" >所属部门</div>
                <div field="yjbm" name="yjbm" width="80" align="center" headerAlign="center" allowSort="true" >所属一级部门</div>
                <div field="ejbm" name="ejbm" width="100" align="center" headerAlign="center" allowSort="true">所属二级部门</div>
                <div field="reason" width="350" align="left" headerAlign="center" allowSort="true">请假原因</div>
                <div field="applydate" width="80" align="center" headerAlign="center" allowSort="true" >申请日期</div>
                <div field="confirdate" width="80" align="center" headerAlign="center" allowSort="true" >HR确认日期</div>
            </div>
        </div>
        </div>
      </div>
      <div id="win1" class="nui-window" title="HR确认日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="confirdate" id="confirdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
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
	var flag=<%=request.getParameter("flag")%>;//flag=1 ，则是我得请假记录
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	init();
    function init(){
    	if(flag==1){//我的请假记录
    		document.getElementById("form1").style.display="none"//隐藏查询表单
    		document.getElementById("leavecounts").style.display="none"//隐藏查询表单
    		document.getElementById("surebutton").style.display="none"//隐藏查询表单
    		document.getElementById("addbutton").style.display="none"//隐藏查询表单
    		document.getElementById("editbutton").style.display="none"//隐藏查询表单
    		nui.get("userid").setValue('<%=nowuserid %>');
    		grid.hideColumn("orgname");//隐藏部门
    		grid.hideColumn("yjbm");
    		grid.hideColumn("ejbm");
    		search();
    	}else{
	    	var json = {"code":"queryLeave","map":{"property":"status","op":"=","value":"running"}};
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
							nui.getbyName("criteria._expr[5]._op").setValue("=");
	        				nui.getbyName("criteria._expr[5]._value").setValue("");
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
    }
    function search() {
            nui.get("startdate").setValue(nui.get("xjdate2").getValue());
            nui.get("enddate").setValue(nui.get("xjdate1").getValue());
            if(nui.get("xjdate1").getValue()=="" && nui.get("xjdate2").getValue()==""){
				nui.get("tempcond1").setValue("=");
				nui.get("tempcond2").setValue("");
		    }else{
				nui.get("tempcond1").setValue("in");
				nui.get("tempcond2").setValue("1");
		    }
            var data = form.getData(); //获取表单JS对象数据
            grid.sortBy("applydate","desc");
            grid.load(data); //datagrid加载数据
        }
    function reset(){
		form.reset();
		init();
	}
	//导出明细查询
	function expqueryLeave(){
		var data = form.getData(); //获取表单JS对象数据
		var json = nui.encode(data); //序列化成JSON	
		form.loading("操作中，请稍后......");
		nui.ajax({
	        url: "com.primeton.eos.ame_permanage.ame_leavepro.expqueryLeave.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		form.unmask();
	        	var filePath = o.downloadFile;
	        	var fileName = "请假查询明细";
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
   function onActionRenderer(e) {
        var record = e.record;
    	var leaveid=e.record.leaveid;
    	var s;
    	if(record.processinstid){
			s = " <a  href='javascript:void(0)' onclick='getdetailLeave(" +leaveid +")' title='点击查看'>明细</a>"+" "+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}else{
    		s = " <a  href='javascript:void(0)' onclick='getdetailLeave(" +leaveid +")' title='点击查看'>明细</a>";
    	}
        return s;
        }

	function getdetailLeave(leaveid){
		var executeUrl = "<%= request.getContextPath() %>/ame_permanage/ame_leave/detailLeave.jsp?leaveid=" + leaveid;
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
    //HR确认
    var chooseRows = "";
    function surepre(){
    	var rows = grid.getSelecteds();
        //对于状态为"审核通过"的才允许HR确认
        if(rows.length > 0){
        	for(var i = 0; i < rows.length; i++){
        		if(rows[i].status != "2"){
        			nui.alert("所选的记录中，包含审批状态为【" + nui.getDictText('AME_LEAVESTATUS', rows[i].status) + "】的审批数据！不能进行HR确认操作！");
		            return;
        		}
        	}
        	if(nui.get("confirdate").getValue() == ""){
	        	nui.get("confirdate").setValue(new Date());
        	}
        	chooseRows = rows;
        	showAtPos();
        }else{
            nui.alert("请选中一条记录！");
        }
    }
    //HR确认日期
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
    	surePreSettle(chooseRows);
    }
    function surePreSettle(rows){
	    	nui.confirm("确认审批状态为审核通过的请假信息？","审批状态确认信息提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"queryLeaves":rows,"confirdate":nui.get("confirdate").getValue()});
                    grid.loading("正在确认审核通过的请假,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_permanage.ame_leavepro.sureHrDate.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            grid.unmask();
                            if(returnJson.result == null){
                            	nui.alert("共：" + (rows.length) + "条数据被选中，全部确认成功！", "系统提示",function(){
                                    grid.reload();
                                });
                            }else{
                                nui.alert("共：" + (rows.length) + "条数据被,其中" + (returnJson.count) + "条HR确认成功，" + (rows.length - returnJson.count) + "条HR确认失败！", "系统提示",function(){
                                	grid.reload();
                                });
                            }
                        }
                    }); 
                }
            });
	    }
    function ondrawqueryLeave(e){
    	var record = e.record;
    	var xjdate = Date.parse(record.minstartdate);
    	var qjdate = Date.parse(record.applydate);
    	if(xjdate && qjdate){
    	  if(qjdate > xjdate){
    		e.rowStyle = "background-color: #FF99CC";
    	   }
    	}
    }
	function getleaveStatus(e){
		return nui.getDictText('AME_LEAVESTATUS',e.value);
	}
	function openBar(){
		    <%--console.log(orgseq); var executeUrl = "<%=request.getContextPath() %>/ame_permanage/ame_leave/getAccountsLeaves.jsp?orgseq="+ orgseq;
			window.open(executeUrl, "休假人数图形统计", 'height=530, width=1150, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no'); --%>
			var orgseq = nui.get("orgseq").getData(); 
			console.log(orgseq);
			var url = "<%=request.getContextPath() %>/ame_permanage/ame_leave/getAccountsLeaves.jsp";
		    var title = "休假人数图形统计";
			nui.open({
			url: url,
			title: title,
			width: 1150,
			height: 560,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.init) {
					iframe.contentWindow.init({orgid:null});
				}
			},
			ondestroy: function (action){
			}
		});
		}
	
	function addpre(e){
		var row = grid.getSelected();
		if(e=='edit'){
			if(row){
			}else{
				nui.alert("请选择一条请假记录！");
				return;
			}
		}
		nui.open({
            url: "/default/ame_permanage/ame_leave/supplyLeave.jsp",
            title: "补充请假记录",
            width: 1200,
            height: 620,
            onload: function () {
                var iframe = this.getIFrameEl();
                console.log(row)
                if(row){
                	var data = { action: "edit",leaveid:row.leaveid};
	                iframe.contentWindow.SetData(data);
                }else{
                	var data = { action: "add",leaveid:''};
	                iframe.contentWindow.SetData(data);
                }
            },
			ondestroy: function (action) {
				if(action=="ok"){
					grid.reload();
                }
			}
		});
	}
</script>
</html>