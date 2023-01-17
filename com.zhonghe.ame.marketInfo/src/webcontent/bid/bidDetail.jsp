<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>投标信息详情</title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="投标信息查看" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 1100px;">
				<legend>投标信息</legend>
				<form id="form_expRei" method="post">
					
					<input name="expusername" id="expusername" class="nui-hidden"/>
					<input name="senderusername" id="senderusername" class="nui-hidden"/>
					<input id="empid" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label"  style="width: 100px" align = "right"> 投标项目</td>
					       		 <td>
									<input id="projectName" name="projectName" property="editor" class="nui-textbox"   allowInput="false" style="width:210px"/>
								</td>
								
								<td align="right" style="width: 100px">投标牵头部门：</td>
								<td style="width: 210px;"><input
									id="orgId"
									class="nui-textbox"  allowInput="false"
									style="width: 210px;" /></td>
								
								<td class="form_label" style="width: 100px" align="right">是否中标</td>
								<td colspan="1"><input class="nui-textbox"
									id="bidStatus" allowInput="false"
									name="bidStatus" shownullItem="true"
									style="width: 210px;" /> 
							</tr>
							<tr>
								<td align="right" style="width: 100px">投标金额(元)：</td>
								<td><input name="tbPrice" id="tbPrice"
									class="nui-textbox" allowInput="false" style="width: 210px;" format="n2"
									showbutton="false" inputStyle="text-align: left" />
								<td align="right" style="width: 100px">中标金额(元)：</td>
								<td><input name="bidPrice" id="price"
									class="nui-textbox" allowInput="false" style="width: 210px;" format="n2"
									showbutton="false" inputStyle="text-align: left" />
								</td>
									<td align="right" style="width: 100px">合同编号：</td>
								<td><input name="contractCode" id="contractCode"
									class="nui-textbox" allowInput="false" style="width: 210px" required="false" /></td>
		           				</td>
							</tr>
							<tr>
									<td align="right" style="width:100px">对应客户：</td>
								<td>
									<input name="custinfoId" id="custid"
									    class="nui-textbox"
										style="width: 210px" allowInput="false" required="true" />
									</td>
								<td align="right" style="width: 100px">招标代理单位：</td>
									<td><input name="proxyCompany" id="companytel" class="nui-textbox" style="width: 210px" allowInput="false"/></td>
									
								<td align="right" style="width: 100px">招标人采购方式：</td>
								<td><input name="bidMode" id="mode"
									class="nui-textbox" allowInput="false" style="width: 210px" required="false" /></td>	
							</tr>
							<tr>
								
								<td align="right" style="width: 100px">合同开始日期：</td>
								<td><input name="startTime" id="startTime"
									class="nui-textbox" allowInput="false" style="width: 210px" required="false" /></td>
									
									<td align="right" style="width: 100px">合同结束日期：</td>
								<td><input name="stopTime" id="stopTime"
									class="nui-textbox" allowInput="false" style="width: 210px" required="false" /></td>
								<td align="right" style="width: 100px">合同周期(月)：</td>
								<td><input name="contractCycle" id="contractcycle"
									class="nui-textbox" allowInput="false" style="width: 210px" required="false" /></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">开标日期：</td>
								<td style="width: 130px"><input
									name="bidOpenTime" id="openTime"
									class="nui-textbox" allowInput="false" style="width: 210px" /></td>
							</tr>
							<tr id="projectsize">
								<td align="right" style="width: 100px">工程规模：</td>
								<td colspan="5"><input name="projectSize" id="size" class="nui-textbox" 
									allowInput="false" style="width: 844px"/></td>
							</tr>
							<tr id="projectlocal">
								<td align="right" style="width: 100px">项目地点：</td>
								<td colspan="5"><input  name="projectLocal" id="local" class="nui-textbox" 
									allowInput="false" style="width: 844px"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset style="border: solid 1px #aaa;padding: 3px;width: 1100px;">
			    <legend>其他单位投标信息</legend>
			
	    	<div id="bidCom" class="nui-datagrid" style="width: 89%;height: auto;" allowCellSelect="true" 
	    		url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.getBidComInfo.biz.ext" dataField="bidCom"
	    		showPager="false" allowCellEdit="true" multiSelect="true">
	            <div property="columns">
	                <div field="custName" width="120" align="center" headerAlign="center" allowSort="true" >其他投标单位</div>
            		<div field="comBidPrice" width="80" align="center" headerAlign="center" allowSort="true" >投标金额</div>
	            </div>
	        </div>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        //报销记录
	  	var form_expRei = new nui.Form("form_expRei");
	  	var bidCom = nui.get("bidCom");
        init();
        function init(){
		  	var bidid=<%=request.getParameter("bidid")%>;
		  	var json = {id : bidid};   
		  	nui.ajax({	
					url: "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryBidByid.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (bidInfo) {
			       	  	var bidData = bidInfo.bidDetail;
			       	  	console.log(bidData);
			       	  	form_expRei.setData(bidData)
			       	  	nui.get("custid").setValue(bidData.custname);
			       	  	nui.get("companytel").setValue(bidData.proxycompany);
			       	  	nui.get("orgId").setValue(bidData.orgname);
			       	  	if(bidData.bidstatus == 1){
			       	  		nui.get("bidStatus").setValue("是");
			       	  	}else if(bidData.bidstatus == 0){
							nui.get("bidStatus").setValue("否");
			       	  	}
			       	  	 nui.get("price").setValue(bidData.bidprice);
			       	  	 nui.get("openTime").setValue(bidData.opentime);
			       	  	nui.get("contractcycle").setValue(bidData.contcycle);
			       	  	/* nui.get("submitstatus").setValue(bidData.submitStatus); */
			       	  	nui.get("mode").setValue(bidData.bidMode);
			       	  	nui.get("size").setValue(bidData.projectsize);
			       	  	nui.get("local").setValue(bidData.projectlocal); 
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    });
			bidCom.load(json)
        }
        
    </script></body>
</html>
