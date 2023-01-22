<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-17 10:58:50
  - Description:
-->
<head>
<title> </title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;	
    }
    table{
    	border: solid 1px #000000;
    	border-collapse: collapse;
    }
    th{
    	border: solid 1px #000000;
    }
    td{
    	border: solid 1px #000000;
    }
</style>
</head>
<body>
<div title="离职交接单" style="height: auto">
	<br/><br/>
	<div id="pipi" class="nui-panel" style="font-size: 20px;font-weight:bold;width: 320px;height: 30px;margin-left: 259px"  align="center"></div><br/>
	<div style="font-size: 14px;">
		<span style="font-weight:bold;">离职人员：</span><span id="empname"></span><span style="margin-left: 100px;font-weight:bold;">工号：</span><span id="empcode"></span><span style="margin-left: 100px;font-weight:bold;">离职部门：</span><span  id="orgname"></span>
	</div><br/>
	<table style="width: 800px;">
		<tr>
			<th align="center" style = "width: 15px;">序号</th>
			<th align="center"  style = "width: 40px;">办理部门/办理角色</th>
			<th align="center" style = "width: 120px;">交接说明</th>
			<th align="center"  style = "width: 60px;">确认人</th>
		</tr>
		<tr style="height:70px;">
			<td align="center" style = "width: 15px;">1</td>
			<td align="left"  style = "width: 30px;">本部门</td>
			<td align="left" style = "width: 120px;" id="dept"></td>
			<td align="center"  style = "width: 60px;" id="deptname"></td>
		</tr>
		<tr style="height:40px;">
			<td align="center" style = "width: 15px;">2</td>
			<td align="left"  style = "width: 30px;">工作交接人</td>
			<td align="left" style = "width: 120px;" id="dept1"></td>
			<td align="center"  style = "width: 60px;" id="handname"></td>
		</tr>
		<tr style="height:40px ">
			<td align="center" style = "width: 15px;">3</td>
			<td align="left"  style = "width: 30px;">行政部</td>
			<td align="left" style = "width: 120px;"id="admin"></td>
			<td align="center"  style = "width: 60px;" id="adminname"></td>
		</tr>
		<tr style="height:40px ">
			<td align="center" style = "width: 15px;">4</td>
			<td align="left"  style = "width: 30px;">MIS部</td>
			<td align="left" style = "width: 120px;"id="mis"></td>
			<td align="center"  style = "width: 60px;" id="misname"></td>
		</tr>
		<tr style="height:40px ">
			<td align="center" style = "width: 15px;">5</td>
			<td align="left"  style = "width: 30px;">PMO</td>
			<td align="left" style = "width: 120px;"id="pmo"></td>
			<td align="center"  style = "width: 60px;" id="pmoname"></td>
		</tr>
		<tr style="height:40px;">
			<td align="center" style = "width: 15px;">6</td>
			<td align="left"  style = "width: 30px;">保密办（若涉及）</td>
			<td align="left" style = "width: 120px;" id="secrecy"></td>
			<td align="center"  style = "width: 60px;" id="secrecyname"></td>
		</tr>
		<tr style="height:70px;">
			<td align="center" style = "width: 15px;">7</td>
			<td align="left"  style = "width: 30px;">人力资源部</td>
			<td align="left" style = "width: 120px;"id="hr"></td>
			<td align="center"  style = "width: 60px;"id="hrname"></td>
		</tr>
		<tr style="height:40px;">
			<td align="center" style = "width: 15px;">8</td>
			<td align="left"  style = "width: 30px;">财务部</td>
			<td align="left" style = "width: 120px;"id="finance"></td>
			<td align="center"  style = "width: 60px;" id="financename"></td>
		</tr>
		<tr style="height:50px;"id="pcf">
			<td align="center" style = "width: 15px;">9</td>
			<td align="left"  style = "width: 30px;">PCF基金</td>
			<td align="left" style = "width: 120px;" colspan="2">
				<b>感谢您积极参与PCF活动和做出的贡献，鉴于您的离职，您捐助的资金将由PCF统一处理，每月费用报告不再另行通知。</b><br/><br/>
			</td>
		</tr>
		<tr style="height:50px ">
			<td align="center" style = "width: 15px;"id="person">10</td>
			<td align="left"  style = "width: 30px;">个人确认签字</td>
			<td align="left" style = "width: 120px;" colspan="2">
				<span>1.本人对上述工作及物品交接确认无误。</span><br>
				<span>2.本人对以上各项提供的信息确认无误。</span><br/>
				<span style="float: right;">__________（签字）</span><br/>
				<span style="float: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
			</td>
		</tr>
	</table>
