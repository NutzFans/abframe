<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2020-03-31 14:11:04
  - Description:
-->
<head>
<title>合同收入记录详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body>
<div class="nui-fit">
	 	<form id="form1" method="post" >
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同收入记录详细信息</legend>
	            	<table style="table-layout:fixed;" id="table_file">
				            <tr>
								<td align="right">合同编号：</td>
								<td id="contnum" ></td>
								<td align="right" >收入确认次数：</td>
								<td id="reveno"   ></td>
								<td align="right" >当前确认状态：</td>
								<td id="status"  ></td>
							</tr>
							<tr>
								<td align="right" >收入类型：</td>
								<td id="revetype" ></td>
								<td align="right" >收入确认时点：</td>
								<td id="revetimedesc"></td>
								<td align="right" >收入确认证据：</td>
								<td id="reveproof" ></td>
							</tr>
							<tr>
								
								<td align="right" >实际确认产品额(含税)：</td>
								<td id="actproductsum" ></td>
								<td align="right" >实际确认服务额(含税)：</td>
								<td id="actservicesum" ></td>
								<td align="right" >实际确认MA额(含税)：</td>
								<td id="actmasum" ></td>
							</tr>
							<tr>
								<td align="right" >产品税率：</td>
								<td id="productRate"  /></td>
								<td align="right" >服务税率：</td>
								<td id="serviceRate"  /></td>
								<td align="right" >MA税率：</td>
								<td id="maRate"  /></td>
							</tr>
							<tr>
								
								<td align="right" >实际确认产品额(不含税)：</td>
								<td id="actproductsum2" ></td>
								<td align="right" >实际确认服务额(不含税)：</td>
								<td id="actservicesum2" ></td>
								<td align="right" >实际确认MA额(不含税)：</td>
								<td id="actmasum2" ></td>
							</tr>
							<tr>
								<td align="right" >实际确认金额(含税)：</td>
								<td id="actsum" ></td>
								<td align="right" >实际确认金额(不含税)：</td>
								<td id="actsum2" ></td>
								<td align="right" >新合同收入类型：</td>
								<td id="newtype"></td>
							</tr>
							<tr>
								<td align="right" >实际确认日期：</td>
								<td id="confirmday" ></td>
								<td align="right" >应收开始日期：</td>
								<td id="confirmdayStart"></td>
								<td align="right" >实际收入确认证据：</td>
								<td id="actreveproof" ></td>
							</tr>
							<tr>
								<td align="right" >本次结算开始年月：</td>
								<td id="setstart"></td>
								<td align="right" >本次结算结束年月：</td>
								<td id="setend"></td>
								<td align="right" >本次结算工作量：</td>
								<td id="labormonth"></td>
							</tr>
							<tr>
								<td align="right" >本次实际工作量：</td>
								<td id="labormonthact"></td>
								<td align="right" >上期实际工作量：</td>
								<td id="sqactgzl"></td>
								<td align="right" >上期确认工作量：</td>
								<td id="sqgzl"></td>
							</tr>
							<tr>
								<td align="right" >上期确认金额：</td>
								<td id="sqqrje"></td>
								<td align="right" >平均人月收入：</td>
								<td id="revery"></td>
								<td align="right" >偏差系数：</td>
								<td id="deviation"></td>
							</tr>
							<tr>
								<td align="right" >说明：</td>
								<td colspan="5"><input id="memo" class="nui-textarea" readonly="readonly" height="100px" style="width: 500px"/></td>
							</tr>
	            	</table>
	        <jsp:include page="/ame_common/detailFile.jsp"/>
	        </fieldset>
        </form>
