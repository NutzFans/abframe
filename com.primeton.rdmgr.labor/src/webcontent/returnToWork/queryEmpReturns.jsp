<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-03-06 11:39:24
  - Description:
-->
<head>
<title>queryEmpReturns</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	复工日报查询
                    </td>
                </tr>
             </table>           
        </div>
    </div>
    <div id="form1" class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<table style="width:100%;">
    		<tr>
			 	<td align="right" nowrap="nowrap" style="width:80px;">填报人：</td>
			 	<td>
			 		<input class="nui-hidden" name="criteria._expr[0]._property" value="empname" />
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-textbox" name="criteria._expr[0]._value" style="width:120px;" id="emp" />
					<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
					<input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="userid" />
					<input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="="/>	
					<input class="nui-hidden" name="criteria._or[0]._expr[0]._value" id="userid" />
					<input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="majorname" />
					<input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="="/>	
					<input class="nui-hidden" name="criteria._or[0]._expr[1]._value" id="majorname" />
			    </td>
			    <td align="right" style="width:50px;" ><span>部门：</span></td>
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
				<td align="right" style="width:100px;">确认人：</td>
            	<td align="left">
				    <input class="nui-textbox" name="criteria._expr[4]._value" style="width: 100px" id="confirmname" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[4]._property" value="confirmname"/>
                    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
                    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
				</td>
				<td align="right" style="width:100px;">填报日期：</td>
            	<td align="left">
            		<input class="nui-datepicker" id="min1" name="criteria._expr[5]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[5]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[5]._property" value="insertdate"/>
		 		 	<input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
    		    <td align="right" style="width:100px;">当日所在城市：</td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="criteria._expr[6]._value" style="width: 120px" allowInput="true"onenter="onKeyEnter" dictTypeId="AME_CITY" multiSelect="true" id="returncity"/>
		 		 	<input class="nui-hidden" name="criteria._expr[6]._property" value="returncity"/>
                    <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
				</td>
			 	<td align="right" nowrap="nowrap" style="width:100px;">复工状态：</td>
			 	<td>
			 		<input class="nui-dictcombobox" name="criteria._expr[7]._value" style="width: 200px" dictTypeId="AME_FGZT" multiSelect="true" onenter="onKeyEnter" id="retrunstatus"/>
		 		 	<input class="nui-hidden" name="criteria._expr[7]._property" value="retrunstatus"/>
                    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
			    </td>
				<td align="right" style="width:100px;">复工确认状态：</td>
            	<td align="left">
				    <input class="nui-dictcombobox" name="criteria._expr[8]._value" style="width: 100px" id= "confirmstatus"onenter="onKeyEnter" dictTypeId="AME_FGZTSTATUS" multiSelect="true"/>
		 		 	<input class="nui-hidden" name="criteria._expr[8]._property" value="confirmstatus"/>
                    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
				</td>
				<td align="right" style="width:100px;">报工日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min2" name="criteria._expr[9]._min" style="width:95px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max2" name="criteria._expr[9]._max" style="width:95px" onenter="onKeyEnter"/>
		 		 	<input class="nui-hidden" name="criteria._expr[9]._property" value="returndate"/>
		 		 	<input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
				</td>
    		</tr>
    		<tr>
    		    <td align="right" style="width:100px;">直属领导：</td>
    		    <td align="left">
			 		<input class="nui-hidden" name="criteria._expr[10]._property" value="majorname" />
			        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
			        <input class="nui-textbox" name="criteria._expr[10]._value" style="width:120px;" id="major" onenter="onKeyEnter"/>
					<input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
			    </td>
			    <td align="right">入职日期：</td>
            	<td align="left">
				    <input class="nui-datepicker" id="min3" name="criteria._expr[12]._min" style="width:97px" onenter="onKeyEnter"/>-<input class="nui-datepicker" id="max3" name="criteria._expr[12]._max" onenter="onKeyEnter" style="width:97px"/>
		 		 	<input class="nui-hidden" name="criteria._expr[12]._property" value="indate"/>
                    <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
				</td>
			    <td align="right">员工属性：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="criteria._expr[11]._value"  id="emptype" style="width: 100px" dictTypeId="EMP_TYPE" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="criteria._expr[11]._property" value="emptype"/>
                    <input class="nui-hidden" name="criteria._expr[11]._op" value="in"/>
				</td>
				<td align="right">人员性质：</td>
            	<td align="left" >
                    <input class="nui-dictcombobox"  name="criteria._expr[12]._value"  id ="nature" style="width: 105px" dictTypeId="AME_EMPTYPE2" onenter="onKeyEnter" multiSelect="true" shownullItem="true"/>
		 		 	<input class="nui-hidden" name="criteria._expr[12]._property" value="nature"/>
                    <input class="nui-hidden" name="criteria._expr[12]._op" value="in"/>
				</td>
				
    		</tr>
    		<tr>
    			<td align="center" colspan="8">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                    <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
    			</td>
    		</tr>
    	</table>
    </div>
