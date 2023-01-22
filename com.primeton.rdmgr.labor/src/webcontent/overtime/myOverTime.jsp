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
	<title>我的加班工时</title>
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
	                       	我的加班工时
	                    </td>
	                </tr>
                 </table>           
	        </div>
	        
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right" width="105px"><span>财务年月：</span></td>
						<td>
							<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:100px" onvaluechanged="watchfinYM"/>
						</td>
						<td align="right" width="120px"><span>工时日期：</span></td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-datepicker" id="min1" name="criteria._expr[0]._min" style="width:100px"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[0]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="laborDate"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[0]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right" width="100px"><span>调休状态：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[1]._value" dictTypeId="AME_LABOR_ISDAYSOFF" multiSelect="true" style="width: 100px;"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="isbreakoff"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._value" id="userid"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="userId"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
					    </td>
					</tr>
			    </table>
			    <table style="width:100%;">
			    	<tr>
					    <td align="center">
	                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
	                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>	
	               		</td>
					</tr>
		      	</table>
			</div>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" id="changeBtn" iconCls="labor-change" onclick="changeBtn()">调休变更</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
			<div id="datagrid1" dataField="overTimeList" class="nui-datagrid" style="width:100%;height:400px;" 
		    	url="com.primeton.rdmgr.labor.queryOverTime.queryOverTime.biz.ext" idField="id" allowResize="true" allowCellWrap="true"
		    	sizeList="[10,20,30,50,100]" pageSize="20" allowAlternating="true" showSummaryRow="true" ondrawsummarycell="doCountSum" multiSelect="false" ondrawcell="ondrawCsGatherFcGridcell">
			    <div property="columns">
			    	<div type="checkcolumn" width="20"></div>
			    	<div field="laborDate" width="75" headerAlign="center" align="center" allowSort="true" renderer="onTitleRenderer">加班日期</div>
			    	<div field="workday" width="75" headerAlign="center" align="center" allowSort="true">星期</div>
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
			    </div>
			</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
	%>
	//数据初始化
	search();
	//查询
	function search(){
		nui.get("userid").setValue('<%=nowuserid %>');//默认当前登陆人
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
	
	//调休变更
	function changeBtn(){
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条工时!");
			return;
		}else if(selectRow.isworkday=='是'){
			nui.alert("只能变更非工作日的调休状态，请重新选择");
			return;
		}else{
			//通过档期日期获取当前的财务年月
			var date = new Date();
			var year = date.getFullYear();
	  		var month = date.getMonth()+1;
	  		var currentStar = "";
	  		var currentEnd = "";
	  		var state = "";
	  		var state2 = "";
	  		var json = ({"criteria":{"_entity":"com.primeton.eos.common.newdataset.MisFinperiod",
									 "_expr[0]":{"_property":"finyear","_op":"=","_value":year},
									 "_expr[1]":{"_property":"finmonth","_op":"=","_value":month}
									}});
			nui.ajax({
		        type:'get',
		        data:json,
		        async :false,
		        contentType: 'text/json',
		        url:'com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz.ext',
		        success:function(result){
		            if(result.misfinperiods.length>0){
		            	currentStar = result.misfinperiods[0].startdate;
		            	currentEnd = result.misfinperiods[0].enddate;
		            }
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            nui.alert("error:" + jqXHR.responseText);
		        }
		    })
		    //将财务年月还有工时日期转化为时间戳，判断工时日期是否在财务年月之间
		    var laborDate = new Date(Date.parse(selectRow.laborDate)).getTime();
		    var currentStars = new Date(Date.parse(currentStar)).getTime();
		    var currentEnds = new Date(Date.parse(currentEnd)).getTime();
		    if(laborDate<currentStars||laborDate>currentEnds){
		    	nui.alert("只能变更当前财务年月的调休状态。（"+currentStar+"~"+currentEnd+"）");
		    	return;
		    }
	    }
	    
	    if(selectRow.breakoffHours!=null && selectRow.breakoffHours!="" && selectRow.breakoffHours!=0){
	    	nui.alert("该加班工时已调休过，不能变更调休状态！");
	    	return;
	    }
	    
	    //存储当前状态
	    if(selectRow.isbreakoff==1){
	    	state = "预留调休";
	    	state2 = "不调休";
	    }else{
	    	state2 = "预留调休";
	    	state = "不调休";
	    }
	    if(!confirm("是否把工时调休状态从 “ "+state+" ” 变更为  “ "+state2+" ” ？")) {
            return false;
        }
	    //设置调休状态字符串
		var isdaysoff = selectRow.isbreakoff;
		var json = "";
		if(isdaysoff=="1"){
			json = {"laborDetailId":selectRow.laborDetailId,"isDaysOff":'0',"overtimeid":selectRow.overtimeid};
		}else if(isdaysoff=="0"){
			json = {"laborDetailId":selectRow.laborDetailId,"isDaysOff":'1',"overtimeid":selectRow.overtimeid};
		}
		nui.ajax({
			url: "com.primeton.rdmgr.labor.queryOverTime.updateOverTime.biz.ext",
			type: 'POST',
			data:json,	
			contentType: 'text/json',
            success: function (result) {
            	if(result.reCode==1){
            		nui.alert("调休状态变更成功。","系统提示",function(){
                        search();
                    });
            	}else{
            		nui.alert("调休状态变更失败！请联系信息技术部。");
            	}
            }
		})
	}
	
	//重置表单
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		search();
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
            e.cellHtml = "<div align='center'>" + e.cellHtml + "<b>(h)</b></div>";
        }
        if (e.field == "otwHours") {
            e.cellHtml = "<div align='center'>" + e.cellHtml + "<b>(h)</b></div>";
        }
	}
	
	// 返回 类似 xxxx-xx-xx 格式的字符串
	function formatDate(year,month,day){
		var y = year;
		var m = month;
		var d = day;
		if(m<10){
			m = "0" + m;
		} 
		if(d<10) {
			d = "0" + d;
		}
		return y+"-"+m+"-"+d
	}
	
	
	//点击日期查看
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
</script>
</html>