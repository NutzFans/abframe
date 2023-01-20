<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2017-04-24 11:47:03
  - Description:
  - 测试合同编号：2017-S029
-->
<head>
	<title>新增收入确认票</title>
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
		<form id="form_cont" method="post">
			<input class="nui-hidden" name="csNewbill.billid" id="billid"/>
			<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file1">
						<tr>
							<td align="right" style="width:130px"></td>
							<td style="width:190px"></td>
							<td align="right" style="width:130px"></td>
							<td style="width:150px"></td>
							<td align="right" style="width:130px"></td>
							<td style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">合同编号：</td>
							<td id="contnum" style="width:190px;"></td>
							<td align="right" style="width:130px">合同名称：</td>
							<td id="projectname" style="width: 430px;" colspan="3"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">客户：</td>
							<td id="miscustname" style="width:190px;"></td>
							<td align="right" style="width:130px">受益人：</td>
							<td id="salename" style="width:150px;"></td>
							<td align="right" style="width:130px">合同收入类型：</td>
							<td id="incometype" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">合同金额：</td>
							<td id="contsum" style="width:190px"></td>
							<td align="right" style="width:130px">已确认收入：</td>
							<td id="income" style="width:150px"></td>
							<td align="right" style="width:130px">未确认收入：</td>
							<td id="outcome" style="width:150px"></td>
						</tr>
						<tr>
		                    <td style="width:130px;" align="right">合同产品金额：</td>
		                    <td style="width:190px;" id="csContract.prodmon"></td>
		                    <td style="width:130px;" align="right">合同服务金额：</td>
		                    <td style="width:150px;" id="csContract.servmon"></td>
		                    <td style="width:130px;display:none;" align="right">合同MA金额：</td>
		                    <td style="width:150px;display:none;" id="csContract.masum"></td>
						</tr>
					</table>
				</div>
	        </fieldset>
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 97.5%;">
	            <legend>合同收入记录列表</legend>
            	<div id="csReveForecastGrid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
            		dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCsReveForecastSum" showPager="false" 
			    	url="com.primeton.eos.ame_income.gatherFcBilling.getCsReveForecastsByCscontract.biz.ext" multiSelect="true"
			    	onselectionchanged="chooiseCsReve" allowUnselect="true">
			    	<!-- onselectionchanged="chooiseGatherFc" onlyCheckSelection="true" -->
					<div property="columns">
						<div type="checkcolumn" width="25"></div>
						<div field="reveno" width="55" align="center" headerAlign="center">收入次数</div>
						<div field="status" width="55" align="center" headerAlign="center" renderer="dictstatus">收入状态</div>
						<div field="revetype" width="110" align="center" headerAlign="center" renderer="dictReveType">收入类型</div>	
						<div field="newyearmonth" width="80" align="center"  headerAlign="center" visible="false">预计收入年月</div>
						<div field="actsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">实际确认金额（含税）</div>	
						<div field="confirmday" width="80" align="center" headerAlign="center">实际收入日期</div>
						<div field="actproductsum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">实际确认产品金额（含税）</div>
						<div field="actservicesum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">实际确认服务金额（含税）</div>
						<div field="fcreverate" width="75" align="center" headerAlign="center" numberFormat="p1" visible="false">预计确认比例</div>
					</div>
				</div>
	        </fieldset>
	        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 97.5%;" id="kpcpxxxx">
	            <legend>开票产品详细信息</legend>
	            <div style="padding:5px;">
		        	<div id="prod_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
		        		oncellendedit="doCal" onselect="prodGridOnselect" ondeselect="prodGridOnselect" showPager="false" 
		        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
		        		onlyCheckSelection="true">			        
				        <div property="columns">
				        	<div type="checkcolumn"></div> 
				            <div field="conProId" width="0" headerAlign="center" >conProId</div>
				            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
				            <div field="prod_name" width="80" headerAlign="center">产品名称</div>
				            <div field="prodmon" width="80" dataType="currency" headerAlign="center" align="right">产品金额</div>
				            <div field="price" width="80" dataType="currency" headerAlign="center" align="right">开票单价
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="num" width="60" headerAlign="center" align="right">开票数量
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n0"/>
				            </div>
				            <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">开票单位
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="UNIT"/>
				            </div>
				            <div field="money" width="100" dataType="currency" headerAlign="center" align="right" >产品开票金额
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="tax" width="80" headerAlign="center" dataType="currency" align="right">税金
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="taxrate" width="60" headerAlign="center" dataType="currency" align="right">税率
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				        </div>
				    </div>
	            </div>
	            <div style="width: 700px;height: 25px;margin-left: 35px;float:left;">
					<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right" style="width: 120px;"></td>
							<!-- 产品金额 -->
							<td id="prodmonTotal" style="width: 100px;" align="right" ></td>
							<!-- 开票单价 -->
							<td id="prodPriceTotal" style="width: 0px;" align="right" ></td>
							<!-- 开票数量 -->
							<td id="prodNumTotal" style="width: 140px;" align="right" ></td>
							<td style="width: 60px;" align="right" ></td>
							<!-- 产品开票金额 -->
							<td id="prodMoneyTotal" style="width: 100px;" align="right" ></td>
							<!-- 产品税金金额 -->
							<td id="prodTaxTotal" style="width: 80px;" align="right" ></td>
							<!-- 产品销售金额 -->
							<td id="prodU8xseTotal" style="width: 90px;" align="right" ></td>
						</tr>
					</table>
				</div>
	        </fieldset>
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 97.5%;" id="kpfwxxxx">
	            <legend>开票服务详细信息</legend>
	            <div style="padding:5px;">
		        	<div id="serv_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="false" 
		        		oncellendedit="doCal" onselect="servGridOnselect" ondeselect="servGridOnselect" showPager="false" 
		        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
		        		onlyCheckSelection="true">			        
				        <div property="columns">    
				        	<div type="checkcolumn"></div>  
				        	<div field="contsaleid" width="0" headerAlign="center" >contsaleid</div> 
				            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
				            <div field="servmon" width="80" dataType="currency" headerAlign="center" align="right">服务金额</div>
				            <div field="servname" width="80" headerAlign="center" align="left" renderer="onServRenderer">服务名称
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_SERVNAME"/>
				            </div>
				            <div field="price" width="80" headerAlign="center" dataType="currency" align="right">开票单价
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="num" width="60" headerAlign="center" align="right" align="right">开票数量
					            <input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n0"/>
				            </div>
				            <div field="money" width="100" headerAlign="center" dataType="currency" align="right">服务开票金额
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="tax" width="80" headerAlign="center" dataType="currency" align="right">税金
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="taxrate" width="60" headerAlign="center" dataType="currency" align="right">税率
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
							</div>
				            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				        </div>    
				    </div>
	            </div>
	            <div style="width: 600px;height: 25px;margin-left: 35px;float:left;">
					<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!-- 服务金额 -->
							<td align="right" style="width: 40px;"></td>
							<td id="servMonTotal" style="width: 100px;" align="right" ></td>
							<td align="right" style="width: 100px;"></td>
							<!-- 开票单价 -->
							<td id="servPriceTotal" style="width: 60px;" align="right" ></td>
							<!-- 开票数量 -->
							<td id="servNumTotal" style="width: 60px;" align="right" ></td>
							<!-- 产品开票金额 -->
							<td id="servMoneyTotal" style="width: 100px;" align="right" ></td>
							<!-- 产品税金金额 -->
							<td id="servTaxTotal" style="width: 80px;" align="right" ></td>
							<!-- 产品销售金额 -->
							<td id="servU8xseTotal" style="width: 105px;" align="right" ></td>
						</tr>
					</table>
				</div>
	        </fieldset>
        
	        <!-- 提供开票基本信息输入（开票单位、开票类型、开票账户信息、预计到款时间，发票邮寄信息） -->
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 97.5%;">
	        	<legend id="billTitle">开票信息</legend>
				<div style="padding:5px;">
					<input name="csNewbill.appname" id="appname" class="nui-hidden"/>
					<input name="csNewbill.fileids" id="fileids1" class="nui-hidden"/>
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:90px">开票产品金额：</td>
							<td style="width: 310px;">
								<!--  allowInput="false" 不允许输入 -->
								<input name="csNewbill.billprodmon" id="billprodmon" class="nui-spinner" inputStyle="text-align: right" style="width:120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" />
							</td>
							<td align="right" style="width:100px">开票服务金额：</td>
							<td style="width: 210px;">
								<input name="csNewbill.billservmon" id="billservmon" class="nui-spinner"inputStyle="text-align: right" style="width:120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" />
							</td>
							<td align="right" style="width:85px">开票金额：</td>
							<td>
								<input name="csNewbill.billsummon" id="billsummon" class="nui-spinner" inputStyle="text-align: right" style="width: 120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" />
							</td>
						</tr>
						<tr>
		                	<td align="right" style="width:130px">开票类型：</td>
							<td>
								<input name="csNewbill.billtype" id="billtype" class="nui-dictcombobox" dictTypeId="BILLTYPE" required="true" style="width: 100px" />
							</td>
							<td align="right" style="width:100px">税号：</td>
							<td colspan="3">
								<input name="csNewbill.taxnumb" id="taxnumb" class="nui-textbox" style="width: 200px" />
								<span style="color: #FF5254;font-weight: bold;">请确认是最新税号</span>
							</td>
		                </tr>
						<tr id="temp1" >
							<td align="right" style="width:90px">客户名称：</td>
							<td>
								<input name="csNewbill.billcompid" id="custname" class="nui-buttonedit" onbuttonclick="selectMisCust" style="width: 300px" />
							</td>
							<td align="right" style="width:100px">开票单位：</td>
							<td>
								<input name="csNewbill.accoutname" id="accoutname" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width:85px">账号：</td>
							<td>
								<input name="csNewbill.accountid" id="accountid" class="nui-textbox" style="width: 135px" />
							</td>
						</tr>
						<tr id="temp2" >
							<td align="right" style="width:90px">开户银行：</td>
							<td>
								<input name="csNewbill.accoutbank" id="accoutbank" class="nui-textbox" style="width: 300px" />
							</td>
							<td align="right" style="width:100px">开票单位电话：</td>
							<td>
								<input name="csNewbill.telephone" id="telephone" class="nui-textbox" style="width: 200px" />
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr id="temp3" >
							<td align="right" style="width:90px">开票单位地址：</td>
							<td>
								<input name="csNewbill.address" id="address" class="nui-textbox" style="width: 300px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:90px">发票邮寄地址：</td>
							<td>
								<input name="csNewbill.mailingaddress" id="mailingaddress" class="nui-textbox" style="width: 300px" />
							</td>
							<td align="right" style="width:100px">发票邮寄联系人：</td>
							<td>
								<input name="csNewbill.mailinglinkman" id="mailinglinkman" class="nui-textbox" style="width: 100px" />
							</td>
							<td align="right" style="width:85px">发票邮寄电话：</td>
							<td>
								<input name="csNewbill.mailinglinktel" id="mailinglinktel" class="nui-textbox" style="width: 135px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px" >开票日期：</td>
							<td>
								<input name="csNewbill.billdate" id="billdate" class="nui-datepicker" style="width: 100px" required="true" />
							</td>
						</tr>
					</table>
				</div>
	        </fieldset>
	        	
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 97.5%;">
	        	<legend id="ticketTitle">发票信息</legend>
	        	<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                    	<a class="nui-button" iconCls="icon-add" onclick="addRow('ticket')">增加</a>
			                    	<a class="nui-button" iconCls="icon-remove" onclick="removeRow('ticket')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	        	<div style="padding:5px;">
		        	<div id="ticket_grid" class="nui-datagrid" style="width: 970px;height:auto;" allowResize="false" 
		        		showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
		        		editNextOnEnterKey="true" onlyCheckSelection="true" 
		        		onselect="ticketGridOnselect" ondeselect="ticketGridOnselect" oncellendedit="doCal_ticket">			        
				        <div property="columns">    
				        	<div type="checkcolumn" width="30"></div>
				        	<div field="ticketid" width="0" headerAlign="center" >TICKETID</div>
				            <div field="type" width="60" headerAlign="center" align="left" renderer="onTypeRenderer" >发票类型
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_BILLTICKET_TYPE"/>
				            </div>
				            <div field="status" width="90" headerAlign="center" align="left" renderer="onStatusRenderer" >发票状态
				            	<!-- <input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_BILLSTATUS"/> -->
				            </div>
				            <div field="money" width="90" headerAlign="center" dataType="currency" align="right">发票金额(含税)
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="tax" width="90" headerAlign="center" dataType="currency" align="right">税金
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="taxrate" width="90" headerAlign="center" dataType="currency" align="right">税率
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="billno" width="auto" headerAlign="center" align="left" align="right">票号
				            	<input property="editor" class="nui-textbox" style="width:100%;" />
				            </div>
				            <div field="ticketdate" width="80" headerAlign="center" align="left" align="right" dateFormat="yyyy-MM-dd">发票日期
				            	<input property="editor" class="nui-datepicker" style="width:100%;" />
				            </div>
				            <div field="czticketid" width="0" headerAlign="center" >CZTICKETID</div>
				            <div field="action" width="60" headerAlign="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
				            <div field="contsaleids" width="0" headerAlign="center"  cellStyle="padding:0;" >contsaleids</div>
				        	<div field="conProIds" width="0" headerAlign="center" >conProIds</div>
				        </div>    
				    </div>
	            </div>
	            <div style="width: 300px;height: 25px;margin-left: 35px;float:left;">
					<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right" style="width: 170px;"></td>
							<!-- 发票金额 -->
							<td id="ticketMoneyTotal" style="width: 100px;" align="right" ></td>
						</tr>
					</table>
				</div>
	        </fieldset>
		</form>
	</div>
	
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;" id="canelButton">关闭</a>
	</div>
	
	<div id="win1" class="nui-window" title="开票产品详细信息" style="width: 900px;height: auto;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
    	<div style="padding:5px;">
        	<div id="prod_grid_chooise" class="nui-datagrid" style="width: 870px;height: auto;" allowResize="true" 
        		showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
        		editNextOnEnterKey="true" allowUnselect="true">			        
		        <div property="columns">
		        	<div type="checkcolumn" width="30"></div>
		            <div field="conProId" width="60" headerAlign="center" >conProId</div>
		            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
		            <div field="prod_name" width="180" headerAlign="center">产品名称</div>
		            <div field="prodmon" width="100" dataType="currency" headerAlign="center" align="right">产品金额</div>
		        </div>
		    </div>
	        <div class="nui-toolbar" style="text-align:center;width: 862px;height: 30px;">
		        <a class="nui-button" onclick="sureChooise('0')" style="">确定</a>
		        <a class="nui-button" onclick="hideWindow('0')" style="margin-left: 20px">关闭</a>
		    </div>
        </div>
    </div>
    <div id="win2" class="nui-window" title="开票服务详细信息" style="width: 800px;height: auto;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
        <div style="padding:5px;">
        	<div id="serv_grid_chooise" class="nui-datagrid" style="width: 770px;height:auto;" allowResize="false" 
        		showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
        		editNextOnEnterKey="true" allowUnselect="true">			        
		        <div property="columns">    
		        	<div type="checkcolumn" width="30"></div>
		        	<div field="contsaleid" width="60" headerAlign="center" >contsaleid</div> 
		            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
		            <div field="servmon" width="100" dataType="currency" headerAlign="center" align="right">服务金额</div>
		        </div>    
		    </div>
	        <div class="nui-toolbar" style="text-align:center;width: 762px;height: 30px;">
		        <a class="nui-button" onclick="sureChooise('1')" style="">确定</a>
		        <a class="nui-button" onclick="hideWindow('1')" style="margin-left: 20px">关闭</a>
		    </div>
        </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_cont = new nui.Form("form_cont");
	//合同收款
	var csReveForecastGrid = nui.get("csReveForecastGrid");
	//开票产品详细信息
	var prod_grid = nui.get("prod_grid");
	//开票服务详细信息
	var serv_grid = nui.get("serv_grid");
	//发票信息
	var ticket_grid = nui.get("ticket_grid");
	//发票行数
	var ticketSumRows = 0;
	//要选择的开票产品详细信息
	var prod_grid_chooise = nui.get("prod_grid_chooise");
	//要选择的开票服务详细信息
	var serv_grid_chooise = nui.get("serv_grid_chooise");
	/**
	 * 页面加载时被调用的方法
	 */
	function SetData(row){
		//alert(nui.encode(row.doneSureBill));
		/*
		{"doneSureBill":{"contnum":"2010-L031","contractid":70886,"actsum":180000,"yymoney":null,"ywmoney":null,
		"custname":"上海三菱电梯有限公司","custid":3287,"ywactsum":180000}}
		*/
		var json = {"csContract": {"contractid": row.doneSureBill.contractid}};
		nui.ajax({
            url: "com.primeton.eos.ame_income.gatherFcBilling.getDoneSureBill.biz.ext",
            data: json,
            type: 'POST',
            contentType: 'text/json',
            success: function (o) {
            	document.getElementById("projectname").innerHTML = o.csContract.projectname == null ?"": o.csContract.projectname;
            	nui.get("contractid").setValue(o.csContract.contractid);
            	document.getElementById("contnum").innerHTML = o.csContract.contnum == null ? "" : o.csContract.contnum;
            	document.getElementById("miscustname").innerHTML = o.csContract.misCustinfo.custname == null ? "" : o.csContract.misCustinfo.custname;
            	document.getElementById("salename").innerHTML = o.csContract.salename == null ? "" : o.csContract.salename;
            	document.getElementById("contsum").innerHTML = o.csContract.contsum == null || o.csContract.contsum == 0 ? "0.00" : toThousands(o.csContract.contsum,'#,##.##');
            	document.getElementById("income").innerHTML = o.csContract.income == null || o.csContract.income == 0 ? "0.00" : toThousands(o.csContract.income,'#,##.##');
				document.getElementById("outcome").innerHTML = o.csContract.outcome == null || o.csContract.outcome == 0 ? "0.00" : toThousands(o.csContract.outcome,'#,##.##');
				document.getElementById("incometype").innerHTML = o.csContract.incometype == null || o.csContract.incometype == 0 ? "" : nui.getDictText('MIS_HTINCOMETYPE',o.csContract.incometype);
				document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon == null || o.csContract.servmon == 0 ? "0.00" : toThousands(o.csContract.servmon,'#,##.##');
                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon == null || o.csContract.prodmon == 0 ? "0.00" : toThousands(o.csContract.prodmon,'#,##.##');
                document.getElementById("csContract.masum").innerHTML = o.csContract.masum == null || o.csContract.masum == 0 ? "0.00" : toThousands(o.csContract.masum,'#,##.##');
                //客户
				nui.get("custname").setValue(o.csContract.misCustinfo.custid);
                nui.get("custname").setText(o.csContract.misCustinfo.custname);
    			var myDate = new Date();    
 				myDate.toLocaleDateString();
    			nui.get("billdate").setValue(myDate);
				var json2 = {"csContract": {"contnum": o.csContract.contnum}};
				csReveForecastGrid.load(json2,function (){
					prod_grid.setData(o.csContractProds);
					serv_grid.setData(o.csContractsales);
					ticket_grid.setData(o.csTickets);
					ticketSumRows = ticket_grid.getData().length;
					prod_grid_chooise.setData(o.csBillProds);
					serv_grid_chooise.setData(o.csBillSales);
				});
            }
        });
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
		
	/**
	 * 汇总行
	 */
	function doCsReveForecastSum(e){
        if (e.field == "actproductsum" || e.field == "actservicesum" || e.field == "actsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
		
	/**
	 * 收入预估状态
	 */
	function dictstatus(e){
		return nui.getDictText('AME_REVESTATUS',e.value);
	}
		
	/**
	 * 收入确认类型
	 */
	function dictReveType(e){
		return nui.getDictText('AME_REVETYPE',e.value);
	}
		
	/**
	 * 服务名称
	 */
	function onServRenderer(e){
    	return nui.getDictText('CS_SERVNAME',e.value);
    }
	    
    /**
     * 产品单位
     */
    function onUnitRenderer(e){
    	return nui.getDictText('UNIT',e.value);
    }
	    
    /**
     * 服务单位
     */
    function onServNumTypeRenderer(e){
    	return nui.getDictText('SERV_NUM_TYPE',e.value);
    }
	    
    /**
     * 开票与发票类型
     */
    function onTypeRenderer(e){
    	return nui.getDictText('CS_BILLTICKET_TYPE',e.value);
    }
	    
    /**
     * 发票状态
     */
    function onStatusRenderer(e){
    	return nui.getDictText('CS_BILLSTATUS',e.value);
    }
	    
    /**
     * 冲正操作
     */
    function onActionRenderer(e) {
        var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s = null;
        if(record.status == "1" || record.ticketid != null){
            s = '<a class="Edit_Button" style="padding-left: 20px;" href="javascript: editRow(\'' + uid + '\')" >冲正</a>' ;
        }else if(record.status != "1" && record.ticketid == null && 
        	(record.conProIds == null || record.conProIds == "") && 
        	(record.contsaleids == null || record.contsaleids == "")){
        	s = '<a class="Edit_Button" style="padding-left: 20px;" href="javascript: chooiseBill(\'' + uid + '\')">关联</a>';
        }else if(record.status != "1" && 
			(record.ticketid == null || record.ticketid == "" || typeof(record.ticketid) == "undefined") && 
			(record.czticketid == null || record.czticketid == "") && 
			(record.conProIds != null || record.contsaleids != null)){
        	s = '<a class="Edit_Button" style="padding-left: 13px;" href="javascript: chooiseBill(\'' + uid + '\')">已关联</a>';
        }else if(record.status != "1" && (record.ticketid == null || record.ticketid == "") && 
        			(record.conProIds != null || record.contsaleids != null) && record.czticketid != null){
        	s = '<span style="padding-left: 13px">已冲正</span>';
        }
        return s;
    }
        
    /**
     * 冲正操作
     */
    function editRow(row_uid) {
    	var row = ticket_grid.getRowByUID(row_uid);
    	var newRow = {};
    	var myDate = new Date(); 
    	//开票日期
		if(row.ticketdate){
			myDate = row.ticketdate;
		}else{ 
 			myDate.toLocaleDateString();
		}
    	if(row.type == "0"){
    		newRow = { name: "New Row",
				status: 3,
				type: row.type,
				money: 0-row.money,
				ticketdate:myDate,
				czticketid: row.ticketid,
				conProIds: row.billsubid
			};
    	}
    	if(row.type == "1"){
        	newRow = { name: "New Row",
				status: 3,
				type: row.type,
				money: 0-row.money,
				ticketdate:myDate,
				czticketid: row.ticketid,
				contsaleids: row.billsubid
			};
    	}
		var rowIndex = ticketSumRows + 1;
		ticketSumRows = rowIndex;
		ticket_grid.addRow(newRow, rowIndex);
    }
        
    //选择开票产品或开票服务，操作时，必须先选择发票类型。
    var chooiseTicketGridRow = "";
    function chooiseBill(row_uid){
    	var row = ticket_grid.getRowByUID(row_uid);
    	chooiseTicketGridRow = row;
    	if(row.type){
    		if(row.type=="0"){
        		//row.type=="0"产品票
        		showAtPos("0",row.conProIds,row.contsaleids);
    		}else if(row.type=="1"){
        		//row.type=="1"服务票
    			showAtPos("1",row.conProIds,row.contsaleids);
    		}
    	}else{
    		nui.alert("请选择发票类型！");
    	}
    }
		
	function showAtPos(e,conProIds,contsaleids) {
        var win;
        if(e == "0"){
        	if(typeof(conProIds) == "undefined"){
        		//开票产品
        		win = nui.get("win1");
        	}else{
	        	//将conProIds转成字符串类型
		        conProIds = conProIds + "";
	        	//开票产品
	        	win = nui.get("win1");
	        	if(conProIds != null){
		        	prod_grid_chooise.selectAll(false);
		        	var rows = prod_grid_chooise.getSelecteds();
		        	for(var i = 0;i < rows.length;i ++){
		        		var billid = nui.get("billid").getValue();
		        		//alert("billid:" + billid + "~" + rows[i].billid);
		        		if(conProIds.indexOf(rows[i].conProId) == "-1"){
				        	prod_grid_chooise.deselect(rows[i]);
		        		}
		        	}
	        	}
        	}
        }else if(e == "1"){
        	if(typeof(contsaleids) == "undefined"){
        		//开票服务
        		win = nui.get("win2");
        	}else{
	        	//将contsaleids转成字符串类型
	        	contsaleids = contsaleids + "";
	        	//开票服务
	        	win = nui.get("win2");
	        	if(contsaleids != null){
		        	serv_grid_chooise.selectAll(false);
		        	var rows = serv_grid_chooise.getSelecteds();
		        	for(var i = 0;i < rows.length;i ++){
		        		if(contsaleids.indexOf(rows[i].contsaleid) == "-1" ){
				        	serv_grid_chooise.deselect(rows[i]);
		        		}
		        	}
	        	}
        	}
    	}
        win.showAtPos("center", "middle");
    }
    function hideWindow(e) {
        var win;
        if(e == "0"){
        	//开票产品
        	win = nui.get("win1");
        	prod_grid_chooise.deselectAll();//clearSelect 
        }else if(e == "1"){
        	//开票服务
        	win = nui.get("win2");
        	serv_grid_chooise.deselectAll();
        }
        win.hide();
    }
    function sureChooise(e){
    	var rows = "";
    	if(e == "0"){
        	//开票产品
        	rows = prod_grid_chooise.getSelecteds();
        	var conProIds = "";
        	for(var i = 0;i < rows.length;i ++){
        		if(conProIds){
        			conProIds += "," + rows[i].conProId;
        		}else{
	        		conProIds = rows[i].conProId;
        		}
        	}
        	chooiseTicketGridRow.conProIds = conProIds;
        	ticket_grid.updateRow(chooiseTicketGridRow,{});
        	hideWindow("0");
        }else if(e == "1"){
        	//开票服务
        	rows = serv_grid_chooise.getSelecteds();
        	var contsaleids = "";
        	for(var i = 0;i < rows.length;i ++){
        		if(contsaleids){
        			contsaleids += "," + rows[i].contsaleid;
        		}else{
	        		contsaleids = rows[i].contsaleid;
        		}
        	}
        	chooiseTicketGridRow.contsaleids = contsaleids;
        	ticket_grid.updateRow(chooiseTicketGridRow,{});
        	hideWindow("1");
        }
    }
		
	/**
	 * 选择收入确认记录
	 */
	function chooiseCsReve(){
		var rows = csReveForecastGrid.getSelecteds();
		//收入类型
		var sktype = "";
		if(rows){
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].status != "3" ){
        			nui.alert("只有收入状态为【已确认】的合同收入记录才能勾选！","系统提示",function(){
        				csReveForecastGrid.deselect(rows[i]);
        			});
        			return;
        		}
				if(sktype){
        			if(sktype.indexOf(rows[i].revetype + "") == "-1"){
        				sktype = sktype + "," + rows[i].revetype;
        			}
        		}else{
        			sktype = rows[i].revetype + "";
        		}
			}
		}
		//0,3,4产品		1,5,2服务
		//产品开票详细信息kpcpxxxx
		if(sktype.indexOf("0") != "-1" || sktype.indexOf("3") != "-1" || sktype.indexOf("4") != "-1" || sktype.indexOf("1") != "-1"){
			document.getElementById("kpcpxxxx").style.display = "";
		}else if(sktype.indexOf("0") == "-1" && sktype.indexOf("3") == "-1" && sktype.indexOf("4") == "-1"){
			document.getElementById("kpcpxxxx").style.display = "none";
			prod_grid.deselectAll(true);
		}
		//服务开票详细信息kpfwxxxx
		if(sktype.indexOf("1") != "-1" || sktype.indexOf("2") != "-1" || sktype.indexOf("5") != "-1"){
			document.getElementById("kpfwxxxx").style.display = "";
		}else if(sktype.indexOf("1") == "-1" && sktype.indexOf("2") == "-1" && sktype.indexOf("5") == "-1"){
			document.getElementById("kpfwxxxx").style.display = "none";
			serv_grid.deselectAll(true);
		}
	}
		
	/**
	 * 选择开票产品详细信息行
	 */
	function prodGridOnselect(){
		var rows1 = prod_grid.getSelecteds();
		//产品金额合计
		var prodmonSum = 0;
		//产品开票单价合计
		var prodPriceSum = 0;
		//产品开票数量合计
		var prodNumSum = 0;
		//产品开票金额合计
		var prodMoneySum = 0;
		var prodTaxSum = 0;
		var prodU8xseSum = 0;
		if(rows1.length > 0){
			for(var i = 0;i < rows1.length;i ++){
				var num = 0;
				var price = 0;
				if(rows1[i].num){
					num = rows1[i].num;
					prodNumSum += parseFloat(rows1[i].num);
				}
				if(rows1[i].price){
					price = rows1[i].price;
					prodPriceSum += parseFloat(rows1[i].price);
				}
				if(rows1[i].prodmon){
					prodmonSum += parseFloat(rows1[i].prodmon);
				}
				if(rows1[i].money){
					prodMoneySum += parseFloat(rows1[i].money);
				}
				if(rows1[i].tax){
					prodTaxSum += parseFloat(rows1[i].tax);
				}
				if(rows1[i].u8xse){
					prodU8xseSum += parseFloat(rows1[i].u8xse);
				}
			}
		}
		//产品金额
		document.getElementById("prodmonTotal").innerHTML = toThousands(parseFloat(prodmonSum).toFixed(2),'#,##.##');
		//开票单价
		document.getElementById("prodPriceTotal").innerHTML = toThousands(parseFloat(prodPriceSum).toFixed(2),'#,##.##');
		//开票数量
		document.getElementById("prodNumTotal").innerHTML = parseFloat(prodNumSum).toFixed(0);
		//产品开票金额
		document.getElementById("prodMoneyTotal").innerHTML = toThousands(parseFloat(prodMoneySum).toFixed(2),'#,##.##');
		document.getElementById("prodTaxTotal").innerHTML = toThousands(parseFloat(prodTaxSum).toFixed(2),'#,##.##');
		document.getElementById("prodU8xseTotal").innerHTML = toThousands(parseFloat(prodU8xseSum).toFixed(2),'#,##.##');
		
		nui.get("billprodmon").setValue(prodMoneySum.toFixed(2));
		nui.get("billsummon").setValue(nui.get("billservmon").getValue() + prodMoneySum);
	}
		
	/**
	 * 选择开票服务详细信息行
	 */
	function servGridOnselect(){
		//服务金额合计
		var servmonSum = 0;
		//服务开票单价合计
		var servPriceSum = 0;
		//服务开票数量合计
		var servNumSum = 0;
		//服务开票金额合计
		var servMoneySum = 0;
		var servTaxSum = 0;
		var servU8xseSum = 0;
		var rows2 = serv_grid.getSelecteds();
		if(rows2.length > 0){
			for(var i = 0;i < rows2.length;i ++){
				var num = 0;
				var price = 0;
				if(rows2[i].num){
					num = rows2[i].num;
					servNumSum += parseFloat(rows2[i].num);
				}
				if(rows2[i].price){
					price = rows2[i].price;
					servPriceSum += parseFloat(rows2[i].price);
				}
				if(rows2[i].servmon){
					servmonSum += parseFloat(rows2[i].servmon);
				}
				if(rows2[i].money){
					servMoneySum += parseFloat(rows2[i].money);
				}
				if(rows2[i].tax){
					servTaxSum += parseFloat(rows2[i].tax);
				}
				if(rows2[i].u8xse){
					servU8xseSum += parseFloat(rows2[i].u8xse);
				}
			}
		}
		//服务金额
		document.getElementById("servMonTotal").innerHTML = toThousands(parseFloat(servmonSum).toFixed(2),'#,##.##');
		//服务开票单价
		document.getElementById("servPriceTotal").innerHTML = toThousands(parseFloat(servPriceSum).toFixed(2),'#,##.##');
		//服务开票数量
		document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(0);
		//开票服务金额
		document.getElementById("servMoneyTotal").innerHTML = toThousands(parseFloat(servMoneySum).toFixed(2),'#,##.##');
		document.getElementById("servTaxTotal").innerHTML = toThousands(parseFloat(servTaxSum).toFixed(2),'#,##.##');
		document.getElementById("servU8xseTotal").innerHTML = toThousands(parseFloat(servU8xseSum).toFixed(2),'#,##.##');
		
		nui.get("billservmon").setValue(servMoneySum.toFixed(2));
		nui.get("billsummon").setValue(nui.get("billprodmon").getValue() + servMoneySum);
	}
		
	//编辑开票产品详细信息和开票服务详细信息
	function doCal(e){
		var rows1 = prod_grid.getData();
		//产品金额合计
		var prodmonSum = 0;
		//产品开票单价合计
		var prodPriceSum = 0;
		//产品开票数量合计
		var prodNumSum = 0;
		//产品开票金额合计
		var prodMoneySum = 0;
		if(rows1.length > 0){
			for(var i = 0;i < rows1.length;i ++){
				var num = 0;
				var price = 0;
				if(rows1[i].num){
					num = rows1[i].num;
					prodNumSum += parseFloat(rows1[i].num);
				}
				if(rows1[i].price){
					price = rows1[i].price;
					prodPriceSum += parseFloat(rows1[i].price);
				}
				var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
				var rowData = {money: money};
				prod_grid.updateRow(rows1[i],rowData);
				var taxrate = rows1[i].taxrate;
				if(taxrate == 0 || taxrate=="" || taxrate == null){
					var rowData = {taxrate: parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'))};
					prod_grid.updateRow(rows1[i],rowData);
				}
				taxrate = parseFloat(rows1[i].taxrate);
				var u8xse = money/(1+taxrate);
				var tax = money - u8xse;
				var rowData = {u8xse:u8xse,tax:tax};
				prod_grid.updateRow(rows1[i],rowData);
				if(rows1[i].prodmon){
					prodmonSum += parseFloat(rows1[i].prodmon);
				}
				if(rows1[i].money){
					prodMoneySum += parseFloat(rows1[i].money);
				}
			}
			if(prod_grid.isSelected(e.row)){
				//产品金额
				document.getElementById("prodmonTotal").innerHTML = toThousands(parseFloat(prodmonSum).toFixed(2),'#,##.##');
				//开票单价
				document.getElementById("prodPriceTotal").innerHTML = toThousands(parseFloat(prodPriceSum).toFixed(2),'#,##.##');
				//开票数量
				document.getElementById("prodNumTotal").innerHTML = parseFloat(prodNumSum).toFixed(0);
				//产品开票金额
				document.getElementById("prodMoneyTotal").innerHTML = toThousands(parseFloat(prodMoneySum).toFixed(2),'#,##.##');
			}
			prodGridOnselect();
		}
		
		//服务金额合计
		var servmonSum = 0;
		//服务开票单价合计
		var servPriceSum = 0;
		//服务开票数量合计
		var servNumSum = 0;
		//服务开票金额合计
		var servMoneySum = 0;
		var rows2 = serv_grid.getData();
		if(rows2.length > 0){
			for(var i = 0;i < rows2.length;i ++){
				var num = 0;
				var price = 0;
				if(rows2[i].num){
					num = rows2[i].num;
					servNumSum += parseFloat(rows2[i].num);
				}
				if(rows2[i].price){
					price = rows2[i].price;
					servPriceSum += parseFloat(rows2[i].price);
				}
				var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
				var rowData = {money: money};
				serv_grid.updateRow(rows2[i],rowData);
				var taxrate = rows2[i].taxrate;
				if(taxrate == 0 || taxrate=="" || taxrate == null){
					var rowData = {taxrate: parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'))};
					serv_grid.updateRow(rows2[i],rowData);
				}
				var taxrate = parseFloat(rows2[i].taxrate);
				var u8xse = money/(1+taxrate);
				var tax = money - u8xse;
				var rowData = {u8xse:u8xse,tax:tax};
				serv_grid.updateRow(rows2[i],rowData);
				if(rows2[i].servmon){
					servmonSum += parseFloat(rows2[i].servmon);
				}
				if(rows2[i].money){
					servMoneySum += parseFloat(rows2[i].money);
				}
			}
			if(serv_grid.isSelected(e.row)){
				//服务金额
				document.getElementById("servMonTotal").innerHTML = toThousands(parseFloat(servmonSum).toFixed(2),'#,##.##');
				//服务开票单价
				document.getElementById("servPriceTotal").innerHTML = toThousands(parseFloat(servPriceSum).toFixed(2),'#,##.##');
				//服务开票数量
				document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(0);
				//开票服务金额
				document.getElementById("servMoneyTotal").innerHTML = toThousands(parseFloat(servMoneySum).toFixed(2),'#,##.##');
			}
			servGridOnselect();
		}
		var datas1 = prod_grid.getSelecteds();
		var datas = serv_grid.getSelecteds();
		var summoney = 0;
		var prodmoney = 0;
		var servmoney = 0;
		for(var i = 0;i < datas1.length;i ++){
			var prodmon = datas1[i].money;
			if(prodmon){
				if(!isNaN(prodmon)){
					prodmoney += parseFloat(prodmon);
				}
			}
		}
		for(var i = 0;i < datas.length;i ++){
			var servmon = datas[i].money;
			if(servmon){
				if(!isNaN(servmon)){
					servmoney += parseFloat(servmon);
				}
			}
		}
		summoney = parseFloat(prodmoney) + parseFloat(servmoney);
		nui.get("billprodmon").setValue(prodmoney.toFixed(2));
		nui.get("billservmon").setValue(servmoney.toFixed(2));
		nui.get("billsummon").setValue(summoney.toFixed(2));
	}
		
	/**
	 * 开票类型选择
	 */
    nui.get("billtype").on("valuechanged",function(e){
		var billtype = nui.get("billtype").getValue();
		if(billtype == "1"){//增值税普通
			document.getElementById("temp1").style.display = "none";
			document.getElementById("temp2").style.display = "none";
			document.getElementById("temp3").style.display = "none";
		}else if(billtype == "2"){//增值税专用
			document.getElementById("temp1").style.display = "";
			document.getElementById("temp2").style.display = "";
			document.getElementById("temp3").style.display = "";
		}
	});
		
	/**
	 * 选择开票单位（客户）
	 */
    function selectMisCust(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
            title: "选择开票单位",
            width: 850,
            height: 410,
            ondestroy: function (action) {
                if (action == "ok") {
                	var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);	//72100-中国联合网络通信有限公司
                    nui.get("custname").setValue(data.id);
                    nui.get("custname").setText(data.text);
                    //户名
                    nui.get("accoutname").setValue(data.accoutname);
                    //开户银行
                    nui.get("accoutbank").setValue(data.accoutbank);
                    //税号
                    nui.get("taxnumb").setValue(data.taxnumb);
                    //账号
                    nui.get("accountid").setValue(data.accountid);
                    //地址
                    nui.get("address").setValue(data.address);
                    //电话
                    nui.get("telephone").setValue(data.telephone);
                }
            }
        });
    }
		
	/**
	 * 新增发票行
	 */
	function addRow(e){
		var myDate = new Date(); 
    	//开票日期
 		myDate.toLocaleDateString();
		if(e == "ticket"){
			var newRow = { name: "New Row",
				status: 0,
				ticketdate:myDate
			};
			var rowIndex = ticketSumRows + 1;
			ticketSumRows = rowIndex;
    		ticket_grid.addRow(newRow, rowIndex);
		}
	}
		
	/**
	 * 删除发票行
	 */
	function removeRow(e){
		if(e == "ticket"){
			var rows = ticket_grid.getSelecteds();
			if(rows.length > 0){
				for(var i = 0;i < rows.length;i ++){
					if(rows[i].ticketid){
						nui.alert("原发票不允许删除！");
						return;
					}
				}
				ticket_grid.removeRows(rows,false);
				ticketSumRows = ticketSumRows - rows.length;
			}else{
				nui.alert("请至少选择一行！");
			}
		}
	}
		
	/**
	 * 发票列表
	 */
	function ticketGridOnselect(){
		//发票金额合计
		var ticketMoneySum = 0;
		var rows = ticket_grid.getSelecteds();
		if(rows.length > 0){
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].money){
					ticketMoneySum += parseFloat(rows[i].money);
				}
			}
		}
		document.getElementById("ticketMoneyTotal").innerHTML = toThousands(parseFloat(ticketMoneySum).toFixed(2),'#,##.##');
	}
		
	function onCancel(e) {
        var data = form_cont.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
        
    //标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
		
	function onOk(){
		if(!form_cont.validate()){
			nui.alert("信息未填写完整！");
			return;
		}
		var csReveForecastGrids = csReveForecastGrid.getSelecteds();
		if(csReveForecastGrids.length<1){
			nui.alert("合同收入记录必选 ！");
			return;
		}else{
			var sktype = "";
			for(var i = 0;i < csReveForecastGrids.length;i ++){
				if(sktype){
        			if(sktype.indexOf(csReveForecastGrids[i].revetype + "") == "-1"){
        				sktype = sktype + "," + csReveForecastGrids[i].revetype;
        			}
        		}else{
        			sktype = csReveForecastGrids[i].revetype + "";
        		}
			}
			//0,3,4产品		1,5,2服务
			//产品开票详细信息kpcpxxxx
			if(sktype.indexOf("0") != "-1" || sktype.indexOf("3") != "-1" || sktype.indexOf("4") != "-1" ){
				if(prod_grid.getSelecteds().length<1){
					nui.alert("产品开票信息必选 ！");
					return;
				}
			}
			//服务开票详细信息kpfwxxxx
			if( sktype.indexOf("2") != "-1" || sktype.indexOf("5") != "-1"){
				if(serv_grid.getSelecteds().length<1){
					nui.alert("服务开票信息必选 ！");
					return;
				}
			}
			
			if(sktype.indexOf("1") != "-1"){
				if(serv_grid.getSelecteds().length<1 && prod_grid.getSelecteds().length<1){
					nui.alert("开票信息必选 ！");
					return;
				}
			}
		}
		var prod_grids = prod_grid.getSelecteds();
		for (var i = 0 ; i < prod_grids.length; i++ ){
			if(prod_grids[i].money == null || prod_grids[i].money == "" || prod_grids[i].money == 0){
				nui.alert("勾选的产品开票信息的产品开票金额不能为空！");
				return;
			}
		}
		var serv_grids = serv_grid.getSelecteds();
		for (var i = 0 ; i < serv_grids.length; i++ ){
			if(serv_grids[i].money == null || serv_grids[i].money == "" || serv_grids[i].money == 0){
				nui.alert("勾选的服务开票信息的服务开票金额不能为空！");
				return;
			}
		}
		var csTickets = ticket_grid.getSelecteds();
		for (var i = 0;i < csTickets.length;i++){
			var billno = csTickets[i].billno;
			if(billno == null || billno == ""){
				nui.alert("勾选的发票票号不能为空！");
				return;
			}
			var ticketid  = csTickets[i].ticketid;
			var status = csTickets[i].status;
			var conProIds = csTickets[i].conProIds;
			var contsaleids = csTickets[i].contsaleids;
			if((ticketid == null || ticketid == "") && status == "0" && ((conProIds == null || conProIds =="") && (contsaleids == null || contsaleids == ""))){
				nui.alert("勾选的新增发票信息需要关联开票服务详细信息或开票产品详细信息！");
				return;
			}
		}
		nui.confirm("确定要保存吗？", "操作提示",
            function (action) {            
                if (action == "ok") {
                	nui.get("sureButton").setEnabled(false);
                	var json = form_cont.getData();
                	json.csBillProds = prod_grid.getSelecteds();
                	json.csBillSales = serv_grid.getSelecteds();
                	json.csTickets = ticket_grid.getSelecteds();
                	var rows_prod = prod_grid.getSelecteds();
                	var rows_sale = serv_grid.getSelecteds();
                	var u8xse = 0; 
                	var tax = 0;
                	for (var i = 0; i < rows_prod.length ; i++){
                		tax += parseFloat(rows_prod[i].tax);
                		u8xse += parseFloat(rows_prod[i].u8xse);
                	}
                	for (var i = 0; i < rows_sale.length ; i++){
                		tax += parseFloat(rows_sale[i].tax);
                		u8xse += parseFloat(rows_sale[i].u8xse);
                	}
                	json.csNewbill.tax = tax ;
                	json.csNewbill.u8xse = u8xse ;
                	nui.ajax({
		    			url:"com.primeton.eos.ame_income.gatherFcBilling.saveDoneSureBill.biz.ext",
		    			data: json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(o){
		    				o = nui.clone(o);
		    				if(o.exception == null){
		    					nui.alert("保存成功！","操作提示",function(){
		    						CloseWindow("ok");
		    					});
		    				}else{
		    					nui.alert("保存失败！");
		    					nui.get("sureButton").setEnabled(true);
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
				}else{
					return;
				}
			}
		);
	}
		
	//开票税率默认值
	function doCal_ticket(e){
		var rows1 = e.record;
		//var rows1 = ticket_grid.getSelecteds();
		var type = "";
		type = rows1.type;
		
		var u8xse = 0.00;
		var taxrate = 0.00;
		var tax = 0.00;
		
		var taxrate_t = rows1.taxrate;
		if(taxrate_t == 0 || taxrate_t=="" || taxrate_t == null){
			if(type=="0"){
				taxrate = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));
			}else if (type=="1"){
				taxrate = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));
			}
			var rowData = {taxrate: taxrate};
			ticket_grid.updateRow(rows1,rowData);
		}
		
		var u8xse_t = rows1.u8xse;
		if(u8xse_t == 0 || u8xse_t == "" || u8xse_t == null){
		    var money = 0.00;
			if(rows1.money == "" || rows1.money == null){
				money = 0.00;
			}else {
				money = rows1.money;
			} 
			taxrate = rows1.taxrate;
			u8xse = parseFloat(money)/(1+taxrate);
			var rowData_t = {u8xse:u8xse};
			ticket_grid.updateRow(rows1,rowData_t);
		}
		
		var tax_t = rows1.tax;
		if(tax_t == 0 || tax_t == "" || tax_t == null || isNaN(tax_t)){
			if(rows1.money == "" || rows1.money == null){
				money = 0.00;
			}else {
				money = rows1.money;
			} 
			var u8xse = 0.00;
			if(rows1.u8xse == "" || rows1.u8xse == null){
				u8xse = 0.00;
			}else{
				u8xse = rows1.u8xse;
			}
			var tax = parseFloat(money) - parseFloat(u8xse);
			var rowData_x = {tax:tax};
			ticket_grid.updateRow(rows1,rowData_x);
		}
	}
</script>
</html>