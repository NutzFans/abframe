<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-09-22 09:44:51
  - Description:
-->
<head>
<title>疑问工时查询</title>
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
	                       	疑问工时查询
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
					  	<input class="nui-datepicker" id="min" name="criteria._expr[0]._min" style="width:95px"/>-<input class="nui-datepicker" id="max" name="criteria._expr[0]._max" style="width:95px"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="laborDate"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
					    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
					</td>
					<td align="right" width="110px"><span>填报人：</span></td>
	            	<td align="left" >
	            		<input name="criteria._expr[1]._value" class="mini-textboxlist" <%--onbuttonclick="showEmployee" --%>id="userid" allowInput="true" textField="empname" valueField="userid" searchField="name" style="width:150px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/><%--
					    <input name="criteria._expr[1]._value" class="nui-buttonedit" onbuttonclick="showEmployee" id="userid" allowInput="false" style="width:150px;"/>--%>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="userId"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
					</td>
					<td align="right" width="110px"><span>受益部门：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[2]._value" style="width:150px" id="salesname"/>
				        <input class="nui-hidden" name="criteria._expr[2]._property" value="salesName"/>
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				    </td>
	    		</tr>
	    		<tr>
					<td align="right" width="110px" ><span>项目名称：</span></td>
					<td align="left">
					    <input name="criteria._expr[3]._value" class="nui-textbox"  style="width:150px;" />
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._rule" value="all"/>
					</td>
					
					<td align="right" width="110px"><span>项目编号：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[4]._value" style="width:180px;"/>
				        <input class="nui-hidden" name="criteria._expr[4]._property" value="projectno"/>
				        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[4]._rule" value="all"/>
				    </td>
				    <td align="right" width="110px"><span>受益人疑问信息：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[5]._value" style="width:150px" id="benefconfq"/>
				        <input class="nui-hidden" name="criteria._expr[5]._property" value="benefconfq"/>
				        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				        
				        <input class="nui-hidden" name="criteria._expr[6]._value" value="2"/>
				        <input class="nui-hidden" name="criteria._expr[6]._property" value="status"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
					    
					    <input class="nui-hidden" name="criteria._expr[7]._value" value=""/>
				        <input class="nui-hidden" name="criteria._expr[7]._property" value="orgid"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
					    
					    <input class="nui-hidden" name="criteria._expr[8]._value" value=""/>
				        <input class="nui-hidden" name="criteria._expr[8]._property" value="userId"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
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
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:10%;">
                        <a class="nui-button" id="editBtn" iconCls="labor-qedit" onclick="edit()">疑问工时编辑</a>
                        <a class="nui-button" id="confirm" iconCls="labor-qrecall" onclick="feedback()">受益疑问回复</a>    
                    </td>
                </tr>
            </table>           
        </div>
    </div>
	
	<div id="datagrid1"  class="nui-datagrid" style="width:100%;height:372px;" allowResize="true" pageSize="20"  showSummaryRow="true"
        url="com.primeton.rdmgr.labor.input.rdlabordetailbiz.queryRdLaborDetails.biz.ext" dataField="rdlabordetails"multiSelect="true"
    	ondrawsummarycell="doCountSum" allowCellWrap="true">
        <div property="columns">
	    	<div name="temp123" type="checkcolumn"></div>
            <div field="userName" width="50" headerAlign="center" allowSort="true" align="center">填报人</div>
        	<div field="laborDate" width="75" headerAlign="center" align="center" allowSort="true" renderer="onTitleRenderer">填报日期</div>     
            <div field="custjc" width="100" headerAlign="center" align="center">客户</div>
            <div field="projectName" width="130" headerAlign="center" allowSort="true" align="center">受益项目</div> 
            <div field="taskname" width="80" headerAlign="center" allowSort="true" align="center">项目活动</div>
            <div field="repContent" width="108" headerAlign="center" allowSort="true" align="left">工时内容</div> 
            <div field="actHours" width="56" headerAlign="center" summaryType="sum" allowSort="true" align="right">填报工时</div>
            <div field="salesName" width="100" headerAlign="center" allowSort="true" align="center">受益部门</div>
        	<div field="benefconftime" width="125" headerAlign="center"  allowSort="true" align="center" renderer = "ondealdate">确认时间</div> 
            <div field="benefconfq" width="108" headerAlign="center" allowSort="true" align="left">受益工时确认疑问</div> 
            <div field="benefconfr" width="108" headerAlign="center" allowSort="true" align="left">受益工时确认反馈</div>
        </div>
    </div>
    
    <div id="win1" class="nui-window" title="工时受益疑问反馈信息" style="width:400px;height:220px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
    	<div style="padding:5px;">
    		<input name="benefconfr" id="benefconfr" vtype="rangeLength:0,100" class="nui-textarea" required="true" onvaluechanged="changecomment" style="width:380px;height:140px;"/>
    	</div>
	    <div property="footbar" style="padding:5px;margin-left: 120px;">
	        <input type='button' value='确定' onclick="sureDate()" style="vertical-align: bottom;"/>
	        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
	    </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
    var form = new nui.Form("form1"); 
    
	//初始化数据
	init();
	function init(){
		var userid='';
		var orgid='';
		var isSYBAssistant = false;
    	var form = new nui.Form("#form1");
		var data1 = form.getData(); //获取表单JS对象数据	
		<%
			UserObject user = (UserObject)session.getAttribute("userObject");
    		String userid = user.getUserId();
    		String orgid = user.getUserOrgId();
    		//角色
    		Map attr = user.getAttributes();
    		DataObject[] roles = (DataObject[])attr.get("roles");
    		Boolean rolesroleids = false;	//是否是事业部助理
    		Boolean isPmo = false;	//是否是Pmo
    		for(int i=0;i < roles.length;i++){
    			if(roles[i].getString("roleid").equals("assistant") || 
					roles[i].getString("roleid").equals("HDJRZL") ){
					rolesroleids = true;
				}
				if(roles[i].getString("roleid").equals("PMO")){
					isPmo = true;
				}
    		}
		 %>
		 userid = "<%=userid %>";
		 orgid = "<%=orgid %>";
		 var rolesroleids = "<%=rolesroleids %>";
		 if(rolesroleids == "true"){
    		isSYBAssistant = true;//助理按照受益人管理权限 
    	}
    	
		var syblist='';
		var isPmo = <%=isPmo %>;
		if(isPmo == true){
		}else{
	    	if(isSYBAssistant == true){
	    		var data = {userid:userid};
		        var json = nui.encode(data);	
		        nui.ajax({
		            url: "com.primeton.rdmgr.labor.queryRdLaborDetail.getSYB.biz.ext",
		            type: "post",
		            data: json,
		            async: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	if(text.syb.length > 0){
		    				for(var i=0;i<text.syb.length;i++){
		    					if(i == 0){
		    						syblist = text.syb[i].orgid;
		    					}else{
		    						syblist = syblist+','+text.syb[i].orgid;
		    					}
		    				}
		    				nui.getbyName("criteria._expr[7]._value").setValue(syblist);
		            	}else {
		            		nui.getbyName("criteria._expr[8]._value").setValue(userid);
		            		data1.criteria._expr[8]._value=userid;
		            	}
		            }
	            });
	    	}else{
	    		nui.getbyName("criteria._expr[8]._value").setValue(userid);
	    		data1.criteria._expr[8]._value=userid;
	    	}
	    	//alert(nui.encode(data1));
	    	data1.criteria._expr[7]._value=syblist;
		}
    	grid.sortBy("benefconftime","desc");
	  	grid.load(data1); //datagrid加载数据
	}
	
	//查询
	function search() {	    		
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
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
	
	//项目查询按钮
	function selectProject(){
		var btnEdit = this;
	    nui.open({
	        url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
	                title: "选择项目名称",
	                width: 750,
	                height: 480,
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {
	                            btnEdit.setValue(data.projectId);
	                            btnEdit.setText(data.projectName);
	                        }
                    	}
	
                	}
            	});
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
    
    //受益疑问回复
    function feedback(){
    	var rdLaborDetails=grid.getSelecteds();
		if(rdLaborDetails.length<=0){
			nui.alert("请选择至少一条工时信息进行本次操作！");
			return;
		}
    	showAtPos();
    }
    function sureDate(){
    	var benefconfr = nui.get("benefconfr").getValue();
    	var rdLaborDetails=grid.getSelecteds();
    	if(benefconfr == '' || benefconfr == null){
			nui.alert("请填写工时受益疑问反馈信息！");
			return;
		}
		for(var i = 0;i < rdLaborDetails.length; i++){
			rdLaborDetails[i].benefconfr=benefconfr;
		}
		var json = {"updateEntities":rdLaborDetails,"style":"fk"};
		nui.ajax({
            type:'get',
            data:json,
            cache: false,
            contentType: 'text/json',
            url:'com.primeton.eos.ame_common.wx_worktime.changeLaborStatus.biz.ext',
            success:function(result){
                if(result.exception == null){
                	hideWindow();
                    nui.alert("操作成功！本次操作确认了"+rdLaborDetails.length+"条数据。","系统提示",function(){
                        grid.reload();
                    });
                }else{	
                	hideWindow();
                    nui.alert("操作失败！请联系信息技术部人员。")
                }
                
            },
            error:function(jqXHR, textStatus, errorThrown){
                nui.alert("error:" + jqXHR.responseText);
            }
        })
    }
    
    //编辑工时
	function edit(){
		var rdLaborDetail=grid.getSelecteds();
		if(rdLaborDetail.length>1 || rdLaborDetail.length<=0){
			nui.alert("请选中一条工时信息进行编辑操作！");
			return;
		}
		nui.open({
  			// 编辑界面  
            url: "<%=request.getContextPath() %>/labor/queryRdLaborDetail/editDoubtfulRdLaborDetail.jsp?laborDetailId="+rdLaborDetail[0].laborDetailId ,
            title: "疑问工时编辑 ",
            width: 1098,
            height: 480,
            onload: function () {
              var iframe = this.getIFrameEl();
              // <!--var data = {action: "edit", emplevelid: row.emplevelid };-->
              var data = {action: "edit", laborDetailId: rdLaborDetail[0].laborDetailId };
              //iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action == "ok"){
		            grid.reload();
            	}
       	 	}
		});
        
	}
	
	//汇总行格式设置
	function doCountSum(e){
		if (e.field == "actHours") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
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
		if(hours>9){
			curDateTime = curDateTime+"   " + hours;
		}else{
			curDateTime = curDateTime+"   " + "0" + hours;
			}
		if(minutes>9){
			curDateTime = curDateTime+":" + minutes;
		}else{
			curDateTime = curDateTime+":" + "0" + minutes;
			}
		if(seconds>9){
			curDateTime = curDateTime+":" + seconds;
		}else{
			curDateTime = curDateTime+":" + "0" + seconds;
			}     
          return   curDateTime;     
		}
	}
	
</script>
</html>