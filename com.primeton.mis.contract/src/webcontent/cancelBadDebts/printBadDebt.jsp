<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2019-12-23 17:12:53
  - Description:
-->
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js"
	type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<div title="坏账核销单打印" style="height:auto">
	<div class="nui-panel" title="基本信息" style="width: 788px;height:auto;">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp;
		<p class="MsoNormal" style="text-align:center;" align="center">
	    <b><span style="font-size:18.0pt;">应收账款坏账核销申请表</span></b><b><span style="font-size:18.0pt;font-family:宋体;"></span></b>
        </p>
       <p class="MsoNormal">
	   <span>&nbsp;</span>
        </p>
        <p class="MsoNormal">
	<span style="font-size:5.0pt;font-family:宋体;"><br />
         </span>
          </p>
		<table class="MsoNormalTable" border="1" cellspacing="0"
			cellpadding="0" width="780"
			style="border-collapse: collapse; border: solid windowtext 1.0pt;">
			<tbody>
				<tr>
				
					<td width="40" rowspan="5" style="border: 1.0pt;">
						<p class="MsoNormal" align="center" style="text-align: center;">
							<b><span style="font-size: 12.0pt; color: black;">坏账具体情况</span></b><span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
					</td>
					<td width="137" style="border: solid windowtext 1.0pt;">
					
						<p class="MsoNormal" align="left" style="text-align: left;">
							<span style="font-size: 12.0pt; color: black;">客户名称：</span><span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
					</td>
					<td width="464" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal">
							<span style="font-size: 12.0pt; color: black;" id="custname"></span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td width="137" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal" align="left" style="text-align: left;">
							<span style="font-size: 12.0pt; color: black;">合同签订日期：</span><span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
					</td>
					<td width="464" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal">
							<span style="font-size: 12.0pt; font-family: 宋体; color: black;" id="signdate"><br />
								</span>
						</p>
						<p class="MsoNormal" style="text-indent: 6.0pt;">
							<span style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td width="137" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal" align="left" style="text-align: left;">
							<span style="font-size: 12.0pt; color: black;">项目名称：</span><span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
					</td>
					<td width="464" style="border: solid windowtext 1.0pt;" >
						<p class="MsoNormal">
							<span style="font-size: 12.0pt; color: black;" id="projectname"></span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td width="137" rowspan="2" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal" align="left" style="text-align: left;">
							<span style="font-size: 12.0pt; color: black;">应收账款信息</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
						</p>
					</td>
					<td width="464" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal">
							<span style="font-size: 12.0pt; color: black;">金额：</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;" id="cancellmoney" ></span><span
								style="font-size: 12.0pt; color: black;">元</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
						</p>
					</td>
				</tr>
				<tr>
					<td width="464" style="border: solid windowtext 1.0pt;">
					<div id="grid_hxjk" class="nui-datagrid"
						style="width: 600px; height: auto;" allowResize="true"
						url="com.primeton.eos.ame_income.cancelBadDebts.getBadDetailPrint.biz.ext"
						dataField="baddebtdetails" allowCellSelect="true"
						showPager="false" allowCellEdit="true" multiSelect="true">
						<div property="columns">
							<div field="cancellmoney" align="center" width="50" format="n2"  currencyUnit="￥" dataType="currency"class="nui-spinner" 
								headerAlign="center"  >
								金额
							</div>
							<div field="incomecontime"  width="50" align="center" vtype="required:true"  renderer="onDealDate1"
								headerAlign="center" >
								应收帐款确认日期
							</div>
							<div field="accountage" align="center" width="50" 
								headerAlign="center" >
								账龄
							</div>
						</div>
					</div>
					<!-- <p class="MsoNormal">
							<span style="font-size: 12.0pt; color: black;">应收帐款确认日期：</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;">
								<span>2017 </span>
							</span><span style="font-size: 12.0pt; color: black;">年</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;">
								9 </span><span style="font-size: 12.0pt; color: black;">月</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;"><span>&nbsp;&nbsp;
							</span></span>
						</p>
						<p class="MsoNormal">
							<span style="font-size: 12.0pt; font-family: 宋体; color: black;"><span>&nbsp;</span></span>
						</p>
						<p class="MsoNormal">
							<span style="font-size: 12.0pt; color: black;">账龄：</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;">
								<span>15 </span>
							</span><span style="font-size: 12.0pt; color: black;" id="accountage"></span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
						</p> -->
					</td>
				</tr>
				<tr>
					<td width="40" style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal" align="center" style="text-align: center;">
							<b><span style="font-size: 12.0pt; color: black;">核销原因</span></b><span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
					</td>
					<td width="602" colspan="2" valign="top"
						style="border: solid windowtext 1.0pt;">
						<p class="MsoNormal" style="text-indent: 24.0pt;">
							<span style="font-size: 12.0pt;">我公司于</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black; background: yellow;" id="signdate3"></span><span
								style="font-size: 12.0pt;">与</span><span
								style="font-size: 12.0pt; color: black; background: yellow;"id="customername1"></span><span
								style="font-size: 12.0pt;">签订</span><span
								style="font-size: 12.0pt; color: black; background: yellow;"id="projectname1"></span><span
								style="font-size: 12.0pt;">，已</span><span
								style="font-size: 12.0pt; font-family: 宋体; color: black; background: yellow;"id="confimdate5"></span><span
								style="font-size: 12.0pt;">按合同约定确认收入。账款</span><!-- <span
								style="font-size: 12.0pt; font-family: 宋体; color: black; background: yellow;"id="cancellmoney1" ></span> -->
								<input id="cancellmoney1"style="border-style:none ;width:85px;font-size: 12.0pt; font-family: 宋体; color: black;background: yellow; " type="text"  ></input><span
								style="font-size: 12.0pt;">元</span> 
								<input id="content" type="text"  style="border-style:none ;width:481px;font-size: 12.0pt; font-family: 宋体; color: black;" ></input>
								<span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
						<p class="MsoNormal" style="text-indent: 24.0pt;">
							<span style="font-size: 12.0pt;">现根据公司会计制度相关规定，申请对该笔应收帐款申请列为坏帐损失进行帐务处理。</span><span
								style="font-size: 12.0pt; font-family: 宋体;"></span>
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		
			<legend>处理意见列表</legend>
			<div id="datagrid1" class="nui-datagrid"
				style="width:780px; height: auto;border-collapse: collapse; border: solid windowtext 1.0pt;" dataField="misOpinions"
				url="com.primeton.eos.ame_income.cancelBadDebts.queryBadDebtOpinionPrint.biz.ext"
				idField="id" allowResize="true" allowAlternating="true"
				multiSelect="true" showPager="false" allowCellWrap="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="30">编号</div>
					<div field="workitemname" width="80" align="center"
						headerAlign="center">处理环节</div>
				
					<div field="operatorname" width="50" headerAlign="center"
						align="center">处理人</div>
					
					<div field="auditopinion" width="150" headerAlign="center">处理意见</div>
				</div>
			</div>
		<!-- 	<legend>处理意见列表</legend>
			<table class="MsoNormalTable" border="1" cellspacing="0"
			cellpadding="0" width="780"
			style="border-collapse: collapse; border: solid windowtext 1.0pt;">
			
			<tr>
			<td ><b><span style="font-size: 12.0pt;text-align:center; color: black;" align="center">处理人</span></b></td>
			<td ><b><span style="font-size: 12.0pt;text-align:center; color: black;" align="center">处理意见</span></b></td>
			</tr>
			<tr>
            <td >
				<p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">申请人</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>			
			<td><p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">同意</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>
			</tr>
			<tr>
			<td >
				<p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">事业部总经理</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>	
			<td><p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">同意</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>
			</tr>
			<tr>
			<td><p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">事业群VP</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>
			<td><p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">同意</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>
			</tr>
			<tr>
			<td><p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">CFO</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>
			<td><p class="MsoNormal" align="left" style="text-align: left;">
				<span style="font-size: 12.0pt; color: black;">同意</span><span
				style="font-size: 12.0pt; font-family: 宋体; color: black;"></span>
				</p>
			</td>
			</tr>
			
			</table> -->
	</div>
