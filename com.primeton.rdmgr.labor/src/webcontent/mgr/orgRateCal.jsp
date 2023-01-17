<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): lixq
  - Date: 2016-08-15 14:33:56
  - Description:
-->
<head>
<title>工时率计算</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:50%;padding:0px;margin:0px;">
		<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	部门月度工时率计算
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				
				<table style="width:90%;" >
					<tr align="center">
					
						<td align="right"><span>设置年月：</span></td>
		            	<td align="left">
		            		<input class="nui-monthpicker" required="true"  id="year_month" style="width: 150px;">
						</td>
						<td align="right"><span>部门：</span></td>
						<td align="left">
							<input class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" id="org" style="width:222px;"/>
					        <input class="nui-hidden" id="orgids"/>
						</td>
						<td align="right" ><span>类型：</span></td>
						<td align="left">
							<input class="nui-combobox" id="type" data="typeData" valueField="id" textField="text"  multiSelect="true" showNullItem="false" style="width: 150px;" required="true"/>
						</td>
					</tr>
	                <td align="center" colspan="15">
		    			<!-- 选择月份后直接点计算按钮计算-->
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查  询</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重  置</a>	
                       </td>
	            </table>           
	        </div>
	    </div>

   
    <div id="datagrid2" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" pageSize="20" sizeList="[20,50,100,500]" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
        url="com.primeton.rdmgr.labor.labormgr.querryOrgRate.biz.ext" dataField="LaborRate">
        <div property="columns">
            <div field="labordate" width="15" headerAlign="center" align="center" allowSort="false" dateFormat="yyyy-MM">年份-月份</div>  
            <div field="org" width="30" headerAlign="center" align="center" allowSort="true" >一级部门</div>   
            <div field="orgname" width="30" headerAlign="center" align="center" allowSort="true" renderer="getDetail">部门</div>
<!--        <div field="pernum" width="15" headerAlign="center" align="center" allowSort="true">总人员数</div> -->
            <div field="inputnum" width="15" headerAlign="center" align="right" allowSort="true" summaryType="sum">有效人员数</div>
            <div field="peract" width="20" headerAlign="center" align="right" allowSort="true" summaryType="sum">总项目工时(h)</div>
            <div field="perworkday" width="20" headerAlign="center" align="right" dataType="float" decimalPlaces="2" allowSort="true" visible="false">本月人天数(天)</div>
            <div field="stdworkday" width="20" headerAlign="center" align="right"  allowSort="true" visible="false">标准总天数(天)</div>
            <div field="stdworkhour" width="20" headerAlign="center" align="right"  allowSort="true" summaryType="sum">标准工时(h)</div>
            <div field="orgradio" id="rate" width="20" headerAlign="center" align="right" allowSort="true" dataType="String" renderer="getper">部门月度工时率</div>
            <div field="otwhours" width="25" headerAlign="center" align="right" dataType="float" decimalPlaces="2" allowSort="true" summaryType="sum">其中总加班工时(h)</div> 
			<div field="avgotwhours" width="25" headerAlign="center" align="right" dataType="float" decimalPlaces="2" allowSort="true">人均加班工时(h)</div>
        </div>
    </div>
    </div>
    <script type="text/javascript">
    	nui.parse();
    	
    	var grid2 = nui.get("datagrid2");
 		var form = new nui.Form("form1");
 		var startdate = '';
 		var enddate = '';
 		var typeData=[];
 		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String userorgid=user.getUserOrgId();
    		String userorgname=user.getUserOrgName();
    		
		%>
 		init();
    	function init(){
    		var data = {};
			var json = {"code":"gsl","map":{"property":"status","op":"=","value":"running"}};
			nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
	            async: false,
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("org").setValue('<%=userorgid %>');
							nui.get("org").setText('<%=userorgname %>');
							nui.get("org").setReadOnly(true);
						}
						nui.get("org").setData(text.orgs);
						nui.get("orgids").setValue(text.orgids);
					}else{
						// 没有有权的机构时只能查项目负责人为自己的数据
							nui.get("org").setValue('<%=userorgid %>');
							nui.get("org").setText('<%=userorgname %>');
							nui.get("org").setReadOnly(true);
					}
				}
			});
		 	typeData=[{id: '3',text: '服务'},{id: '4',text: '研发'}];
		 	nui.get("type").setData(typeData);
		 	nui.get("type").setValue("3,4");
		 	var myDate = new Date();
			var year = myDate.getFullYear();
			var month = myDate.getMonth()+1;
			var curDateTime = year+'-';
	    	if(month>9){
				curDateTime = curDateTime + "" + month;
			}else{
				curDateTime = curDateTime + "0" + month;
			}
			nui.get("year_month").setValue(curDateTime);
			search();
		}
    	function search(){

			var year_month = nui.get("year_month").getValue();
			var year = year_month.getFullYear();
			var month = year_month.getMonth() +　1;
			var type = nui.get("type").getValue();
			var orgids = nui.get("orgids").getValue();

    		if(year_month == null || year_month ==''){
    			alert("请设置查询年月! "); 
    			return;
    		}else if(type == null || type == ''){
    			alert("类型不能为空！")
    			return;
    		}else{
	    		month = month < 10 ? '0' + month : month ;
	    		startdate = year+'-'+month+'-01 00:00:00';
	    		var dt = new Date();
	    		dt.setFullYear(year,month,1);
	    		dt.setDate(0); 
			    dt.setMonth(dt.getMonth());
			    var myyear = dt.getYear();
			    if(myyear < 1900) myyear = myyear + 1900;
			    var mymonth = dt.getMonth() + 1;
			    var myday = dt.getDate();
			    enddate = myyear + "-" + mymonth + "-" + myday + " 23:59:59";
	    		var date = {sdate:startdate,edate:enddate,org: nui.get("org").getValue(),type:nui.get("type").getValue(),orgids:orgids};
			  	grid2.load(date,function(o){
			  		if(o.total==0){
			  			alert("该月无工时填写记录!");
			  			return;
			  		}
			  	});
			  	grid2.sortBy("orgradio","desc");
			}
    	}
    	function reset(){
			var form = new nui.Form("#form1");
			form.reset();
		}
    	
  		function getper(e){
  			var rate = (e.value*100).toFixed(2)+"%";
  			return rate;
  		}
  		function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='部门人员工时率'>" + e.value + "</a>";
	    }
  		function contDeal(e){
	        return nui.getDictText('CONT_ORG',e.value);
	    }
	     function checkDetail(){
	 		var selectRow = grid2.getSelected();
            var orgname = selectRow.orgname;
            orgname=orgname.replace("&","%26");
			var executeUrl = "<%=request.getContextPath()%>/labor/mgr/RdLaborRateCal.jsp?orgname=" + orgname +"&startdate=" + startdate + "&enddate="+enddate;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(executeUrl, "部门人员月度工时率", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
	    }
	    
	    var aaa= "";
	    var bbb= "";
	    function doCountNowPage(e){
	    	 if (e.field == "inputnum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
             }
             if (e.field == "peract") {
                 e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
                 aaa=e.value;
             }
             if (e.field == "stdworkhour") {
                 e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
                 bbb= e.value;
             }
             if (e.field == "otwhours") {
                 e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
             }
             if(e.field=="orgradio"){
             	e.cellHtml = "<div align='right'><b>" + parseFloat(aaa/bbb*100).toFixed(2)+"%" + "</b></div>";
             }
	    }
    
    </script>
</body>
</html>