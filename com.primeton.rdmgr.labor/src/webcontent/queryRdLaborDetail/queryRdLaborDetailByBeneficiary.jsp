<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-09-20 14:58:24
  - Description:
-->
<head>
<title>由我受益的工时</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                       	由我受益的工时
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    	<table style="width:100%;">
	    		<tr>
					<td align="right" width="110px"><span>财务年月：</span></td>
					<td>
						<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:86px" onvaluechanged="watchfinYM"/>
					</td>
					<td align="right" width="110px"><span>日期范围：</span></td>
	            	<td align="left" nowrap="nowrap">
					  	<input class="nui-datepicker" id="min" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[0]._max" style="width:100px"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="laborDate"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
					</td>
					<td align="right" width="110px"><span>填报人：</span></td>
	            	<td align="left" >
	            		<input name="criteria._expr[1]._value" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="userid" allowInput="true" textField="empname" valueField="userid" searchField="name" style="width:160px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/><%--
					    <input name="criteria._expr[1]._value" class="nui-buttonedit" onbuttonclick="showEmployee" id="userid" allowInput="false" style="width:150px;"/>--%>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="userId"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					    
					</td>
					<td align="right" width="70px" nowrap="nowrap"><span>工时状态：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="AME_LABOR_STATUS" multiSelect="true" style="width: 100px;"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._property" value="status"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
	            		
					    <input class="nui-hidden" name="criteria._or[0]._expr[0]._value" value=""/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="syorgid"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in"/>
					    
					    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._value" value=""/>
				        <input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="projectId"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="in"/>
					    <input class="nui-hidden" name="criteria._or[0]._expr[1]._ref" value="1"/>
					    <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					    <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.rdmgr.data.rd.RdProject"/>
					    <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="projectId"/>
					    <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="manager"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="="/>
					    
					    <input class="nui-hidden" name="criteria._orderby[0]._property" />
				        <input class="nui-hidden" name="criteria._orderby[1]._property" />
					    <input class="nui-hidden" name="criteria._orderby[1]._sort" />
				    </td>
				</tr>
				<tr>
					<td align="right" width="110px" nowrap="nowrap"><span>项目编号：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[4]._value" style="width:120px;"/>
				        <input class="nui-hidden" name="criteria._expr[4]._property" value="projectno"/>
				        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[4]._rule" value="all"/>
				    </td> 
					<td align="right" width="95px" nowrap="nowrap"><span>项目名称：</span></td>
					<td align="left">
					    <input name="criteria._expr[3]._value" class="nui-textbox"  id="projectid" style="width:160px;" />
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._rule" value="all"/>
					</td>
			    	<td align="right" width="95px" nowrap="nowrap"><span>客户：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[5]._value" style="width:160px"/>
				        <input class="nui-hidden" name="criteria._expr[5]._property" value="custname"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[5]._rule" value="all"/>
				    </td>
					<td align="center" colspan="2">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                    </td>
				</tr>
	    	</table>
    	</div>
	</div>
	
	<div style="width:100%;">
        <div class="nui-toolbar" style="padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:10%;">
                        <a class="nui-button" id="confirm" iconCls="labor-syc" onclick="confirmRdLaborDetail('confirm')">受益确认</a> 
                    </td>
                </tr>
            </table>           
        </div>
    </div>
	<div  class="nui-tabs" style="width:100%;" activeIndex="0">
		<div title="工时统计" style="width:100%;">
	    	<div id="datagrid2"  class="nui-datagrid" style="width:100%;height:318px;" allowResize="true" pageSize="20"  showSummaryRow="true"
		        url="com.primeton.rdmgr.labor.queryRdLaborDetail.queryStatisticsLabor.biz.ext" dataField="rdlabordetails"  multiSelect="true" frozenEndColumn="4"
		    	ondrawcell="ondrawCsGatherFcGridcell" allowCellWrap="true" ondrawsummarycell="doCountSum" >
		        <div property="columns">
		            <div field="userName" width="60" headerAlign="center"  align="center">填报人</div> 
		            <div field="projectName" width="130" headerAlign="center" align="left">受益项目</div>
		            <div field="projectno" width="100" headerAlign="center"  align="center">项目编号</div>  
		            <div field="custjc" width="100" headerAlign="center" align="left">所属客户</div>
		        	<div field="startdate" width="75" headerAlign="center" align="center" allowSort="false" renderer = "ondealdate">开始日期</div>
		        	<div field="enddate" width="75" headerAlign="center" align="center" allowSort="false" renderer = "ondealdate">截至日期</div> 
		        	<div field="benefconfer" width="75" headerAlign="center" align="center" allowSort="false">受益确认人</div> 
		            <div field="actHours" width="65" headerAlign="center" summaryType="sum"  align="center">工时总数</div> 
		            <div field="laborNum" width="65" headerAlign="center" summaryType="sum"  align="center">工时笔数</div>
		            <div field="standcost" width="80" headerAlign="center" summaryType="sum"  align="right">原始定额成本</div> 
		            <div field="cost" width="80" headerAlign="center" summaryType="sum"  align="right">定额结算成本</div>
		        </div>
		    </div>
	    </div>
		<div title="工时明细" style="width:100%;">
			<div style="width:100%;">
		        <div class="nui-toolbar" style="padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:10%;">
		                        <a class="nui-button" id="FINconfirm" iconCls="labor-syq" onclick="confirmRdLaborDetail('doubt')">受益疑问</a>    
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:318px;" allowResize="true" pageSize="20"  showSummaryRow="true"
		        url="com.primeton.rdmgr.labor.input.rdlabordetailbiz.queryRdLaborDetails.biz.ext" dataField="rdlabordetails" frozenStartColumn="0" frozenEndColumn="4" multiSelect="true"
		    	ondrawcell="ondrawCsGatherFcGridcell" allowCellWrap="true" ondrawsummarycell="doCountSum" >
		        <div property="columns">
			    	<div name="temp123" type="checkcolumn"></div>
		            <div field="userName" width="60" headerAlign="center" allowSort="true" align="center">填报人</div>
		            <div field="gradename" width="60" headerAlign="center" allowSort="true" align="center">人员级别</div>
		            <div field="orgname" width="80" headerAlign="center" allowSort="true" align="center">填报部门</div>
		            <div field="salesName" width="80" headerAlign="center" allowSort="true" align="center">受益部门</div>
		            <div field="projectName" width="100" headerAlign="center" allowSort="true" align="center">受益项目</div>     
		            <div field="custjc" width="100" headerAlign="center" align="center">所属客户</div>
		        	<div field="laborDate" width="75" headerAlign="center" align="center" allowSort="false" renderer="onTitleRenderer">工时日期</div>   
		            <div field="actHours" width="43" headerAlign="center" summaryType="sum" allowSort="true" align="center">总工时</div>  
		            <div field="otwHours" width="53" headerAlign="center" summaryType="sum" allowSort="true" align="center">其中加班</div> 
		            <div field="standcost" width="78" headerAlign="center" summaryType="sum" allowSort="true" align="right">原始定额成本</div> 
		            <div field="cost" width="78" headerAlign="center" summaryType="sum" allowSort="true" align="right">定额结算成本</div>
		            <div field="conratio" width="53" headerAlign="center" allowSort="true" align="right">转换系数</div>
		            <div field="concost" width="78" headerAlign="center" summaryType="sum" allowSort="true" align="right">工时转换成本</div>   
		            <div field="status" width="60" headerAlign="center" allowSort="true" renderer="laborStatus" align="center">工时状态</div>
		            <div field="benefconfq" width="80" headerAlign="center" allowSort="true" align="center">工时疑问</div> 
		            <div field="benefconfr" width="80" headerAlign="center" allowSort="true" align="center">疑问反馈</div> 
		            <div field="taskname" width="75" headerAlign="center" allowSort="true" align="center">项目活动</div>
		            <div field="repContent" width="110" headerAlign="center" allowSort="true" align="center" >工作填写内容</div> 
		        </div>
		    </div>
	    </div>
    </div>
    
    <div id="win1" class="nui-window" title="受益疑问信息" style="width:400px;height:220px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
    	<div style="padding:5px;">
    		<input name="benefconfq" id="benefconfq" vtype="rangeLength:0,100" class="nui-textarea" required="true"  style="width:380px;height:140px;"/>
    	</div>
	    <div property="footbar" style="padding:5px;margin-left: 120px;">
	        <input type='button' value='确定' id="sureDate1" onclick="sureDate('doubt')" style="vertical-align: bottom;"/>
	        <input type='button' value='关闭' id="closeDate" onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
	    </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var grid2 = nui.get("datagrid2");
    var form = new nui.Form("form1"); 
   
	//初始化数据
	init();
	function init(){
		var myDate = new Date();
		var year = myDate.getFullYear();
		var month = myDate.getMonth()+1;
		var curDateTime = year+'-';
    	if(month>9){
			curDateTime = curDateTime + "" + month;
		}else{
			curDateTime = curDateTime + "0" + month;
		}
		nui.get("finYM").setValue(curDateTime);
		watchfinYM();
		var userid='';
	    var form = new nui.Form("#form1");
		var data1 = form.getData(); //获取表单JS对象数据
		<%
			UserObject user = (UserObject)session.getAttribute("userObject");
    		String userid = user.getUserId();
		 %>
		 userid = "<%=userid %>";
		 nui.getbyName("criteria._ref[0]._expr[0]._value").setValue(userid);
		 data1.criteria._ref[0]._expr[0]._value=userid;
		 var data = {userid:userid};
         var json = nui.encode(data);
         nui.ajax({
     	 	url: "com.primeton.rdmgr.labor.queryRdLaborDetail.getManaferSYBonly.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
            async: false,
	        contentType: 'text/json',
	        success: function (text) {
	        	var syblist='';
	        	if(text.syb.length > 0){
					for(var i=0;i<text.syb.length;i++){
						if(i == 0){
							syblist = text.syb[i].orgid;
						}else{
							syblist = syblist+','+text.syb[i].orgid;
						}
					}
					nui.getbyName("criteria._or[0]._expr[0]._value").setValue(syblist);
					data1.criteria._or[0]._expr[0]._value=syblist;
				}else{
					nui.getbyName("criteria._or[0]._expr[0]._value").setValue('0');
					data1.criteria._or[0]._expr[0]._value='0';
				}
	        }
         });
         if((data1.criteria._or[0]._expr[0]._value == null || data1.criteria._or[0]._expr[0]._value == '') && (data1.criteria._ref[0]._expr[0]._value == null || data1.criteria._ref[0]._expr[0]._value == '')){
         }else{
         	data1.criteria._orderby[1]._property="laborDate";
         	data1.criteria._orderby[1]._sort="desc";
         	data1.sortField="userName";
         	data1.sortOrder="asc";
         	grid.load(data1); //datagrid加载数据
         	grid2.load(data1);
         }
	  	 
	}
	
	//财务年月控制
	function watchfinYM(){
		var finYM = nui.get("finYM").getValue();
		var year = finYM.getFullYear();
  		var month = finYM.getMonth()+1;
		var json = ({"criteria":{"_entity":"com.primeton.eos.common.newdataset.MisFinperiod",
								 "_expr[0]":{"_property":"finyear","_op":"=","_value":year},
								 "_expr[1]":{"_property":"finmonth","_op":"=","_value":month}
								}});
		nui.ajax({
	        type:'get',
	        data:json,
	        cache: false,
	        showModal: false,
	        async :false,
	        contentType: 'text/json',
	        url:'com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz.ext',
	        success:function(result){
	            if(result.misfinperiods.length>0){
	            	nui.get("min").setValue(result.misfinperiods[0].startdate);
	            	nui.get("max").setValue(result.misfinperiods[0].enddate);
	            }else{
	            	nui.get("min").setValue('');
	            	nui.get("max").setValue('');
	            }
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            nui.alert("error:" + jqXHR.responseText);
	        }
	    })
	}
	
	//员工查询按钮
	function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/tree/lazytree.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			onload: function () {
                var iframe = this.getIFrameEl();
                var empname=nui.get("userid").getText();
                var userid=nui.get("userid").getValue();
                if(userid){
                	var data = {empname:empname,userid:userid};
                }else{
                	var data ={};
                }
                iframe.contentWindow.SetData(data);
            },
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
	
	//查询
	function search() {	    		
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
		data.criteria._orderby[1]._property="laborDate";
        data.criteria._orderby[1]._sort="desc";
	  	grid.load(data); //datagrid加载数据
	  	grid2.load(data);
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		init();
	}
	
	//疑问工时标红
	function ondrawCsGatherFcGridcell(e){
		var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
        if(record.status == '2'){
        	e.rowStyle = "background-color: #FF99CC";
        }
	}
	
	//收益疑问信息
    function showAtPos() {
        var win = nui.get("win1");
        win.showAtPos("center", "middle");
    }
    function hideWindow() {
        var win = nui.get("win1");
        win.hide();
    }
    
	//工时确认
	function confirmRdLaborDetail(e){
		var rdLaborDetails=grid.getSelecteds();
		var status = ''
		if(e == "confirm"){
			status = '1';
		}else if(e == "doubt"){
			status = '2';
		}else {
			nui.alert("方法调用错误，请联系管理员！");
			return;
		}
		if(rdLaborDetails.length<1 && e == "doubt"){
			nui.alert("进行受益疑问时,请选择至少一条的工时信息执行本操作！");
			return;
		}
		var status1 = nui.getbyName("criteria._expr[2]._value").getValue();
		if((status1 == null || status1== '') && e == "confirm"){
			nui.alert("进行受益确认操作时，查询条件里的工时状态必选！");
			return;
		}
		if(status1!= '0' && status1!= '2' && status1!= '0,2' && status1!= '2,0' && e == "confirm"){
			nui.alert("只能对状态为新增和受益部门疑问的工时数据进行受益确认操作！");
			return;
		}
		if(e == "doubt"){
			for(var i = 0;i < rdLaborDetails.length; i++){
				if((rdLaborDetails[i].status == '0' || rdLaborDetails[i].status == '2') && (status == '1' || status == '2')){
					
				}else {
					nui.alert("只能对工时状态为新增和受益疑问的工时信息进行受益疑问操作，请按照规则勾选！");
					return;
				}
			}
		}
		
		if(status == '2'){
			showAtPos();
		}else if (status == '1'){
			nui.confirm("本操作将确认符合查询条件的所有工时记录，请确认是否操作。", "确定？",function (action) {
				if (action == "ok"){
					sureDate("confirm");
				}
			});
		}
	}
	function sureDate(e){
		var rdLaborDetails=grid.getSelecteds();
		var status = ''
		var benefconfq = nui.get("benefconfq").getValue();
		var message = '';
		if(e == "confirm"){
			status = '1';
			message = "确认";
		}else if(e == "doubt"){
			status = '2';
			message = "疑问";
		}
		if((benefconfq == '' || benefconfq == null) && status == '2'){
			nui.alert("受益疑问请填写受益疑问信息！");
			return;
		}
		if(status == '2'){
			document.getElementById("sureDate1").disabled=true;
			document.getElementById("closeDate").disabled=true;
		}else{
			nui.get("confirm").disable();
			nui.get("FINconfirm").disable();
		}
		for(var i = 0;i < rdLaborDetails.length; i++){
			if((rdLaborDetails[i].status == '0' || rdLaborDetails[i].status == '2') && (status == '1' || status == '2')){
				rdLaborDetails[i].status = status;
			}
			if(status == '2'){
				rdLaborDetails[i].benefconfq=benefconfq;
			}
		}
		var json = '';
		var url = '';
		if(e == "doubt"){
			json = {"updateEntities":rdLaborDetails,"style":"syr"};
			url= 'com.primeton.eos.ame_common.wx_worktime.changeLaborStatus.biz.ext';
		}else if (e == "confirm"){
			json = form.getData();
			json.type="syr";
			json.criteria._orderby[0]._property="userName";
        	json.criteria._orderby[0]._sort="desc";
			json.criteria._orderby[1]._property="laborDate";
        	json.criteria._orderby[1]._sort="desc";
        	//json.staristicsLabor = grid2.getSelecteds();
			url= 'com.primeton.rdmgr.labor.queryRdLaborDetail.confirmRdLaborDetails.biz.ext';
		}
		grid.loading("操作中，请稍后......");
		grid2.loading("操作中，请稍后......");
		nui.ajax({
            type:'get',
            data:json,
            cache: false,
            contentType: 'text/json',
            url:url,
            success:function(result){
            	grid.unmask ( );
             	grid2.unmask ( );
                if(result.exception == null){
                	hideWindow();
                	var alertmessage = '';
                	if(status == '2'){
                		alertmessage = "操作成功！本次操作将"+rdLaborDetails.length+"条工时数据的状态改为受益疑问。";
                	}else if(status == '1'){
                		alertmessage = "操作成功！本次操作"+message+"了"+result.total+"条数据。";
                	}
                    nui.alert(alertmessage,"系统提示",function(){
                        search();
                    });
                }else{	
                	hideWindow();
                    nui.alert("操作失败！请联系信息技术部人员。")
                }
                if(status == '2'){
					document.getElementById("sureDate1").disabled=false;
					document.getElementById("closeDate").disabled=false;
				}else{
					nui.get("confirm").enable();
					nui.get("FINconfirm").enable();
				}
                
            },
            error:function(jqXHR, textStatus, errorThrown){
            	grid.unmask ( );
             	grid2.unmask ( );
            	if(status == '2'){
					document.getElementById("sureDate1").disabled=false;
					document.getElementById("closeDate").disabled=false;
				}else{
					nui.get("confirm").enable();
					nui.get("FINconfirm").enable();
				}
                nui.alert("error:" + jqXHR.responseText);
            }
        })
	}
	
	//汇总行格式设置
	function doCountSum(e){
		if (e.field == "actHours") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "otwHours") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "cost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "concost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "standcost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
		if (e.field == "laborNum") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//日期格式化
    function ondealdate(e){
		if(e.value){
		  var now  = e.value;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"-" + month;
		  }else{
		  	curDateTime = curDateTime+"-" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"-" + day;
		}else{
			curDateTime = curDateTime+"-" + "0" + day;
			}
		return   curDateTime; 
		}
	}
	
	 //工时状态业务字典
	function laborStatus(e){
		return nui.getDictText('AME_LABOR_STATUS',e.value);
	}
</script>
</html>