</div>

<script type="text/javascript">
	
	nui.parse();
	var grid_hxjk = nui.get("grid_hxjk");
	var contractid='<%=request.getParameter("contractid")%>';
	var processinstid='<%=request.getParameter("processinstid")%>';
	var cancelltype='<%=request.getParameter("cancelltype")%>';
	console.log(processinstid)
	//表单
	 //审核意见的表单
/* 	//处理申请原因
	var applyreasonFrom = new nui.Form("applyreasonFrom");
	 */
	//文件路径
	 var ContextPath= '<%=request.getContextPath()%>'
	 var contnum;
	 var json = {"processinstid" : processinstid,contractid :contractid};
		init();
		function init() {
			//查询合同相关信息
			nui.ajax({
						url : "com.primeton.eos.ame_income.cancelBadDebts.getPrintBadDebt.biz.ext",
						data : json,
						type : "post",
						contentType : "text/json",
						success : function(data) {
							data = nui.clone(data);
							/* 	//核销申请内容
								nui.get("applyreason").setValue(data.amebcancell.applyreason); 
								console.log(data)
								nui.get("cancelltype").setValue(data.amebcancell.cancelltype);
								nui.get("processinstid1").setValue(data.amebcancell.processinstid); 
								nui.get("cancellapplyid").setValue(data.amebcancell.cancellapplyid);
								nui.get("contnum1").setValue(data.amebcancell.contnum);  */

							//合同基本信息
							//加载附件设置参数
							 document.getElementById("custname").innerHTML = data.csContract.misCustinfo.custname == null ? ""
									: data.csContract.misCustinfo.custname;
									
							document.getElementById("customername1").innerHTML = data.csContract.misCustinfo.custname == null ? ""
									: data.csContract.misCustinfo.custname;	
							document.getElementById("signdate").innerHTML = data.csContract.signdate == null ? ""
									: data.csContract.signdate;
							document.getElementById("projectname").innerHTML = data.csContract.projectname == null ? ""
									: data.csContract.projectname;
							document.getElementById("projectname1").innerHTML = data.csContract.projectname == null ? ""
									: data.csContract.projectname;
							//合同签署日期
							 var signdate=data.csContract.signdate;
							var contnum=data.csContract.contnum
							
							 
							 var signdate1=signdate.substring(0,signdate.length-6)
							  
							 var signdate2=signdate.substring(5,signdate.length-3)
							var signdate3=signdate1+"年"+signdate2+"月";
							document.getElementById("signdate3").innerHTML = signdate3 == null ? "": signdate3;
							  
							  
							  document.getElementById("content").value="经我方多次催收仍然未能收回，后一直未与该公司发生销售业务。";
							var processinstid = data.amebcancell.processinstid;
 							grid_hxjk.load({"processinstid":processinstid},function(){//坏账明细
					        //加载查询审核意见
							var grid = nui.get("datagrid1");
							grid.sortBy("time", "desc"); 
							 grid.load({"processInstID":processinstid},function(){//审批意见
	                			}); 
					 			})
 							//计算核销总金额
 							//计算拼接收入确认日期
			                var details =data.badDebtDetails;
			         	   var total = 0;
			         	 //  var confimdate4="";
			               for (var i = 0, l = details.length; i < l; i++) {
			               			
			               
			              			var cancellmoney;
			                    	var data2 = details[i];
			                    	var m = data2.cancellmoney;
			                    	//var confimdate=data2.incomecontime;
			                    	//var confimdate1=confimdate.substring(0,4);
			                    	//console.log(confimdate1);
			                    	
			                    	
									//var confimdate2=confimdate.substring(5,7);
									//var confimdate6=confimdate.substring(8,10);
									//var confimdate3=confimdate1+"年"+confimdate2+"月"+confimdate6+"日";
			                   		var c = parseFloat(m);
			                    if (isNaN(m)) continue 
			                    	//confimdate4 += confimdate3 + ',';
			                        total+=c;
			                }
			             //   var confimdate5=confimdate4.substring(0,confimdate4.length-1); 
			         	 //  document.getElementById("confimdate5").innerHTML = confimdate5 == null ? "" : confimdate5;
 			              document.getElementById("cancellmoney").innerHTML = total == null ? "0.00" : nui.formatNumber(total,'0.00');
						   document.getElementById("cancellmoney1").value = total == null ? "0.00" : nui.formatNumber(total,'0.00');
							
	 
							},
							error : function(jqXHR, textStatus, errorThrown) {
								nui.alert("error:" + jqXHR.responseText);
							}
	
						});

		}
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e.value);//设置业务字典值
		}
	</script>
	<script
	src="<%=request.getContextPath()%>/contract/cancelBadDebts/js/cancellBadDebt.js"
	type="text/javascript"></script>
	
</body>
</html>