</div>
<div style="width:100%;">
<div class="nui-toolbar"  style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a  id="queryEmpReturns_surebutton" class="nui-button" iconCls="icon-ok" onclick="surepre()">报工确认</a>
			                <a class="nui-button" id="export" iconCls="icon-download" onclick="expqueryEmpReturns()">导出复工日报</a>
				        </td>
	                </tr>
	            </table>           
	       </div>
</div>
<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" 
    dataField="queryEmpReturns" multiSelect="true" pageSize="20" sizeList="[10,20,50,100,200,500]" allowAlternating="true"
    url='com.primeton.rdmgr.labor.returnToWork.queryEmpReturns.biz.ext'>
    <div property="columns">
    	<div type="checkcolumn" width="22"></div>
    	<div field="empname" width="50" headerAlign="center" align="center" allowSort="true">填报人</div>
    	<div field="returndate" width="80" headerAlign="center" align="center" allowSort="true">报工日期</div>
    	<div field="retrunstatus" width="100" headerAlign="center" align="center" allowSort="true" renderer="getretrunStatus">复工状态</div> 
    	<div field="orgname" name="orgname" width="80" align="center" headerAlign="center" allowSort="true" >所属部门</div>
        <div field="yjbm" name="yjbm" width="80" align="center" headerAlign="center" allowSort="true" >所属一级部门</div>
        <div field="ejbm" name="ejbm" width="80" align="center" headerAlign="center" allowSort="true">所属二级部门</div>
        <div field="indate" width="80" headerAlign="center" align="center" allowSort="true">入职日期</div> 
        <div field="majorname" name="orgname" width="55" align="center" headerAlign="center" allowSort="true" >直属领导</div>
    	<div field="confirmname" width="50" headerAlign="center" align="center" allowSort="true">确认人</div>
    	<div field="confirmstatus" width="55" headerAlign="center" align="center" allowSort="true" renderer="getconfirmStatus">确认状态</div>
    	<div field="returncity" width="60" headerAlign="center" align="center" allowSort="true" renderer="getCity">所在省市</div>  
    	<div field="insertdate" width="110" headerAlign="center" align="center"  renderer="DateFormat">填报时间</div>
    	<div field="inlocation" width="95" headerAlign="center" align="center" allowSort="true">填报的地理位置</div>
        <div field="remark" width="200" headerAlign="center" align="left" allowSort="true">备注</div>
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
	var nowusername = '<%=nowusername %>';
	var nowuserid = '<%=nowuserid %>';
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	init();
    function init(){
            //按钮权限的控制
	        getOpeatorButtonAuth("queryEmpReturns_surebutton");//操作按钮权限初始化
	    	var json = {"code":"queryEmpReturns","map":{"property":"status","op":"=","value":"running"}};
	    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("userid").setValue('<%=nowuserid %>');
							nui.get("majorname").setValue('<%=nowusername %>');
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
							nui.get("userid").setValue('<%=nowuserid %>');
							nui.get("majorname").setValue('<%=nowusername %>');
					}
					search();
				}
			});
    }
    function search() {
            var data = form.getData(); //获取表单JS对象数据
            grid.sortBy("returndate","desc"); 
            grid.load(data); //datagrid加载数据
        }
    function reset(){
		form.reset();
		init();
	}
	//导出明细查询
	function expqueryEmpReturns(){
	   var min2 = nui.get("min2").getValue();
	   var max2 = nui.get("max2").getValue();
	   if((min2 == null || min2 == '') || (max2 == null || max2 == '')){
           nui.alert("报工日期日期必填");
		   return;
       }
       var startdate = min2;
       var enddate = max2; 
       var empname = nui.get("emp").getValue();
       var userid = nui.get("userid").getValue();
       var majorname = nui.get("major").getValue();
	   var orgseq = nui.get("orgseq").getValue();
	   var orgids = nui.get("orgids").getValue();
	   var confirmname = nui.get("confirmname").getValue();
	   var min1 = nui.get("min1").getValue();
	   var max1 = nui.get("max1").getValue();
	   var min3 = nui.get("min3").getValue();
	   var max3 = nui.get("max3").getValue();
	   var returncity = nui.get("returncity").getValue();
	   var retrunstatus = nui.get("retrunstatus").getValue();
	   var confirmstatus = nui.get("confirmstatus").getValue();
	   var emptype = nui.get("emptype").getValue();
	   var nature = nui.get("nature").getValue();
       nui.confirm("导出数据可能较大，请确认导出部门已选择？","导出部门提示",function(action){
        if(action=="ok"){
		var json = {startdate:startdate,enddate:enddate,empname:empname,orgseq:orgseq,orgids:orgids,confirmname:confirmname,min1:min1,max1:max1,min3:min3,max3:max3,returncity:returncity,retrunstatus:retrunstatus,confirmstatus:confirmstatus,majorname:majorname,emptype:emptype,userid:userid,nature:nature}; 
		form.loading("操作中，请稍后......");
		nui.ajax({
	        url: "com.primeton.rdmgr.labor.returnToWork.expqueryEmpReturns.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		form.unmask();
	        	var filePath = o.downloadFile;
	        	var fileName = "复工日报";
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
	  });  
    }
    //HR确认
    var chooseRows = "";
    function surepre(){
    	var rows = grid.getSelecteds();
        //对于状态为"上报"的才允许直属主管确认
        if(rows.length > 0){
        	for(var i = 0; i < rows.length; i++){
        		if(rows[i].confirmstatus != "0"){
        			nui.alert("所选的记录中，包含复工确认状态为【" + nui.getDictText('AME_FGZTSTATUS', rows[i].confirmstatus) + "】的复工人员日报数据！不能进行确认操作！");
		            return;
        		}
        		/* if(rows[i].major != nowuserid){
        			nui.alert("所选的记录中，包含直属领导不是您的复工人员日报数据！不能进行确认操作！");
		            return;
        		} */
        	}
        	chooseRows = rows;
        	surePreSettle(chooseRows);
        }else{
            nui.alert("请选择未确认的报工记录进行确认，允许多条！");
        }
    }
    function surePreSettle(rows){
	    	nui.confirm("本次操作将选择的报工记录状态变更为“已确认”，是否确定操作？","复工确认信息提示",function(action){
                if(action=="ok"){
                    var json = nui.encode({"queryEmpReturns":rows});
                    grid.loading("正在确认上报的复工人员日报,请稍等...");
                    nui.ajax({
                        url:"com.primeton.rdmgr.labor.returnToWork.sureReturnwork.biz.ext",
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
                                nui.alert("共：" + (rows.length) + "条数据被,其中" + (returnJson.count) + "条直属领导确认成功，" + (rows.length - returnJson.count) + "条确认失败！", "系统提示",function(){
                                	grid.reload();
                                });
                            }
                        }
                    }); 
                }
            });
	}
	function getretrunStatus(e){
		return nui.getDictText('AME_FGZT',e.value);
	}
	function getCity(e){
		return nui.getDictText('AME_CITY',e.value);
	}
	function getconfirmStatus(e){
		return nui.getDictText('AME_FGZTSTATUS',e.value);
	}
	//回车触发事件
    function onKeyEnter(){
    	search();
    }
    function DateFormat(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
    }
</script>
</html>