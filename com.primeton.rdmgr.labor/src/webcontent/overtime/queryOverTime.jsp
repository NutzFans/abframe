<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-10-30 09:54:23
  - Description:
-->
<head>
	<title>加班工时查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
    	body{
    		width:100%;
    		height:100%;
    		padding:0px;
    		margin:0px;
    		font-size:12px;
    	}
    </style>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                       	加班工时查询
	                    </td>
	                </tr>
                 </table>           
	        </div>
	        
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right" width="105px"><span>财务年月：</span></td>
						<td>
							<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:140px" onvaluechanged="watchfinYM"/>
						</td>
						<td align="right" width="120px"><span>工时日期：</span></td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-datepicker" id="min1" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[0]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="laborDate"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right" width="95px"><span>姓名：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="mini-textboxlist" id="userid" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:186px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="userId"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
						</td>
					</tr>
					<tr>
					    <td align="right" width="100px"><span>调休状态：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[3]._value" dictTypeId="AME_LABOR_ISDAYSOFF" multiSelect="true" style="width: 140px;"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="isbreakoff"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
					    </td>
					    <td align="right" width="115px" nowrap="nowrap"><span>员工所属部门：</span></td>
					 	<td>
					 		<input id="finUnitId"  name="criteria._expr[2]._value"  class="nui-combobox" 
						    textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width:205px;"/>
				    		<input class="nui-hidden" name="criteria._expr[2]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="end"/>
					    </td>
						<td align="right" width="95px" nowrap="nowrap"><span>项目：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[6]._value" style="width:186px;"/>
					        <input class="nui-hidden" name="criteria._expr[6]._property" value="projectName"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					    </td> 
				    </tr>
				    <tr>
				    	<td align="right" width="95px" nowrap="nowrap"><span>项目编号：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[7]._value" style="width:140px;"/>
					        <input class="nui-hidden" name="criteria._expr[7]._property" value="projectNo"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
					    </td> 
				    	<td align="right" width="95px" nowrap="nowrap"><span>客户：</span></td>
		            	<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[8]._value" style="width:205px;"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="custjc"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
					    </td>
						<td align="right" width="120px"></td>
					    <td align="left">
	                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
	                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
	                        <a class="nui-button" onclick="exportRdLabors" iconCls="icon-download"  id="exportButton">导出</a>
	                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>		
	               		</td>
	               		<td>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="userOrgId"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._value" value="0"/>
					    </td>
					</tr>
			    </table>
			</div>
			
	    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" iconCls="icon-edit" onclick="breakSet()">调休设置</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
			<div id="datagrid1" dataField="overTimeList" class="nui-datagrid" style="width:100%;height:400px;" 
		    	url="com.primeton.rdmgr.labor.queryOverTime.queryOverTime.biz.ext" idField="id" allowResize="true" allowCellWrap="true"
		    	sizeList="[10,20,30,50,100]" pageSize="20" allowAlternating="true" showSummaryRow="true" ondrawsummarycell="doCountSum" multiSelect="false" ondrawcell="ondrawCsGatherFcGridcell">
			    <div property="columns">
			    	<div type="checkcolumn" width="20"></div>
			    	<div field="laborDate" width="75" headerAlign="center" align="center" allowSort="true" renderer="onTitleRenderer">加班日期</div>
			    	<div field="workday" width="75" headerAlign="center" align="center" allowSort="true">星期</div>
			        <div field="empname" width="73" headerAlign="center" align="center" allowSort="true">姓名</div>
			        <div field="projectName" width="100" headerAlign="center" allowSort="true" align="left">项目</div>
			        <div field="projectNo" width="100" headerAlign="center" allowSort="true" align="left">项目编码</div>
			        <div field="custjc" width="100" headerAlign="center" allowSort="true" align="left">客户</div>
			        <div field="orgname" width="100" headerAlign="center" allowSort="true" align="center">受益销售</div>
			        <div field="actHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center">总工时</div>   
	            	<div field="otwHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center" >其中加班</div> 
	            	<div field="breakoffHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center" >已调休小时数</div> 
	            	<div field="breakoffDate" width="100" headerAlign="center" allowSort="true" align="left">调休日期</div>
	            	<div field="isworkday" width="60" headerAlign="center" allowSort="true" align="center" >是否工作日</div>
			        <div field="isbreakoff" width="60" headerAlign="center" allowSort="true" renderer="laborIsDaysOff" align="center">调休状态</div>
			        <div field="remark" width="100" headerAlign="center" allowSort="true" align="left">备注</div>
			        <div field="repContent" width="100" headerAlign="center" allowSort="true" align="left">工作内容</div>
			    </div>
			</div>
	    </div>
	</div>
	<div id="editWindow" class="nui-window" title="调休设置" style="width:650px;" 
    showModal="true" allowResize="true" allowDrag="true">
    <div id="editform" class="form" >
        <table style="width:100%;">
            <tr>
	            <td colspan="6"><span style="color: red">提醒：1：根据部门规定选择有效期范围内的加班日期调休；
		            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2：尽量选择有效期范围内最早的加班日期；
		            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3：该加班日期如果被多次调休，调休日期请以逗号分割。
		            </span>
	            </td>
            </tr>
            <tr>
                <td align="right" style="width: 60px;">加班日期：</td>
                <td id="laborDate" style="width: 60px"></td>
                <td align="right"  style="width: 90px;">姓名：</td>
                <td id="empname" style="width: 60px"></td>
                <td style="width: 110px;" align="right">可调休工时数：</td>
                <td id="resthours" style="width: 60px"></td>
            </tr>
            <tr>
                <td align="right">调休小时数：</td>
                <td ><input name="breakhours" id="breakhours" class="nui-textbox" /></td>
                <td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td align="right">调休日期：</td>
                <td colspan="5"><input name="breakdate" id="breakdate" class="nui-textbox"  style="width: 95%"/></td>
            </tr>
            <tr>
                <td align="right">备注：</td>
                <td colspan="5"><input id="remark" class="nui-textbox" style="width: 95%"/></td>
            </tr>
            <tr>
                <td style="text-align:center;padding-top:5px;" colspan="6">
                    <a class="nui-button" iconCls="icon-save" onclick="saveBreak()">保存</a>
                    <a class="nui-button" iconCls="icon-close" onclick="cancle()">关闭</a>
                </td>                
            </tr>
       
        </table>
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var editWindow = nui.get("editWindow")
	init();
	//数据初始化
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
    		
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"jbgscx","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					var isall;//是否拥有全公司的权限
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.getbyName("criteria._expr[4]._op").setValue("=");
        				nui.getbyName("criteria._expr[4]._value").setValue("");
					}else{
						nui.getbyName("criteria._expr[4]._value").setValue(text.orgids);
					}
					if(text.orgs.length == 0){
						nui.get("userid").setValue("<%=nowuserid %>");
						nui.get("userid").setText("<%=nowusername %>");
						nui.get("userid").setReadOnly(true);
					}
					nui.get("finUnitId").setData(text.orgs);
				}
				search();
			}
		});
	}
	//重置按钮
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		init();
	}
	//查询
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData();//获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	//非工作日标示
	function ondrawCsGatherFcGridcell(e){
		var isWork = e.record.isworkday;
        if(isWork == '否'){
        	e.rowStyle = "background-color: rgba(145,228,87,0.6)";
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
	            	nui.get("min1").setValue(result.misfinperiods[0].startdate);
	            	nui.get("max1").setValue(result.misfinperiods[0].enddate);
	            }else{
	            	nui.get("min1").setValue('');
	            	nui.get("max1").setValue('');
	            }
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            nui.alert("error:" + jqXHR.responseText);
	        }
	    })
	}
	
	//工时计算
	function doCountSum(e){
		if (e.field == "actHours") {
            e.cellHtml = "<div align='center'>" + e.cellHtml + "<b>（h）</b></div>";
        }
        if (e.field == "otwHours") {
            e.cellHtml = "<div align='center'>" + e.cellHtml + "<b>（h）</b></div>";
        }
	}
	
	
	//导出
	function exportRdLabors(){
		nui.confirm("确认导出？", "确定？",
        function (action) {
        	if(action=='ok'){
        		var form = new nui.Form("#form1");
        		var json = form.getData();
        		grid.loading("操作中，请稍后......");
				nui.ajax({
	    			url: "com.primeton.rdmgr.labor.queryOverTime.exporOverTime.biz.ext",
			        type: "post",
			        data: json,
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			     		grid.unmask();
			     		var filePath = o.downloadFile;
			        	var fileName = "加班工时记录";
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
			     		grid.unmask();
			        	alert("error");
			        }
				});
        	}
		});
	}
	
	//工时日期详情格式化
	function onTitleRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doView("+e.record.laborDetailId+");' title='点击查看'>" + e.value + "</a>";
	}
	//查看工时
	function doView(laborDetailId){
		var detailWrokUrl = "<%=request.getContextPath() %>/labor/queryRdLaborDetail/checkRdLaborDetail.jsp?laborDetailId=" + laborDetailId;
		window.open(detailWrokUrl, "工时查看", "height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
	}
	//预留调休业务字典
	function laborIsDaysOff(e){
		return nui.getDictText('AME_LABOR_ISDAYSOFF',e.value);
	}
	
	//调休设置
	function breakSet(){
		var overtime=grid.getSelected();
		if(overtime){
			if(overtime.isbreakoff=="0"){
				nui.alert("该加班工时为不调休，无法设置调休工时！");
				return;
			}
			if(overtime.breakoffHours ==overtime.otwHours ){
				nui.alert("该加班工时已全部调休完毕，无法设置调休工时！");
				return;
			}
			document.getElementById("laborDate").innerHTML = overtime.laborDate;
			document.getElementById("empname").innerHTML = overtime.empname;
			document.getElementById("resthours").innerHTML = overtime.otwHours;
			editWindow.show();
			var editform = new nui.Form("editform");
			editform.clear();
			nui.get("remark").setValue(overtime.remark);
			nui.get("breakdate").setValue(overtime.breakoffDate);
			nui.get("breakhours").setValue(overtime.breakoffHours);
		}else{
			nui.alert("请选中一条加班工时记录！");
		}
	}
	
	//保存调休设置
	function saveBreak(){
		var breakhours = nui.get("breakhours").getValue();
		var breakdate = nui.get("breakdate").getValue();
		var remark = nui.get("remark").getValue();
		if(breakhours==null||breakhours==""){
			nui.alert("调休小时数不能为空！");
			return;
		}
		if(parseFloat(breakhours)>0){
			if(breakdate==null||breakdate==""){
				nui.alert("调休日期不能为空！");
				return;
			}
		}
		var overtime=grid.getSelected();
		if(parseFloat(breakhours)>parseFloat(overtime.otwHours)){
			nui.alert("调休小时数已超过可调休小时数，请调整！")
			return;
		}
		var tips = "是否设置"+overtime.empname+"于"+overtime.laborDate+"的加班工时调休数？"
		nui.confirm(tips,"操作提示",function(o){
        	if("ok" == o){
        		var json={breakhours:breakhours,breakdate:breakdate,overtime:overtime,remark:remark};
				nui.ajax({
			        type:'get',
			        data:json,
			        cache: false,
			        async :false,
			        contentType: 'text/json',
			        url:'com.primeton.rdmgr.labor.queryOverTime.updateBreakOff.biz.ext',
			        success:function(result){
			            if(result.reCode=="1"){
			            	nui.alert("设置成功！");
			            	cancle();
			            	grid.reload();
			            }else{
			            	nui.alert("设置失败！");
			            }
			        },
			        error:function(jqXHR, textStatus, errorThrown){
			            nui.alert("error:" + jqXHR.responseText);
			        }
			    })
        	}
        });
	}
	
	//关闭设置窗口
	function cancle(){
		editWindow.hide();
		var editform = new nui.Form("editform");
		editform.clear();
	}
</script>
</html>