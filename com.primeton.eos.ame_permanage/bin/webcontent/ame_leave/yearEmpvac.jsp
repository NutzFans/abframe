<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>

<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-06-14 16:01:54
  - Description:
-->
<head>
<title>本人年假情况查看</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    td{
    	align:center;
    }
    .tr{
    	background: #E4EEF6; text-align: center;height: 1.7rem;
    }
</style>
</head>
<body>
	
	<div  style="border-bottom:0;padding:0px;width: 100%">
          <!-- <table style="border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="6" width="99%" hight="50%" align = "center"> -->
          	<table border="100"  style=" border-collapse:collapse;border-spacing:0; border:1px  solid  #FFFFFF;" width="90%" hight="50%" align = "center">
          	<tr style="background:#007AFF;color: #fff;border-bottom-width: 0;  text-align: center; height: 2.4rem;">
              <th width="5%" >序号</th>
              <th width="16%">属性</th>
              <th width="12%">统计</th>
              <th>备注</th>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab1','over')" onmouseout="changeColor('tab1','out')" id="tab1">
              <td align="center">1</td>
              <td align="center">登录名</td>
              <td align="center" id="userid"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab2','over')" onmouseout="changeColor('tab2','out')" id="tab2">
              <td align="center">2</td>
              <td align="center">姓名</td>
              <td align="center" id="empname"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab3','over')" onmouseout="changeColor('tab3','out')" id="tab3">
              <td align="center">3</td>
              <td align="center">入职日期</td>
              <td align="center" id="indate"></td>
              <td></td>
            </tr>
            
            <!-- <tr class="tr" onmouseover="changeColor('tab4','over')" onmouseout="changeColor('tab4','out')" id="tab4">
              <td align="center">4</td>
              <td align="center" >社会工作起始时间 </td>
              <td align="center" id="socialstart"></td>
              <td></td>
            </tr> -->
            
            <tr class="tr" onmouseover="changeColor('tab5','over')" onmouseout="changeColor('tab5','out')" id="tab5">
              <td align="center">4</td>
              <td align="center">统计截止时间</td>
              <td align="center" id="endtime"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab6','over')" onmouseout="changeColor('tab6','out')" id="tab6">
              <td align="center">5</td>
              <td align="center">司龄</td>
              <td align="center" id="comyears"></td>
              <td align="center"></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab7','over')" onmouseout="changeColor('tab7','out')" id="tab7">
              <td align="center">6</td>
              <td align="center">当年在职天数 </td>
              <td align="center" id="thdutyday"></td>
              <td align="left">当年在职天数：指员工的可用年假按在职天数计算。</td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab8','over')" onmouseout="changeColor('tab8','out')" id="tab8">
              <td align="center">7</td>
              <td align="center">社会工龄</td>
              <td align="center" id="workyears"></td>
              <td align="center"></td>
            </tr>
            
            <tr class="tr"  onmouseover="changeColor('tab9','over')" onmouseout="changeColor('tab9','out')" id="tab9">
              <td align="center">8</td>
              <td align="center">标准年假天数</td>
              <td align="center" id="standvac"></td>
              <td align="center"></td>
            </tr>
            
            <tr  class="tr" onmouseover="changeColor('tab10','over')" onmouseout="changeColor('tab10','out')" id="tab10">
              <td align="center">9</td>
              <td align="center">当年可用年假天数</td>
              <td align="center" id="tyusevac"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab11','over')" onmouseout="changeColor('tab11','out')" id="tab11">
              <td align="center">10</td>
              <td align="center">去年剩余年假</td>
              <td align="center" id="lastrest"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab12','over')" onmouseout="changeColor('tab12','out')" id="tab12">
              <td align="center">11</td>
              <td align="center">当年春节统筹休假 </td>
              <td align="center" id="overvac"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab13','over')" onmouseout="changeColor('tab13','out')" id="tab13"> 
              <td align="center">12</td>
              <td align="center">当年已休天数</td>
              <td align="center" id="daysoff"></td>
              <td></td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab14','over')" onmouseout="changeColor('tab14','out')" id="tab14">
              <td align="center">13</td>
              <td align="center">去年延期年假(清零）</td>
              <td align="center" id="delayvac"></td>
              <td align="left">13=10-11-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;去年延期年假：指去年剩余年假如仍有剩余，将于当年12月31日到期清零。</td>
            </tr>
            
            <tr class="tr" onmouseover="changeColor('tab15','over')" onmouseout="changeColor('tab15','out')" id="tab15">
              <td align="center">14</td>
              <td align="center">当前可请年假</td>
              <td align="center" id="tyleftvac"></td>
              <td align="left">14=9+10-11-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前可请年假若为负数，将在下一年年假中扣减。<br>年假扣减顺序：优先扣除上年剩余年假，最后为当前可请年假。</br></td>
            </tr>
            
            <tr class="tr"  onmouseover="changeColor('tab16','over')" onmouseout="changeColor('tab16','out')" id="tab16">
              <td align="center">15</td>
              <td colspan="3" align="center">以上，如有异议，请与<B>人力资源部刘师霞 （liusx@primeton.com）</B>联系，谢谢！</td>
            </tr>
            
          </table>
      </div>
</body>

<script type="text/javascript">
	   nui.parse();
	    //获取当前登陆人 的id,name
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    	%>
    	nowuserid = '<%=nowuserid %>'
    	nowusername = '<%=nowusername %>'
		nui.parse();//初始化NUI
		init();
	    function init(){
	    	var json = ({userid:nowuserid});
			nui.ajax({
				url: "com.primeton.eos.ame_permanage.ame_leavepro.yearEmpvac.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
		        success: function (o) {
		        	vacs =o.vacs;
		        	if(o.result==0){
	                	alert("查询失败!");
	                }else{
	                     document.getElementById("userid").innerHTML = o.vacs.userid == null ?"":o.vacs.userid; 
	                     document.getElementById("empname").innerHTML = o.vacs.empname == null ?"":o.vacs.empname;
	                     document.getElementById("indate").innerHTML = o.vacs.indate == null ?"":o.vacs.indate;
	                     /* document.getElementById("socialstart").innerHTML = o.vacs.socialstart == null ?"":o.vacs.socialstart; */
	                     document.getElementById("endtime").innerHTML = o.vacs.endtime == null ?"":o.vacs.endtime;
	                     document.getElementById("comyears").innerHTML = o.vacs.comyears == null ?"":o.vacs.comyears;
	                     document.getElementById("thdutyday").innerHTML = o.vacs.thdutyday == null ?"":o.vacs.thdutyday;
	                     document.getElementById("workyears").innerHTML = o.vacs.workyears == null ?"":o.vacs.workyears;
	                     document.getElementById("standvac").innerHTML = o.vacs.workyears == null ?"":o.vacs.standvac;
	                     document.getElementById("tyusevac").innerHTML = o.vacs.tyusevac == null ?"":o.vacs.tyusevac;
	                     document.getElementById("lastrest").innerHTML = o.vacs.lastrest == null ?"":o.vacs.lastrest;
	                     document.getElementById("overvac").innerHTML = o.vacs.overvac == null ?"":o.vacs.overvac;
	                     document.getElementById("daysoff").innerHTML = o.vacs.daysoff == null ?"":o.vacs.daysoff;
	                     document.getElementById("delayvac").innerHTML = o.vacs.delayvac == null ?"":o.vacs.delayvac;
	                     document.getElementById("tyleftvac").innerHTML = o.vacs.tyleftvac == null ?"":o.vacs.tyleftvac;
	                }
		        }
			});
		 }
		 function changeColor(id,flag)
        {
            if(flag=="over")
            {
                document.getElementById(id).style.backgroundColor="#FFFF66";
            }
            else{
                document.getElementById(id).style.backgroundColor="#E4EEF6";
            }
        }
</script>
</html>