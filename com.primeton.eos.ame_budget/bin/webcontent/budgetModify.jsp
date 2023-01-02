<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>

<head>
	<title>增加/修改预算信息</title>
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
	<fieldset id="field1" style="border:solid 1px #aaa;padding:8px;">
    <legend>项目预算损益表</legend>         
    
	<form id="form1" method="post" >
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" id="budgetModify_addBtn" iconCls="icon-add" onclick="add()" plain="true">增加</a>
	                    <a class="nui-button" id="budgetModify_updateBtn" iconCls="icon-edit"  onclick="edit()" plain="true">编辑</a>
	                    <a class="nui-button" id="budgetModify_deltBtn" iconCls="icon-remove"  onclick="remove()" plain="true">删除</a>
	                    <a class="nui-button" id="budgetModify_modifyBtn" iconCls="icon-addnew" onclick="adjust()" plain="true">复制产生新版本</a>
	                    <a class="nui-button" id="budgetModify_impBtn" iconCls="icon-upload" onclick="impbudget()" plain="true">导入预算版本</a>        
                    </td>
                </tr>
            </table>           
        </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:120px;"  showPager="false" dataField="budget" url="com.primeton.eos.ame_budget.ame_budget.queryBudget.biz.ext" onload="afterload">
	        <div property="columns">
	        	<div type="checkcolumn" width="25px"></div>          
	            <div field="versionid1" width="65px">预算版本号 </div>
	            <div field="iscversion" renderer="dictversion" width="60px">是否有效 </div>
	            <div field="budstatus" renderer="dictstatus" width="80px">预算审核状态</div>
	            <div field="contamt" numberFormat="n0" width="65px">项目合同额</div>
	            <div field="pgrossprofit"  numberFormat="n0" width="70px">项目毛利</div>
	            <div field="pgprate" width="65px">项目毛利率</div>
	            <div field="labortransf" width="80px">工时转换系数</div>
	            <div field="budgetdate" width="80px">预算评估日期 </div>                          
	            <div field="managerdept" width="100px">实施责任部门 </div>
	            <div field="manager" width="68px">技术负责人</div>
	            <div field="budgetmaker" width="68px">预算制定人</div>
	            <div field="sprname" width="120px">审核人</div>
	            <div field="appyjdate" width="75px">审核时间</div>
	            <div field="startdate" width="78px">实施开始日期</div>
	            <div field="enddate" width="78px">预计完成日期</div>
	            <div field="pcoststartdate" width="127px">已发生成本开始日期</div>
	            <div field="pcostclosedate" width="127px">已发生成本截止日期</div>
	            <div field="fmainexpain" width="200px">免费维护期成本说明</div>
	            <div field="tpexplain" width="200px">第三方分摊成本说明</div>
	        </div>
	    </div>    
    </form>  
    </fieldset>      
       <form id="form2" method="post" >
        <fieldset id="field2" style="border:solid 1px #aaa;padding:8px;">
            <legend>项目预算损益表</legend>                       
            <div style="padding:8px;">
            <table style="table-layout:fixed;" style="border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" id="table_file">
                <tr class="nui-toolbar">
               	 	<td style="padding-left:20px;width:160px">指标项</td>
                    <td style="width:300px" align="center" align="center" id="v1"></td>          
					<td style="width:300px" align="center" align="center" id="v2"></td>					
                    <td style="width:300px" align="center" align="center" id="v3"></td>	                   
                
                </tr>                  
                <tr>
                    <td style="width:140px">一、项目合同额</td>
                    <td  style="width:300px" align="center" align="center" id="ht1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].contamt" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="contamt1"/>
                    </td>
                    <td style="width:300px" align="center" align="center" id="ht2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].contamt" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="contamt2"/>
                    </td>
                    <td style="width:300px" align="center" align="center" id="ht3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].contamt" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="contamt3"/>
                    </td>                                                                                                                                                                            
                </tr>
                <tr>
                    <td style="padding-left:20px";width:140px" id="cpht1">1.产品合同额</td>
                    <td style="width:300px" align="center" align="center" id="cpht1"> 
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pcontamt" style="width:140px" inputStyle="text-align:right;" id="pcontamt1" onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" align="center" id="cpht2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pcontamt" style="width:140px" inputStyle="text-align:right;" id="pcontamt2" onvaluechanged="doCal1()"/>
                    </td>
                    <td style="width:300px" align="center" align="center" id="cpht3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pcontamt" style="width:140px" inputStyle="text-align:right;" id="pcontamt3" onvaluechanged="doCal2()"/>
                    </td>                        
                </tr>
                <tr>
                    <td style="padding-left:20px;width:140px">2.服务合同额</td>
                    <td style="width:300px" align="center" id="fwht1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].scontamt" style="width:140px" inputStyle="text-align:right;" id="scontamt1" onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" id="fwht2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].scontamt" style="width:140px" inputStyle="text-align:right;" id="scontamt2" onvaluechanged="doCal1()" />
                    </td>
                    <td style="width:300px" align="center" id="fwht3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].scontamt" style="width:140px" inputStyle="text-align:right;"  id="scontamt3" onvaluechanged="doCal2()"/>
                    </td>                     
                </tr>
                <tr>
                    <td style="padding-left:20px;width:140px">3.MA合同额</td>
                    <td style="width:300px" align="center" id="maht1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].mcontamt" style="width:140px" inputStyle="text-align:right;" id="mcontamt1" onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" id="maht2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].mcontamt" style="width:140px" inputStyle="text-align:right;" id="mcontamt2" onvaluechanged="doCal1()" />
                    </td>
                    <td style="width:300px" align="center" id="maht3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].mcontamt" style="width:140px" inputStyle="text-align:right;" id="mcontamt3" onvaluechanged="doCal2()"/>
                    </td>                     
                </tr>
                
                <tr>
                    <td style="width:140px">二、项目毛收入</td>
                    <td style="width:300px" align="center" id="jsr1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pnetincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pnetincome1"  />
                    </td>
                    <td style="width:300px" align="center" id="jsr2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pnetincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pnetincome2" />
                    </td>
                    <td style="width:300px" align="center" id="jsr3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pnetincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pnetincome3" />
                    </td>                      
                </tr>
                <tr >
                    <td style="padding-left:20px;width:140px">1.产品不含税收入</td>
                    <td style="width:300px" align="center" id="cpsr1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pntaxincome1"  />
                    </td>
                    <td style="width:300px" align="center" id="cpsr2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pntaxincome2"  />
                    </td>
                    <td style="width:300px" align="center" id="cpsr3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pntaxincome3"  />
                        
                    </td>
				</tr>
                 <tr >
                    <td style="padding-left:20px;width:140px">2.服务不含税收入</td>
                    <td style="width:300px" align="center" id="fwsr1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].sntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="sntaxincome1"  />
                    </td>
                    <td style="width:300px" align="center" id="fwsr2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].sntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="sntaxincome2"  />
                    </td>
                    <td style="width:300px" align="center" id="fwsr3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].sntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="sntaxincome3"  />
                        
                    </td>
				</tr>
				<tr >
                    <td style="padding-left:20px;width:140px">3.MA不含税收入</td>
                    <td style="width:300px" align="center" id="masr1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].mntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="mntaxincome1"  />
                    </td>
                    <td style="width:300px" align="center" id="masr2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].mntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="mntaxincome2"  />
                    </td>
                    <td style="width:300px" align="center" id="masr3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].mntaxincome" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="mntaxincome3"  />
                        
                    </td>
				</tr>
                <tr >
                    <td width:140px">三、产品退税</td>
                    <td style="width:300px" align="center" id="cpts1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].ppayback" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="ppayback1" />
                    </td>
                    <td style="width:300px" align="center" id="cpts2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].ppayback" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="ppayback2"  />
                    </td>
                    <td style="width:300px" align="center" id="cpts3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].ppayback" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="ppayback3" />
                    </td>
                </tr>
                 <!-- <tr >
                    <td style="padding-left:20px;width:140px">减：外包2</td>
                    <td style="width:300px" align="center" id="gw1">    
                        <input class="nui-textbox" name="budget[0].pconsultfee" style="width:140px" inputStyle="text-align:right;" id="pconsultfee1" onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" id="gw2">    
                        <input class="nui-textbox" name="budget[1].pconsultfee" style="width:140px" inputStyle="text-align:right;" id="pconsultfee2" onvaluechanged="doCal1()" />
                    </td>
                    <td style="width:300px" align="center" id="gw3">    
                        <input class="nui-textbox" name="budget[2].pconsultfee" style="width:140px" inputStyle="text-align:right;" id="pconsultfee3" onvaluechanged="doCal2()"/>
                    </td>	
                </tr> -->
                <tr>
                    <td style="width:140px">四、项目总成本 </td>
                    <td style="width:300px" align="center" id="zcb1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pcostsum" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pcostsum1"/>
                    </td>
                    <td style="width:300px" align="center" id="zcb2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pcostsum" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pcostsum2"/>
                    </td>
                    <td style="width:300px" align="center" id="zcb3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pcostsum" style="width:140px" inputStyle="text-align:right;" allowInput="false" id="pcostsum3"/>
                    </td>
	            </tr>
                <tr >
                    <td style="padding-left:20px;width:140px">1.项目立项前已发生成本</td>
                    <td style="width:300px" align="center" id="ycb1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pcosts" style="width:140px" id="pcosts1" inputStyle="text-align:right;"  onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" id="ycb2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pcosts" style="width:140px" id="pcosts2" inputStyle="text-align:right;" onvaluechanged="doCal1()"/>
                    </td>
                    <td style="width:300px" align="center" id="ycb3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pcosts" style="width:140px" id="pcosts3" inputStyle="text-align:right;" onvaluechanged="doCal2()"/>
                        
                    </td>
				</tr>
	            <tr >
                    <td style="padding-left:20px;width:140px">2.项目实施内部人力成本</td>
                    <td style="width:300px" align="center" id="rlcb1">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pempcost" allowInput="false" style="width:140px" id="pempcost1" inputStyle="text-align:right;" onvaluechanged="doCal()" />
                    	<a class="nui-button" onclick="selectPemp('pempcost1')" id="rlmx1" style="width:40px">明细</a>
                    </td>
                    <td style="width:300px" align="center" id="rlcb2"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pempcost" allowInput="false" style="width:140px" id="pempcost2" inputStyle="text-align:right;" onvaluechanged="doCal1()" />
                    	<a class="nui-button" onclick="selectPemp('pempcost2')" id="rlmx2" style="width:40px">明细</a>
                    </td>
                    <td style="width:300px" align="center" id="rlcb3">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pempcost" allowInput="false" style="width:140px" id="pempcost3" inputStyle="text-align:right;" onvaluechanged="doCal2()" />
                    	<a class="nui-button" onclick="selectPemp('pempcost3')" id="rlmx3" style="width:40px">明细</a>
                    </td>
	            </tr>
	            <tr >
                    <td style="padding-left:20px;width:140px">3.项目实施直接费用成本</td>
                    <td style="width:300px" align="center" id="zjcb1">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pdircost" allowInput="false" style="width:140px" id="pdircost1" inputStyle="text-align:right;" onvaluechanged="doCal()" />
                    	<a class="nui-button" onclick="selectPdir('pdircost1')" id="zjmx1" style="width:40px">明细</a>
                    </td>
                    <td style="width:300px" align="center" id="zjcb2">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pdircost" allowInput="false" style="width:140px" id="pdircost2" inputStyle="text-align:right;" onvaluechanged="doCal1()" />
                    	<a class="nui-button" onclick="selectPdir('pdircost2')" id="zjmx2" style="width:40px">明细</a>
                    </td>
                    <td style="width:300px" align="center" id="zjcb3">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pdircost" allowInput="false" style="width:140px" id="pdircost3" inputStyle="text-align:right;" onvaluechanged="doCal2()" />
                    	<a class="nui-button" onclick="selectPdir('pdircost3')" id="zjmx3" style="width:40px">明细</a>
                    </td>
	            </tr>
	             <tr >
                    <td style="padding-left:20px;width:140px">4.项目实施外包成本(不含税)</td>
                    <td style="width:300px" align="center" id="wbcb1">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].poutcost" allowInput="false" style="width:140px" id="poutcost1" inputStyle="text-align:right;" onvaluechanged="doCal()" />
                    	<a class="nui-button" onclick="selectPout('poutcost1')" id="wbmx1" style="width:40px">明细</a>
                    </td>
                    <td style="width:300px" align="center" id="wbcb2">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].poutcost" allowInput="false" style="width:140px" id="poutcost2" inputStyle="text-align:right;"  onvaluechanged="doCal1()"/>
                    	<a class="nui-button" onclick="selectPout('poutcost2')" id="wbmx2" style="width:40px">明细</a>
                    </td>
                    <td style="width:300px" align="center" id="wbcb3">    
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].poutcost" allowInput="false" style="width:140px" id="poutcost3" inputStyle="text-align:right;" onvaluechanged="doCal2()" />
                    	<a class="nui-button" onclick="selectPout('poutcost3')" id="wbmx3" style="width:40px">明细</a>
                    </td>
	            </tr>
	             <tr >
                    <td style="padding-left:20px;width:140px">5.项目外部采购(不含税)</td>
                    <td style="width:300px" align="center" id="fb1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].pconsultfee" style="width:140px" inputStyle="text-align:right;" id="pconsultfee1" onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" id="fb2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].pconsultfee" style="width:140px" inputStyle="text-align:right;" id="pconsultfee2" onvaluechanged="doCal1()"/>
                    </td>
                    <td style="width:300px" align="center" id="fb3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].pconsultfee" style="width:140px" inputStyle="text-align:right;" id="pconsultfee3" onvaluechanged="doCal2()"/>
                    </td> 	
                </tr>
	             <tr >
                    <td style="padding-left:20px;width:140px">6.预计免费维护期成本</td>
                    <td style="width:300px" align="center" id="whcb1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].expfmaincost" style="width:140px" id="expfmaincost1" inputStyle="text-align:right;" onvaluechanged="doCal()" />
                    </td>
                    <td style="width:300px" align="center" id="whcb2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].expfmaincost" style="width:140px" id="expfmaincost2" inputStyle="text-align:right;" onvaluechanged="doCal1()" />
                    </td>
                    <td style="width:300px" align="center" id="whcb3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].expfmaincost" style="width:140px" id="expfmaincost3" inputStyle="text-align:right;" onvaluechanged="doCal2()" />
                    </td>
	            </tr>
	             <tr >
                    <td style="padding-left:20px;width:140px">7.其他</td>
                    <td style="width:300px" align="center" id="qt1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].othfee" style="width:140px" id="othfee1" inputStyle="text-align:right;" onvaluechanged="doCal()" />
                    </td>
                    <td style="width:300px" align="center" id="qt2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].othfee" style="width:140px" id="othfee2" inputStyle="text-align:right;" onvaluechanged="doCal1()"/>
                    </td>
                    <td style="width:300px" align="center" id="qt3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].othfee" style="width:140px" id="othfee3" inputStyle="text-align:right;" onvaluechanged="doCal2()"/>
                    </td>
	            </tr>
	            <tr >
                    <td style="padding-left:20px;width:140px">减：第三方分摊成本</td>
                    <td style="width:300px" align="center" id="dscb1">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[0].expthirdpay" style="width:140px" id="expthirdpay1" inputStyle="text-align:right;" onvaluechanged="doCal()"/>
                    </td>
                    <td style="width:300px" align="center" id="dscb2">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[1].expthirdpay" style="width:140px" id="expthirdpay2" inputStyle="text-align:right;" onvaluechanged="doCal1()" />
                    </td>
                    <td style="width:300px" align="center" id="dscb3">    
                        <input class="nui-spinner" format="n0" maxValue="999999999" showButton="false" name="budget[2].expthirdpay" style="width:140px" id="expthirdpay3" inputStyle="text-align:right;" onvaluechanged="doCal2()"/>
                    </td>
	            </tr>
	            <tr>
                    <td style="width:140px">五、项目毛利</td>
                    <td style="width:300px" align="center" id="ml1">    
                        <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" showButton="false"  name="budget[0].pgrossprofit" style="width:140px" allowInput="false" inputStyle="text-align:right;" id="pgrossprofit1" />
                    </td>
                    <td style="width:300px" align="center" id="ml2">    
                        <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" showButton="false" name="budget[1].pgrossprofit" style="width:140px" allowInput="false" inputStyle="text-align:right;" id="pgrossprofit2" />
                    </td>
                    <td style="width:300px" align="center" id="ml3">    
                        <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" showButton="false" name="budget[2].pgrossprofit" style="width:140px" allowInput="false" inputStyle="text-align:right;" id="pgrossprofit3" />
                    </td>
	            </tr>
	            <tr>
                    <td style="width:140px">六、项目毛利率</td>
                    <td style="width:300px" align="center" id="mlv1">    
                        <input class="nui-textbox" name="budget[0].pgprate" style="width:140px" allowInput="false" inputStyle="text-align:right;" id="pgprate1" />
                    </td>
                    <td style="width:300px" align="center" id="mlv2">    
                        <input class="nui-textbox" name="budget[1].pgprate" style="width:140px" allowInput="false" inputStyle="text-align:right;" id="pgprate2" />
                    </td>
                    <td style="width:300px" align="center" id="mlv3">    
                        <input class="nui-textbox" name="budget[2].pgprate" style="width:140px" allowInput="false" inputStyle="text-align:right;" id="pgprate3" />
                    </td>
	            </tr>
                    <td style="width:140px">预算说明</td>
                    <td style="width:300px" align="center" id="sm1">
                        	<input class="nui-textarea" name="budget[0].budgetmemo" id="budgetmemo1" style="width:300px;height:80px" emptyText="请输入"/>
                    </td>
                    <td style="width:300px" align="center" id="sm2">
                    	<input class="nui-textarea" name="budget[1].budgetmemo" id="budgetmemo2" style="width:300px;height:80px" emptyText="请输入"/>
                    </td>
                    <td style="width:300px" align="center" id="sm3">
                    	<input class="nui-textarea" name="budget[2].budgetmemo" id="budgetmemo3" style="width:300px;height:80px" emptyText="请输入"/>
                    </td>           
                </tr>
                </tr>
                     <td style="width:140px"></td>
                    <td style="width:300px" align="center" id="bc1">    
                        <a class="nui-button" onclick="onSubmit1" id="budgetModify_save1" style="width:80px;margin-right:20px;">保存</a>
                    </td>
                    <td style="width:300px" align="center" id="bc2">    
                        <a class="nui-button" onclick="onSubmit2" id="budgetModify_save2" style="width:80px;margin-right:20px;">保存</a>
                    </td> 
                    <td style="width:300px" align="center" id="bc3">    
                        <a class="nui-button" onclick="onSubmit3" id="budgetModify_save3" style="width:80px;margin-right:20px;">保存</a>
                    </td>                
                </tr>
	               
            </table>
        	</div>
        </fieldset>   
    </form>        