</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
	    <script type="text/javascript">
			nui.parse();
	    	var form = new nui.Form("form1");
	    	var reveid= getUrlParam("id");
			setData(reveid);
			function getUrlParam(name) { 
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
				var r = window.location.search.substr(1).match(reg); 
				if (r != null) 
				return unescape(r[2]); 
				return null; 
			} 
			
	        function setData(reveid){ 
	        	var json = nui.encode({csReveForecastFin:{reveid:reveid}});
	        	nui.ajax({
		            url: "com.primeton.eos.ame_income.csReveForcastFin.getCsReveForecastFinDetail.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	//附件信息
		           		nui.get("grid_0").load({"groupid":"csReveForecastFin","relationid":o.csReveForecastFin.reveid});
						document.getElementById("contnum").innerHTML = o.csReveForecastFin.contnum == null ?"":o.csReveForecastFin.contnum;
						document.getElementById("reveno").innerHTML = o.csReveForecastFin.reveno == null ?"":o.csReveForecastFin.reveno;
						document.getElementById("revetype").innerHTML = nui.getDictText('AME_REVETYPE',o.csReveForecastFin.revetype);
						document.getElementById("revetimedesc").innerHTML = o.csReveForecastFin.revetimedesc == null ?"":o.csReveForecastFin.revetimedesc;
						document.getElementById("status").innerHTML = nui.getDictText('AME_REVESTATUS',o.csReveForecastFin.status);
						document.getElementById("actreveproof").innerHTML = nui.getDictText('MIS_INCOMECONV',o.csReveForecastFin.actreveproof);
						document.getElementById("actsum").innerHTML = o.csReveForecastFin.actsum == null ?"":o.csReveForecastFin.actsum;
						document.getElementById("actproductsum").innerHTML = o.csReveForecastFin.actproductsum == null ?"":o.csReveForecastFin.actproductsum;
						document.getElementById("actservicesum").innerHTML = o.csReveForecastFin.actservicesum == null ?"":o.csReveForecastFin.actservicesum;
						document.getElementById("actmasum").innerHTML = o.csReveForecastFin.actmasum == null ?"":o.csReveForecastFin.actmasum;
						document.getElementById("actsum2").innerHTML = o.csReveForecastFin.actsum2 == null ?"":o.csReveForecastFin.actsum2;
						document.getElementById("actproductsum2").innerHTML = o.csReveForecastFin.actproductsum2 == null ?"":o.csReveForecastFin.actproductsum2;
						document.getElementById("actservicesum2").innerHTML = o.csReveForecastFin.actservicesum2 == null ?"":o.csReveForecastFin.actservicesum2;
						document.getElementById("actmasum2").innerHTML = o.csReveForecastFin.actmasum2 == null ?"":o.csReveForecastFin.actmasum2;
						nui.get("memo").setValue(o.csReveForecastFin.memo == null ?"":o.csReveForecastFin.memo);
						document.getElementById("productRate").innerHTML = o.csReveForecastFin.productrate == null ?"":o.csReveForecastFin.productrate*100+"%";
						document.getElementById("serviceRate").innerHTML = o.csReveForecastFin.servicerate == null ?"":o.csReveForecastFin.servicerate*100+"%";
						document.getElementById("maRate").innerHTML = o.csReveForecastFin.marate == null ?"":o.csReveForecastFin.marate*100+"%";
						document.getElementById("newtype").innerHTML = nui.getDictText('AME_NEWTYPE',o.csReveForecastFin.newtype);
						
						document.getElementById("confirmday").innerHTML = o.csReveForecastFin.confirmday == null ?"":o.csReveForecastFin.confirmday;
						document.getElementById("confirmdayStart").innerHTML = o.csReveForecastFin.confirmdayStart == null ?"":o.csReveForecastFin.confirmdayStart;
						document.getElementById("sqqrje").innerHTML = o.csReveForecastFin.sqqrje == null ?"":o.csReveForecastFin.sqqrje;
						document.getElementById("sqactgzl").innerHTML = o.csReveForecastFin.sqactgzl == null ?"":o.csReveForecastFin.sqactgzl;
						document.getElementById("sqgzl").innerHTML = o.csReveForecastFin.sqgzl == null ?"":o.csReveForecastFin.sqgzl;
						document.getElementById("revery").innerHTML = o.csReveForecastFin.revery == null ?"":o.csReveForecastFin.revery;
						document.getElementById("deviation").innerHTML = o.csReveForecastFin.deviation == null ?"":o.csReveForecastFin.deviation;
						document.getElementById("setstart").innerHTML = o.csReveForecastFin.setstart == null ?"":o.csReveForecastFin.setstart;
						document.getElementById("setend").innerHTML = o.csReveForecastFin.setend == null ?"":o.csReveForecastFin.setend;
						document.getElementById("labormonth").innerHTML = o.csReveForecastFin.labormonth == null ?"":o.csReveForecastFin.labormonth;
						document.getElementById("labormonthact").innerHTML = o.csReveForecastFin.labormonthact == null ?"":o.csReveForecastFin.labormonthact;
						
		            }
		     });
		}		
	    
	   //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            act
        }
		
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	   </script>
</body>
</html>