</div>
</body>
<script type="text/javascript">
    nui.parse();
	var leaveid='<%=request.getParameter("leaveid")%>';
	var userid ="";
	var misop =[];
	document.getElementById("pipi").innerHTML="离职工作与物品交接确认单";
	init();//申请数据初始化
  	function init(){
  		var json = nui.encode({leaveid:leaveid});
  		nui.ajax({//获取离职申请信息
      		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getLeaveApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			userid=o.omLeaveApply.userid;
                var empname = o.omLeaveApply.empname;
                var empcode = o.omLeaveApply.empcode;
                var sybname = o.omLeaveApply.sybname;
                var orgname = o.omLeaveApply.orgname;
                var isjoinpcf = o.omLeaveApply.isjoinpcf;//是否有PCF
                var issignconf = o.omLeaveApply.issignconf;//是否有PCF
                var dirleadername = o.omLeaveApply.dirleadername;
                if(sybname){
                	orgname = sybname+"——"+orgname;
                }
                document.getElementById("empname").innerHTML=empname==null?"":empname;
                document.getElementById("empcode").innerHTML=empcode==null?"":empcode;
                document.getElementById("orgname").innerHTML=orgname==null?"":orgname;
               /*  if(isjoinpcf =="1"){
	  				document.getElementById("pcf").style.display="";
                	document.getElementById("person").innerHTML=10;
                } */
                var outdate = o.omLeaveApply.outdate;
				if(outdate){
					var outdateyear = outdate.substring(0,4);
					var outdatemonth = outdate.substring(5,7);
					outdatemonth = outdatemonth.indexOf('0') == 0?outdatemonth.substring(1,2):outdatemonth;
					var outdateday = outdate.substring(8,10);
					outdateday = outdateday.indexOf('0') == 0?outdateday.substring(1,2):outdateday;
				}
				var nohxje = getnohxje();
				var hxmsg="员工无公司欠款";
				if(nohxje>0){
					hxmsg ="员工有公司欠款"+nohxje+"元";
				}
				var deptlist="<span>同意离职</span><br/>";
				var deptlist=deptlist+"<span>最后工作日(离职日期)："+outdateyear+"年"+outdatemonth+"月"+outdateday+"日</span><br/>";
				var deptlist1="<span>1.工作文档已交接完成</span><br/>";
					deptlist1=deptlist1+"<span>2.部门主管明确的其他交接任务已完成</span><br/>";
					deptlist1=deptlist1+"<span>3.部门内部调配的物品检查与回收已完成</span><br/><span>4.产品文档资料与账户/密码处理</span><br/>";
				var admin="<span>1.如有借阅图书已处理（含技术书籍） </span><br/>";
					admin=admin+"<span>2.非耗材办公用品/固定资产已回收处理</span><br/><span>3.文件柜钥匙/门禁卡、档案文件已回收处理</span><br/>";
					admin=admin+"<span>4.电脑等相关设备检查（具体配置）与回收已处理</span><br/>";
				var mis="<span>1.系统待办任务已处理(或改派、终止) </span><br/><span>2.非耗材办公用品/固定资产已回收处理</span><br/>";
				var pmo="<span>1.技术人员工时是否填写完整 </span><br/><span>2.PMO部门其他工作交接已完成</span><br/>";
				var secrecy="<span>1.涉密计算机、涉密文件、技术资料、软件，涉密介质交接/销毁已完成 </span><br/>";
					secrecy=secrecy+"<span>2.《涉密人员离岗离职审批表》、《涉密人员离岗离职保密承诺书》、《涉密人员离岗离职秘密载体移交表》填写完成</span><br/>";
				var hr="<span>1.社会保险、住房公积金已结算 </span><br/>";
					hr=hr+"<span>2.商业保险截至"+outdateyear+"年"+outdatemonth+"月"+outdateday+"日</span><br/>";
					hr=hr+"<span>3.工资结算至"+outdateyear+"年"+outdatemonth+"月"+outdateday+"日</span><br/><span>离职手续办理完毕，末月工资将在次月15日前发放</span><br/>";
					hr=hr+"<span>4.年假结算至"+outdateyear+"年"+outdatemonth+"月"+outdateday+"日，剩余年假为零</span><br/>";
					if("1" == issignconf){
						hr=hr+"<span>5.保密承诺书签订（是  / 否）</span><br/>";
					}
				var finance="<span>1."+hxmsg+"</span><br/>";
					finance=finance+"<span>2.其他：________</span><br/>";
                document.getElementById("dept").innerHTML=deptlist;
                document.getElementById("dept1").innerHTML=deptlist1;
                document.getElementById("admin").innerHTML=admin;
                document.getElementById("mis").innerHTML=mis;
                document.getElementById("pmo").innerHTML=pmo;
                document.getElementById("secrecy").innerHTML=secrecy;
                document.getElementById("finance").innerHTML=finance;
                document.getElementById("hr").innerHTML=hr;
                
				var misop=getMisOp(o.omLeaveApply.processinstid);
				var deptname ="";
				var depttime ="";
				var handname ="";
				var handtime ="";
				var adminname ="";
				var admintime ="";
				var misname ="";
				var mistime ="";
				var pmoname ="";
				var pmotime ="";
				var secrecyname ="";
				var secrecytime ="";
				var hrname ="";
				var hrtime ="";
				var financename ="";
				var financetime ="";
				
				for(var i=0;i<misop.length;i++){
					var op = misop[i];
					if(op.activitydefid == "manualActivity1"){//直属领导
						deptname = op.operatorname;
						depttime = op.max_time;
						if(depttime){
							depttime = depttime.substring(0,10);
						}
					}
					if(op.activitydefid == "manualActivity8"){//交接人
						handname = op.operatorname;
						handtime = op.max_time;
						if(handtime){
							handtime = handtime.substring(0,10);
						}
					}else if(op.activitydefid == "manualActivity6"){//行政
						adminname = op.operatorname;
						admintime = op.max_time;
						if(admintime){
							admintime = admintime.substring(0,10);
						}
					}else if(op.activitydefid == "manualActivity7"){//mis
						misname = op.operatorname;
						mistime = op.max_time;
						if(mistime){
							mistime = mistime.substring(0,10);
						}
					}else if(op.activitydefid == "manualActivity5"){//pmo
						pmoname = op.operatorname;
						pmotime = op.max_time;
						if(pmotime){
							pmotime = pmotime.substring(0,10);
						}
					}else if(op.activitydefid == "manualActivity9"){//保密办
						secrecyname = op.operatorname;
						secrecytime = op.max_time;
						if(secrecytime){
							secrecytime = secrecytime.substring(0,10);
						}
					}else if(op.activitydefid == "manualActivity14"){//HR
						hrname = op.operatorname;
						hrtime = op.max_time;
						if(hrtime){
							hrtime = hrtime.substring(0,10);
						}
					}else if(op.activitydefid == "manualActivity4"){//财务
						financename = op.operatorname;
						financetime = op.max_time;
						if(financetime){
							financetime = financetime.substring(0,10);
						}
					}
				}
                document.getElementById("deptname").innerHTML=deptname==null || deptname==""?dirleadername:deptname;
                document.getElementById("handname").innerHTML=handname;
                document.getElementById("adminname").innerHTML=adminname;
                document.getElementById("misname").innerHTML=misname;
                document.getElementById("pmoname").innerHTML=pmoname;
                document.getElementById("secrecyname").innerHTML=secrecyname == null ||secrecyname==""?"不涉及":secrecyname;
                document.getElementById("hrname").innerHTML=hrname;
                document.getElementById("financename").innerHTML=financename;
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
  	}
  	
  	//获取未核销金额
	function getnohxje(){
		var json = nui.encode({"userid":userid});
		var nohxje=0;
		nui.ajax({
    		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getnohxje.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nohxje = text.nohxje;
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
    	return nohxje;
	}
	//获取审批意见
	function getMisOp(processInstID){
		var json = nui.encode({"processInstID":processInstID});
		var nohxje=0;
		nui.ajax({
    		url: "com.primeton.eos.ame_permanage.ame_leave_apply.queryMisOp.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				misop = text.misOpinions;
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
    	return misop;
	}
</script>
</html>