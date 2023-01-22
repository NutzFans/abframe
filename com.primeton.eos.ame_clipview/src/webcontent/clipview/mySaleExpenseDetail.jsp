<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): 占婷婷
  - Date: 2018-08-28 14:59:37
  - Description:
-->
<head>
<title>我的销售费用额度明细</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>

<div style="width:100%;height:100%;padding:0px;margin:0px;" >
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                       	我的销售费用额度明细
                    </td>
                </tr>
             </table>           
        </div>
    </div>
	<div id="detail">
	 <form id="form1" method="post" >
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;" id="choseorg">
				<tr>
					<td align="right"><span>年份：</span></td>
	            	<td align="left">
					    <input name="year" class="nui-textbox" id="years" style="width:160px;" required="false"/>
					</td> 
					<td align="right"  id="sale_orgname" style="display:none">销售部门:</td>
					<td align="left">
				     <input class="nui-dictcombobox" name="orgid"  textField="orgname" valueField="orgid" style="display:none" id="sale_orgid" required="false"/>
					</td>				
				</tr>
				<tr>
	    			<td align="center" colspan="15">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                   </td>
                </tr>
            </table>           
        </div>
      </form > 
    </div>
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:190px;" dataField="saledetail" showPager="false"
	    url="com.primeton.eos.ame_newlook.newlook.saledetail.biz.ext" frozenStartColumn="0" frozenEndColumn="0">
	          <div property="columns">
		        <div header="销售费用额度明细" headerAlign="center" width="200" field="type">我的销售额度类型</div>
		        <!-- <div header="合计" headerAlign="center" align="right" width="100"  field="total" id="total" renderer="onDrawCell2"></div> -->              
		        <div header="1月" headerAlign="center" align="right" width="100"  field="cost1" id="month" renderer="onDrawCell1"></div> 
		        <div header="2月" headerAlign="center" align="right" width="100"  field="cost2" id="month"  renderer="onDrawCell1" ></div> 
		        <div header="3月" headerAlign="center" align="right" width="100"  field="cost3" id="month"  renderer="onDrawCell1"></div>	            
		        <div header="4月" headerAlign="center" align="right" width="100"  field="cost4" id="month"  renderer="onDrawCell1"></div>
		        <div header="5月" headerAlign="center" align="right" width="100"  field="cost5" id="month"  renderer="onDrawCell1"></div>
		        <div header="6月" headerAlign="center" align="right" width="100"  field="cost6" id="month"  renderer="onDrawCell1"></div>
		        <div header="7月" headerAlign="center" align="right" width="100"  field="cost7" id="month"  renderer="onDrawCell1"></div>   
		        <div header="8月" headerAlign="center" align="right" width="100"  field="cost8" id="month"  renderer="onDrawCell1"></div>  
		        <div header="9月" headerAlign="center" align="right" width="100"  field="cost9" id="month"  renderer="onDrawCell1"></div>     
		        <div header="10月" headerAlign="center"align="right" width="100"  field="cost10"id="month"  renderer="onDrawCell1"></div>     
		        <div header="11月" headerAlign="center" align="right" width="100"  field="cost11" id="month" renderer="onDrawCell1"></div>     
		        <div header="12月" headerAlign="center" align="right" width="100"  field="cost12" id="month" renderer="onDrawCell1"></div>
		      </div>
		</div>
				<p>&nbsp;注:&nbsp①本月可使用销售额度&nbsp;=&nbsp;本月销售费用额度&nbsp;+&nbsp;上月剩余额度&nbsp;+&nbsp;特批额度。</p>
		        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;②本月可报销剩余额度&nbsp;=&nbsp;本月可使用销售额度&nbsp;-&nbsp;已出款销售费用额度。</p>
		        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;③流程中报销：指已填报销单但未出款。</p>
		        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;④当年的额度当年内有效，本月额度可累积到下个月，本年剩余额度不累计到下一年。</p>
	 </div>    
