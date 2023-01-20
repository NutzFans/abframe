<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-11-03 11:32:54
  - Description:
-->
<head>
<title>工时填报缺失查询</title>
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
	                       	工时填报缺失查询
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
					  	<input class="nui-datepicker" id="min" name="manage.startdate" style="width:100px"/>-<input class="nui-datepicker" id="max" name="manage.enddate" style="width:100px"/>
					</td>
				 	<td align="right" width="115px" nowrap="nowrap"><span>员工所属部门：</span></td>
				 	<td>
	            		<input class="nui-combobox" name="manage.org" id="dyassetnum1" textField="orgname" valueField="orgseq" dataField = "orgs" shownullItem="true" allowInput="true" style="width: 160px;" />
	            		<input class="nui-hidden" name="manage.org1"  id="dyassetnum2"/>
				    </td>
					<td align="right" width="95px"><span>员工姓名：</span></td>
	            	<td align="left">
					    <input name="manage.userid" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="userid" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:160px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext"/>
					</td>
	    		</tr>
	    		<tr>
				 	<td align="right" width="110px" nowrap="nowrap"><span>人员状态：</span></td>
				 	<td>
	            		<input class="nui-dictcombobox" name="manage.status" dictTypeId="ABF_EMPSTATUS" multiSelect="true" style="width: 100px;" allowInput="true" shownullItem="false"/>
				    </td>
	    			<td align="center" colspan="6">
	    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
	    			</td>
	    		</tr>
	    	</table>
	    </div>
	</div>
	
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:10%;">
                        <a class="nui-button" id="editBtn" iconCls="labor-sendwx" onclick="sendWXtoRemind()">微信催促</a>
                        <a class="nui-button" id="exportinfo" iconCls="icon-download" onclick="exportLabor()">导出</a>     
                    </td>
                </tr>
            </table>           
        </div>
    </div>
	
	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:354px;" allowResize="true" pageSize="20"  showSummaryRow="true" sortMode="client"
        url="com.primeton.rdmgr.labor.queryRdLaborDetail.queryLackRdLaborDetail.biz.ext" dataField="lacklabor" frozenStartColumn="0" frozenEndColumn="0" multiSelect="true"
    	<%--ondrawcell="ondrawCsGatherFcGridcell"--%> ondrawsummarycell="doCountSum">
        <div property="columns">
        	<div name="temp123" type="checkcolumn"></div>
        	<div field="yjbmname" width="100" headerAlign="center" align="center" allowSort="true">一级部门</div> 
        	<div field="ejbmname" width="100" headerAlign="center" align="center" allowSort="true">二级部门</div> 
        	<div field="orgname" width="100" headerAlign="center" align="center" allowSort="true">员工所属部门</div> 
            <div field="empname" width="100" headerAlign="center"  align="center" allowSort="true" renderer="onTitleRenderer">人员姓名</div>
        	<div field="startdate" width="100" headerAlign="center" align="center" 、 dateFormat="yyyy-MM-dd" allowSort="true">开始日期</div>
        	<div field="enddate" width="100" headerAlign="center" align="center"  dateFormat="yyyy-MM-dd" allowSort="true">结束日期</div>
            <div field="num" width="100" headerAlign="center" dataType="int" align="center" summaryType="sum" allowSort="true">缺失天数</div>
        	<div field="empstatus" width="100" headerAlign="center" align="center" renderer = "empstatusfin" allowSort="true">人员状态</div> 
        </div>
    </div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
    var form = new nui.Form("form1");
    //人员状态业务字典
	function empstatusfin(e){
		return nui.getDictText('ABF_EMPSTATUS',e.value);
	}
	
    init();//初始化
	var authorgs;//有权的机构，定义为全局变量，只查一遍
	var authorgids;//有权的机构，定义为全局变量，只查一遍
	function init(){
		//初始化财务年月日期区间
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
		
		//权限初始化开始
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
		%>
		var userid="<%=nowuserid %>";
		var username = "<%=nowusername %>";
    	
    	var name;
		var ids;
		
		name = "dyassetnum1";
		ids="dyassetnum2";
    	
    	var json = {"code":"GSTBQSCX","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
            async: false,
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						nui.get("userid").setValue(userid);
						nui.get("userid").setText(username);
						nui.get("userid").setReadOnly(true);
						nui.ajax({
				            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
				            type: "post",
				            data: '',
				            cache: false,
            				async: false,//异步加载，在页面生成之前加载权限控制
				            contentType: 'text/json',
				            success: function (text) {
					    		authorgs=text.orgs;
					    		authorgids = text.orgids;
					    		nui.get(name).setData(authorgs);
								nui.get(ids).setValue("");
				    		}
				    	});
				    	return;
					}
					authorgs=text.orgs;
		    		authorgids = text.orgids;
		    		var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
						nui.get(ids).setValue("");
					}else{
						nui.get(ids).setValue(authorgids);
					}
		    		nui.get(name).setData(authorgs);
					
				}else{
					nui.get("userid").setValue(userid);
					nui.get("userid").setText(username);
					nui.get("userid").setReadOnly(true);
					nui.ajax({
			            url: "com.bos.mp.common.SelectManage.queryAllOrg.biz.ext",
			            type: "post",
			            data: '',
			            cache: false,
            			async: false,
			            contentType: 'text/json',
			            success: function (text) {
				    		authorgids = text.orgids;
				    		nui.get(name).setData(authorgs);
							nui.get(ids).setValue("");
			    		}
			    	});
				}
			}
		});
		//权限初始化结束
		
    	var data1 = form.getData();
    	grid.load(data1);
	}
	
	//查询
	function search(){	
		var data = form.getData(); 
		if(data.manage.startdate == null || data.manage.startdate ==''){
			nui.alert("查询前请选择开始日期！");
			return;
		}
		if(data.manage.enddate == null || data.manage.enddate ==''){
			nui.alert("查询前请选择结束日期！");
			return;
		}
		grid.load(data); //datagrid加载数据
	}
	//重置
	function reset(){
		form.reset();
		init();
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
	
	//合计栏样式控制
	function doCountSum(e){
		if (e.field == "num") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//工时填报缺失微信催促
	function sendWXtoRemind(){
		var lacklabor=grid.getSelecteds();
		if(lacklabor.length<=0){
			nui.alert("请选中至少一条信息进行微信催促的操作！");
			return;
		}
		var json = {"lacklabor":lacklabor};
		if(confirm("本操作将针对缺失的工时对勾选的员工进行微信催促，请确认本操作。")){
			grid.loading("操作中，请稍后......");
			nui.ajax({
	            type:'get',
	            data:json,
	            cache: false,
	            contentType: 'text/json',
	            url:'com.primeton.rdmgr.labor.queryRdLaborDetail.sendWXtoRemindbyPMO.biz.ext',
	            success:function(result){
                 	grid.unmask ( );
	            	if(result.num<=0){
	            		nui.alert("操作失败，请确认勾选的员工已关注企业微信！");
	            	}else{
	            		nui.alert("操作成功，成功发送"+result.num+"条微信通知。");
	            	}
	            },
	            error:function(jqXHR, textStatus, errorThrown){
                 	grid.unmask ( );
	                nui.alert("error:" + jqXHR.responseText);
	            }
	        })
        }
	}
	
	//人员姓名链接
	function onTitleRenderer(e) {
		var startdate = ondealdate(e.record.startdate);
		var enddate = ondealdate(e.record.enddate);
		return "<a href='javascript:void(0)' onclick='doView(\""+e.record.userid+"\",\""+startdate+"\",\""+enddate+"\",\""+e.record.empname+"\");' title='点击查看'>" + e.value + "</a>";
	}
	function doView(userid,startdate,enddate,empname){
		var arr=enddate.split("/");
		sessionStorage.setItem("year_lack",arr[0]); 
        sessionStorage.setItem("month_lack",arr[1]);
        sessionStorage.setItem("userid_lack",userid);
        sessionStorage.setItem("empname_lack",empname);
        window.open("<%=request.getContextPath() %>/labor/queryRdLaborDetail/queryLackRdLaborDetaildata.jsp", empname+"工时查看", "height=617,width=634,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
	}
	//日期格式设置（2018/01/10）
	function ondealdate(e){
		if(e){
		  var now  = e;
		  var   year=now.getFullYear();     
          var   month=now.getMonth()+1;
          var   day=now.getDate();     
          var   hours=now.getHours();     
          var   minutes=now.getMinutes();     
          var   seconds=now.getSeconds();
          var curDateTime = year;
          if(month>9){
			curDateTime = curDateTime +"/" + month;
		  }else{
		  	curDateTime = curDateTime+"/" + "0" + month;
		  }
    	if(day>9){
			curDateTime = curDateTime+"/" + day;
		}else{
			curDateTime = curDateTime+"/" + "0" + day;
			}     
          return   curDateTime;     
		}
	}
	
	//导出
	function exportLabor(){
         var data = form.getData(); 
		if(data.manage.startdate == null || data.manage.startdate ==''){
			nui.alert("导出前请选择开始日期！")
			return;
		}
		if(data.manage.enddate == null || data.manage.enddate ==''){
			nui.alert("导出前请选择结束日期！")
			return;
		}
			nui.ajax({
                url: "com.primeton.rdmgr.labor.queryRdLaborDetail.exportLackLabor.biz.ext",
                type: "post",
                data: data,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		nui.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "LackLabor";
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
</body>
</html>