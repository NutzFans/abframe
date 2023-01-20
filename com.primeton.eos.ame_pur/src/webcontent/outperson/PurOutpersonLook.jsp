<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-02 09:40:03
  - Description:
-->
<head>
	<title>查看外包人员</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<input name="purOutperson.outperno" id="outperno" class="nui-hidden" />
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<!-- 
					显示外包人员基本信息，附件信息
					显示外包人员相关的工作协议书列表信息和结算记录列表信息
				 -->
				<legend>外包人员基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						
						<tr>
							<td align="right" style="width:120px;">姓名：</td>
							<td id="purOutperson.outpername" style="width:150px"></td>
							<td align="right" style="width:120px;">身份证号码：</td>
							<td id="purOutperson.outpercartno" style="width:290px"></td>
							<td align="right" style="width:120px;">性别：</td>
							<td id="purOutperson.gender" style="width:150px"></td>
							<td align="right" style="width:120px;">学历：</td>
							<td id="purOutperson.degree" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">毕业时间：</td>
							<td id="purOutperson.gradudate" style="width:150px"></td>
							<td align="right" style="width:120px;">联系电话：</td>
							<td id="purOutperson.linktel" style="width:150px"></td>
							<td align="right" style="width:120px;">价格(元)：</td>
							<td id="price" style="width:100px"></td>
							<td align="right" style="width:120px;">状态：</td>
							<td id="currentstatus" style="width:75px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">开始服务日期：</td>
							<td id="startdate" style="width:100px"></td>
							<td align="right" style="width:120px;height:40px;">创建日期：</td>
							<td id="createdate" style="width:290px;"></td>
							<td align="right" style="width:120px;">供应商：</td>
							<td id="custid" style="width:290px"></td>
							<td align="right" style="width:120px;" >电脑提供方式：</td>
							<td id="pcprotype" style="width:100px" ></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;height:40px;">联系邮箱：</td>
							<td id="purOutperson.linkemail" style="width:150px;"></td>
							<td align="right" style="width:120px;">微信企业号：</td>
							<td id="purOutperson.wxno" style="width:120px;"></td>
							<td align="right" style="width:120px;height:40px;">备注：</td>
							<td colspan="3" id="memo" style="width:290px;"></td>
						</tr>
					</table>
				</div>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
		</form>
		<!-- 外包人员相关的工作协议书列表信息和结算记录列表信息 -->
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包人员相关的工作协议书信息</legend>
			<div style="padding:5px;">
				<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="purOrderOutpers" 
			    	url="com.primeton.eos.ame_pur.outperson.queryOrderByOutpersonno.biz.ext" showFooter="false" showPager="false">
			    	<div property="columns">
			    		
		                <div field="purOrder.purContract.purcontid" headerAlign="center" allowSort="true" visible="false">采购合同编号</div>
		                <div field="purOrder.purorderid" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
		                <div field="purOrder.purordernum" width="140" headerAlign="center" allowSort="true">采购订单编码</div>
		                <div field="purOrder.projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" width="220" headerAlign="center" allowSort="true" >项目名称</div>
		                <div field="purOrder.userid" headerAlign="center" allowSort="true" visible="false">所属客户id</div>
		                <div field="custname" width="220" headerAlign="center" allowSort="true">所属客户</div>
		                <div field="purOrder.signdate" width="80" align="center" headerAlign="center" allowSort="true" >签订日期</div>
		                <div field="price" width="80" align="right" dataType="currency" headerAlign="center" allowSort="true" >价格</div>
		                <div field="startdate" width="100" align="center" headerAlign="center" allowSort="true" >开始服务日期</div>
		                <div field="expenddate" width="100" align="center" headerAlign="center" allowSort="true" >预计结束日期</div>
		                <div field="purOrder.signuserid" headerAlign="center" allowSort="true" visible="false">协议签订人员id</div>
		                <div field="empname" width="auto" headerAlign="center" allowSort="true">协议签订人员</div>
		                <div field="purOrder.calcycle" headerAlign="center" allowSort="true" visible="false">结算周期说明</div>
		                <div field="purOrder.purstatus" headerAlign="center" allowSort="true" renderer="dictorderstatus" visible="false">状态</div>
		                <div field="purOrder.contmemo" headerAlign="center" allowSort="true" visible="false">协议内容说明</div>
		                <div field="purOrder.processinstid" headerAlign="center" allowSort="true" visible="false">流程实例ID</div>
			    	</div>
			    </div>
			</div>
		</fieldset>
		
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>参与的项目列表</legend>
			<div style="padding:5px;">
				<div id="datagrid3" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="purProjOutpers" 
			    	url="com.primeton.eos.ame_pur.outperson.queryProjectlistByOutpersonno.biz.ext" showFooter="false" showPager="false" >
			    	<div property="columns">
		                <div field="projectno" width="100" headerAlign="center" allowSort="true">项目编号</div>
		                <div field="projectName" width="260" headerAlign="center" allowSort="true">项目名称</div>
		                <div field="miscustname" width="220" headerAlign="center" allowSort="true">所属客户</div>
		                <div field="workunit" width="80" headerAlign="center" align="center" allowSort="true" renderer="dictSERVNUMTYPE">计价单位</div>
		                <div field="price" width="80" headerAlign="center" dataType="currency" allowSort="true" align="right">价格</div>
		                <div field="inputratio" width="65" headerAlign="center" dataType="float" numberFormat="p" allowSort="true" align="right">投入比重</div>
		                <div field="currentstatus" width="80" headerAlign="center" align="center" allowSort="true" renderer="dictcurrentstatus">服务状态</div>
		                <div field="startdate" width="90" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">开始服务日期</div>
		                <div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">预计结束日期</div>
		                <div field="costenddate" width="90" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">最近结算日期</div>
		                <div field="accuenddate" width="90" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">最近计提日期</div>
		                <div field="actenddate" width="auto" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">实际结束日期</div>
			    	</div>
			    </div>
			</div>
		</fieldset>
			
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包人员相关的结算记录信息</legend>
			<div style="padding:5px;">
				<div id="datagrid2" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="purSettlelists" 
			    	url="com.primeton.eos.ame_pur.outperson.querySettlelistByOutpersonno.biz.ext" showFooter="false" showPager="false" >
			    	<div property="columns">
		                <div field="purSettle.settlementid" headerAlign="center" allowSort="true" visible="false">结算单编号</div>
		                <div field="setdetailid" headerAlign="center" allowSort="true" visible="false">结算单明细编号</div>
		                <div field="purOutperson.outperno" headerAlign="center" allowSort="true" visible="false">人员编号</div>
		                <div field="purorderid" headerAlign="center" allowSort="true" visible="false">采购订单ID</div>
		                <div field="purOutperno" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
		                <div field="setstartdate" width="100" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">结算开始日期</div>
		                <div field="setenddate" width="100" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">结算截止日期</div>
		                <div field="days" width="90" headerAlign="center" allowSort="true">工作日统计</div>
		                <div field="months" width="80" headerAlign="center" allowSort="true">人月数</div>
		                <div field="perprice" width="90" align="right" headerAlign="center" dataType="currency" allowSort="true" >人月单价</div>
		                <div field="setfee" width="110" align="right" headerAlign="center" dataType="currency" allowSort="true">工时结算费用</div>
		                <div field="othfee" width="80" align="right" headerAlign="center" dataType="currency" allowSort="true">其他费用</div>
		                <div field="totalfee" width="120" align="right" headerAlign="center" dataType="currency" allowSort="true">结算费用小计</div>
		                <div field="score" width="80" headerAlign="center" allowSort="true">打分</div>
		                <div field="evaluate" width="auto" headerAlign="center" allowSort="true">评价</div>
		                <div field="othmemo" headerAlign="center" allowSort="true" visible="false">其他说明</div>
			    	</div>
			    </div>
			</div>
		</fieldset>
		
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<!-- 
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;margin-right:20px;" id="sureButton">确定</a>
		 -->
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var grid = nui.get("datagrid1");
	  	var grid2 = nui.get("datagrid2");
	  	var grid3 = nui.get("datagrid3");
        var updateURL = "com.primeton.eos.ame_pur.ame_purcomponent.updatePurOutperson.biz.ext";
        //新增保存逻辑流路径
    	var addURL = "com.primeton.eos.ame_pur.ame_purcomponent.addPurOutperson.biz.ext";
    	var saveURL = "";        
        
        var outperno = getUrlParam("id");
        
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
		
		init();
		function init(){
			if(outperno){
				SetData({outperno: outperno}); 
			}else{
				SetData(data);
			}
		}
		
		//进入页面 设 值
	    function SetData(data){
	    	data = nui.clone(data);
			//nui.get("#sureButton").setEnabled(false);
			var json = nui.encode({purOutperson:data});   
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.outperson.getPurOutpersonDetail.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                	//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"purOutperson","relationid":o.purOutperson.outperno});
                    form.setData(o);
                    form.isChanged(false);
                    document.getElementById("purOutperson.outpername").innerHTML = o.purOutperson.outpername == null ? "" : o.purOutperson.outpername;
                    document.getElementById("purOutperson.outpercartno").innerHTML = o.purOutperson.outpercartno == null ? "" : o.purOutperson.outpercartno;
                    document.getElementById("purOutperson.linkemail").innerHTML = o.purOutperson.linkemail == null ? "" : o.purOutperson.linkemail;
                    document.getElementById("purOutperson.gender").innerHTML = o.purOutperson.gender == null ? "" : nui.getDictText('ABF_GENDER',o.purOutperson.gender);
                    document.getElementById("purOutperson.degree").innerHTML = o.purOutperson.degree == null ? "" :  nui.getDictText('DEGREE',o.purOutperson.degree);
                    document.getElementById("purOutperson.gradudate").innerHTML = o.purOutperson.gradudate == null ? "" : o.purOutperson.gradudate;
                    document.getElementById("purOutperson.linktel").innerHTML = o.purOutperson.linktel == null ? "" : o.purOutperson.linktel;
                    document.getElementById("custid").innerHTML = o.purOutperson.ryzjglcustname == null ? "" : o.purOutperson.ryzjglcustname;
                    document.getElementById("price").innerHTML = o.purOutperson.price == null ? "0.00" : o.purOutperson.price;
                    document.getElementById("startdate").innerHTML = o.purOutperson.startdate == null ? "" : o.purOutperson.startdate;
                    //document.getElementById("expenddate").innerHTML = o.purOutperson.expenddate == null ? "" : o.purOutperson.expenddate;
                    //document.getElementById("actenddate").innerHTML = o.purOutperson.actenddate == null ? "" : o.purOutperson.actenddate;
                    document.getElementById("currentstatus").innerHTML = o.purOutperson.currentstatus == null ? "" : nui.getDictText('AME_OUTPERSTATUS',o.purOutperson.currentstatus);
                    //document.getElementById("projectno").innerHTML = o.purOutperson.projectno == null ? "" : o.purOutperson.projectno;
                    //document.getElementById("miscustname").innerHTML = o.purOutperson.miscustname == null ? "" : o.purOutperson.miscustname;
                    document.getElementById("pcprotype").innerHTML = o.purOutperson.pcprotype == null ? "" : nui.getDictText('AME_PCPROTYPE',o.purOutperson.pcprotype);
                    document.getElementById("createdate").innerHTML = o.purOutperson.createdate == null ? "" : o.purOutperson.createdate;
                    document.getElementById("memo").innerHTML = o.purOutperson.memo == null ? "" : o.purOutperson.memo;
                    
                    document.getElementById("purOutperson.wxno").innerHTML = o.purOutperson.wxno == null ? "" : o.purOutperson.wxno;
                    
                    grid.load({outperno: nui.get("outperno").getValue()});
					grid2.load({outperno: nui.get("outperno").getValue()});
					grid3.sortBy("startdate","desc");
					grid3.load({outperno: nui.get("outperno").getValue()});
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
    	}
    	
    	//订单状态字典
    	function dictorderstatus(e) {
			return nui.getDictText('AME_SETSTATUS',e.value);//设置业务字典值
		}
		
		//服务状态
		function dictcurrentstatus(e){
			return nui.getDictText('AME_OUTPERSTATUS',e.value);
		}
		
		//计价单位
		function dictSERVNUMTYPE(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		} 
	
        //标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        //点击确认和取消按钮都调用关闭窗口
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
        
    </script>
</body>
</html>