</div>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var projectid="<b:write property='projectId'/>";
	var projectName="<b:write property='projectName'/>";
	var startdate="<b:write property='startdate'/>";
	var expenddate="<b:write property='expenddate'/>";
	var sybm="<b:write property='sybm'/>";
	if(projectid){
	}else{
		projectid = <%=request.getParameter("projectId")%>;
	    projectName = "<%=request.getParameter("projectName")%>";
	    startdate = "<%=request.getParameter("startdate")%>";
	    expenddate = "<%=request.getParameter("expenddate")%>";
	    sybm = "<%=request.getParameter("sybm")%>";
	}
	var form2 = new nui.Form("form2");
	var form1 = new nui.Form("form1");
	init();
	function init(){
		getOpeatorButtonAuth("budgetModify_addBtn,budgetModify_updateBtn,budgetModify_deltBtn,budgetModify_modifyBtn,budgetModify_impBtn,budgetModify_save1,budgetModify_save2,budgetModify_save3");//按钮权限
		//设置输入框的背景色
		nui.get("pcontamt1").setBorderStyle("background:#FFFFE6");
		nui.get("othfee1").setBorderStyle("background:#FFFFE6");
		nui.get("othfee2").setBorderStyle("background:#FFFFE6");
		nui.get("othfee3").setBorderStyle("background:#FFFFE6");
		nui.get("scontamt1").setBorderStyle("background:#FFFFE6");
		nui.get("mcontamt1").setBorderStyle("background:#FFFFE6");
		nui.get("pconsultfee1").setBorderStyle("background:#FFFFE6");
		//nui.get("psubfee1").setBorderStyle("background:#FFFFE6");
		nui.get("pcosts1").setBorderStyle("background:#FFFFE6");
		/* nui.get("pempcost1").setBorderStyle("background:#FFFFE6");
		nui.get("pdircost1").setBorderStyle("background:#FFFFE6");
		nui.get("poutcost1").setBorderStyle("background:#FFFFE6"); */
		nui.get("expfmaincost1").setBorderStyle("background:#FFFFE6");
		nui.get("expthirdpay1").setBorderStyle("background:#FFFFE6");
		nui.get("pcontamt2").setBorderStyle("background:#FFFFE6");
		nui.get("scontamt2").setBorderStyle("background:#FFFFE6");
		nui.get("mcontamt2").setBorderStyle("background:#FFFFE6");
		nui.get("pconsultfee2").setBorderStyle("background:#FFFFE6");
		//nui.get("psubfee2").setBorderStyle("background:#FFFFE6");
		nui.get("pcosts2").setBorderStyle("background:#FFFFE6");
		/* nui.get("pempcost2").setBorderStyle("background:#FFFFE6");
		nui.get("pdircost2").setBorderStyle("background:#FFFFE6");
		nui.get("poutcost2").setBorderStyle("background:#FFFFE6"); */
		nui.get("expfmaincost2").setBorderStyle("background:#FFFFE6");
		nui.get("expthirdpay2").setBorderStyle("background:#FFFFE6");
		nui.get("pcontamt3").setBorderStyle("background:#FFFFE6");
		nui.get("scontamt3").setBorderStyle("background:#FFFFE6");
		nui.get("mcontamt3").setBorderStyle("background:#FFFFE6");
		nui.get("pconsultfee3").setBorderStyle("background:#FFFFE6");
		//nui.get("psubfee3").setBorderStyle("background:#FFFFE6");
		nui.get("pcosts3").setBorderStyle("background:#FFFFE6");
		/* nui.get("pempcost3").setBorderStyle("background:#FFFFE6");
		nui.get("pdircost3").setBorderStyle("background:#FFFFE6");
		nui.get("poutcost3").setBorderStyle("background:#FFFFE6"); */
		nui.get("expfmaincost3").setBorderStyle("background:#FFFFE6");
		nui.get("expthirdpay3").setBorderStyle("background:#FFFFE6");
		grid.load({projectid:projectid});
	}
	function afterload(){
		var o=grid.getData();
		if(o.length==0){
			document.getElementById("form2").style.display = "none";
		} else{
			var json={budget:o};
			form2.setData(json);
			if(o.length == 1){
				nui.get("pempcost1").setValue(o[0].pempcost);
				nui.get("pdircost1").setValue(o[0].pdircost);
				nui.get("poutcost1").setValue(o[0].poutcost);
				document.getElementById("v1").innerHTML = "版本V"+o[0].versionid+"(单位:元)";
				document.getElementById("form2").style.display = "";
				document.getElementById("v1").style.display = "";
				document.getElementById("ht1").style.display = "";	
				document.getElementById("cpht1").style.display = "";
				document.getElementById("fwht1").style.display = "";	
				document.getElementById("maht1").style.display = "";
				document.getElementById("jsr1").style.display = "";	
				document.getElementById("fwsr1").style.display = "";
				document.getElementById("cpsr1").style.display = "";	
				document.getElementById("masr1").style.display = "";
				document.getElementById("cpts1").style.display = "";	
				//document.getElementById("gw1").style.display = "";
				document.getElementById("fb1").style.display = "";	
				document.getElementById("zcb1").style.display = "";
				document.getElementById("ycb1").style.display = "";	
				document.getElementById("rlcb1").style.display = "";
				document.getElementById("zjcb1").style.display = "";	
				document.getElementById("wbcb1").style.display = "";
				document.getElementById("whcb1").style.display = "";	
				document.getElementById("qt1").style.display = "";
				document.getElementById("dscb1").style.display = "";	
				document.getElementById("ml1").style.display = "";
				document.getElementById("mlv1").style.display = "";	
				document.getElementById("sm1").style.display = "";
				document.getElementById("bc1").style.display = "";
				document.getElementById("rlmx1").style.display = "";
				document.getElementById("zjmx1").style.display = "";
				document.getElementById("wbmx1").style.display = "";
				document.getElementById("v2").style.display = "none";
				document.getElementById("ht2").style.display = "none";	
				document.getElementById("cpht2").style.display = "none";
				document.getElementById("fwht2").style.display = "none";	
				document.getElementById("maht2").style.display = "none";
				document.getElementById("jsr2").style.display = "none";	
				document.getElementById("fwsr2").style.display = "none";
				document.getElementById("cpsr2").style.display = "none";	
				document.getElementById("masr2").style.display = "none";
				document.getElementById("cpts2").style.display = "none";	
				//document.getElementById("gw2").style.display = "none";
				document.getElementById("fb2").style.display = "none";	
				document.getElementById("zcb2").style.display = "none";
				document.getElementById("ycb2").style.display = "none";	
				document.getElementById("rlcb2").style.display = "none";
				document.getElementById("zjcb2").style.display = "none";	
				document.getElementById("wbcb2").style.display = "none";
				document.getElementById("whcb2").style.display = "none";	
				document.getElementById("qt2").style.display = "none";
				document.getElementById("dscb2").style.display = "none";	
				document.getElementById("ml2").style.display = "none";
				document.getElementById("mlv2").style.display = "none";	
				document.getElementById("sm2").style.display = "none";
				document.getElementById("bc2").style.display = "none";
				document.getElementById("rlmx2").style.display = "none";
				document.getElementById("zjmx2").style.display = "none";
				document.getElementById("wbmx2").style.display = "none";	
				document.getElementById("v3").style.display = "none";
				document.getElementById("ht3").style.display = "none";	
				document.getElementById("cpht3").style.display = "none";
				document.getElementById("fwht3").style.display = "none";	
				document.getElementById("maht3").style.display = "none";
				document.getElementById("jsr3").style.display = "none";	
				document.getElementById("fwsr3").style.display = "none";
				document.getElementById("cpsr3").style.display = "none";	
				document.getElementById("masr3").style.display = "none";
				document.getElementById("cpts3").style.display = "none";	
				//document.getElementById("gw3").style.display = "none";
				document.getElementById("fb3").style.display = "none";	
				document.getElementById("zcb3").style.display = "none";
				document.getElementById("ycb3").style.display = "none";	
				document.getElementById("rlcb3").style.display = "none";
				document.getElementById("zjcb3").style.display = "none";	
				document.getElementById("wbcb3").style.display = "none";
				document.getElementById("whcb3").style.display = "none";	
				document.getElementById("qt3").style.display = "none";
				document.getElementById("dscb3").style.display = "none";	
				document.getElementById("ml3").style.display = "none";
				document.getElementById("mlv3").style.display = "none";	
				document.getElementById("sm3").style.display = "none";
				document.getElementById("bc3").style.display = "none";	
				document.getElementById("rlmx3").style.display = "none";
				document.getElementById("zjmx3").style.display = "none";
				document.getElementById("wbmx3").style.display = "none";	
			}else if(o.length == 2){
				nui.get("pempcost1").setValue(o[0].pempcost);
				nui.get("pempcost2").setValue(o[1].pempcost);
				nui.get("poutcost1").setValue(o[0].poutcost);
				nui.get("poutcost2").setValue(o[1].poutcost);
				nui.get("pdircost1").setValue(o[0].pdircost);
				nui.get("pdircost2").setValue(o[1].pdircost);
				document.getElementById("v1").innerHTML = "版本V"+o[0].versionid+"(单位:元)";
				document.getElementById("v2").innerHTML = "版本V"+o[1].versionid+"(单位:元)";
				document.getElementById("v2").style.display = "";
				document.getElementById("ht2").style.display = "";	
				document.getElementById("cpht2").style.display = "";
				document.getElementById("fwht2").style.display = "";	
				document.getElementById("maht2").style.display = "";
				document.getElementById("jsr2").style.display = "";	
				document.getElementById("fwsr2").style.display = "";
				document.getElementById("cpsr2").style.display = "";	
				document.getElementById("masr2").style.display = "";
				document.getElementById("cpts2").style.display = "";	
				//document.getElementById("gw2").style.display = "";
				document.getElementById("fb2").style.display = "";	
				document.getElementById("zcb2").style.display = "";
				document.getElementById("ycb2").style.display = "";	
				document.getElementById("rlcb2").style.display = "";
				document.getElementById("zjcb2").style.display = "";	
				document.getElementById("wbcb2").style.display = "";
				document.getElementById("whcb2").style.display = "";	
				document.getElementById("qt2").style.display = "";
				document.getElementById("dscb2").style.display = "";	
				document.getElementById("ml2").style.display = "";
				document.getElementById("mlv2").style.display = "";	
				document.getElementById("sm2").style.display = "";
				document.getElementById("bc2").style.display = "";
				document.getElementById("rlmx2").style.display = "";
				document.getElementById("zjmx2").style.display = "";
				document.getElementById("wbmx2").style.display = "";	
				document.getElementById("v3").style.display = "none";	
				document.getElementById("ht3").style.display = "none";	
				document.getElementById("cpht3").style.display = "none";
				document.getElementById("fwht3").style.display = "none";	
				document.getElementById("maht3").style.display = "none";
				document.getElementById("jsr3").style.display = "none";	
				document.getElementById("fwsr3").style.display = "none";
				document.getElementById("cpsr3").style.display = "none";	
				document.getElementById("masr3").style.display = "none";
				document.getElementById("cpts3").style.display = "none";	
				//document.getElementById("gw3").style.display = "none";
				document.getElementById("fb3").style.display = "none";	
				document.getElementById("zcb3").style.display = "none";
				document.getElementById("ycb3").style.display = "none";	
				document.getElementById("rlcb3").style.display = "none";
				document.getElementById("zjcb3").style.display = "none";	
				document.getElementById("wbcb3").style.display = "none";
				document.getElementById("whcb3").style.display = "none";	
				document.getElementById("qt3").style.display = "none";
				document.getElementById("dscb3").style.display = "none";	
				document.getElementById("ml3").style.display = "none";
				document.getElementById("mlv3").style.display = "none";	
				document.getElementById("sm3").style.display = "none";
				document.getElementById("bc3").style.display = "none";
				document.getElementById("rlmx3").style.display = "none";
				document.getElementById("zjmx3").style.display = "none";
				document.getElementById("wbmx3").style.display = "none";				
			}else if(o.length == 3){
				nui.get("pempcost1").setValue(o[0].pempcost);
				nui.get("pempcost2").setValue(o[1].pempcost);
				nui.get("pempcost3").setValue(o[2].pempcost);
				nui.get("poutcost1").setValue(o[0].poutcost);
				nui.get("poutcost2").setValue(o[1].poutcost);
				nui.get("poutcost3").setValue(o[2].poutcost);
				nui.get("pdircost1").setValue(o[0].pdircost);
				nui.get("pdircost2").setValue(o[1].pdircost);
				nui.get("pdircost3").setValue(o[2].pdircost);
				document.getElementById("v1").innerHTML = "版本V"+o[0].versionid+"(单位:元)";
				document.getElementById("v2").innerHTML = "版本V"+o[1].versionid+"(单位:元)";
				document.getElementById("v3").innerHTML = "版本V"+o[2].versionid+"(单位:元)";	
				document.getElementById("v3").style.display = "";
				document.getElementById("ht3").style.display = "";	
				document.getElementById("cpht3").style.display = "";
				document.getElementById("fwht3").style.display = "";	
				document.getElementById("maht3").style.display = "";
				document.getElementById("jsr3").style.display = "";	
				document.getElementById("fwsr3").style.display = "";
				document.getElementById("cpsr3").style.display = "";	
				document.getElementById("masr3").style.display = "";
				document.getElementById("cpts3").style.display = "";	
				//document.getElementById("gw3").style.display = "";
				document.getElementById("fb3").style.display = "";	
				document.getElementById("zcb3").style.display = "";
				document.getElementById("ycb3").style.display = "";	
				document.getElementById("rlcb3").style.display = "";
				document.getElementById("zjcb3").style.display = "";	
				document.getElementById("wbcb3").style.display = "";
				document.getElementById("whcb3").style.display = "";	
				document.getElementById("qt3").style.display = "";
				document.getElementById("dscb3").style.display = "";	
				document.getElementById("ml3").style.display = "";
				document.getElementById("mlv3").style.display = "";	
				document.getElementById("sm3").style.display = "";
				document.getElementById("bc3").style.display = "";
				document.getElementById("rlmx3").style.display = "";
				document.getElementById("zjmx3").style.display = "";
				document.getElementById("wbmx3").style.display = "";	
			}
		}
	}
	
	function add() {
		var o=grid.getData();
		if(o.length==3){
			alert("预算已有三个版本，请删除一个版本再添加!")
			return;
		}
		var versionid="1.0";
		if(o.length>0){
			for(var i=0;i<o.length;i++){
				if(versionid<o[i].versionid){
					versionid=o[i].versionid;
				}
			}
			versionid=(parseFloat(versionid)+1).toFixed(1); 
		}
        nui.open({
            url: "<%=request.getContextPath() %>/ame_budget/addBudget.jsp",
            title: "新增项目预算版本", 
			width: 850,
            height: 400,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new",projectid:projectid,expenddate:expenddate,startdate:startdate,projectName:projectName,versionid:versionid};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
	            grid.reload();
            }
        });
    }
    function impbudget(){
    	var o=grid.getData();
		if(o.length==3){
			alert("预算已有三个版本，请删除一个版本再添加!")
			return;
		}
		
		var versionid="1.0";
		if(o.length>0){
			for(var i=0;i<o.length;i++){
				if(versionid<o[i].versionid){
					versionid=o[i].versionid;
				}
			}
			versionid=(parseFloat(versionid)+1).toFixed(1);
		}
		nui.open({
            url: "<%=request.getContextPath() %>/ame_budget/impBudget.jsp",
            title: "导入预算版本", 
			width: 440,
            height: 150,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {projectid:projectid,versionid:versionid,projectName:projectName};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
	            grid.reload();
            }
        });
    }
    function onSubmit1(){
    	var a=grid.getData();
    	var o = form2.getData();
    	o.budget[0].iscversion=a[0].iscversion;
    	o.budget[0].pbid=a[0].pbid;
    	o.budget[0].versionid=a[0].versionid;
    	o.budget[0].budstatus=a[0].budstatus;
    	o.budget[0].budgetdate=a[0].budgetdate;
    	o.budget[0].startdate=a[0].startdate;
    	o.budget[0].enddate=a[0].enddate;
    	o.budget[0].projectid=a[0].projectid;
    	o.budget[0].projectName=projectName;
        if(form2.validate()){
            var json = nui.encode({budget:o.budget[0]});
            nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.updateBudget.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                    	grid.reload();
                    	form2.setData(text.budget);
                    	alert("保存成功!");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }else{
        	return;
        } 
    
    }
    function onSubmit2(){
    	var a=grid.getData();
    	var o = form2.getData();
    	o.budget[1].pbid=a[1].pbid;
    	o.budget[1].iscversion=a[1].iscversion;
    	o.budget[1].versionid=a[1].versionid;
    	o.budget[1].budstatus=a[1].budstatus;
    	o.budget[1].budgetdate=a[1].budgetdate;
    	o.budget[1].startdate=a[1].startdate;
    	o.budget[1].enddate=a[1].enddate;
    	o.budget[1].projectid=a[1].projectid; 
    	o.budget[1].projectName=projectName;
        if(form2.validate()){
            var json = nui.encode({budget:o.budget[1]});
            nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.updateBudget.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                    	grid.reload();
                    	form2.setData(text.budget);
                    	alert("保存成功!");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }else{
        	return;
        } 
    
    }
    function onSubmit3(){
    	var a=grid.getData();
    	var o = form2.getData();
    	o.budget[2].pbid=a[2].pbid;
    	o.budget[2].iscversion=a[2].iscversion;
    	o.budget[2].versionid=a[2].versionid;
    	o.budget[2].budstatus=a[2].budstatus;
    	o.budget[2].budgetdate=a[2].budgetdate;
    	o.budget[2].startdate=a[2].startdate;
    	o.budget[2].enddate=a[2].enddate;
    	o.budget[2].projectid=a[2].projectid;
    	o.budget[2].projectName=projectName; 
        if(form2.validate()){
            var json = nui.encode({budget:o.budget[2]});
            nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.updateBudget.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                    	grid.reload();
                    	form2.setData(text.budget);
                    	alert("保存成功!");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }else{
        	return;
        } 
    
    }
   <%-- //编辑删除放在最后一列
    function onActionRenderer(e) {
    	var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
    	if(record.budstatus==1){
    		 var s = ' <a class="Edit_Button" href="javascript:edit(\'' + uid + '\')" >编辑</a>';
    	}else {
    		var s = ' <a class="Edit_Button" href="javascript:edit(\'' + uid + '\')" >编辑</a>'
                + ' <a class="Delete_Button" href="javascript:remove(\'' + uid + '\')">删除</a>';
    	}
        return s;
    }--%>
    function remove() {
	    var row = grid.getSelected();  //获取所有选中的行对象
	    if(row.iscversion==1){
	    	alert("当前有效版本不能删除,请重新选择!")
	    	return;
	    }
	    var data = {budget:{pbid:row.pbid,versionid:row.versionid},projectName:projectName};
	    var json = nui.encode(data);     //序列化成json字符串
    	if (confirm("确定删除此预算版本？")) {
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.deleteBudget.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	grid.reload();
                },
                error: function () {
                }
           });
        }
    }
    function edit() {
		var row = grid.getSelected();
		if (row) {
  		nui.open({
            url: "<%=request.getContextPath() %>/ame_budget/addBudget.jsp",
            title: "编辑项目预算版本",
            width: 850,
            height: 400,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "edit", pbid: row.pbid };
              iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if(action=="save"){
                  grid.reload();
                }
            }
        });
        } else {
          nui.alert("请选中一条记录","提示");
        }
    }
    //复制产生新版本
    function adjust(){
    	var row = grid.getSelected();
    	if(row){
	    	var a=grid.getData();
	    	if(a.length==3){
	    		nui.alert("预算已有三个版本，请删除一个版本再添加","提示");
	    		return;
	    	}
	    	if (confirm("是否生成新版本？")) {
		    	for(var i=0;i<a.length;i++){
		    		if(row.versionid<a[i].versionid){
		    			row.versionid=a[i].versionid
		    		}
		    	}
		    	row.versionid=(parseFloat(row.versionid)+1).toFixed(1);
		    	//row.pbid="";
		    	row.budstatus=0;
		    	row.iscversion=0;
		    	var data={budget:row};
		    	var json=nui.encode(data);
		    	nui.ajax({
		                url: "com.primeton.eos.ame_budget.ame_budget.addBudget.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                    	grid.reload();
		                    	form2.setData(text.budget);
		                    	alert("新版本已生成!");
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                    CloseWindow();
		                }
		            });
            }
    	}else {
          nui.alert("请选中一条记录","提示");
        }
    }
    //人力投入预算明细
    function selectPemp(e) {
        var pid = e;
        var a=grid.getData();
        nui.open({
			url:"<%=request.getContextPath() %>/ame_budget/pempCost.jsp",
			title: "人力成本预算明细",
			width: 1000,
			height: 400,
			onload: function () {
                var iframe = this.getIFrameEl();     
                var data="";
                if(pid == "pempcost1"){
	            	var p1=nui.get("pempcost1").getValue();
	            	if(p1&&p1!=0){
	            		data={pbid:a[0].pbid,action:"edit",sybm:sybm,labortransf:a[0].labortransf};
	            	}else{
	            		data={pbid:a[0].pbid,action:"add",sybm:sybm,labortransf:a[0].labortransf};
	            	}
				}else if(pid == "pempcost2"){
					 var p2=nui.get("pempcost2").getValue();
	            	if(p2&&p2!=0){
	            		data={pbid:a[1].pbid,action:"edit",sybm:sybm,labortransf:a[1].labortransf};
	            	}else{
	            		data={pbid:a[1].pbid,action:"add",sybm:sybm,labortransf:a[1].labortransf};
	            	}
				}else if(pid=="pempcost3"){
					 var p3=nui.get("pempcost3").getValue();
	            	if(p3&&p3!=0){
	            		data={pbid:a[2].pbid,action:"edit",sybm:sybm,labortransf:a[2].labortransf};
	            	}else{
	            		data={pbid:a[2].pbid,action:"add",sybm:sybm,labortransf:a[2].labortransf};
	            	}
				}
                iframe.contentWindow.SetData(data);
            },
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						nui.get(pid).setValue(data);
                    	if(pid=="pempcost1"){
                    		doCal();
                    	}else if(pid=="pempcost2"){
                    		doCal1();
                    	}else if(pid=="pempcost3"){
                    		doCal2();
                    	}
					}
				}
			}
		});
	  }
	   //项目外包成本预算明细
    function selectPout(e) {
        var pid = e;
        var a=grid.getData();
        nui.open({
			url:"<%=request.getContextPath() %>/ame_budget/pempCost.jsp",
			title: "外包成本预算明细",
			width: 1000,
			height: 400,
			onload: function () {
                var iframe = this.getIFrameEl();     
                var data="";
                if(pid == "poutcost1"){
	            	var p1=nui.get("poutcost1").getValue();
	            	if(p1&&p1!=0){
	            		data={pbid:a[0].pbid,action:"outedit"};
	            	}else{
	            		data={pbid:a[0].pbid,action:"outadd"};
	            	}
				}else if(pid == "poutcost2"){
					 var p2=nui.get("poutcost2").getValue();
	            	if(p2&&p2!=0){
	            		data={pbid:a[1].pbid,action:"outedit"};
	            	}else{
	            		data={pbid:a[1].pbid,action:"outadd"};
	            	}
				}else if(pid=="poutcost3"){
					 var p3=nui.get("poutcost3").getValue();
	            	if(p3&&p3!=0){
	            		data={pbid:a[2].pbid,action:"outedit"};
	            	}else{
	            		data={pbid:a[2].pbid,action:"outadd"};
	            	}
				}
                iframe.contentWindow.SetData(data);
            },
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						nui.get(pid).setValue(data);
                    	if(pid=="poutcost1"){
                    		doCal();
                    	}else if(pid=="poutcost2"){
                    		doCal1();
                    	}else if(pid=="poutcost3"){
                    		doCal2();
                    	}
					}
				}
			}
		});
	  }
	  
	  //项目直接费用预算明细
    function selectPdir(e) {
        var pid = e;
        var a=grid.getData();
        nui.open({
			url:"<%=request.getContextPath() %>/ame_budget/pdirCost.jsp",
			title: "项目直接费用预算明细",
			width: 800,
			height: 300,
			onload: function () {
                var iframe = this.getIFrameEl();     
                var data="";
                if(pid == "pdircost1"){
	            	data={pbid:a[0].pbid}
				}else if(pid == "pdircost2"){
					 data={pbid:a[1].pbid}
				}else if(pid=="pdircost3"){
					 data={pbid:a[2].pbid}
				}
                iframe.contentWindow.SetData(data);
            },
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						nui.get(pid).setValue(data);
                    	if(pid=="pdircost1"){
                    		doCal();
                    	}else if(pid=="pdircost2"){
                    		doCal1();
                    	}else if(pid=="pdircost3"){
                    		doCal2();
                    	}
					}
				}
			}
		});
	  }
	function doCal(){
		var othfee1=nui.get("othfee1").getValue();
		var pconsultfee1=nui.get("pconsultfee1").getValue();
		var pcontamt1=nui.get("pcontamt1").getValue();
		var scontamt1=nui.get("scontamt1").getValue();
		var mcontamt1=nui.get("mcontamt1").getValue();
		//var pconsultfee1=nui.get("pconsultfee1").getValue();
		var pcosts1=nui.get("pcosts1").getValue();
		var pempcost1=nui.get("pempcost1").getValue();
		var pdircost1=nui.get("pdircost1").getValue();
		var poutcost1=nui.get("poutcost1").getValue();
		var expfmaincost1=nui.get("expfmaincost1").getValue();
		var expthirdpay1=nui.get("expthirdpay1").getValue();
		var contamt1 = 0;
		var pntaxincome1=0;
		var sntaxincome1=0;
		var mntaxincome1=0;
		var ppayback1=0;
		var pnetincome1=0;
		var pcostsum1=0;
		var pgrossprofit1=0;
		var pgprate1=0;
		if(othfee1==null||othfee1==""){
    		othfee1 = 0;
    	}
		if(pconsultfee1==null||pconsultfee1==""){
    		pconsultfee1 = 0;
    	}
    	if(pcontamt1==null||pcontamt1==""){
    		pcontamt1 = 0;
    	}
    	if(scontamt1==null||scontamt1==""){
    		scontamt1 = 0;
    	}
    	if(mcontamt1==null||mcontamt1==""){
    		mcontamt1 = 0;
    	}
    	/* if(pconsultfee1==null||pconsultfee1==""){
    		pconsultfee1 = 0;
    	} */
    	if(pcosts1==null||pcosts1==""){
    		pcosts1 = 0;
    	}
    	if(pempcost1==null||pempcost1==""){
    		pempcost1 = 0;
    	}
    	if(pdircost1==null||pdircost1==""){
    		pdircost1 = 0;
    	}
    	if(expfmaincost1==null||expfmaincost1==""){
    		expfmaincost1 = 0;
    	}
    	if(poutcost1==null||poutcost1==""){
    		poutcost1 = 0;
    	}
    	if(expthirdpay1==null||expthirdpay1==""){
    		expthirdpay1 = 0;
    	}
		contamt1=parseFloat(pcontamt1)+parseFloat(scontamt1)+parseFloat(mcontamt1);
		pntaxincome1=Math.round(parseFloat(pcontamt1)/1.16);
		sntaxincome1=Math.round(parseFloat(scontamt1)/1.06);
		mntaxincome1=Math.round(parseFloat(mcontamt1)/1.06);
		ppayback1=Math.round((parseFloat(pcontamt1)/1.16)*0.14);
		pnetincome1=Math.round(parseFloat(pntaxincome1)+parseFloat(sntaxincome1)+parseFloat(mntaxincome1));
		pcostsum1=Math.round(parseFloat(pcosts1)+parseFloat(pempcost1)+parseFloat(pdircost1)+parseFloat(poutcost1)+parseFloat(expfmaincost1)+parseFloat(othfee1)+parseFloat(pconsultfee1)-parseFloat(expthirdpay1));
		pgrossprofit1=Math.round(pnetincome1-pcostsum1+parseFloat(ppayback1));
		pgprate1=(pgrossprofit1/(pnetincome1+parseFloat(ppayback1))*100).toFixed(1)+"%";
		nui.get("contamt1").setValue(contamt1);
		nui.get("pntaxincome1").setValue(pntaxincome1);
		nui.get("sntaxincome1").setValue(sntaxincome1);
		nui.get("mntaxincome1").setValue(mntaxincome1);
		nui.get("ppayback1").setValue(ppayback1);
		nui.get("pnetincome1").setValue(pnetincome1);
		nui.get("pcostsum1").setValue(pcostsum1);
		nui.get("pgrossprofit1").setValue(pgrossprofit1);
		nui.get("pgprate1").setValue(pgprate1);
	}
	function doCal1(){
		var othfee2=nui.get("othfee2").getValue();
		var pconsultfee2=nui.get("pconsultfee2").getValue();
		var pcontamt2=nui.get("pcontamt2").getValue();
		var scontamt2=nui.get("scontamt2").getValue();
		var mcontamt2=nui.get("mcontamt2").getValue();
		//var pconsultfee2=nui.get("pconsultfee2").getValue();
		var pcosts2=nui.get("pcosts2").getValue();
		var pempcost2=nui.get("pempcost2").getValue();
		var pdircost2=nui.get("pdircost2").getValue();
		var poutcost2=nui.get("poutcost2").getValue();
		var expfmaincost2=nui.get("expfmaincost2").getValue();
		var expthirdpay2=nui.get("expthirdpay2").getValue();
		var contamt2 = 0;
		var pntaxincome2=0;
		var sntaxincome2=0;
		var mntaxincome2=0;
		var ppayback2=0;
		var pnetincome2=0;
		var pcostsum2=0;
		var pgrossprofit2=0;
		var pgprate2=0;
		if(othfee2==null||othfee2==""){
    		othfee2 = 0;
    	}
		if(pconsultfee2==null||pconsultfee2==""){
    		pconsultfee2 = 0;
    	}
		if(pcontamt2==null||pcontamt2==""){
    		pcontamt2 = 0;
    	}
    	if(scontamt2==null||scontamt2==""){
    		scontamt2 = 0;
    	}
    	if(mcontamt2==null||mcontamt2==""){
    		mcontamt2 = 0;
    	}
    	/* if(pconsultfee2==null||pconsultfee2==""){
    		pconsultfee2 = 0;
    	} */
    	if(pcosts2==null||pcosts2==""){
    		pcosts2 = 0;
    	}
    	if(pempcost2==null||pempcost2==""){
    		pempcost2 = 0;
    	}
    	if(pdircost2==null||pdircost2==""){
    		pdircost2 = 0;
    	}
    	if(expfmaincost2==null||expfmaincost2==""){
    		expfmaincost2 = 0;
    	}
    	if(poutcost2==null||poutcost2==""){
    		poutcost2 = 0;
    	}
    	if(expthirdpay2==null||expthirdpay2==""){
    		expthirdpay2 = 0;
    	}
		contamt2=parseFloat(pcontamt2)+parseFloat(scontamt2)+parseFloat(mcontamt2);
		pntaxincome2=Math.round(parseFloat(pcontamt2)/1.16);
		sntaxincome2=Math.round(parseFloat(scontamt2)/1.06);
		mntaxincome2=Math.round(parseFloat(mcontamt2)/1.06);
		ppayback2=Math.round((parseFloat(pcontamt2)/1.16)*0.14);
		pnetincome2=Math.round(parseFloat(pntaxincome2)+parseFloat(sntaxincome2)+parseFloat(mntaxincome2));
		pcostsum2=Math.round(parseFloat(pcosts2)+parseFloat(pempcost2)+parseFloat(pdircost2)+parseFloat(poutcost2)+parseFloat(expfmaincost2)+parseFloat(othfee2)+parseFloat(pconsultfee2)-parseFloat(expthirdpay2));
		pgrossprofit2=Math.round(pnetincome2-pcostsum2+parseFloat(ppayback2));
		pgprate2=(pgrossprofit2/(pnetincome2+parseFloat(ppayback2))*100).toFixed(1)+"%";
		nui.get("contamt2").setValue(contamt2);
		nui.get("pntaxincome2").setValue(pntaxincome2);
		nui.get("sntaxincome2").setValue(sntaxincome2);
		nui.get("mntaxincome2").setValue(mntaxincome2);
		nui.get("ppayback2").setValue(ppayback2);
		nui.get("pnetincome2").setValue(pnetincome2);
		nui.get("pcostsum2").setValue(pcostsum2);
		nui.get("pgrossprofit2").setValue(pgrossprofit2);
		nui.get("pgprate2").setValue(pgprate2);
	}
	function doCal2(){
		var othfee3=nui.get("othfee3").getValue();
		var pconsultfee3=nui.get("pconsultfee3").getValue();
		var pcontamt3=nui.get("pcontamt3").getValue();
		var scontamt3=nui.get("scontamt3").getValue();
		var mcontamt3=nui.get("mcontamt3").getValue();
		//var pconsultfee3=nui.get("pconsultfee3").getValue();
		var pcosts3=nui.get("pcosts3").getValue();
		var pempcost3=nui.get("pempcost3").getValue();
		var pdircost3=nui.get("pdircost3").getValue();
		var poutcost3=nui.get("poutcost3").getValue();
		var expfmaincost3=nui.get("expfmaincost3").getValue();
		var expthirdpay3=nui.get("expthirdpay3").getValue();
		var contamt3 = 0;
		var pntaxincome3=0;
		var sntaxincome3=0;
		var mntaxincome3=0;
		var ppayback3=0;
		var pnetincome3=0;
		var pcostsum3=0;
		var pgrossprofit3=0;
		var pgprate3=0;
		if(othfee3==null||othfee3==""){
    		othfee3 = 0;
    	}
		if(pconsultfee3==null||pconsultfee3==""){
    		pconsultfee3 = 0;
    	}
		if(pcontamt3==null||pcontamt3==""){
    		pcontamt3 = 0;
    	}
    	if(scontamt3==null||scontamt3==""){
    		scontamt3 = 0;
    	}
    	if(mcontamt3==null||mcontamt3==""){
    		mcontamt3 = 0;
    	}
    	/* if(pconsultfee3==null||pconsultfee3==""){
    		pconsultfee3 = 0;
    	} */
    	if(pcosts3==null||pcosts3==""){
    		pcosts3 = 0;
    	}
    	if(pempcost3==null||pempcost3==""){
    		pempcost3 = 0;
    	}
    	if(pdircost3==null||pdircost3==""){
    		pdircost3 = 0;
    	}
    	if(expfmaincost3==null||expfmaincost3==""){
    		expfmaincost3 = 0;
    	}
    	if(poutcost3==null||poutcost3==""){
    		poutcost3 = 0;
    	}
    	if(expthirdpay3==null||expthirdpay3==""){
    		expthirdpay3 = 0;
    	}
		contamt3=parseFloat(pcontamt3)+parseFloat(scontamt3)+parseFloat(mcontamt3);
		pntaxincome3=Math.round(parseFloat(pcontamt3)/1.16);
		sntaxincome3=Math.round(parseFloat(scontamt3)/1.06);
		mntaxincome3=Math.round(parseFloat(mcontamt3)/1.06);
		ppayback3=Math.round((parseFloat(pcontamt3)/1.16)*0.14);
		pnetincome3=Math.round(parseFloat(pntaxincome3)+parseFloat(sntaxincome3)+parseFloat(mntaxincome3));
		pcostsum3=Math.round(parseFloat(pcosts3)+parseFloat(pempcost3)+parseFloat(pdircost3)+parseFloat(poutcost3)+parseFloat(expfmaincost3)+parseFloat(othfee3)+parseFloat(pconsultfee3)-parseFloat(expthirdpay3));
		pgrossprofit3=Math.round(pnetincome3-pcostsum3+parseFloat(ppayback3));
		pgprate3=(pgrossprofit3/(pnetincome3+parseFloat(ppayback3))*100).toFixed(1)+"%";
		nui.get("contamt3").setValue(contamt3);
		nui.get("pntaxincome3").setValue(pntaxincome3);
		nui.get("sntaxincome3").setValue(sntaxincome3);
		nui.get("mntaxincome3").setValue(mntaxincome3);
		nui.get("ppayback3").setValue(ppayback3);
		nui.get("pnetincome3").setValue(pnetincome3);
		nui.get("pcostsum3").setValue(pcostsum3);
		nui.get("pgrossprofit3").setValue(pgrossprofit3);
		nui.get("pgprate3").setValue(pgprate3);
	}
	function dictstatus(e) {
		return nui.getDictText('MIS_BUDSTATUS',e.value);//设置业务字典值
	}
	function dictversion(e) {
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
</script>
</body>
</html>