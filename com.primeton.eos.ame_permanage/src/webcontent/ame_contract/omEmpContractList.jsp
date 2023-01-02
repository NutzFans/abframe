<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-02-14 16:42:10
  - Description:
-->
<head>
<title>查询员工合同信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
<div class="nui-panel" title="员工合同信息查询" style="width:100%;">
    <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    		<table align="center" border="0" width="100%">
    			<tr>
    				<td align="right">所属机构:</td>
					<td align="left">
					    <input name="criteria._expr[0]._value" class="nui-combobox" style="width: 150px" id="orgseq" textField="orgname" 
					    valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter" allowInput="true" />
					<input class="nui-hidden" name="criteria._expr[0]._property" value="orgseq"/>
		 		 	<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
                    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="end"/>
                    
                    <input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
			        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
			        <input class="nui-hidden" name="criteria._expr[1]._value" id="orgids"/>
					</td>
					<td align="right">人员姓名:</td>
					<td align="left">
				        <input name="criteria._expr[2]._value" id="empname" style="width:150px;" class="nui-textbox"  onenter="onKeyEnter" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[2]._property" value="empname"/>
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					</td>
					<td  align = "right">人员状态:</td>
			        <td align="left">
				        <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="ABF_EMPSTATUS"  multiSelect="true"  shownullItem="true" style="width:150px;"  />
						<input class="nui-hidden" name="criteria._expr[4]._property" value="empstatus"/>
						<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
			        </td>
					<td align = "right">用户登录:</td>
		         	<td align="left">
		         		<input name="criteria._expr[3]._value"  id="userid" style="width:205px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[3]._property" value="userid"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
		          	</td>
    			</tr>
    			<tr>
    				<td  align = "right">签署工号:</td>
			        <td align="left">
				        <input name="criteria._expr[13]._value"  id="userid" style="width:150px;" class="nui-textbox" allowInput="true" />
		            	<input class="nui-hidden" name="criteria._expr[13]._property" value="contuserid"/>
				        <input class="nui-hidden" name="criteria._expr[13]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[13]._likeRule" value="all"/>
			        </td>
					<td  align = "right">合同属性:</td>
			        <td align="left">
				        <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="CONT_TYPE" multiSelect="true"  style="width:150px;" />
						<input class="nui-hidden" name="criteria._expr[5]._property" value="conttype"/>
						<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
			        </td>
			        <td  align = "right">合同性质:</td>
			        <td align="left">
				        <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="CONT_PROP" shownullItem="true" multiSelect="true" style="width:150px;" />
						<input class="nui-hidden" name="criteria._expr[6]._property" value="contprop"/>
						<input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
			        </td>
					<td align="right">合同开始日期:</td>
					<td align="left">
						<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="contstart"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					</td>
					
    			</tr>
    			<tr>
    				<td  align = "right">签署公司:</td>
			        <td align="left">
				        <input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="company" multiSelect="true" shownullItem="true" style="width:150px;"  />
						<input class="nui-hidden" name="criteria._expr[7]._property" value="contcompany"/>
						<input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
			        </td>
			        <td  align = "right">合同签署状态:</td>
			        <td align="left">
				        <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="EMP_CONT_STATUS" shownullItem="true" multiSelect="true" style="width:150px;" />
						<input class="nui-hidden" name="criteria._expr[10]._property" value="contstatus"/>
						<input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
			        </td>
			        <td  align = "right">工作地:</td>
			        <td align="left">
				        <input name="criteria._expr[11]._value" class="nui-dictcombobox" dictTypeId="AREA4CLRY" multiSelect="true" shownullItem="true" style="width:150px;"  />
						<input class="nui-hidden" name="criteria._expr[11]._property" value="contworkplace"/>
						<input class="nui-hidden" name="criteria._expr[11]._op" value="in"/>
			        </td>
					<td align="right">合同结束日期:</td>
					<td align="left">
						<input class="nui-datepicker" name="criteria._expr[12]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[12]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[12]._property" value="contend"/>
					    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[12]._pattern" value="yyyy-MM-dd"/>
					</td>
			    </tr>
			    <tr>
			    	<td  align = "right">职位分类:</td>
			        <td align="left">
				        <input name="criteria._expr[14]._value" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO" shownullItem="true" allowInput="true"  style="width:150px;"  />
						<input class="nui-hidden" name="criteria._expr[14]._property" value="position"/>
						<input class="nui-hidden" name="criteria._expr[14]._op" value="in"/>
			        </td>
    				<td  align = "right">职位名称:</td>
			        <td align="left">
				        <input name="criteria._expr[9]._value" class="nui-textbox"  style="width:150px;"/>
						<input class="nui-hidden" name="criteria._expr[9]._property" value="position"/>
						<input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
						<input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
			        </td>
			    </tr>
    			<tr>
		        <td colspan="8" align="center">
		            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				    <a class="nui-button" id="exportEmpCont" iconCls="icon-download" onclick="exportEmpCont()">导出</a>
		        </td>
    		</table>
    	</div>
    </div>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
        	<tr>
                <td style="width:20%;">
                    <a class="nui-button" id="creatEmpCont_button" iconCls="icon-goto" onclick="startEmpCont()">发起员工续签流程</a>
                </td>
            </tr>
         </table>           
    </div>
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" frozenStartColumn="0" frozenEndColumn="3" 
	    dataField="empcontracts" multiSelect="true" pageSize="20" sizeList="[10,20,30,50]" allowAlternating="true"
	    url='com.primeton.eos.ame_permanage.ame_contract.omEmpContractlist.biz.ext' >
	    <div property="columns">
		    <div type="checkcolumn" width="30px"></div>
    	    <div field="processinstid" width="70" headerAlign="center" align="center" renderer="onActionRenderer">操作</div>
	        <div field="empname" width="80" headerAlign="center" align="center" allowSort="true">人员姓名</div>
	        <div field="indate" width="80" headerAlign="center" align="center" allowSort="true">入职日期</div> 
	        <div field="empstatus" width="60" headerAlign="center" align="left" renderer="empstatus"  allowSort="true">人员状态</div>
	        <div field="contuserid"  width="60" headerAlign="center"  align="center" allowSort="true" >签署工号</div>
	    	<div field="userid" width="60" headerAlign="center" align="left" allowSort="true">用户登录</div>
	    	<div field="conttype" width="80" headerAlign="center" align="center" allowSort="true" renderer="getConttype">合同属性</div>
	    	<div field="contprop" width="100" headerAlign="center" align="center" allowSort="true"renderer="getContprop" >合同性质</div>
	    	<div field="conttime" width="80" align="center" headerAlign="center" >合同期限(年)</div>
	    	<div field="contstart" width="80" headerAlign="center" align="center"allowSort="true">合同开始日期</div>
	        <div field="contend" width="80" headerAlign="center" align="center" allowSort="true">合同结束日期</div>
	    	<div field="gender" width="40" headerAlign="center" align="center" renderer="gender" allowSort="true">性别</div>
	    	<div field="syqname" width="120" headerAlign="center" align="center" allowSort="true">一级部门</div>
	    	<div field="sybname" width="120" headerAlign="center" align="center" allowSort="true">二级部门</div>
	    	<div field="ywdyname" width="120" headerAlign="center" align="center" allowSort="true">三级部门</div>
	    	<div field="orgname" width="120" headerAlign="center" align="center" allowSort="true">所属部门</div>
	    	<!-- <div field="processinstid" width="120" headerAlign="center" align="center" allowSort="true">流程实例id</div> -->
	        <div field="position" width="80" headerAlign="center" align="center" renderer="getPosition" allowSort="true">职位分类</div>
	        <div field="positionname"  width="80" headerAlign="center"  align="center" allowSort="true" >职位名称</div>
	        <div field="contcompany"  width="80" headerAlign="center"  align="center" renderer="company" allowSort="true" >签署公司</div>
	        <div field="contworkplace"  width="80" headerAlign="center"  align="center" renderer="workplace" allowSort="true" >工作地</div>
	        <div field="contstatus"  width="80" headerAlign="center"  align="center" renderer="contstatus" allowSort="true" >签署状态</div>
	        <div field="agentname" width="80" align="center" headerAlign="center" >经办人</div> 
	        <div field="remark" width="80" align="center" headerAlign="center" >备注</div> 
	        <div field="recipient" width="80" align="center" headerAlign="center" >收件人</div>
	        <div field="telephone" width="80" align="center" headerAlign="center" >联系电话</div>
	        <div field="address" width="160" align="left" headerAlign="center" >收件地址</div>
	    	<!-- <div field="files" width="70" align="center" headerAlign="center">附件</div> -->
	    </div>
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
	var grid = nui.get("datagrid1");
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowusername = '<%=nowusername %>';
	var nowuserid = '<%=nowuserid %>';
	
	init();
	function init(){
		
		//按钮权限的控制
	    getOpeatorButtonAuth("creatEmpCont_button");//操作按钮权限初始化
	    //机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件			
		var json = {"code":"OmEmpCont","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("empname").setValue('<%=nowusername %>');
						nui.get("userid").setValue('<%=nowuserid %>');
						nui.get("empname").setReadOnly(true);
						nui.get("userid").setReadOnly(true);
					}
					nui.get("orgseq").setData(text.orgs);
					nui.get("orgids").setValue(text.orgids);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
					nui.get("empname").setValue('<%=nowusername %>');
					nui.get("userid").setValue('<%=nowuserid %>');
					nui.get("empname").setReadOnly(true);
					nui.get("userid").setReadOnly(true);
				}
				search();
			}
		});
	}
	function search(){
		var data = form.getData();
		grid.load(data);
		grid.sortBy("contend","desc");
	}
	
	//发起员工续签流程
    function startEmpCont(){
		var row = grid.getSelected();
		if(row){
			if(row.contstatus=="3"){
				if(row.contprop=="2"){
					var text = nui.getDictText('CONT_PROP',row.contprop);
					nui.alert(text+"员工无需发起续签流程！","提示");
				}else{
					nui.open({
						url:"<%=request.getContextPath() %>/ame_permanage/ame_contract/creatEmpCont.jsp",
						title: '发起合同续签流程',
			            width: 1120,
			            height: 580,
			            onload: function () {
			            	var iframe = this.getIFrameEl();
							var data = {oldempcont:row};
							iframe.contentWindow.SetData(data);
			            },
			            ondestroy: function (action) {
			            	if(action == "ok"){
					            grid.reload();
			            	}
			       	 	}
					});
				}
			}else{
				nui.alert("只能发起有效的合同","提示");
			}
		}else{
			nui.alert("请选择一条记录","提示");
		}
		
	}
	
	//导出员工合同
    function exportEmpCont(){
    	if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_contract.exportEmpCont.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "omEmpCont";
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
	
	function reset(){
		form.reset();
		init();
	}
	
	
   function onActionRenderer(e) {
        var record = e.record;
    	var empcontid=e.record.empcontid;
    	var processinstid = e.record.processinstid;
    	var s;
    	if(processinstid){
			s = " <a  href='javascript:void(0)' onclick='getdetailCont(" + empcontid +")' title='点击查看'>详情</a>"+" "+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}else{
    		s = " <a  href='javascript:void(0)' onclick='getdetailCont(" + empcontid +")' title='点击查看'>详情</a>";
    	}
        return s;
    }   
    function getdetailCont(empcontid){
		var executeUrl = "<%= request.getContextPath() %>/ame_permanage/ame_contract/empContView.jsp?empcontid=" + empcontid;
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
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
    //所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	//工作地
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//工作地
	function contstatus(e){
		return nui.getDictText('EMP_CONT_STATUS',e.value);
	}
	//人员状态
	function empstatus(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	//性别
	function gender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
	}
</script>
</html>