<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<!-- 
  - Author(s): 占婷婷
  - Date: 2018-08-28 10:24:48
  - Description:
-->
<head>
<title>我的销售费用额度</title>
<style type="text/css">
	.saleN{
		display: inline-block;
	}
	#mysale tbody tr{margin: 5px auto;}
	<%--.saleN select{border: none!important;}--%>
</style>

</head>
<html lang="en" class="no-js">
<body>
<table class="table table-striped table-bordered table-hover" id="mysale"  >
	 <thead>
		<tr>
			<th style="text-align: center;" >
				<select id="saleorg" onchange="changeValue(this)"  class="saleN"></select>
				销售费用额度明细
			</th>
			<th style="text-align: center;" data-width='90px'>额度</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td> 本月可报销剩余额度</td>
			<td align="right" id="bykbx"></td>
		</tr>
		<tr>
			<td> 流程中报销（预估）</td>
			<td align="right" id="lczbx"></td>
		</tr>
		<tr>
			<td>除流程中可报销剩余额度</td>
			<td align="right" id="clczbx"></td>
		</tr>
		<tr>
			<td>当年已出款销售费用合计</td>
			<td align="right" id="dnyck"></td>
		</tr>
		<tr>
			<td>当年可报销剩余额度</td>
			<td align="right" id="dnkbx"></td>
		</tr>
	</tbody>
</table>
</body>
<script type="text/javascript">
	<%
	   UserObject user = (UserObject) session.getAttribute("userObject");
   	   Map<String,Object> a = user.getAttributes();
   	   String empid = (String) a.get("empid");
	 %>
	var empid = <%=empid %>;
	//加载我的销售费用额度
	function loadMySaleExpense(){
      	//先加载销售部门
      	nui.ajax({ 
    	  	url: "com.primeton.eos.ame_newlook.newlook.getSaleOrg.biz.ext", 
    	  	type: "post", 
    	  	data: {"empid":empid} , 
    	  	success:function(data){
    	  		if(data.orgs.length == 0){
    	  			return false;
    	  		}
    	  		if(data.orgs.length==1){
	  				for (var i = 0; i < data.orgs.length; i++) { 
    	  				 $('#saleorg').append("<option value=" + data.orgs[i].omOrganization.orgid + ">" + data.orgs[i].omOrganization.orgname + "</option>");
    	  			 }
    	  			 $('#saleorg').selectpicker();
    	  			 $('#saleorg').selectpicker('val', data.orgs);  
           			 $('#saleorg').selectpicker('refresh'); 
    	  			 $('.saleN').hide();
    	  		}else{
    	  			for (var i = 0; i < data.orgs.length; i++) { 
    	  				$('#saleorg').append("<option value=" + data.orgs[i].omOrganization.orgid + ">" + data.orgs[i].omOrganization.orgname + "</option>");
    	  			}
    	  			 $('#saleorg').selectpicker({"width":"70px","height":"20px"});
    	  			 $('#saleorg').selectpicker('val', data.orgs);  
           			 $('#saleorg').selectpicker('refresh');
    	  		}
    	  		loadData(data.orgs[0].omOrganization.orgid)
			},error:function(data){
			    alert("刷新数据失败！");
			    return false;
			}
      	})
	}
	
	//加载数据
	function loadData(orgid){
		//遮罩
 	    var el = $('#mysale').parents(".panel");
        el.block({
                overlayCSS: {
                    backgroundColor: '#fff'
                },
                message: '<img src="assets/images/loading.gif" /> Just a moment...',
                css: {
                    border: 'none',
                    color: '#333',
                    background: 'none'
                }
         }); 
		var today=new Date().format("yyyy-MM-dd 00:00:00:000"); //获取当前时间
		var today=new Date();
		var thisYear = today.getFullYear();
		var thisMonth = today.getMonth()+1;
    	var json = nui.encode({"thisYear":thisYear,"thisMonth":thisMonth,"today":today,"orgid":orgid});
	  	nui.ajax({ 
    	  	url: "com.primeton.eos.ame_newlook.newlook.reiQuotaProcess.biz.ext", 
    	  	type: "post", 
    	  	data: json , 
    	  	success:function(data){
			     var datalist = data.salelist;
			     if(datalist.length!=0){
			     	$("#bykbx").html(remSale(toThousands(datalist[0].num)));
			     	$("#lczbx").html(proSale(toThousands(datalist[0].num2)));
			     	$("#clczbx").text(toThousands(datalist[0].num1));
			     	$("#dnyck").text(toThousands(datalist[0].costs));
			     	$("#dnkbx").text(toThousands(datalist[0].restquota));
			     }else{
			     	$("#bykbx").text(0);
			     	$("#lczbx").text(0);
			     	$("#clczbx").text(0);
			     	$("#dnyck").text(0);
			     	$("#dnkbx").text(0);
			     }
			     el.unblock();
			 },error:function(data){
				    alert("刷新数据失败！");
				}
	 	 })
	}
	//查看销售费用额度明细
	function remSale(e) {
		if(e!="0"){
			var s = '<a class="dgBtn" href="javascript: remQuota()">' + e + '</a> ';
            return s;
		}else{
			return e;
		}
	}
	function remQuota(){
		var orgid = $('#saleorg').selectpicker('val');
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open("<%=request.getContextPath() %>/ame/clipview/mySaleExpenseDetail.jsp?orgid="+orgid,"","height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
	}         
	//查看流程中受益给我的报销单    
	function proSale(e) {
		if(e!="0"){
			var s = '<a class="dgBtn" href="javascript: proQuota()">' + e + '</a> ';
            return s;
		}else{
			return e;
		}
	}
	function proQuota(orgid){
		var orgid = $('#saleorg').selectpicker('val');
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=400; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open("<%=request.getContextPath() %>/ame_fee/salesQuota/SaleQuotaDetail.jsp?id="+orgid+"&type=lcz","","height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
	}
	
	Date.prototype.format = function(fmt) { //当前时间格式化
		 var o = { 
		        "M+" : this.getMonth()+1,                 //月份 
		        "d+" : this.getDate(),                    //日 
		  }; 
	     if(/(y+)/.test(fmt)) {
	            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	     }
	     for(var k in o) {
	        if(new RegExp("("+ k +")").test(fmt)){
	             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	         }
	     }
	    return fmt; 
	}
	
	//销售值改变
	function changeValue(obj){
		loadData(obj.value);
	}
	
	//金额千分位
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
</html>