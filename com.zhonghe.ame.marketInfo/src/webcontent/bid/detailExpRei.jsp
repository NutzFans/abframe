<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-05-22 10:10:10
  - Description:
-->
<head>
<title>报销明细查询</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:;
	    }
    </style>
</head>
<body>

<div class="nui-fix">
	<div class="nui-panel" title="报销明细查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">	  	        
			        <tr>			          
			          <td class="form_label" align = "right">受益部门:</td>
			          <td colspan="1">				          					        
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="beneforgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="=" id="tempcond1"/>
					        <input class="nui-hidden" name="criteria._expr[1]._ref" value="" id="tempcond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>					        
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input id="orgid2"  name="criteria._ref[0]._expr[0]._value"  style="width:150px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"  onvaluechanged="changeOrg"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />	
					        
                            <input class="nui-hidden" name="criteria._expr[10]._property" value="beneforgid"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[10]._value" id="orgids2" />					        					        
			          </td>
			          <td class="form_label" align = "right">报销记录编号:</td>
			          <td colspan="1">
				    	<input class="nui-hidden" name="criteria._expr[0]._property" value="reiid" id="reiid"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="=" />
				        <input class="nui-textbox" name="criteria._expr[0]._value" style="width:120px"/>
			          </td>						          
			          <td class="form_label" align = "right">报销人:</td>
			          <td colspan="1">
				    	<input class="nui-hidden" name="criteria._expr[2]._property" value="expuserid" />
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="in" />
				        <input  id="empname" class="mini-textboxlist"  name="criteria._expr[2]._value" searchField="name"
			url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext" value="" text=""
			textField="EMPNAME" valueField="USERID" required="true" width="120px"/>
				        
				        <input class="nui-hidden" name="criteria._expr[11]._property" value="expuserid" />
				        <input class="nui-hidden" name="criteria._expr[11]._value" id="expuserid"/>
			          </td>
			          <td class="form_label" align = "right">报销日期:</td>
			          <td colspan="1">
			           	<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px" />-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px" />
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="tbdate"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
			          </td>			          	          			          
			      </tr>		      			     
			       <tr>
			         <td class="form_label" align = "right">受益项目:</td>
				      <td colspan="1">				            
					      <input class="nui-hidden" name="criteria._expr[4]._property" value="projectName" />
                          <input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
                          <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all" />
                          <input class="nui-textbox" name="criteria._expr[4]._value" style="width:150px"/>				      
				      </td>  
			          <td class="form_label" align = "right">报销类型:</td>
			          <td colspan="1">
			              <input class="nui-hidden" name="criteria._expr[5]._property" value="exptype"/>
					      <input class="nui-hidden" name="criteria._expr[5]._op" value="in" />
			              <input name="criteria._expr[5]._value" id="exptype"  class="nui-combobox"  allowInput="true"
									style="width: 120px;" textField="feetypename" valueField="feetypecode" pinyinField="feeseq" 
									dataField="expfees"  multiSelect="true" shownullitem="true"/>					  
			          </td>
			           <td class="form_label" align = "right">受益客户:</td>
			          <td colspan="1">			          			          						        
					      <input class="nui-hidden" name="criteria._expr[7]._property" value="custname" />
                          <input class="nui-hidden" name="criteria._expr[7]._op" value="like" />
                          <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all" />
                          <input class="nui-textbox" name="criteria._expr[7]._value" style="width:120px"/>		          			         				        
				        </td>	
			          <td class="form_label" align = "right">审核日期:</td>
			          <td colspan="1">
			           	  <input class="nui-datepicker" name="criteria._expr[6]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[6]._max" style="width:100px"/>
					      <input class="nui-hidden" name="criteria._expr[6]._property" value="checkdate"/>
					      <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
					      <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd"/>
			          </td> 			              
			      </tr>			      
			      <tr>
			          <td class="form_label" align = "right">费用类型:</td>
                       <td colspan="1">                                                   
                           <input class="nui-hidden" name="criteria._expr[8]._property" value="feetypecode" />
                           <input class="nui-hidden" name="criteria._expr[8]._op" value="in" />
                           <input  class="nui-treeselect" name="criteria._expr[8]._value"  url="com.primeton.eos.ame_fee.feeTypeTree.getFeeTypeTree2.biz.ext" 
				           valueField="feetypecode" textField="feetypename" dataField="feetypes" parentField="parentfeetypeid"
						   showTreeIcon="true" valueFromSelect="true"  showNullItem="true" multiSelect="true" checkRecursive = "true" showFolderCheckBox="true"
						   expandOnLoad="0"  style="width:150px"/>	
                       </td>	         		         	
			          <td class="form_label" align = "right">报销状态:</td>
			          <td colspan="1">
			            <input class="nui-hidden" name="criteria._expr[9]._property" value="expstatus"/>
					    <input class="nui-hidden" name="criteria._expr[9]._op" value="in" />
			            <input name="criteria._expr[9]._value" class="nui-dictcombobox" dictTypeId="EXP_CHECKFLAG"  multiSelect="true"  shownullitem="true" allowInput="true"style="width:120px;"  />					    
			          </td>	
			          <td class="form_label" align = "right">费用日期:</td>
			          <td colspan="3">
			           	  <input class="nui-datepicker" name="criteria._expr[12]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[12]._max" style="width:100px"/>
					      <input class="nui-hidden" name="criteria._expr[12]._property" value="findate"/>
					      <input class="nui-hidden" name="criteria._expr[12]._op" value="between"/>
					      <input class="nui-hidden" name="criteria._expr[12]._pattern" value="yyyy-MM-dd"/>
			          </td> 			         			          			          			
					  </tr>			       
			        <tr>			        			        
			        <td colspan="8" align="center">
			            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()" >查询</a>
			            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
			        </td>
			    </tr>
            </table>
  		</div>
	</div>
	
	<div style="width:100%;">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">            	
            	<tr>
                    <td align="left">
			            <a class="nui-button" id="exportCk" iconCls="icon-download" onclick="expDetailExp()">导出明细</a>
			        </td>
                </tr>                
            </table>           
        </div>        
        <div id="datagrid1" sizeList="[10,20,50,100,500,1000,10000]" showPager="true" dataField="detailExpRei"
        	showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell" 
        	class="nui-datagrid" style="width:100%;height:330px;" url="com.primeton.eos.ame_fee.expReiList.detailExpRei.biz.ext" 
        	multiSelect="true" allowSortColumn=true>
            <div property="columns">
            	<div type="checkcolumn"></div>            	
                <div field="reiid" width="85" align="center" headerAlign="center" allowSort="true" renderer="getExpReiList">报销记录编号</div>
                <div field="orgname" width="100" align="center" headerAlign="center" allowSort="true" >受益部门/区域</div>                                                                         
                <div field="benefmon" width="80" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >受益金额</div>               
                <div field="empname" width="60" align="center" headerAlign="center" allowSort="true" >报销人</div>                            
                <div field="exptype" width="85" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">报销类型</div>
                <div field="feetypename" width="120" align="center" headerAlign="center" allowSort="true">实际费用类型</div>
                <div field="expstatus" width="90" align="center" headerAlign="center" allowSort="true" dataType="currency" renderer="dictGetStatus" >报销状态</div>                  
                <div field="custname" width="140" align="center" headerAlign="center" allowSort="true" >受益客户</div>
                <div field="projectName" width="100" align="center" headerAlign="center" allowSort="true" >受益项目</div> 
                <div field="findate" width="90" align="center" headerAlign="center" allowSort="true" >费用日期</div>                            
                <div field="tbdate" width="140" align="center" headerAlign="center" allowSort="true" renderer = "ondealdate">报销日期</div>
                <div field="checkdate" width="90" align="center" headerAlign="center" allowSort="true" >审核日期</div>                
            </div>
         </div>        
		</div>
	</div>	
