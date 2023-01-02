<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-10-23 15:12:00
  - Description:
-->
<head>
<title>试用期员工查询</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	试用期员工查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<input class="nui-hidden" name="Newstaffs._entity" value="org.gocom.abframe.dataset.organization.Newstaffs"/>
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" style="width: 90px">人员姓名：</td>
			 	<td>
			 		<input class="nui-textbox" name="Newstaffs._expr[0]._value" id = "emp" onenter="onKeyEnter" style="width: 195px"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[0]._property" value="empname"/>
                    <input class="nui-hidden" name="Newstaffs._expr[0]._op" value="like"/>
			    </td>
			    <td align="right" style="width: 120px">所属部门：</td>
            	<td align="left" >
				    <input name="Newstaffs._expr[1]._value" class="nui-combobox" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs" 
				     style="width: 200px"  shownullItem="true" onenter="onKeyEnter" allowInput="true" />
					<input class="nui-hidden" name="Newstaffs._expr[1]._property" value="orgseq"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[1]._op" value="like"/>
                    <input class="nui-hidden" name="Newstaffs._expr[1]._likeRule" value="end"/>
                    
                    <input class="nui-hidden" name="Newstaffs._expr[2]._property" value="orgid"/>
			        <input class="nui-hidden" name="Newstaffs._expr[2]._op" value="in"/>
			        <input class="nui-hidden" name="Newstaffs._expr[2]._value" id="orgids"/>
			    </td>
			    <td align="right">入职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min1" name="Newstaffs._expr[4]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="Newstaffs._expr[4]._max" onenter="onKeyEnter" style="width:95px"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[4]._property" value="indate"/>
                    <input class="nui-hidden" name="Newstaffs._expr[4]._op" value="between"/>
				</td>
    	   </tr>
    	   <tr>
    	        <td align="right" style="width: 60px">直属上级：</td>
			    <td>
                    <input class="nui-hidden" name="Newstaffs._expr[3]._property" value="managername"/>
			        <input class="nui-hidden" name="Newstaffs._expr[3]._op" value="like"/>
			        <input class="nui-textbox" name="Newstaffs._expr[3]._value" onenter="onKeyEnter" style="width: 195px"/>
			    </td> 
    	        <td align="right" >试用期开始时间：</td>
	            <td align="left" >
					    <input class="nui-datepicker" id="min1" name="Newstaffs._expr[5]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="Newstaffs._expr[5]._max" style="width:100px" onenter="onKeyEnter"/>
			 		 	<input class="nui-hidden" name="Newstaffs._expr[5]._property" value="probationstartdate"/>
	                    <input class="nui-hidden" name="Newstaffs._expr[5]._op" value="between"/>
				</td>
				<td align="right">试用期结束时间：</td>
	        	<td align="left">
				    <input class="nui-datepicker" id="min1" name="Newstaffs._expr[6]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="Newstaffs._expr[6]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[6]._property" value="probationenddate"/>
	                <input class="nui-hidden" name="Newstaffs._expr[6]._op" value="between"/>
				</td>
		   </tr> 
		   <tr>
		        <td align="right" >应转正日期：</td>
	            <td align="left">
					    <input class="nui-datepicker" id="min1" name="Newstaffs._expr[7]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="Newstaffs._expr[7]._max" style="width:100px" onenter="onKeyEnter"/>
			 		 	<input class="nui-hidden" name="Newstaffs._expr[7]._property" value="shoulddate"/>
	                    <input class="nui-hidden" name="Newstaffs._expr[7]._op" value="between"/>
				</td>
				<td align="right">实际转正日期：</td>
	        	<td align="left">
				    <input class="nui-datepicker" id="min1" name="Newstaffs._expr[8]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="Newstaffs._expr[8]._max" style="width:100px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[8]._property" value="realdate"/>
	                <input class="nui-hidden" name="Newstaffs._expr[8]._op" value="between"/>
				</td>
			 	<td align="right" nowrap="nowrap">转正状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="Newstaffs._expr[9]._value" style="width: 200px" value="on" dictTypeId="VERI_RESULT" shownullItem="true" onenter="onKeyEnter" multiSelect="true"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[9]._property" value="veriresult"/>
                    <input class="nui-hidden" name="Newstaffs._expr[9]._op" value="in"/>
			    </td>
		   </tr> 
		   <tr> 
			 	<td align="right" nowrap="nowrap">在职状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="Newstaffs._expr[10]._value" style="width: 200px" value="on" dictTypeId="ABF_EMPSTATUS" shownullItem="true" onenter="onKeyEnter" multiSelect="true"/>
		 		 	<input class="nui-hidden" name="Newstaffs._expr[10]._property" value="empstatus"/>
                    <input class="nui-hidden" name="Newstaffs._expr[10]._op" value="in"/>
			    </td>
		   		<td align="center" colspan="6">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>	
    	</table>
    </div>
	<div style="width:100%;">
	    <div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	            <tr>
	                <td style="width:10%;">
	                    <a class="nui-button" id="Newstaffs_editRec" iconCls="icon-edit" onclick="editNewstaff()">修改</a>
	                    <a class="nui-button" id="Newstaffs_exportStaffs" iconCls="icon-download" onclick="exportStaffs()">导出转正信息</a>
	                	<a class="nui-button" id="Newstaffs_startRegular"  iconCls="icon-goto" onclick="createRegularProcess()">发起转正流程</a>
	            	</td>
	            </tr>
	        </table>
	    </div>
	</div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true"
	    dataField="newstaffs" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
	    url='org.gocom.abframe.org.employee.EmpManager.queryNewstaffByCriteria.biz.ext'>
	    <div property="columns">
	    	<div type="checkcolumn"></div>
	    	<div field="empid" width="60" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
	    	<div field="empname" width="70" headerAlign="center" align="center" renderer="getEmpDetail" allowSort="true">人员姓名</div>
	    	<div field="empcode" width="60" headerAlign="center" align="center" allowSort="true">工号</div>
	    	<div field="orgname" width="130" headerAlign="center" align="center" allowSort="true">所属部门</div>
	    	<div field="indate" width="80" headerAlign="center" align="center" allowSort="true">入职日期</div>  
        	<div field="empstatus"  width="80" headerAlign="center"  align="center" allowSort="true" renderer="getempstatus">在职状态</div>
        	<div field="veriresult"  width="80" headerAlign="center"  align="center" allowSort="true" renderer="getturnregularstatus">转正状态</div>
	    	<div field="syqname" width="130" headerAlign="center" align="center" allowSort="true">一级部门</div>
	    	<div field="sybname" width="130" headerAlign="center" align="center" allowSort="true">二级部门</div>
	    	<div field="managername" width="70" align="center" headerAlign="center" >直属上级</div>
	     	<div field="shoulddate" width="80" headerAlign="center" align="center" allowSort="true" >应转正日期</div>
	     	<div field="realdate" width="80" headerAlign="center" align="center" allowSort="true">实际转正日期</div>
	     	<div field="outdate" width="80" headerAlign="center" align="center" allowSort="true">离职日期</div>
	     	<div field="remark" width="160" headerAlign="center" align="left" allowSort="true">备注</div>
	    </div>
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
	var form = new nui.Form("#form1");
	var grid = nui.get('datagrid1');
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	init();
	function init(){
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
		json = {"code":"queryNewstaff","map":{"property":"status","op":"=","value":"running"}};
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
						nui.getbyName("Newstaffs._expr[2]._op").setValue("=");
        				nui.getbyName("Newstaffs._expr[2]._value").setValue("");
					}else{
						nui.get("orgids").setValue(text.orgids);
					}
					nui.get("orgseq").setData(text.orgs);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("emp").setValue('<%=nowusername %>');
						nui.get("emp").setReadOnly(true);
				}
				search();
				//按钮权限的控制
				getOpeatorButtonAuth("Newstaffs_startRegular");//操作按钮权限初始化
				getOpeatorButtonAuth("Newstaffs_editRec");//操作按钮权限初始化
			}
		});
	}
	//查询功能列表
	function search(){
        var data = form.getData();
		grid.load(data);
		grid.sortBy("shoulddate","asc");
	}
	//重置
	function reset(){
		form.reset();
        init();
	}
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
    function onActionRenderer(e) {
        var record = e.record;
    	var intendid = e.record.intendid;
    	var shoulddate = e.record.shoulddate;
    	var realdate = e.record.realdate;
    	if(intendid){
    	  var	s = " <a  href='javascript:void(0)' onclick='getdetailNewstaff(" + intendid +")' title='点击查看'>查看</a>";
    	}
        return s;
    }
    function getdetailNewstaff(intendid){
		var executeUrl = "<%= request.getContextPath() %>/abframe/org/newOrganization/detailNewstaff.jsp?intendid=" + intendid;
		window.open(executeUrl);
	}
	function editNewstaff(){
	    var selectRow = grid.getSelecteds();
	    if(selectRow.length >1){
	      nui.alert("只允许选择一条记录，请重新选择");
	      return;
	    }
	    var intendid = selectRow[0].intendid;
    	var shoulddate = selectRow[0].shoulddate;
    	var realdate = selectRow[0].realdate;
		var executeUrl = "<%= request.getContextPath() %>/abframe/org/newOrganization/editNewstaff.jsp?intendid=" + intendid;
		var date = new Date(); 
		if(realdate == "" || realdate == null){
		  if(intendid){
		     window.open(executeUrl);
		  }
		}else{
		  nui.alert("已过试用期，不允许修改");
		}
	}
	
	function getturnregularstatus(e) {
        var veprocessinstid = e.record.veprocessinstid;
        var	s = nui.getDictText('VERI_RESULT',e.value);
        if(veprocessinstid != null && veprocessinstid !=''){
        	var	s = " <a  href='javascript:void(0)' onclick='getdetailregularProcess(" + veprocessinstid +")' title='点击查看'>"+nui.getDictText('VERI_RESULT',e.value)+"</a>";
        }
     	return s;
    }
    function getdetailregularProcess(veprocessinstid){
		var executeUrl = "<%= request.getContextPath() %>/ame_permanage/ame_becomeregulae/regularInformation.jsp?processinstid=" + veprocessinstid;
		var iWidth=1200; //弹出窗口的宽度;
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "转正流程详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    }
	
	
	//发起转正流程
	function createRegularProcess(){
		var emps = grid.getSelecteds();
		if(emps.length <= 0){
			nui.alert("请选择一条或多条员工信息！");
			return;
		}
		for(var i = 0 ; i < emps.length ; i++){
			if(emps[i].empstatus != 'on'){
				nui.alert(emps[i].empname+"的员工状态不是‘在岗’，无法发起转正流程！")
				return;
			}
			if(emps[i].empveriid == null || emps[i].empveriid == ''){
				nui.alert(emps[i].empname+"没有转正信息，无法发起转正流程！")
				return;
			}
			if(emps[i].veriresult == '3' || emps[i].veriresult == '2' || emps[i].veriresult == '1'  || emps[i].veriresult == '4' || emps[i].veriresult == '5'){
				nui.alert(emps[i].empname+"已完成转正或处于转正流程中，无法发起转正流程！")
				return;
			}
		}
		
		nui.confirm("本操作将发起"+emps.length+"条转正流程，请确认是否操作？", "确定？",function (action) {
   			if (action == "ok"){
   				grid.loading("操作中，请稍后......");
				nui.ajax({
		            type:'get',
		            data:{"emps":emps},
		            cache: false,
		            showModal: false,
		            async :false,
		            contentType: 'text/json',
		            url:'com.primeton.eos.ame_permanage.ame_becomeregulae.BecomeProcessCreate.biz.ext',
		            success:function(result){
             			grid.unmask ( );
		            	if(result.exception == null){
		                    nui.alert("发起成功！本次操作发起了"+emps.length+"条数据。","系统提示",function(){
		                        grid.reload();
		                    });
		                }else{
		                    nui.alert("发失败！请联系信息技术部人员。")
		                }
		            },
		            error:function(jqXHR, textStatus, errorThrown){
             			grid.unmask ( );
		                nui.alert("error:" + jqXHR.responseText);
		            }
            	})
        	}
   		})
	}
	function exportStaffs(){
    	if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "org.gocom.abframe.org.employee.EmpManager.exportNewstaffByCriteria.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "试用期员工导出";
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
	
	function getempstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
</script>
</html>