</body>
<script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid1");
    var date = new Date();
	var year = date.getFullYear();
	nui.get("years").setValue(year);//默认系统当前年份
	var orgid = <%=request.getParameter("orgid")%>;
	//进入时默认加载所属销售部门以防一个人在多个销售部门
	loadorg();
	function loadorg(){
		nui.ajax({ 
    	  	url: "com.primeton.eos.ame_newlook.newlook.checkOrg.biz.ext", 
    	  	type: "post", 
    	  	success:function(data){
		    	var SaleOrg = data.SaleOrg;
		      	nui.get("sale_orgid").setData(SaleOrg);
		      	if(SaleOrg.length > 1){  //当销售属于多个部门时显示销售部门
	            	document.getElementById("sale_orgid").style.display="";
	            	document.getElementById("sale_orgname").style.display="";
	           	}
	           	if(orgid){
		           	nui.get("sale_orgid").setValue(orgid);
	           	}else{
	           		nui.get("sale_orgid").setValue(SaleOrg[0].orgid);
	           	}
	           	search();
			}
	 	});
	}
	
	function search(){//数据初始化
		
		var form = new nui.Form("form1");
		var data = form.getData();
		if(!data.year){
			nui.alert("请先填写年份！");
			return;
		}
		if(!data.orgid){
			nui.alert("请选择一个销售部门！");
			return;
		}
	 	grid.load(data);
	}
	
	/* //汇总行
	function onDrawCell2(e){
		if(e.field == "total"){
			if(e.value == 0 || e.value==null){
		   		return 0;
		    }else{
		     return toThousands(e.value);
		     }
		}
	} */
	
	//查看已出款销售费用额度明细
	function onDrawCell1(e){
    	if(e.record.type == "已出款销售费用额度(E)"){
			if(e.value == 0 || e.value==null){
				return 0;
			}else{
			    if(e.value){
	        		var month;
	        		if(e.field == "cost1"){
	        			month = "1";
	        		}
	        		if(e.field == "cost2"){
	        			month = "2";
	        		}
	        		if(e.field == "cost3"){
	        			month = "3";
	        		}
	        		if(e.field == "cost4"){
	        			month = "4";
	        		}
	        		if(e.field == "cost5"){
	        			month = "5";
	        		}
	        		if(e.field == "cost6"){
	        			month = "6";
	        		}
	        		if(e.field == "cost7"){
	        			month = "7";
	        		}
	        		if(e.field == "cost8"){
	        			month = "8";
	        		}
	        		if(e.field == "cost9"){
	        			month = "9";
	        		}
	        		if(e.field == "cost10"){
	        			month = "10";
	        		}
	        		if(e.field == "cost11"){
	        			month = "11";
	        		}
	        		if(e.field == "cost12"){
	        			month = "12";
	        		}
        		    return "<a href='javascript:void(0)' onclick='getSaleDetail("+month+");' title='点击查看'>" +toThousands(e.cellHtml) + "</a>";
        	    }
			 }
		}else{
			if(e.value == 0 || e.value==null){
				return 0;
			}else{
				return toThousands(e.value);
			}
		}
	}
	
	//查看已出款相关报销单
	function  getSaleDetail(month){
	    var form = new nui.Form("form1");
		var data = form.getData();
		var year = data.year;
		var orgid = data.orgid;
		var executeUrl = "<%=request.getContextPath() %>/ame_fee/salesQuota/SaleQuotaDetail.jsp?id="+orgid+"&year="+year+"&month="+month+"&type=yck";
		window.open(executeUrl, "已出款报销单", "fullscreen=1");
	}
	
	//格式化为千分位形式
	function toThousands(num) {
		var num = (num || 0).toString(), result = '';
		if(num){
			if(num != 0){
				var s = num.substring(0,1);
				if(s=="-"){
					var num3 = num.split("-");
					var num4 = num3[1];
					var num2 = num4.split(".");
					num = num2[0];
					while (num.length > 3) {
						result = ',' + num.slice(-3) + result;
						num = num.slice(0, num.length - 3);
					}
					if (num) { 
						if(num2[1]){
							result = "-"+num + result + "." + num2[1]; 
						}else{
							result = "-"+num + result; 
						}
					}
				}else{
					var num2 = num.split(".");
					num = num2[0];
					while (num.length > 3) {
						result = ',' + num.slice(-3) + result;
						num = num.slice(0, num.length - 3);
					}
					if (num) { 
						if(num2[1]){
							result = num + result + "." + num2[1]; 
						}else{
							result = num + result; 
						}
					}
				}
			}else{
				result = 0;
			}
		}else{
			result = 0;
		}
		return result;
	}
		</script>
	</body>
</html>