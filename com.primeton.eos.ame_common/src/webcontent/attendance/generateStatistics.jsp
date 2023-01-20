<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-02-20 11:06:02
  - Description:
-->
<head>
	<title>生成考勤统计</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post" style="width:100%">
			<input name="criteria._expr[1]._value" class="nui-hidden" style="width:150px;" id="nowYear" />
			<input class="nui-hidden" name="criteria._expr[1]._property" value="year"/>
			<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
			<input name="criteria._expr[2]._value" class="nui-hidden" style="width:150px;" id="nowMonth" />
			<input class="nui-hidden" name="criteria._expr[2]._property" value="month"/>
			<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
			<table style="width:100%;">
				<tr>
					<td align="right">考勤年月：</td>
					<td>
						<input class="nui-monthpicker" style="width:150px;" id="newyearmonth" allowInput="true" onblur="getAddDays"/>
					</td>
					<td align="right">标准补充天数：</td>
					<td>
						<input name="adddays" class="nui-textbox" style="width:150px;" id="adddays" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td align="right">供应商：</td>
					<td>
						<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					</td>
					<td align="right">受益事业部：</td>
					<td>
						<input name="criteria._expr[0]._value" class="nui-dictcombobox"  shownullItem="true" dictTypeId="CONT_ORG" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="sybid"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
					</td>
				</tr>
				<tr>
					<td align="right">外包人员：</td>
					<td>
						<input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;" id="names"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="operatorname"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					</td>
					<td align="right">项目名称：</td>
					<td>
						<input name="criteria._expr[7]._value" class="nui-textbox" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="projectName"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
					</td>
				</tr>
				<tr>
					<td align="right">项目编号：</td>
					<td>
						<input name="criteria._expr[6]._value" class="nui-textbox" style="width:150px;" id = "projectno"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="projectNo"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					</td>
					<td align="right">受益销售：</td>
					<td>
						<input name="criteria._expr[5]._value" class="nui-textbox" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="orgname"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
					</td>
				</tr>
		    </table>
		</form>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
		<a class="nui-button" iconCls="icon-search" id="search" style="width:100px;" onclick="search">确认生成</a>
	</div> 
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var d = new Date();
    var  nowYear = d.getFullYear();//当前年
    nui.get("nowYear").setValue(nowYear);
    var nowMonth = d.getMonth()+1;//当前月
    nowMonth =(nowMonth<10 ? "0"+nowMonth:nowMonth); 
    nui.get("nowMonth").setValue(nowMonth);
    var ym=nowYear+"-"+nowMonth;//当前年月
    nui.get("newyearmonth").setValue(ym);
    getAddDays();
    
    //获取补充天数
    function getAddDays(){
    	var ym1=nui.get("newyearmonth").getValue();
    	var year=ym1.getFullYear();
    	var month=ym1.getMonth()+1;
    	month =(month<10 ? "0"+month:month);
    	//考勤年大于当前年
    	if(year>nowYear){
			nui.get("nowYear").setValue(nowYear);
			nui.get("nowMonth").setValue(nowMonth);
			nui.get("newyearmonth").setValue(ym);
			year=nowYear;
			month=nowMonth;
			var json=nui.encode({year:year,month:month});
			nui.ajax({
	    		url:"com.primeton.eos.ame_common.ameAttendance.getAddDays.biz.ext",
				data:json,
				type:"post",
				contentType:"text/json",
				success:function(o){
					var adddays = o.adddays;
					nui.get("adddays").setValue(adddays);
				}    	
	    	});
    	}
    	//考勤年等于当前年
    	if(year==nowYear){
    		if(month>nowMonth){
    			nui.get("nowYear").setValue(nowYear);
				nui.get("nowMonth").setValue(nowMonth);
				nui.get("newyearmonth").setValue(ym);
				year=nowYear;
				month=nowMonth;
				var json=nui.encode({year:year,month:month});
				nui.ajax({
		    		url:"com.primeton.eos.ame_common.ameAttendance.getAddDays.biz.ext",
					data:json,
					type:"post",
					contentType:"text/json",
					success:function(o){
						var adddays = o.adddays;
						nui.get("adddays").setValue(adddays);
					}    	
		    	});
	    	}
    	}
    	nui.get("nowYear").setValue(year);
		nui.get("nowMonth").setValue(month);
    	var json=nui.encode({year:year,month:month});
		nui.ajax({
    		url:"com.primeton.eos.ame_common.ameAttendance.getAddDays.biz.ext",
			data:json,
			type:"post",
			contentType:"text/json",
			success:function(o){
				var adddays = o.adddays;
				nui.get("adddays").setValue(adddays);
			}    	
    	});
    }
    
    //生成计提
	function search(){
		var data = form.getData();
		var year = nui.get("nowYear").getValue();
		var month = nui.get("nowMonth").getValue();
		//开始日期
		var startdate = year + "-" + month + "-" + "01";
		var premonthnew = new Date(year,month,1);
		var enddateday = (new Date(premonthnew.getTime()-1000*60*60*24)).getDate();
		//结束日期
		var enddate = year + "-" + month + "-" + enddateday;
		form.loading("生成中......");
		var adddays=nui.get("adddays").getValue();
		var datas=nui.encode({startdate:startdate,enddate:enddate,adddays:adddays,criteria:data.criteria});
		nui.ajax({
			url:"com.primeton.eos.ame_common.ameAttendance.insertPurOutCount.biz.ext",
			data:datas,
			type:"post",
			contentType:"text/json",
			success:function(text){
				var result = text.result;
				form.unmask();
				if(result==1){
					alert("生成失败！");
				}else if(result==2){
					if(confirm("指定条件的考勤统计数据已存在，是否将其覆盖？")){
						form.loading("生成中......");
						//stat=1 为标志位  如果为1 则需把当月的静态数据删除掉 重新生成当月静态考勤记录
						var json=nui.encode({startdate:startdate,enddate:enddate,stat:"1",criteria:data.criteria,adddays:adddays});
						nui.ajax({
							url:"com.primeton.eos.ame_common.ameAttendance.insertPurOutCount.biz.ext",
							data:json,
							type:"post",
							contentType:"text/json",
							success:function(o){
								form.unmask();
								var r=o.result;
								if(r==0){
									alert("生成成功！");
								}else if(r==2){
									alert("本月暂无考勤信息，无法生存考勤统计！");
								}else{
									alert("生成失败！");
								}
							}
						});
					}
				}else if(result==0){
					alert("生成成功!");
				}
			}
		});
	}

</script>
</html>