</div>

<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
</form> 

<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
 		var grid = nui.get("datagrid1");
 		//获取当前登陆人 的id,name
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    	%>
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
        nui.ajax({	
		      url: "com.primeton.eos.ame_fee.ReimbApply.queryExpReiExptype.biz.ext",
		      type: 'POST',
	          data: json,
	          success: function (text) {
	       	  	//报销单类型
	       	  	nui.get("exptype").setData(text.expfees);
	          },
		      error: function (jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.responseText);
		      }
	    }); 
       function search() {
            var data = form.getData(); //获取表单JS对象数据
            grid.load(data); //datagrid加载数据
        }
	  	  
	   function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}  
		  
      function getExpReiList(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkExpNo(reiid){
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
	    }
		  
    	init();
    	function init(){
    		var json = {"code":"detailExpRei","map":{"property":"status","op":"=","value":"running"}};
    		nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						if(text.orgs.length==0){
							//当没有有权限的机构时将报销人设置为自己并且不允许调整
							nui.get("empname").setValue('<%= nowuserid %>');
							nui.get("empname").setText('<%= nowusername %>');
							nui.get("expuserid").setValue('<%= nowuserid %>');
							nui.get("empname").setReadOnly(true);
							return;
						}
						var authorgs=text.orgs;
			    		var authorgids = text.orgids;
			    		var isall;
						for(var i=0;i<text.orgs.length;i++){
							if(text.orgs[i].orgid == "1"){
								isall = "1";
								break;
							}
						}
						//如果拥有全公司的权限就取消部门限制
						if(isall == "1"){
							nui.get("orgids2").setValue("");
						}else{
							nui.get("orgids2").setValue(authorgids);
						}
						nui.get("orgid2").setData(authorgs);
					}else{
						//当没有有权的机构时将报销人设置为自己并且不允许调整
						nui.get("empname").setValue('<%= nowuserid %>');
						nui.get("empname").setText('<%= nowusername %>');
						nui.get("expuserid").setValue('<%= nowuserid %>');
						nui.get("empname").setReadOnly(true);
						return;
					}
					
				}
			});
		}
        
        function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
        
                
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		
		function onOk(){
			search();
		}
					    
				
		//导出明细查询
		function expDetailExp(){
			var data = form.getData(); //获取表单JS对象数据
			//alert(nui.encode(data));	
			var json = nui.encode(data); //序列化成JSON	
			//var data1 = grid.getSelecteds();			
			//var json = nui.encode({datas:data1}); //序列化成JSON
			//alert(json);
			form.loading("操作中，请稍后......");
			nui.ajax({
                url: "com.primeton.eos.ame_fee.expReiList.exportdetailExpRei.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		form.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "报销明细";
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

        
    //格式化为千分位形式
	function formatNumber(num,cent) {
		num = num.toString().replace(/\$|\,/g,'');  
        // 检查传入数值为数值类型  
         if(isNaN(num))  
          num = "0";  
        // 获取符号(正/负数)  
        sign = (num == (num = Math.abs(num)));  
        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
        cents = num%Math.pow(10,cent);       // 求出小数位数值  
        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
       
        // 补足小数位到指定的位数  
        while(cents.length<cent)  
         cents = "0" + cents;  
         // 对整数部分进行千分位格式化.  
         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
        return (((sign)?'':'-') + num + '.' + cents); 
	}
	
	//将中国标准时间格式化为“yyyy-MM-dd HH:mm:ss”
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
	
	function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		     if (e.field == "benefmon") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		}
	
	//受益部门值改变时判断是否为空，如果为空则取消ref
	function changeOrg(e){
		if(e.value==null || e.value==""){
			nui.get("tempcond1").setValue("=");
			nui.get("tempcond2").setValue("");
		}else{
			nui.get("tempcond1").setValue("in");
			nui.get("tempcond2").setValue("1");
		}
	}
	

</script>
</body>
</html>