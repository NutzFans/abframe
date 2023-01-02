<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-09-19 16:17:56
  - Description:
-->
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
<jsp:include page="menu.jsp"></jsp:include>
<div class="main-content">
<body>
	<div style="width: 100%;overflow-y:hidden; " class = "nui-fit">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;width: 1123px" >
        	<table style="width:100%;" id="bmtop">
            	<tr>
                    <td style="width: 400px;" id="syb" align="left"></td>
                    <td style="width: 120px;" align="right" >
	                    <a class="nui-button" id="lock" iconCls="icon-lock" onclick="locks(1)" style="align:right">锁定部门预算</a>
	                    <a class="nui-button" id="unlock" iconCls="icon-unlock" onclick="locks(2)" style="align:right">解锁部门预算</a>  
                   	</td>
                   	<td align = "right" style="width: 200px;">是否显示实际执行数据:</td>
                   	<td><input class = "nui-checkbox" id = "isshowsj" oncheckedchanged="showsj" align="left"></td>
                   	<td style="width: auto;"></td>
                </tr>
             </table>           
	
        </div>
        <div  style="border-bottom:0;padding:0px;">
        	<table style="width:100%;" id="table1">
                <tr>
                    <td style="width: 160px;" id="qhzsj">请选择需要汇总的数据范围：</td>
                    <td style="width: 355px;">
                    	<div class="nui-combobox"  id="hzsj"  valueField="id" textField="text"  style="width: 350px"  multiSelect="true" data="degreeData">
                    	<div property="columns">
					         <div header="全选" field="text"></div>
					    </div>
					    </div>
                    </td>
                    <td style="width: 86px;">
                    	<a class="nui-button" id="sumData" iconCls="icon-ok" onclick="sumCal()">数据汇总</a>
                    </td>
                    <td style="width: 215px;" align="left">
                    </td>
                	<td style="width: 70px;">
                   	</td>
                   	<td style="width: auto;"></td> 
                </tr>
            </table>          
        </div>
        <div style = "padding: 0px;width:1123px;margin: 0px;">
       <table style="table-layout:fixed;width: 100%;border-collapse:collapse;" bordercolor="#A8A8A8" border="1" cellspacing="0" id="table_file1">
		            <thead>
			            <tr class="nui-toolbar" style="width: 100%">
			           	 	<td style="width:150px;" align="center" >预算项</td>
			           	 	<td style="width:60px" align="center" id="v7">同比增长</td>
			           	 	<td style="width:80px" align="center" id="v6"></td>
			                <td style="width:80px" align="center" id="v1"></td>
			                <td style="width:80px" align="center" id="a1"></td>           
							<td style="width:80px" align="center" id="v2">Q1</td>					
			                <td style="width:80px" align="center" id="a2">Q1实际</td>					
			                <td style="width:80px" align="center" id="v3">Q2</td>	                   
			                <td style="width:80px" align="center" id="a3">Q2实际</td>	                   
							<td style="width:80px" align="center" id="v4">Q3</td>					
							<td style="width:80px" align="center" id="a4">Q3实际</td>					
			                <td style="width:80px" align="center" id="v5">Q4</td>
			                <td style="width:80px" align="center" id="a5">Q4实际</td>
			                <td style="width: auto;"></td> 
			            </tr>
		            </thead>
		            </table>
		            </div>
	        <div style="padding:0px;width:1140px;height:500px;overflow-x: hidden;margin: 0px;" class = "nui-fit">
		<form id="form1" method="post" style="-webkit-overflow-scrolling: touch; width: 100%;margin: 0px;">
	            <input class="nui-hidden" name="budget[0].orgid" id="orgid1"/>
	            <input class="nui-hidden" name="budget[1].orgid" id="orgid2"/>
	            <input class="nui-hidden" name="budget[2].orgid" id="orgid3"/>
	            <input class="nui-hidden" name="budget[3].orgid" id="orgid4"/>
	            <input class="nui-hidden" name="budget[0].year" id="year1"/>
	            <input class="nui-hidden" name="budget[1].year" id="year2"/>
	            <input class="nui-hidden" name="budget[2].year" id="year3"/>
	            <input class="nui-hidden" name="budget[3].year" id="year4"/>
	            <input class="nui-hidden" name="budget[0].quarter" id="q1"/>
	            <input class="nui-hidden" name="budget[1].quarter" id="q2"/>
	            <input class="nui-hidden" name="budget[2].quarter" id="q3"/>
	            <input class="nui-hidden" name="budget[3].quarter" id="q4"/>
		         <table style="table-layout:fixed;width: 100%;border-collapse:collapse;overflow: scroll; " bordercolor="#A8A8A8" border="1" cellspacing="0" id="table_file">
		            <tbody> 
			            <tr>
			                <td style="width:150px;background:#9ACD32;">一、合同额</td>
			                <td  style="width:60px;background:#9ACD32;" align="center" id="contamt6"></td>
			                <td style="width:80px;background:#9ACD32;" align="center" id="contamt5"></td>
			                <td  style="width:80px;background:#9ACD32;" align="center" id="contamt"></td>
			                <td  style="width:80px;background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.contamt" style="width:100%;background:#9ACD32;" inputStyle="width:100%;text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td>
			                <td style="width:80px;background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].contamt" style="width:100%; background:#9ACD32;" inputStyle="width:100%;text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="contamt1"/>
			                </td>
			                <td  style="width:80px;background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].contamt" style="width:100%;background:#9ACD32;" inputStyle="width:100%;text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="contamt_a1"/>
			                </td>
			                <td style="width:80px;background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].contamt" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="contamt2"/>
			                </td>
			                <td  style="width:80px;background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].contamt" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="contamt_a2"/>
			                </td>
			                <td style="width:80px;background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].contamt" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="contamt3"/>
			                </td>
			                <td  style="width:80px;background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].contamt" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="contamt_a3"/>
			                </td>
			                <td style="width:80px;background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].contamt" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="contamt4"/>
			                </td>                                                                            
			                <td  style="width:80px;background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].contamt" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="contamt_a4"/>
			                </td>
			                <td style="width: auto;border: 0px"></td> 
			            </tr>
			            <tr id = "cphtline">
			                <td style="padding-left:10px;" id="cpht1">1.1产品合同额</td>
			                <td align="center" id="pcontamt6"></td>
			                <td align="center" id="pcontamt5"></td>
			                <td align="center" id="pcontamt"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.pcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].pcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="pcontamt1" onvaluechanged="doCal1()" />
			                </td>
			                <td  style="width:100%; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].pcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pcontamt_a1"/>
			                </td> 
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].pcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="pcontamt2" onvaluechanged="doCal2()" />
			                </td> 
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].pcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pcontamt_a2"/>
			                </td>
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].pcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="pcontamt3" onvaluechanged="doCal3()" />
			                </td>
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].pcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pcontamt_a3"/>
			                </td>
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].pcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="pcontamt4" onvaluechanged="doCal4()" />
			                </td> 
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].pcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pcontamt_a4"/>
			                </td>                       
			            </tr>
						<tr id = "mahtline">
			                <td style="padding-left:10px;">1.2MA合同额</td>
			                <td align="center" id="mcontamt6"></td>
			                <td align="center" id="mcontamt5"></td>
			                <td align="center" id="mcontamt"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.mcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].mcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mcontamt1" onvaluechanged="doCal1()" />
			                </td>
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].mcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mcontamt_a1"/>
			                </td> 
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].mcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mcontamt2" onvaluechanged="doCal2()" />
			                </td>
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].mcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mcontamt_a2"/>
			                </td> 
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].mcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mcontamt3" onvaluechanged="doCal3()" />
			                </td>
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].mcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mcontamt_a3"/>
			                </td> 
			                <td style="width:100px;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].mcontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mcontamt4" onvaluechanged="doCal4()" />
			                </td>
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].mcontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mcontamt_a4"/>
			                </td>                        
			            </tr>
			            <tr id = "fwhtline">
			                <td style="padding-left:10px;">1.3服务合同额</td>
			                <td align="center" id="scontamt6"></td>
			                <td align="center" id="scontamt5"></td>
			                <td align="center" id="scontamt"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.scontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].scontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="scontamt1" onvaluechanged="doCal1()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].scontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="scontamt_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].scontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;"  id="scontamt2" onvaluechanged="doCal2()" />
			                </td>
			                <td  style="width:100px; align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].scontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="scontamt_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].scontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="scontamt3" onvaluechanged="doCal3()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].scontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="scontamt_a3"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].scontamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="scontamt4" onvaluechanged="doCal4()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].scontamt" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="scontamt_a4"/>
			                </td>                      
			            </tr>
						<tr >
			                <td  style="background:#9ACD32;">二、收款额</td>
			                <td  style="background:#9ACD32;" align="center" id="receamt6"></td>
			                <td  style="background:#9ACD32;" align="center" id="receamt5"></td>
			                <td  style="background:#9ACD32;" align="center" id="receamt"></td>
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.receamt" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td  align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].receamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="receamt1" onvaluechanged="doCal1()" />
			                </td>
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].receamt" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="receamt_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].receamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="receamt2" onvaluechanged="doCal2()" />
			                </td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].receamt" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="receamt_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].receamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="receamt3" onvaluechanged="doCal3()" />
			                </td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].receamt" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="receamt_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].receamt" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="receamt4" onvaluechanged="doCal4()" />
			                </td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].receamt" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="receamt_a4"/>
			                </td>                                                                                                                                                                              
			            </tr>
			            <tr>
			                <td style=background:#9ACD32;">三、营业收入（含税）</td>
			                <td  style="background:#9ACD32;" align="center" id="taxincome6"></td>
			                <td style="background:#9ACD32;" align="center" id="taxincome5"></td>
			                <td  style="background:#9ACD32;" align="center" id="taxincome"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.taxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].taxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="taxincome1"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].taxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="taxincome_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].taxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="taxincome2"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].taxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="taxincome_a2"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].taxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="taxincome3"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].taxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="taxincome_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].taxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="taxincome4"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].taxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="taxincome_a4"/>
			                </td>                                                                                                                                                                               
			            </tr>
			            <tr id = "cpsrline">
			                <td style="padding-left:10px;" id="cpht1">3.1产品收入</td>
			                <td align="center" id="ptaxincome6"></td>
			                <td align="center" id="ptaxincome5"></td>
			                <td align="center" id="ptaxincome"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.ptaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].ptaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="ptaxincome1" onvaluechanged="doCal1()" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].ptaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ptaxincome_a1"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].ptaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="ptaxincome2" onvaluechanged="doCal2()" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].ptaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ptaxincome_a2"/>
			                </td>   
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].ptaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="ptaxincome3" onvaluechanged="doCal3()" />
			                </td>
			                 <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].ptaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ptaxincome_a3"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].ptaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="ptaxincome4" onvaluechanged="doCal4()" />
			                </td> 
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].ptaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ptaxincome_a4"/>
			                </td>                         
			            </tr>
						<tr id = "masrline">
			                <td style="padding-left:10px;">3.2MA收入</td>
			                <td align="center" id="mtaxincome6"></td>
			                <td align="center" id="mtaxincome5"></td>
			                <td align="center" id="mtaxincome"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.mtaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>  
			                <td align="center">  
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].mtaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mtaxincome1" onvaluechanged="doCal1()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].mtaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mtaxincome_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].mtaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mtaxincome2" onvaluechanged="doCal2()" />
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].mtaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mtaxincome_a2"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].mtaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mtaxincome3" onvaluechanged="doCal3()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].mtaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mtaxincome_a3"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].mtaxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="mtaxincome4" onvaluechanged="doCal4()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].mtaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mtaxincome_a4"/>
			                </td>                       
			            </tr>
			            <tr id = "fwsrline">
			                <td style="padding-left:10px;">3.3服务收入</td>
			                <td align="center" id="staxincome6"></td>
			                <td align="center" id="staxincome5"></td>
			                <td align="center" id="staxincome"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.staxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].staxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="staxincome1" onvaluechanged="doCal1()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].staxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="staxincome_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].staxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;"  id="staxincome2" onvaluechanged="doCal2()" />
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].staxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="staxincome_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].staxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="staxincome3" onvaluechanged="doCal3()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].staxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="staxincome_a3"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].staxincome" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="staxincome4" onvaluechanged="doCal4()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].staxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="staxincome_a4"/>
			                </td>                      
			            </tr>
			            <tr>
			                <td  style="background:#9ACD32;">四、营业毛收入（不含税）</td>
			                <td  style="background:#9ACD32;" align="center" id="ntaxincome6"></td>
			                <td  style="background:#9ACD32;" align="center" id="ntaxincome5"></td>
			                <td  style="background:#9ACD32;" align="center" id="ntaxincome"></td>
			                <td  style = "background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.ntaxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td  style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].ntaxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="ntaxincome1"/>
			                </td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].ntaxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="ntaxincome_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].ntaxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="ntaxincome2"/>
			                </td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].ntaxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="ntaxincome_a2"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].ntaxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="ntaxincome3"/>
			                </td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].ntaxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="ntaxincome_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].ntaxincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="ntaxincome4"/>
			                </td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].ntaxincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="ntaxincome_a4"/>
			                </td>                                                                                                                                                                               
			            </tr>
			            <tr id = "cpmsrline">
			                <td style="padding-left:10px;" id="cpht1">4.1产品毛收入</td>
			                <td align="center" id="pntaxincome6"></td>
			                <td align="center" id="pntaxincome5"></td>
			                <td align="center" id="pntaxincome"></td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.pntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].pntaxincome" style="width:100%;" inputStyle="text-align:right;" id="pntaxincome1" allowInput="false"/>
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].pntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pntaxincome_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].pntaxincome" style="width:100%;" inputStyle="text-align:right;" id="pntaxincome2" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].pntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pntaxincome_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].pntaxincome" style="width:100%;" inputStyle="text-align:right;" id="pntaxincome3" allowInput="false"/>
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].pntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pntaxincome_a3"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].pntaxincome" style="width:100%;" inputStyle="text-align:right;" id="pntaxincome4" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].pntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pntaxincome_a4"/>
			                </td>                        
			            </tr>
						<tr id = "mamsrline">
			                <td style="padding-left:10px;">4.2MA毛收入</td>
			                <td align="center" id="mntaxincome6"></td>
			                <td align="center" id="mntaxincome5"></td>
			                <td align="center" id="mntaxincome"></td>
			                 <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.mntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].mntaxincome" style="width:100%;" inputStyle="text-align:right;" id="mntaxincome1" allowInput="false" />
			                </td>
			                 <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].mntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mntaxincome_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].mntaxincome" style="width:100%;" inputStyle="text-align:right;" id="mntaxincome2" allowInput="false"/>
			                </td>
			                 <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].mntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mntaxincome_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].mntaxincome" style="width:100%;" inputStyle="text-align:right;" id="mntaxincome3" allowInput="false" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].mntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mntaxincome_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].mntaxincome" style="width:100%;" inputStyle="text-align:right;" id="mntaxincome4" allowInput="false"/>
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].mntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mntaxincome_a4"/>
			                </td>                        
			            </tr>
			            <tr id = "fwmsrline">
			                <td style="padding-left:10px;">4.3服务毛收入</td>
			                <td align="center" id="sntaxincome6"></td>
			                <td align="center" id="sntaxincome5"></td>
			                <td align="center" id="sntaxincome"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.sntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].sntaxincome" style="width:100%;" inputStyle="text-align:right;" id="sntaxincome1" allowInput="false" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].sntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="sntaxincome_a1"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].sntaxincome" style="width:100%;" inputStyle="text-align:right;"  id="sntaxincome2" allowInput="false"/>
			                </td> 
			                 <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].sntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="sntaxincome_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].sntaxincome" style="width:100%;" inputStyle="text-align:right;" id="sntaxincome3" allowInput="false" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].sntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="sntaxincome_a3"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].sntaxincome" style="width:100%;" inputStyle="text-align:right;" id="sntaxincome4" allowInput="false"/>
			                </td>  
			                 <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].sntaxincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="sntaxincome_a4"/>
			                </td>                      
			            </tr>
			            <tr>
			                <td style="background:#9ACD32;">五、分包及外部采购</td>
			                <td  style="background:#9ACD32;" align="center" id="subfee6"></td>
			                <td  style="background:#9ACD32;" align="center" id="subfee5"></td>
			                <td  style="background:#9ACD32;" align="center" id="subfee"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.subfee" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].subfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="subfee1"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].subfee" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="subfee_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].subfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="subfee2"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].subfee" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="subfee_a2"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].subfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="subfee3"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].subfee" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="subfee_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].subfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="subfee4"/>
			                </td> 
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].subfee" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="subfee_a4"/>
			                </td>                                                                                                                                                                              
			            </tr>
						<tr id = "psubline">
			                <td style="padding-left:10px;" id="cpht1">5.1产品分包及外部采购</td>
			                <td align="center" id="psubfee6"></td>
			                <td align="center" id="psubfee5"></td>
			                <td align="center" id="psubfee"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.psubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].psubfee" style="width:100%;" inputStyle="text-align:right;" id="psubfee1" onvaluechanged="doCal1()" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].psubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="psubfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].psubfee" style="width:100%;" inputStyle="text-align:right;" id="psubfee2" onvaluechanged="doCal2()" />
			                </td> 
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].psubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="psubfee_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].psubfee" style="width:100%;" inputStyle="text-align:right;" id="psubfee3" onvaluechanged="doCal3()" />
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].psubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="psubfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].psubfee" style="width:100%;" inputStyle="text-align:right;" id="psubfee4" onvaluechanged="doCal4()" />
			                </td>  
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].psubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="psubfee_a4"/>
			                </td>                       
			            </tr>
						<tr id = "masubline">
			                <td style="padding-left:10px;">5.2MA分包及外部采购</td>
			                <td align="center" id="msubfee6"></td>
			                <td align="center" id="msubfee5"></td>
			                <td align="center" id="msubfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.msubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].msubfee" style="width:100%;" inputStyle="text-align:right;" id="msubfee1" onvaluechanged="doCal1()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].msubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="msubfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].msubfee" style="width:100%;" inputStyle="text-align:right;" id="msubfee2" onvaluechanged="doCal2()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].msubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="msubfee_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].msubfee" style="width:100%;" inputStyle="text-align:right;" id="msubfee3" onvaluechanged="doCal3()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].msubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="msubfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].msubfee" style="width:100%;" inputStyle="text-align:right;" id="msubfee4" onvaluechanged="doCal4()" />
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].msubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="msubfee_a4"/>
			                </td>                       
			            </tr>
			            <tr id = "ssubline">
			                <td style="padding-left:10px;">5.3服务分包及外部采购</td>
			                <td align="center" id="ssubfee6"></td>
			                <td align="center" id="ssubfee5"></td>
			                <td align="center" id="ssubfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.ssubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].ssubfee" style="width:100%;" inputStyle="text-align:right;" id="ssubfee1" onvaluechanged="doCal1()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].ssubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ssubfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].ssubfee" style="width:100%;" inputStyle="text-align:right;"  id="ssubfee2" onvaluechanged="doCal2()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].ssubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ssubfee_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].ssubfee" style="width:100%;" inputStyle="text-align:right;" id="ssubfee3" onvaluechanged="doCal3()" />
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].ssubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ssubfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].ssubfee" style="width:100%;" inputStyle="text-align:right;" id="ssubfee4" onvaluechanged="doCal4()" />
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].ssubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="ssubfee_a4"/>
			                </td>                       
			            </tr>
						<tr>
			                <td style="background:#9ACD32;">六、营业税金及附加</td>
			                <td  style="background:#9ACD32;" align="center" id="bustax6"></td>
			                <td  style="background:#9ACD32;" align="center" id="bustax5"></td>
			                <td  style="background:#9ACD32;" align="center" id="bustax"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.bustax" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].bustax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="bustax1"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].bustax" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="bustax_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].bustax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="bustax2"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].bustax" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="bustax_a2"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].bustax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="bustax3"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].bustax" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="bustax_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].bustax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="bustax4"/>
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].bustax" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="bustax_a4"/>
			                </td>                                                                                                                                                                               
			            </tr>
			            <tr>
			                <td style="background:#9ACD32;">七、营业净收入</td>
			                <td style="background:#9ACD32;" align="center" id="netincome6"></td>
			                <td style="background:#9ACD32;" align="center" id="netincome5"></td>
			                <td style="background:#9ACD32;" align="center" id="netincome"></td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.netincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" />
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].netincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="netincome1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].netincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="netincome_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].netincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="netincome2" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].netincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="netincome_a2"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].netincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="netincome3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].netincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="netincome_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].netincome" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="netincome4" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].netincome" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="netincome_a4"/>
			                </td>                       
			            </tr>
			            <tr id = "cpjsrline">
			                <td style="padding-left:10px;" id="cpht1">7.1产品净收入</td>
			                <td align="center" id="pnetincome6"></td>
			                <td align="center" id="pnetincome5"></td>
			                <td align="center" id="pnetincome"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.pnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" />
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].pnetincome" style="width:100%;" inputStyle="text-align:right;" id="pnetincome1" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].pnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pnetincome_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].pnetincome" style="width:100%;" inputStyle="text-align:right;" id="pnetincome2" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].pnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pnetincome_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].pnetincome" style="width:100%;" inputStyle="text-align:right;" id="pnetincome3" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].pnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pnetincome_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].pnetincome" style="width:100%;" inputStyle="text-align:right;" id="pnetincome4" allowInput="false"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].pnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pnetincome_a4"/>
			                </td>                        
			            </tr>
						<tr id = "majsrline">
			                <td style="padding-left:10px;">7.2MA净收入</td>
			                <td align="center" id="mnetincome6"></td>
			                <td align="center" id="mnetincome5"></td>
			                <td align="center" id="mnetincome"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.mnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].mnetincome" style="width:100%;" inputStyle="text-align:right;" id="mnetincome1" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].mnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mnetincome_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].mnetincome" style="width:100%;" inputStyle="text-align:right;" id="mnetincome2" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].mnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mnetincome_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].mnetincome" style="width:100%;" inputStyle="text-align:right;" id="mnetincome3" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].mnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mnetincome_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].mnetincome" style="width:100%;" inputStyle="text-align:right;" id="mnetincome4" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].mnetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="mnetincome_a4"/>
			                </td>                        
			            </tr>
			            <tr id = "fwjsrline">
			                <td style="padding-left:10px;">7.3服务净收入</td>
			                <td align="center" id="snetincome6"></td>
			                <td align="center" id="snetincome5"></td>
			                <td align="center" id="snetincome"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.snetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].snetincome" style="width:100%;" inputStyle="text-align:right;" id="snetincome1" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].snetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="snetincome_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].snetincome" style="width:100%;" inputStyle="text-align:right;"  id="snetincome2" allowInput="false"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].snetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="snetincome_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].snetincome" style="width:100%;" inputStyle="text-align:right;" id="snetincome3" allowInput="false"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].snetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="snetincome_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].snetincome" style="width:100%;" inputStyle="text-align:right;" id="snetincome4" allowInput="false"/>
			                </td>  
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].snetincome" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="snetincome_a4"/>
			                </td>                     
			            </tr>
						<tr>
			                <td style="background:#9ACD32;">八、当期发生成本</td>
			                <td style="background:#9ACD32;" align="center" id="currentcost6"></td>
			                <td style="background:#9ACD32;" align="center" id="currentcost5"></td>
			                <td style="background:#9ACD32;" align="center" id="currentcost"></td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.currentcost" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].currentcost" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="currentcost1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].currentcost" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="currentcost_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].currentcost" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="currentcost2"/>
			                </td> 
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].currentcost" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="currentcost_a2"/>
			                </td> 
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].currentcost" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="currentcost3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].currentcost" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="currentcost_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].currentcost" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="currentcost4" />
			                </td>  
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].currentcost" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="currentcost_a4"/>
			                </td>                     
			            </tr>
			            <tr>
			                <td style="padding-left:10px;" id="cpht1">8.1服务成本</td>
			                <td align="center" id="servcost6"></td>
			                <td align="center" id="servcost5"></td>
			                <td align="center" id="servcost"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.servcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].servcost" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="servcost1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].servcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="servcost_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].servcost" style="width:100%;" inputStyle="text-align:right;" id="servcost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].servcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="servcost_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].servcost" style="width:100%;" inputStyle="text-align:right;" id="servcost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].servcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="servcost_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].servcost" style="width:100%;" inputStyle="text-align:right;" id="servcost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].servcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="servcost_a4"/>
			                </td>                        
			            </tr>
						<tr>
			                <td style="padding-left:10px;">8.2销售费用</td>
			                <td align="center" id="salecost6"></td>
			                <td align="center" id="salecost5"></td>
			                <td align="center" id="salecost"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.salecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].salecost" style="width:100%;" inputStyle="text-align:right;" id="salecost1" allowInput="false" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].salecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="salecost_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].salecost" style="width:100%;" inputStyle="text-align:right;" id="salecost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].salecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="salecost_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].salecost" style="width:100%;" inputStyle="text-align:right;" id="salecost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].salecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="salecost_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].salecost" style="width:100%;" inputStyle="text-align:right;" id="salecost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].salecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="salecost_a4"/>
			                </td>                        
			            </tr>
			            <tr id="bmglfy">
			                <td style="padding-left:10px;">8.3部门管理费用</td>
			                <td align="center" id="deptmcost6"></td>
			                <td align="center" id="deptmcost5"></td>
			                <td align="center" id="deptmcost"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.deptmcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].deptmcost" style="width:100%;" inputStyle="text-align:right;" id="deptmcost1" allowInput="false" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].deptmcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptmcost_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].deptmcost" style="width:100%;" inputStyle="text-align:right;"  id="deptmcost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].deptmcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptmcost_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].deptmcost" style="width:100%;" inputStyle="text-align:right;" id="deptmcost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].deptmcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptmcost_a3"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].deptmcost" style="width:100%;" inputStyle="text-align:right;" id="deptmcost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].deptmcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptmcost_a4"/>
			                </td>                      
			            </tr>
			            <tr id="bmyffy">
			                <td style="padding-left:10px;" id="cpht1">8.4部门研发费用</td>
			                <td align="center" id="deptdcost6"></td>
			                <td align="center" id="deptdcost5"></td>
			                <td align="center" id="deptdcost"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.deptdcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].deptdcost" style="width:100%;" inputStyle="text-align:right;" id="deptdcost1" allowInput="false" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].deptdcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptdcost_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].deptdcost" style="width:100%;" inputStyle="text-align:right;" id="deptdcost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td> 
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].deptdcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptdcost_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].deptdcost" style="width:100%;" inputStyle="text-align:right;" id="deptdcost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].deptdcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptdcost_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].deptdcost" style="width:100%;" inputStyle="text-align:right;" id="deptdcost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td>  
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].deptdcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="deptdcost_a4"/>
			                </td>                       
			            </tr>
						<tr>
			                <td style="padding-left:10px;" id="gsglft"></td>
			                <td align="center" id="commshar6"></td>
			                <td align="center" id="commshar5"></td>
			                <td align="center" id="commshar"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.commshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].commshar" style="width:100%;" inputStyle="text-align:right;" id="commshar1" allowInput="false" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].commshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="commshar_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].commshar" style="width:100%;" inputStyle="text-align:right;" id="commshar2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].commshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="commshar_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].commshar" style="width:100%;" inputStyle="text-align:right;" id="commshar3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].commshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="commshar_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].commshar" style="width:100%;" inputStyle="text-align:right;" id="commshar4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].commshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="commshar_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:10px;" id="gsscft"></td>
			                <td align="center" id="comashar6"></td>
			                <td align="center" id="comashar5"></td>
			                <td align="center" id="comashar"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.comashar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" />
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].comashar" style="width:100%;" inputStyle="text-align:right;" id="comashar1" allowInput="false" onvaluechanged="doCal1()"/>
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].comashar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comashar_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].comashar" style="width:100%;" inputStyle="text-align:right;"  id="comashar2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td> 
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].comashar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comashar_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].comashar" style="width:100%;" inputStyle="text-align:right;" id="comashar3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].comashar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comashar_a3"/>
			                </td> 
			                <td  align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].comashar" style="width:100%;" inputStyle="text-align:right;" id="comashar4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td>  
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].comashar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comashar_a4"/>
			                </td>                     
			            </tr>
						<tr>
			                <td style="padding-left:10px;" id="gsyfft"></td>
			                <td align="center" id="comdshar6"></td>
			                <td align="center" id="comdshar5"></td>
			                <td align="center" id="comdshar"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.comdshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].comdshar" style="width:100%;" inputStyle="text-align:right;" id="comdshar1" allowInput="false" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].comdshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comdshar_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].comdshar" style="width:100%;" inputStyle="text-align:right;"  id="comdshar2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].comdshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comdshar_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].comdshar" style="width:100%;" inputStyle="text-align:right;" id="comdshar3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].comdshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comdshar_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].comdshar" style="width:100%;" inputStyle="text-align:right;" id="comdshar4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].comdshar" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="comdshar_a4"/>
			                </td>                       
			            </tr>
			             <tr>
			                <td style="padding-left: 10px;" id="hzhx">8.8坏账核销</td>
			                <td align="center" id="baddebts6"></td>
			                <td align="center" id="baddebts5"></td>
			                <td align="center" id="baddebts"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.baddebts" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].baddebts" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="baddebts1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].baddebts" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="baddebts_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].baddebts" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="baddebts2" onvaluechanged="doCal2()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].baddebts" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="baddebts_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].baddebts" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="baddebts3" onvaluechanged="doCal3()"/>
			                </td>
			                <td  align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].baddebts" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="baddebts_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].baddebts" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="baddebts4" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].baddebts" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="baddebts_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left: 10px;" id="cpht1">加：转入存货成本</td>
			                <td align="center" id="instock6"></td>
			                <td align="center" id="instock5"></td>
			                <td align="center" id="instock"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.instock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].instock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="instock1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].instock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="instock_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].instock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="instock2" onvaluechanged="doCal2()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].instock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="instock_a2"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].instock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="instock3" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].instock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="instock_a3"/>
			                </td>
			                <td  align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].instock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="instock4" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].instock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="instock_a4"/>
			                </td>                       
			            </tr>
						<tr>
			                <td style="padding-left: 10px;">减：转出存货成本</td>
			                <td align="center" id="outstock6"></td>
			                <td align="center" id="outstock5"></td>
			                <td align="center" id="outstock"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.outstock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].outstock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="outstock1" onvaluechanged="doCal1()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].outstock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="outstock_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].outstock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="outstock2" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].outstock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="outstock_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].outstock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="outstock3" onvaluechanged="doCal3()" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].outstock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="outstock_a3"/>
			                </td> 
			                <td  align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].outstock" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="outstock4" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].outstock" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="outstock_a4"/>
			                </td>                       
			            </tr>
			            <tr>
			                <td style="background:#9ACD32;">九、资产减值损失</td>
			                <td style="background:#9ACD32;" align="center" id="assetlose6"></td>
			                <td style="background:#9ACD32;" align="center" id="assetlose5"></td>
			                <td style="background:#9ACD32;" align="center" id="assetlose"></td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.assetlose" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].assetlose" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="assetlose1" onvaluechanged="doCal1()"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].assetlose" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="assetlose_a1"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].assetlose" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="assetlose2" onvaluechanged="doCal2()"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].assetlose" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="assetlose_a2"/>
			                </td>
			                 <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].assetlose" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="assetlose3" onvaluechanged="doCal3()"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].assetlose" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="assetlose_a3"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].assetlose" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="assetlose4" onvaluechanged="doCal4()"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].assetlose" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="assetlose_a4"/>
			                </td>                      
			            </tr>
			            <tr>
			                <td style="background:#9ACD32;">十、退税</td>
			                <td style=";background:#9ACD32;" align="center" id="payback6"></td>
			                <td style="background:#9ACD32;" align="center" id="payback5"></td>
			                <td style="background:#9ACD32;" align="center" id="payback"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.payback" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].payback" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="payback1" />
			                </td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].payback" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="payback_a1"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].payback" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="payback2" />
			                </td> 
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].payback" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="payback_a2"/>
			                </td>
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].payback" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="payback3" />
			                </td>
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].payback" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="payback_a3"/>
			                </td>
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].payback" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="payback4" />
			                </td> 
			                 <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].payback" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="payback_a4"/>
			                </td>                     
			            </tr>
			              <tr>
			                <td style="background:#9ACD32;">十一、服务税抵扣</td>
			                <td style="background:#9ACD32;" align="center" id="servtax6"></td>
			                <td style="background:#9ACD32;" align="center" id="servtax5"></td>
			                <td style="background:#9ACD32;" align="center" id="servtax"></td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.servtax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].servtax" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="servtax1" onvaluechanged="doCal1()"/>
			                </td>
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].servtax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="servtax_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].servtax" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="servtax2" onvaluechanged="doCal2()"/>
			                </td> 
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].servtax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="servtax_a2"/>
			                </td> 
			                 <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].servtax" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="servtax3" onvaluechanged="doCal3()"/>
			                </td>
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].servtax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="servtax_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].servtax" style="width:100%;" inputStyle="text-align:right;background:#FFFFE6;" id="servtax4" onvaluechanged="doCal4()"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].servtax" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="servtax_a4"/>
			                </td>                     
			            </tr>
						<tr>
			                <td style="background:#9ACD32;">十二、奖金前利润</td>
			                <td style="background:#9ACD32;" align="center" id="profitBBonus6"></td>
			                <td style="background:#9ACD32;" align="center" id="profitBBonus5"></td>
			                <td style="background:#9ACD32;" align="center" id="profitBBonus"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.profitBBonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" />
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].profitBBonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitBBonus1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].profitBBonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitBBonus_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].profitBBonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitBBonus2" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].profitBBonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitBBonus_a2"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].profitBBonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitBBonus3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].profitBBonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitBBonus_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].profitBBonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitBBonus4" />
			                </td> 
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].profitBBonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitBBonus_a4"/>
			                </td>                      
			            </tr>
						<tr>
			                <td >减：奖金</td>
			                <td align="center" id="bonus6"></td>
			                <td align="center" id="bonus5"></td>
			                <td align="center" id="bonus"></td>
			                 <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.bonus" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].bonus" style="width:100%;" inputStyle="text-align:right;" onvaluechanged="doCal1()" id="bonus1" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].bonus" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bonus_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].bonus" style="width:100%;" inputStyle="text-align:right;" onvaluechanged="doCal2()" id="bonus2" />
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].bonus" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bonus_a2"/>
			                </td> 
			                 <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].bonus" style="width:100%;" inputStyle="text-align:right;" onvaluechanged="doCal3()" id="bonus3" />
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].bonus" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bonus_a3"/>
			                </td> 
			                <td  align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].bonus" style="width:100%;" inputStyle="text-align:right;" onvaluechanged="doCal4()" id="bonus4" />
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].bonus" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bonus_a4"/>
			                </td>                      
			            </tr>
						<tr>
			                <td style="background:#9ACD32;">十三、奖金后利润</td>
			                <td style="background:#9ACD32;" align="center" id="profitABonus6"></td>
			                <td style="background:#9ACD32;" align="center" id="profitABonus5"></td>
			                <td style="background:#9ACD32;" align="center" id="profitABonus"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.profitABonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].profitABonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitABonus1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].profitABonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitABonus_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].profitABonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitABonus2" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].profitABonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitABonus_a2"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].profitABonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitABonus3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].profitABonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitABonus_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].profitABonus" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="profitABonus4" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].profitABonus" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="profitABonus_a4"/>
			                </td>                       
			            </tr>
			            <tr>
			                <td >预算说明</td>
			                <td></td>
			                <td></td>
			                <td></td>
			                <td></td>
			                <td align="center">
		                    	<input class="nui-textarea" name="budget[0].budgetmemo" id="budgetmemo1" style="width:100%;height:80px" emptyText="请输入"/>
			                </td>
			                <td></td>
			                <td align="center">
			                    	<input class="nui-textarea" name="budget[1].budgetmemo" id="budgetmemo2" style="width:100%;height:80px" emptyText="请输入"/>
			                </td>
			                <td></td>
			                <td align="center">
			                	<input class="nui-textarea" name="budget[2].budgetmemo" id="budgetmemo3" style="width:100%;height:80px" emptyText="请输入"/>
			                </td>
			                <td></td>
			                <td align="center">
			                	<input class="nui-textarea" name="budget[3].budgetmemo" id="budgetmemo4" style="width:100%;height:80px" emptyText="请输入"/>
			                </td> 
			                <td></td>          
			            </tr>
		            </tbody>
		        </table>
		</form>
    		</div>
		</div>
		<div style="padding-left:420px;height: 15px;margin-left: 8px;margin-right: 50px;margin-bottom: 3%">
			<a class="nui-button" onclick="onChecks">保存预算损益</a>
			<a class="nui-button" id="exportData" iconCls="icon-download" onclick="exportDeptbudget()">导出预算损益</a>
			<a class="nui-button" id="impBtn" iconCls="icon-upload" onclick="impbudget()">导入预算损益</a> 
		</div>
		<div id="win1" class="nui-window" title="请选择导出范围" style="width:595px;height: 215px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
		    <div style="padding:5px;width: 480px;text-align: center;">
	    		<span style="">请选择导出范围</span>
	    	</div>
	    	<div style="margin-top: 10px;" class="nui-toolbar" >
	    		  <a class="nui-button" onclick="dataPrepare()" style="width: 140px;">导出当前页面数据</a>   
	    		<a class="nui-button" onclick="exportDeptbudget1('0')" style="width: 140px;">导出本部门预算损益</a>
		        <a class="nui-button" onclick="exportDeptbudget1('1')" style="width: 200px;">导出本部门及下级部门预算损益</a>
		        <a class="nui-button" onclick="hideWindow" style="width: 60px;">关闭</a>
	    	</div>
	    	<div>注释：</br>1、“导出当前页面数据” 是指导出当前页面显示的预算数据（可能是修改未保存的）</br>
	    	2、“导出本部门预算损益” 是指导出数据库中保存的预算数据，不能导出页面修改后未保存的数据</br>
	    	3、“导出本部门及下级部门预算损益” 是指导出数据库中保存的本部门以及下级部门的预算数据
	    	 </div>
		</div>
	 <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<h:hidden property="_eosFlowAction" value="action0"/>
		<h:hidden property="downloadFile"/>
		<h:hidden property="fileName"/>
	</form> 
<!-- <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_fee.exportTicket.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>   --> 
	<script type="text/javascript">
		var degreeData = [];
		nui.parse();
		var form = new nui.Form("form1");
		var orgid = '<%=request.getParameter("orgid") %>';
		var orgdegree = '<%=request.getParameter("orgdegree") %>';
		var orglevel = '<%=request.getParameter("orglevel") %>';
		var orgtype = '<%=request.getParameter("orgtype") %>';
		var inputyear = '<%=request.getParameter("year") %>';
		var orgname = '<%=request.getParameter("orgname") %>';
		var orgseq = '<%=request.getParameter("orgseq") %>';
		var parentorgid = '<%=request.getParameter("parentorgid") %>';
		var orgFlag = '<%=request.getParameter("orgFlag") %>';//判断orgid是事业部还是业单元，或者是事业部但是没有业务单元
		top["win"]=window;//方便主页面调用
		init();
		function init(){
			var isshowdata = "";
			isshowdata.checked = false;
			showsj(isshowdata);
			document.getElementById("v1").innerHTML = inputyear+"年预计";
			document.getElementById("a1").innerHTML = inputyear+"年实际";
			document.getElementById("v6").innerHTML = inputyear-1+"年合计";
			document.getElementById("unlock").style.display = "none";
	   		document.getElementById("lock").style.display = "none";
			if(orgdegree==2||orgdegree==1){
				document.getElementById("table1").style.display = "";
				nui.get("psubfee1").setAllowInput(true);
				nui.get("psubfee2").setAllowInput(true);
				nui.get("psubfee3").setAllowInput(true);
				nui.get("psubfee4").setAllowInput(true);
				nui.get("ssubfee1").setAllowInput(true);
				nui.get("ssubfee2").setAllowInput(true);
				nui.get("ssubfee3").setAllowInput(true);
				nui.get("ssubfee4").setAllowInput(true);
				nui.get("msubfee1").setAllowInput(true);
				nui.get("msubfee2").setAllowInput(true);
				nui.get("msubfee3").setAllowInput(true);
				nui.get("msubfee4").setAllowInput(true);
				nui.get("servcost1").setAllowInput(true);
				nui.get("servcost2").setAllowInput(true);
				nui.get("servcost3").setAllowInput(true);
				nui.get("servcost4").setAllowInput(true);
				nui.get("salecost1").setAllowInput(true);
				nui.get("salecost2").setAllowInput(true);
				nui.get("salecost3").setAllowInput(true);
				nui.get("salecost4").setAllowInput(true);
				nui.get("deptmcost1").setAllowInput(true);
				nui.get("deptmcost2").setAllowInput(true);
				nui.get("deptmcost3").setAllowInput(true);
				nui.get("deptmcost4").setAllowInput(true);
				nui.get("deptdcost1").setAllowInput(true);
				nui.get("deptdcost2").setAllowInput(true);
				nui.get("deptdcost3").setAllowInput(true);
				nui.get("deptdcost4").setAllowInput(true);
				nui.get("servcost1").setBorderStyle("background:#FFFFE6");
				nui.get("servcost2").setBorderStyle("background:#FFFFE6");
				nui.get("servcost3").setBorderStyle("background:#FFFFE6");
				nui.get("servcost4").setBorderStyle("background:#FFFFE6");
				nui.get("salecost1").setBorderStyle("background:#FFFFE6");
				nui.get("salecost2").setBorderStyle("background:#FFFFE6");
				nui.get("salecost3").setBorderStyle("background:#FFFFE6");
				nui.get("salecost4").setBorderStyle("background:#FFFFE6");
				nui.get("deptmcost1").setBorderStyle("background:#FFFFE6");
				nui.get("deptmcost2").setBorderStyle("background:#FFFFE6");
				nui.get("deptmcost3").setBorderStyle("background:#FFFFE6");
				nui.get("deptmcost4").setBorderStyle("background:#FFFFE6");
				nui.get("deptdcost1").setBorderStyle("background:#FFFFE6");
				nui.get("deptdcost2").setBorderStyle("background:#FFFFE6");
				nui.get("deptdcost3").setBorderStyle("background:#FFFFE6");
				nui.get("deptdcost4").setBorderStyle("background:#FFFFE6");
				nui.get("psubfee1").setBorderStyle("background:#FFFFE6");
				nui.get("psubfee2").setBorderStyle("background:#FFFFE6");
				nui.get("psubfee3").setBorderStyle("background:#FFFFE6");
				nui.get("psubfee4").setBorderStyle("background:#FFFFE6");
				nui.get("ssubfee1").setBorderStyle("background:#FFFFE6");
				nui.get("ssubfee2").setBorderStyle("background:#FFFFE6");
				nui.get("ssubfee3").setBorderStyle("background:#FFFFE6");
				nui.get("ssubfee4").setBorderStyle("background:#FFFFE6");
				nui.get("msubfee1").setBorderStyle("background:#FFFFE6");
				nui.get("msubfee2").setBorderStyle("background:#FFFFE6");
				nui.get("msubfee3").setBorderStyle("background:#FFFFE6");
				nui.get("msubfee4").setBorderStyle("background:#FFFFE6");
				if(orgdegree== 1){
					nui.get("servcost1").setAllowInput(true);
					nui.get("servcost2").setAllowInput(true);
					nui.get("servcost3").setAllowInput(true);
					nui.get("servcost4").setAllowInput(true);
					nui.get("salecost1").setAllowInput(true);
					nui.get("salecost2").setAllowInput(true);
					nui.get("salecost3").setAllowInput(true);
					nui.get("salecost4").setAllowInput(true);
					nui.get("commshar1").setAllowInput(true);
					nui.get("commshar2").setAllowInput(true);
					nui.get("commshar3").setAllowInput(true);
					nui.get("commshar4").setAllowInput(true);
					nui.get("comdshar1").setAllowInput(true);
					nui.get("comdshar2").setAllowInput(true);
					nui.get("comdshar3").setAllowInput(true);
					nui.get("comdshar4").setAllowInput(true);
					nui.get("comashar1").setAllowInput(true);
					nui.get("comashar2").setAllowInput(true);
					nui.get("comashar3").setAllowInput(true);
					nui.get("comashar4").setAllowInput(true);
					nui.get("commshar1").setBorderStyle("background:#FFFFE6");
					nui.get("commshar2").setBorderStyle("background:#FFFFE6");
					nui.get("commshar3").setBorderStyle("background:#FFFFE6");
					nui.get("commshar4").setBorderStyle("background:#FFFFE6");
					nui.get("comdshar1").setBorderStyle("background:#FFFFE6");
					nui.get("comdshar2").setBorderStyle("background:#FFFFE6");
					nui.get("comdshar3").setBorderStyle("background:#FFFFE6");
					nui.get("comdshar4").setBorderStyle("background:#FFFFE6");
					nui.get("comashar1").setBorderStyle("background:#FFFFE6");
					nui.get("comashar2").setBorderStyle("background:#FFFFE6");
					nui.get("comashar3").setBorderStyle("background:#FFFFE6");
					nui.get("comashar4").setBorderStyle("background:#FFFFE6");
					nui.get("servcost1").setBorderStyle("background:#FFFFE6");
					nui.get("servcost2").setBorderStyle("background:#FFFFE6");
					nui.get("servcost3").setBorderStyle("background:#FFFFE6");
					nui.get("servcost4").setBorderStyle("background:#FFFFE6");
					nui.get("salecost1").setBorderStyle("background:#FFFFE6");
					nui.get("salecost2").setBorderStyle("background:#FFFFE6");
					nui.get("salecost3").setBorderStyle("background:#FFFFE6");
					nui.get("salecost4").setBorderStyle("background:#FFFFE6");
					document.getElementById("bmglfy").style.display = "none";
					document.getElementById("bmyffy").style.display = "none";
					document.getElementById("gsglft").innerHTML = "8.3公司管理费用";
					document.getElementById("gsscft").innerHTML = "8.4公司市场费用";
					document.getElementById("gsyfft").innerHTML = "8.5公司研发费用";
					degreeData = [{id: '1',text: '汇总合同数据'},{id:'2',text: '汇总收入数据'},{id:'3',text: '汇总收款数据'},{id:'4',text: '汇总分包及外部采购数据'},
					{id:'5',text: '汇总服务成本数据'},{id:'6',text: '汇总销售费用数据'}
					,{id:'9',text: '汇总公司管理费用数据'},{id:'A',text: '汇总公司研发费用数据'},
	                    {id:'B',text: '汇总公司市场费用数据'},{id:'C',text: '汇总资产减值损失数据'},{id:'D',text: '汇总存货数据'},{id:'E',text: '汇总坏账核销数据'},{id:'F',text: '汇总服务税抵扣数据'}];
	                nui.get("hzsj").setData(degreeData);
				}else{
					nui.get("commshar1").setAllowInput(false);
					nui.get("commshar2").setAllowInput(false);
					nui.get("commshar3").setAllowInput(false);
					nui.get("commshar4").setAllowInput(false);
					nui.get("comdshar1").setAllowInput(false);
					nui.get("comdshar2").setAllowInput(false);
					nui.get("comdshar3").setAllowInput(false);
					nui.get("comdshar4").setAllowInput(false);
					nui.get("comashar1").setAllowInput(false);
					nui.get("comashar2").setAllowInput(false);
					nui.get("comashar3").setAllowInput(false);
					nui.get("comashar4").setAllowInput(false);
					nui.get("commshar1").setBorderStyle("background:");
					nui.get("commshar2").setBorderStyle("background:");
					nui.get("commshar3").setBorderStyle("background:");
					nui.get("commshar4").setBorderStyle("background:");
					nui.get("comdshar1").setBorderStyle("background:");
					nui.get("comdshar2").setBorderStyle("background:");
					nui.get("comdshar3").setBorderStyle("background:");
					nui.get("comdshar4").setBorderStyle("background:");
					nui.get("comashar1").setBorderStyle("background:");
					nui.get("comashar2").setBorderStyle("background:");
					nui.get("comashar3").setBorderStyle("background:");
					nui.get("comashar4").setBorderStyle("background:");
					document.getElementById("bmglfy").style.display = "";
					document.getElementById("bmyffy").style.display = "";
					document.getElementById("gsglft").innerHTML = "8.5公司管理分摊";
					document.getElementById("gsscft").innerHTML = "8.6公司市场分摊";
					document.getElementById("gsyfft").innerHTML = "8.7公司研发分摊";
					var degreeData = [{id: '1',text: '汇总合同数据'},{id:'2',text: '汇总收入数据'},{id:'3',text: '汇总收款数据'},{id:'4',text: '汇总分包及外部采购数据'},
	                    {id:'5',text: '汇总服务成本数据'},{id:'6',text: '汇总销售费用数据'}
	                    ,{id:'7',text: '汇总部门管理费用数据'},{id:'8',text: '汇总部门研发费用数据'},{id:'C',text: '汇总资产减值损失数据'},{id:'D',text: '汇总存货数据'},{id:'E',text: '汇总坏账核销数据'},{id:'F',text: '汇总服务税抵扣数据'}];
	                    nui.get("hzsj").setData(degreeData);
				}
			}else{
				document.getElementById("table1").style.display = "none";
				nui.get("psubfee1").setAllowInput(false);
				nui.get("psubfee2").setAllowInput(false);
				nui.get("psubfee3").setAllowInput(false);
				nui.get("psubfee4").setAllowInput(false);
				nui.get("ssubfee1").setAllowInput(false);
				nui.get("ssubfee2").setAllowInput(false);
				nui.get("ssubfee3").setAllowInput(false);
				nui.get("ssubfee4").setAllowInput(false);
				nui.get("msubfee1").setAllowInput(false);
				nui.get("msubfee2").setAllowInput(false);
				nui.get("msubfee3").setAllowInput(false);
				nui.get("msubfee4").setAllowInput(false);
				nui.get("servcost1").setAllowInput(false);
				nui.get("servcost2").setAllowInput(false);
				nui.get("servcost3").setAllowInput(false);
				nui.get("servcost4").setAllowInput(false);
				nui.get("salecost1").setAllowInput(false);
				nui.get("salecost2").setAllowInput(false);
				nui.get("salecost3").setAllowInput(false);
				nui.get("salecost4").setAllowInput(false);
				nui.get("deptmcost1").setAllowInput(false);
				nui.get("deptmcost2").setAllowInput(false);
				nui.get("deptmcost3").setAllowInput(false);
				nui.get("deptmcost4").setAllowInput(false);
				nui.get("deptdcost1").setAllowInput(false);
				nui.get("deptdcost2").setAllowInput(false);
				nui.get("deptdcost3").setAllowInput(false);
				nui.get("deptdcost4").setAllowInput(false);
				nui.get("commshar1").setAllowInput(false);
				nui.get("commshar2").setAllowInput(false);
				nui.get("commshar3").setAllowInput(false);
				nui.get("commshar4").setAllowInput(false);
				nui.get("comdshar1").setAllowInput(false);
				nui.get("comdshar2").setAllowInput(false);
				nui.get("comdshar3").setAllowInput(false);
				nui.get("comdshar4").setAllowInput(false);
				nui.get("comashar1").setAllowInput(false);
				nui.get("comashar2").setAllowInput(false);
				nui.get("comashar3").setAllowInput(false);
				nui.get("comashar4").setAllowInput(false);
				nui.get("servcost1").setBorderStyle("background:");
				nui.get("servcost2").setBorderStyle("background:");
				nui.get("servcost3").setBorderStyle("background:");
				nui.get("servcost4").setBorderStyle("background:");
				nui.get("salecost1").setBorderStyle("background:");
				nui.get("salecost2").setBorderStyle("background:");
				nui.get("salecost3").setBorderStyle("background:");
				nui.get("salecost4").setBorderStyle("background:");
				nui.get("deptmcost1").setBorderStyle("background:");
				nui.get("deptmcost2").setBorderStyle("background:");
				nui.get("deptmcost3").setBorderStyle("background:");
				nui.get("deptmcost4").setBorderStyle("background:");
				nui.get("deptdcost1").setBorderStyle("background:");
				nui.get("deptdcost2").setBorderStyle("background:");
				nui.get("deptdcost3").setBorderStyle("background:");
				nui.get("deptdcost4").setBorderStyle("background:");
				nui.get("commshar1").setBorderStyle("background:");
				nui.get("commshar2").setBorderStyle("background:");
				nui.get("commshar3").setBorderStyle("background:");
				nui.get("commshar4").setBorderStyle("background:");
				nui.get("comdshar1").setBorderStyle("background:");
				nui.get("comdshar2").setBorderStyle("background:");
				nui.get("comdshar3").setBorderStyle("background:");
				nui.get("comdshar4").setBorderStyle("background:");
				nui.get("comashar1").setBorderStyle("background:");
				nui.get("comashar2").setBorderStyle("background:");
				nui.get("comashar3").setBorderStyle("background:");
				nui.get("comashar4").setBorderStyle("background:");
				nui.get("psubfee1").setBorderStyle("background:");
				nui.get("psubfee2").setBorderStyle("background:");
				nui.get("psubfee3").setBorderStyle("background:");
				nui.get("psubfee4").setBorderStyle("background:");
				nui.get("ssubfee1").setBorderStyle("background:");
				nui.get("ssubfee2").setBorderStyle("background:");
				nui.get("ssubfee3").setBorderStyle("background:");
				nui.get("ssubfee4").setBorderStyle("background:");
				nui.get("msubfee1").setBorderStyle("background:");
				nui.get("msubfee2").setBorderStyle("background:");
				nui.get("msubfee3").setBorderStyle("background:");
				nui.get("msubfee4").setBorderStyle("background:");
				document.getElementById("bmglfy").style.display = "";
				document.getElementById("bmyffy").style.display = "";
				document.getElementById("gsglft").innerHTML = "8.5公司管理分摊";
				document.getElementById("gsscft").innerHTML = "8.6公司市场分摊";
				document.getElementById("gsyfft").innerHTML = "8.7公司研发分摊";
			}
			form.loading("加载中....");
			var data = {orgid:orgid,year:inputyear,depttype:orgdegree,orgseq:orgseq,parentorgid:parentorgid};
		    var json = nui.encode(data);
			 nui.ajax({
	                url: "com.primeton.eos.ame_budget.deptbudget.getDeptBudget.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
						form.setData(text);
						form.unmask();
						document.getElementById("contamt").innerHTML = text.budget1.contamt == null ? "":formatNumber(text.budget1.contamt);
	    				document.getElementById("pcontamt").innerHTML = text.budget1.pcontamt == null ? "":formatNumber(text.budget1.pcontamt);
				    	document.getElementById("scontamt").innerHTML = text.budget1.scontamt == null ? "":formatNumber(text.budget1.scontamt);
				    	document.getElementById("mcontamt").innerHTML = text.budget1.mcontamt == null ? "":formatNumber(text.budget1.mcontamt);
				    	document.getElementById("receamt").innerHTML = text.budget1.receamt == null ? "":formatNumber(text.budget1.receamt);
				    	document.getElementById("taxincome").innerHTML = text.budget1.taxincome == null ? "":formatNumber(text.budget1.taxincome);
				    	document.getElementById("ptaxincome").innerHTML = text.budget1.ptaxincome == null ? "":formatNumber(text.budget1.ptaxincome);
				    	document.getElementById("mtaxincome").innerHTML = text.budget1.mtaxincome == null ? "":formatNumber(text.budget1.mtaxincome);
				    	document.getElementById("staxincome").innerHTML = text.budget1.staxincome == null ? "":formatNumber(text.budget1.staxincome);
				    	document.getElementById("ntaxincome").innerHTML = text.budget1.ntaxincome == null ? "":formatNumber(text.budget1.ntaxincome);
				    	document.getElementById("pntaxincome").innerHTML = text.budget1.pntaxincome == null ? "":formatNumber(text.budget1.pntaxincome);
				    	document.getElementById("mntaxincome").innerHTML = text.budget1.mntaxincome == null ? "":formatNumber(text.budget1.mntaxincome);
				    	document.getElementById("sntaxincome").innerHTML = text.budget1.sntaxincome == null ? "":formatNumber(text.budget1.sntaxincome);
				    	document.getElementById("subfee").innerHTML = text.budget1.subfee == null ? "":formatNumber(text.budget1.subfee);
				    	document.getElementById("psubfee").innerHTML = text.budget1.psubfee == null ? "":formatNumber(text.budget1.psubfee);
				    	document.getElementById("ssubfee").innerHTML = text.budget1.ssubfee == null ? "":formatNumber(text.budget1.ssubfee);
				    	document.getElementById("msubfee").innerHTML = text.budget1.msubfee == null ? "":formatNumber(text.budget1.msubfee);
				    	document.getElementById("bustax").innerHTML = text.budget1.bustax == null ? "":formatNumber(text.budget1.bustax);
				    	document.getElementById("netincome").innerHTML = text.budget1.netincome == null ? "":formatNumber(text.budget1.netincome);
				    	document.getElementById("pnetincome").innerHTML = text.budget1.pnetincome == null ? "":formatNumber(text.budget1.pnetincome);
				    	document.getElementById("snetincome").innerHTML = text.budget1.snetincome == null ? "":formatNumber(text.budget1.snetincome);
				    	document.getElementById("mnetincome").innerHTML = text.budget1.mnetincome == null ? "":formatNumber(text.budget1.mnetincome);
				    	document.getElementById("currentcost").innerHTML = text.budget1.currentcost == null ? "":formatNumber(text.budget1.currentcost);
				    	document.getElementById("servcost").innerHTML = text.budget1.servcost == null ? "":formatNumber(text.budget1.servcost);
				    	document.getElementById("salecost").innerHTML = text.budget1.salecost == null ? "":formatNumber(text.budget1.salecost);
				    	document.getElementById("deptmcost").innerHTML = text.budget1.deptmcost == null ? "":formatNumber(text.budget1.deptmcost);
				    	document.getElementById("deptdcost").innerHTML = text.budget1.deptdcost == null ? "":formatNumber(text.budget1.deptdcost);
				    	document.getElementById("commshar").innerHTML = text.budget1.commshar == null ? "":formatNumber(text.budget1.commshar);
				    	document.getElementById("comashar").innerHTML = text.budget1.comashar == null ? "":formatNumber(text.budget1.comashar);
				    	document.getElementById("comdshar").innerHTML = text.budget1.comdshar == null ? "":formatNumber(text.budget1.comdshar);
				    	document.getElementById("baddebts").innerHTML = text.budget1.baddebts == null ? "":formatNumber(text.budget1.baddebts);
				    	document.getElementById("assetlose").innerHTML = text.budget1.assetlose == null ? "":formatNumber(text.budget1.assetlose);
				    	document.getElementById("instock").innerHTML = text.budget1.instock == null ? "":formatNumber(text.budget1.instock);
				    	document.getElementById("outstock").innerHTML = text.budget1.outstock == null ? "":formatNumber(text.budget1.outstock);
				    	document.getElementById("payback").innerHTML = text.budget1.payback == null ? "":formatNumber(text.budget1.payback);
				    	document.getElementById("servtax").innerHTML = text.budget1.servtax == null ? "":formatNumber(text.budget1.servtax);
				    	document.getElementById("bonus").innerHTML = text.budget1.bonus == null ? "":formatNumber(text.budget1.bonus);
				    	document.getElementById("profitBBonus").innerHTML = text.budget1.profitBBonus == null ? "":formatNumber(text.budget1.profitBBonus);
				    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
						document.getElementById("contamt5").innerHTML = text.budget2.contamt == null ? "":formatNumber(text.budget2.contamt);
	    				document.getElementById("pcontamt5").innerHTML = text.budget2.pcontamt == null ? "":formatNumber(text.budget2.pcontamt);
				    	document.getElementById("scontamt5").innerHTML = text.budget2.scontamt == null ? "":formatNumber(text.budget2.scontamt);
				    	document.getElementById("mcontamt5").innerHTML = text.budget2.mcontamt == null ? "":formatNumber(text.budget2.mcontamt);
				    	document.getElementById("receamt5").innerHTML = text.budget2.receamt == null ? "":formatNumber(text.budget2.receamt);
				    	document.getElementById("taxincome5").innerHTML = text.budget2.taxincome == null ? "":formatNumber(text.budget2.taxincome);
				    	document.getElementById("ptaxincome5").innerHTML = text.budget2.ptaxincome == null ? "":formatNumber(text.budget2.ptaxincome);
				    	document.getElementById("mtaxincome5").innerHTML = text.budget2.mtaxincome == null ? "":formatNumber(text.budget2.mtaxincome);
				    	document.getElementById("staxincome5").innerHTML = text.budget2.staxincome == null ? "":formatNumber(text.budget2.staxincome);
				    	document.getElementById("ntaxincome5").innerHTML = text.budget2.ntaxincome == null ? "":formatNumber(text.budget2.ntaxincome);
				    	document.getElementById("pntaxincome5").innerHTML = text.budget2.pntaxincome == null ? "":formatNumber(text.budget2.pntaxincome);
				    	document.getElementById("mntaxincome5").innerHTML = text.budget2.mntaxincome == null ? "":formatNumber(text.budget2.mntaxincome);
				    	document.getElementById("sntaxincome5").innerHTML = text.budget2.sntaxincome == null ? "":formatNumber(text.budget2.sntaxincome);
				    	document.getElementById("subfee5").innerHTML = text.budget2.subfee == null ? "":formatNumber(text.budget2.subfee);
				    	document.getElementById("psubfee5").innerHTML = text.budget2.psubfee == null ? "":formatNumber(text.budget2.psubfee);
				    	document.getElementById("ssubfee5").innerHTML = text.budget2.ssubfee == null ? "":formatNumber(text.budget2.ssubfee);
				    	document.getElementById("msubfee5").innerHTML = text.budget2.msubfee == null ? "":formatNumber(text.budget2.msubfee);
				    	document.getElementById("bustax5").innerHTML = text.budget2.bustax == null ? "":formatNumber(text.budget2.bustax);
				    	document.getElementById("netincome5").innerHTML = text.budget2.netincome == null ? "":formatNumber(text.budget2.netincome);
				    	document.getElementById("pnetincome5").innerHTML = text.budget2.pnetincome == null ? "":formatNumber(text.budget2.pnetincome);
				    	document.getElementById("snetincome5").innerHTML = text.budget2.snetincome == null ? "":formatNumber(text.budget2.snetincome);
				    	document.getElementById("mnetincome5").innerHTML = text.budget2.mnetincome == null ? "":formatNumber(text.budget2.mnetincome);
				    	document.getElementById("currentcost5").innerHTML = text.budget2.currentcost == null ? "":formatNumber(text.budget2.currentcost);
				    	document.getElementById("servcost5").innerHTML = text.budget2.servcost == null ? "":formatNumber(text.budget2.servcost);
				    	document.getElementById("salecost5").innerHTML = text.budget2.salecost == null ? "":formatNumber(text.budget2.salecost);
				    	document.getElementById("deptmcost5").innerHTML = text.budget2.deptmcost == null ? "":formatNumber(text.budget2.deptmcost);
				    	document.getElementById("deptdcost5").innerHTML = text.budget2.deptdcost == null ? "":formatNumber(text.budget2.deptdcost);
				    	document.getElementById("commshar5").innerHTML = text.budget2.commshar == null ? "":formatNumber(text.budget2.commshar);
				    	document.getElementById("comashar5").innerHTML = text.budget2.comashar == null ? "":formatNumber(text.budget2.comashar);
				    	document.getElementById("comdshar5").innerHTML = text.budget2.comdshar == null ? "":formatNumber(text.budget2.comdshar);
				    	document.getElementById("baddebts5").innerHTML = text.budget2.baddebts == null ? "":formatNumber(text.budget2.baddebts);
				    	document.getElementById("assetlose5").innerHTML = text.budget2.assetlose == null ? "":formatNumber(text.budget2.assetlose);
				    	document.getElementById("instock5").innerHTML = text.budget2.instock == null ? "":formatNumber(text.budget2.instock);
				    	document.getElementById("outstock5").innerHTML = text.budget2.outstock == null ? "":formatNumber(text.budget2.outstock);
				    	document.getElementById("payback5").innerHTML = text.budget2.payback == null ? "":formatNumber(text.budget2.payback);
				    	document.getElementById("servtax5").innerHTML = text.budget2.servtax == null ? "":formatNumber(text.budget2.servtax);
				    	document.getElementById("bonus5").innerHTML = text.budget2.bonus == null ? "":formatNumber(text.budget2.bonus);
				    	document.getElementById("profitBBonus5").innerHTML = text.budget2.profitBBonus == null ? "":formatNumber(text.budget2.profitBBonus);
				    	document.getElementById("profitABonus5").innerHTML = text.budget2.profitABonus == null ? "":formatNumber(text.budget2.profitABonus);
				    	document.getElementById("contamt6").innerHTML = (text.budget3.contamt*100).toFixed(1)+"%";
				    	document.getElementById("pcontamt6").innerHTML = (text.budget3.pcontamt*100).toFixed(1)+"%";
				    	document.getElementById("scontamt6").innerHTML = (text.budget3.scontamt*100).toFixed(1)+"%";
				    	document.getElementById("mcontamt6").innerHTML = (text.budget3.mcontamt*100).toFixed(1)+"%";
				    	document.getElementById("receamt6").innerHTML = (text.budget3.receamt*100).toFixed(1)+"%";
				    	document.getElementById("taxincome6").innerHTML = (text.budget3.taxincome*100).toFixed(1)+"%";
				    	document.getElementById("ptaxincome6").innerHTML = (text.budget3.ptaxincome*100).toFixed(1)+"%";
				    	document.getElementById("mtaxincome6").innerHTML = (text.budget3.mtaxincome*100).toFixed(1)+"%";
				    	document.getElementById("staxincome6").innerHTML = (text.budget3.staxincome*100).toFixed(1)+"%";
				    	document.getElementById("ntaxincome6").innerHTML = (text.budget3.ntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("pntaxincome6").innerHTML = (text.budget3.pntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("mntaxincome6").innerHTML = (text.budget3.mntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("sntaxincome6").innerHTML = (text.budget3.sntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("subfee6").innerHTML = (text.budget3.subfee*100).toFixed(1)+"%";
				    	document.getElementById("psubfee6").innerHTML = (text.budget3.psubfee*100).toFixed(1)+"%";
				    	document.getElementById("ssubfee6").innerHTML = (text.budget3.ssubfee*100).toFixed(1)+"%";
				    	document.getElementById("msubfee6").innerHTML = (text.budget3.msubfee*100).toFixed(1)+"%";
				    	document.getElementById("bustax6").innerHTML = (text.budget3.bustax*100).toFixed(1)+"%";
				    	document.getElementById("netincome6").innerHTML = (text.budget3.netincome*100).toFixed(1)+"%";
				    	document.getElementById("pnetincome6").innerHTML = (text.budget3.pnetincome*100).toFixed(1)+"%";
				    	document.getElementById("snetincome6").innerHTML = (text.budget3.snetincome*100).toFixed(1)+"%";
				    	document.getElementById("mnetincome6").innerHTML = (text.budget3.mnetincome*100).toFixed(1)+"%";
				    	document.getElementById("currentcost6").innerHTML = (text.budget3.currentcost*100).toFixed(1)+"%";
				    	document.getElementById("servcost6").innerHTML = (text.budget3.servcost*100).toFixed(1)+"%";
				    	document.getElementById("salecost6").innerHTML = (text.budget3.salecost*100).toFixed(1)+"%";
				    	document.getElementById("deptmcost6").innerHTML = (text.budget3.deptmcost*100).toFixed(1)+"%";
				    	document.getElementById("deptdcost6").innerHTML = (text.budget3.deptdcost*100).toFixed(1)+"%";
				    	document.getElementById("commshar6").innerHTML = (text.budget3.commshar*100).toFixed(1)+"%";
				    	document.getElementById("comashar6").innerHTML = (text.budget3.comashar*100).toFixed(1)+"%";
				    	document.getElementById("comdshar6").innerHTML = (text.budget3.comdshar*100).toFixed(1)+"%";
				    	document.getElementById("baddebts6").innerHTML = (text.budget3.baddebts*100).toFixed(1)+"%";
				    	document.getElementById("assetlose6").innerHTML = (text.budget3.assetlose*100).toFixed(1)+"%";
				    	document.getElementById("instock6").innerHTML = (text.budget3.instock*100).toFixed(1)+"%" ;
				    	document.getElementById("outstock6").innerHTML = (text.budget3.outstock*100).toFixed(1)+"%";
				    	document.getElementById("payback6").innerHTML = (text.budget3.payback*100).toFixed(1)+"%";
				    	document.getElementById("servtax6").innerHTML = (text.budget3.servtax*100).toFixed(1)+"%";
				    	document.getElementById("bonus6").innerHTML = (text.budget3.bonus*100).toFixed(1)+"%";
				    	document.getElementById("profitBBonus6").innerHTML = (text.budget3.profitBBonus*100).toFixed(1)+"%";
				    	document.getElementById("profitABonus6").innerHTML = (text.budget3.profitABonus*100).toFixed(1)+"%";
						//判断是否事业部级（筛除除没有业务单元的事业部）1、是事业部：false。2、不是事业部true
						orgFlag = text.orgFlag;
						if(orgFlag == 3){
							degreeData = [{id:'4',text: '汇总分包及外部采购数据'},{id:'5',text: '汇总服务成本数据'},{id:'6',text: '汇总销售费用数据'}
	                    ,{id:'7',text: '汇总部门管理费用数据'},{id:'8',text: '汇总部门研发费用数据'}];
		               		 nui.get("hzsj").setData(degreeData);
						}
	                   	//锁定解锁：1、锁定  2、解锁
	                   	budstatus = text.budstatus;
	                   	if(budstatus=="1"){
	                   		//锁定状态下隐藏分包及外部采购非统计行
	                   		document.getElementById("psubline").style.display = "none";
	                   		document.getElementById("masubline").style.display = "none";
	                   		document.getElementById("ssubline").style.display = "none";
	                   		if(orgid==1){
	                   			nui.get("commshar1").setAllowInput(false);
								nui.get("commshar2").setAllowInput(false);
								nui.get("commshar3").setAllowInput(false);
								nui.get("commshar4").setAllowInput(false);
								nui.get("comdshar1").setAllowInput(false);
								nui.get("comdshar2").setAllowInput(false);
								nui.get("comdshar3").setAllowInput(false);
								nui.get("comdshar4").setAllowInput(false);
								nui.get("comashar1").setAllowInput(false);
								nui.get("comashar2").setAllowInput(false);
								nui.get("comashar3").setAllowInput(false);
								nui.get("comashar4").setAllowInput(false);
								nui.get("commshar1").setBorderStyle("background:");
								nui.get("commshar2").setBorderStyle("background:");
								nui.get("commshar3").setBorderStyle("background:");
								nui.get("commshar4").setBorderStyle("background:");
								nui.get("comdshar1").setBorderStyle("background:");
								nui.get("comdshar2").setBorderStyle("background:");
								nui.get("comdshar3").setBorderStyle("background:");
								nui.get("comdshar4").setBorderStyle("background:");
								nui.get("comashar1").setBorderStyle("background:");
								nui.get("comashar2").setBorderStyle("background:");
								nui.get("comashar3").setBorderStyle("background:");
								nui.get("comashar4").setBorderStyle("background:");
								document.getElementById("lock").style.display = "none";
								document.getElementById("unlock").style.display = "";
								document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(已锁定)";
	                   		}else{
	                   			document.getElementById("unlock").style.display = "none";
	                   			document.getElementById("lock").style.display = "none";
	                   			document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(已锁定)";
	                   		}
	                   	}else{
	                   	//解锁状态下释放非统计行
	                   		document.getElementById("psubline").style.display = "";
	                   		document.getElementById("masubline").style.display = "";
	                   		document.getElementById("ssubline").style.display = "";
	                   		if(orgid==1){
	                   			document.getElementById("unlock").style.display = "none";
	                   			document.getElementById("lock").style.display = "";
	                   			document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(未锁定)";	
	                   		}else{
	                   			document.getElementById("unlock").style.display = "none";
	                   			document.getElementById("lock").style.display = "none";
	                   			document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(未锁定)";	
	                   		}
	                   	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    //alert(jqXHR.responseText);
	                }
	            });
		}
		function onChecks(){
			var json = nui.encode({year:inputyear});
	        nui.ajax({
	            url: "com.primeton.eos.ame_budget.common.lockOrUnlock.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
						if(text.budstatus=="1"){
	                   		if(orgid==1){
	                   			budstatus=1;
								document.getElementById("lock").style.display = "none";
								document.getElementById("unlock").style.display = "";
								document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(已锁定)";
								onOk();
	                   		}else{
		                   		alert("预算已锁定，不能提交数据");
								budstatus=1;
								return;
	                   			document.getElementById("unlock").style.display = "none";
	                   			document.getElementById("lock").style.display = "none";
	                   			document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(已锁定)";
	                   		}
	                   	}else{
	                   		if(orgid==1){
	                   			budstatus=2;
	                   			document.getElementById("unlock").style.display = "none";
	                   			document.getElementById("lock").style.display = "";
	                   			document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(未锁定)";	
	                   		}else{
	                   			budstatus=2;
	                   			document.getElementById("unlock").style.display = "none";
	                   			document.getElementById("lock").style.display = "none";
	                   			document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(未锁定)";	
	                   		}
	                   		onOk();
	                   	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
		}
		function onOk(){
			var netincome6 = document.getElementById("netincome6").innerHTML;
			var currentcost6 = document.getElementById("currentcost6").innerHTML;
			nui.get("q1").setValue("1");
			nui.get("q2").setValue("2");
			nui.get("q3").setValue("3");
			nui.get("q4").setValue("4");
			nui.get("orgid1").setValue(orgid);
			nui.get("orgid2").setValue(orgid);
			nui.get("orgid3").setValue(orgid);
			nui.get("orgid4").setValue(orgid);
			nui.get("year1").setValue(inputyear);
			nui.get("year2").setValue(inputyear);
			nui.get("year3").setValue(inputyear);
			nui.get("year4").setValue(inputyear); 
	    	var o = form.getData();
	       form.loading("加载中....");
	       if(confirm("保存预算损益会重新计算相关分摊数据，是否保存当前页面的预算损益数据？")){
	        if(parseFloat(currentcost6)>parseFloat(netincome6)){
				if (confirm("成本的增长率大于净收入的增长率，是否确定保存！？")) {
			        if(form.validate()){
			            var json = nui.encode({budget:o.budget,orgname:orgname});
			            nui.ajax({
			                url: "com.primeton.eos.ame_budget.deptbudget.addDeptBudget.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                    	form.unmask();
			                    	alert("保存成功!");
			                    	init();
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			            });
			        }else{
			        	return;
			        } 
				}else{
					form.unmask();
				}
	   	 	}else{
	   	 		if(form.validate()){
			            var json = nui.encode({budget:o.budget,orgname:orgname});
			            nui.ajax({
			                url: "com.primeton.eos.ame_budget.deptbudget.addDeptBudget.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                    	form.unmask();
			                    	alert("保存成功!");
			                    	init();
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
	   	 	
	       }else{
	       	form.unmask();
	       }	
		}
	    //汇总数据，需要把页面上已有的数据传到后台，做数据计算
		function sumCal(e){
				var temp = nui.get("hzsj").getValue();
				if(temp == null || temp == ""){
					nui.alert("请选择一个汇总项！");
					return;
				}
			if (confirm("数据汇总后，将替换现有数据，是否确定汇总？")) {
				form.loading("数据汇总中....");
				var o = form.getData();
				var data = {orgid:orgid,year:inputyear,budget:o.budget,temp:temp,orgname:orgname,orgFlag:orgFlag};
			    var json = nui.encode(data);
				 nui.ajax({
		                url: "com.primeton.eos.ame_budget.deptbudget.sumcont2.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                		form.setData(text);
		                		document.getElementById("contamt").innerHTML = text.budget1.contamt == null ? "":formatNumber(text.budget1.contamt);
			    				document.getElementById("pcontamt").innerHTML = text.budget1.pcontamt == null ? "":formatNumber(text.budget1.pcontamt);
						    	document.getElementById("scontamt").innerHTML = text.budget1.scontamt == null ? "":formatNumber(text.budget1.scontamt);
						    	document.getElementById("mcontamt").innerHTML = text.budget1.mcontamt == null ? "":formatNumber(text.budget1.mcontamt);
						    	document.getElementById("receamt").innerHTML = text.budget1.receamt == null ? "":formatNumber(text.budget1.receamt);
						    	document.getElementById("taxincome").innerHTML = text.budget1.taxincome == null ? "":formatNumber(text.budget1.taxincome);
						    	document.getElementById("ptaxincome").innerHTML = text.budget1.ptaxincome == null ? "":formatNumber(text.budget1.ptaxincome);
						    	document.getElementById("mtaxincome").innerHTML = text.budget1.mtaxincome == null ? "":formatNumber(text.budget1.mtaxincome);
						    	document.getElementById("staxincome").innerHTML = text.budget1.staxincome == null ? "":formatNumber(text.budget1.staxincome);
						    	document.getElementById("ntaxincome").innerHTML = text.budget1.ntaxincome == null ? "":formatNumber(text.budget1.ntaxincome);
						    	document.getElementById("pntaxincome").innerHTML = text.budget1.pntaxincome == null ? "":formatNumber(text.budget1.pntaxincome);
						    	document.getElementById("mntaxincome").innerHTML = text.budget1.mntaxincome == null ? "":formatNumber(text.budget1.mntaxincome);
						    	document.getElementById("sntaxincome").innerHTML = text.budget1.sntaxincome == null ? "":formatNumber(text.budget1.sntaxincome);
						    	document.getElementById("subfee").innerHTML = text.budget1.subfee == null ? "":formatNumber(text.budget1.subfee);
						    	document.getElementById("psubfee").innerHTML = text.budget1.psubfee == null ? "":formatNumber(text.budget1.psubfee);
						    	document.getElementById("ssubfee").innerHTML = text.budget1.ssubfee == null ? "":formatNumber(text.budget1.ssubfee);
						    	document.getElementById("msubfee").innerHTML = text.budget1.msubfee == null ? "":formatNumber(text.budget1.msubfee);
						    	document.getElementById("bustax").innerHTML = text.budget1.bustax == null ? "":formatNumber(text.budget1.bustax);
						    	document.getElementById("netincome").innerHTML = text.budget1.netincome == null ? "":formatNumber(text.budget1.netincome);
						    	document.getElementById("pnetincome").innerHTML = text.budget1.pnetincome == null ? "":formatNumber(text.budget1.pnetincome);
						    	document.getElementById("snetincome").innerHTML = text.budget1.snetincome == null ? "":formatNumber(text.budget1.snetincome);
						    	document.getElementById("mnetincome").innerHTML = text.budget1.mnetincome == null ? "":formatNumber(text.budget1.mnetincome);
						    	document.getElementById("currentcost").innerHTML = text.budget1.currentcost == null ? "":formatNumber(text.budget1.currentcost);
						    	document.getElementById("servcost").innerHTML = text.budget1.servcost == null ? "":formatNumber(text.budget1.servcost);
						    	document.getElementById("salecost").innerHTML = text.budget1.salecost == null ? "":formatNumber(text.budget1.salecost);
						    	document.getElementById("deptmcost").innerHTML = text.budget1.deptmcost == null ? "":formatNumber(text.budget1.deptmcost);
						    	document.getElementById("deptdcost").innerHTML = text.budget1.deptdcost == null ? "":formatNumber(text.budget1.deptdcost);
						    	document.getElementById("commshar").innerHTML = text.budget1.commshar == null ? "":formatNumber(text.budget1.commshar);
						    	document.getElementById("comashar").innerHTML = text.budget1.comashar == null ? "":formatNumber(text.budget1.comashar);
						    	document.getElementById("comdshar").innerHTML = text.budget1.comdshar == null ? "":formatNumber(text.budget1.comdshar);
						    	document.getElementById("baddebts").innerHTML = text.budget1.baddebts == null ? "":formatNumber(text.budget1.baddebts);
						    	document.getElementById("assetlose").innerHTML = text.budget1.assetlose == null ? "":formatNumber(text.budget1.assetlose);
						    	document.getElementById("instock").innerHTML = text.budget1.instock == null ? "":formatNumber(text.budget1.instock);
						    	document.getElementById("outstock").innerHTML = text.budget1.outstock == null ? "":formatNumber(text.budget1.outstock);
						    	document.getElementById("payback").innerHTML = text.budget1.payback == null ? "":formatNumber(text.budget1.payback);
						    	document.getElementById("servtax").innerHTML = text.budget1.servtax == null ? "":formatNumber(text.budget1.servtax);
						    	document.getElementById("bonus").innerHTML = text.budget1.bonus == null ? "":formatNumber(text.budget1.bonus);
						    	document.getElementById("profitBBonus").innerHTML = text.budget1.profitBBonus == null ? "":formatNumber(text.budget1.profitBBonus);
						    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
								document.getElementById("contamt5").innerHTML = text.budget2.contamt == null ? "":formatNumber(text.budget2.contamt);
			    				document.getElementById("pcontamt5").innerHTML = text.budget2.pcontamt == null ? "":formatNumber(text.budget2.pcontamt);
						    	document.getElementById("scontamt5").innerHTML = text.budget2.scontamt == null ? "":formatNumber(text.budget2.scontamt);
						    	document.getElementById("mcontamt5").innerHTML = text.budget2.mcontamt == null ? "":formatNumber(text.budget2.mcontamt);
						    	document.getElementById("receamt5").innerHTML = text.budget2.receamt == null ? "":formatNumber(text.budget2.receamt);
						    	document.getElementById("taxincome5").innerHTML = text.budget2.taxincome == null ? "":formatNumber(text.budget2.taxincome);
						    	document.getElementById("ptaxincome5").innerHTML = text.budget2.ptaxincome == null ? "":formatNumber(text.budget2.ptaxincome);
						    	document.getElementById("mtaxincome5").innerHTML = text.budget2.mtaxincome == null ? "":formatNumber(text.budget2.mtaxincome);
						    	document.getElementById("staxincome5").innerHTML = text.budget2.staxincome == null ? "":formatNumber(text.budget2.staxincome);
						    	document.getElementById("ntaxincome5").innerHTML = text.budget2.ntaxincome == null ? "":formatNumber(text.budget2.ntaxincome);
						    	document.getElementById("pntaxincome5").innerHTML = text.budget2.pntaxincome == null ? "":formatNumber(text.budget2.pntaxincome);
						    	document.getElementById("mntaxincome5").innerHTML = text.budget2.mntaxincome == null ? "":formatNumber(text.budget2.mntaxincome);
						    	document.getElementById("sntaxincome5").innerHTML = text.budget2.sntaxincome == null ? "":formatNumber(text.budget2.sntaxincome);
						    	document.getElementById("subfee5").innerHTML = text.budget2.subfee == null ? "":formatNumber(text.budget2.subfee);
						    	document.getElementById("psubfee5").innerHTML = text.budget2.psubfee == null ? "":formatNumber(text.budget2.psubfee);
						    	document.getElementById("ssubfee5").innerHTML = text.budget2.ssubfee == null ? "":formatNumber(text.budget2.ssubfee);
						    	document.getElementById("msubfee5").innerHTML = text.budget2.msubfee == null ? "":formatNumber(text.budget2.msubfee);
						    	document.getElementById("bustax5").innerHTML = text.budget2.bustax == null ? "":formatNumber(text.budget2.bustax);
						    	document.getElementById("netincome5").innerHTML = text.budget2.netincome == null ? "":formatNumber(text.budget2.netincome);
						    	document.getElementById("pnetincome5").innerHTML = text.budget2.pnetincome == null ? "":formatNumber(text.budget2.pnetincome);
						    	document.getElementById("snetincome5").innerHTML = text.budget2.snetincome == null ? "":formatNumber(text.budget2.snetincome);
						    	document.getElementById("mnetincome5").innerHTML = text.budget2.mnetincome == null ? "":formatNumber(text.budget2.mnetincome);
						    	document.getElementById("currentcost5").innerHTML = text.budget2.currentcost == null ? "":formatNumber(text.budget2.currentcost);
						    	document.getElementById("servcost5").innerHTML = text.budget2.servcost == null ? "":formatNumber(text.budget2.servcost);
						    	document.getElementById("salecost5").innerHTML = text.budget2.salecost == null ? "":formatNumber(text.budget2.salecost);
						    	document.getElementById("deptmcost5").innerHTML = text.budget2.deptmcost == null ? "":formatNumber(text.budget2.deptmcost);
						    	document.getElementById("deptdcost5").innerHTML = text.budget2.deptdcost == null ? "":formatNumber(text.budget2.deptdcost);
						    	document.getElementById("commshar5").innerHTML = text.budget2.commshar == null ? "":formatNumber(text.budget2.commshar);
						    	document.getElementById("comashar5").innerHTML = text.budget2.comashar == null ? "":formatNumber(text.budget2.comashar);
						    	document.getElementById("comdshar5").innerHTML = text.budget2.comdshar == null ? "":formatNumber(text.budget2.comdshar);
						    	document.getElementById("baddebts5").innerHTML = text.budget2.baddebts == null ? "":formatNumber(text.budget2.baddebts);
						    	document.getElementById("assetlose5").innerHTML = text.budget2.assetlose == null ? "":formatNumber(text.budget2.assetlose);
						    	document.getElementById("instock5").innerHTML = text.budget2.instock == null ? "":formatNumber(text.budget2.instock);
						    	document.getElementById("outstock5").innerHTML = text.budget2.outstock == null ? "":formatNumber(text.budget2.outstock);
						    	document.getElementById("payback5").innerHTML = text.budget2.payback == null ? "":formatNumber(text.budget2.payback);
						    	document.getElementById("servtax5").innerHTML = text.budget2.servtax == null ? "":formatNumber(text.budget2.servtax);
						    	document.getElementById("bonus5").innerHTML = text.budget2.bonus == null ? "":formatNumber(text.budget2.bonus);
						    	document.getElementById("profitBBonus5").innerHTML = text.budget2.profitBBonus == null ? "":formatNumber(text.budget2.profitBBonus);
						    	document.getElementById("profitABonus5").innerHTML = text.budget2.profitABonus == null ? "":formatNumber(text.budget2.profitABonus);
						    	document.getElementById("contamt6").innerHTML = (text.budget3.contamt*100).toFixed(1)+"%";
						    	document.getElementById("pcontamt6").innerHTML = (text.budget3.pcontamt*100).toFixed(1)+"%";
						    	document.getElementById("scontamt6").innerHTML = (text.budget3.scontamt*100).toFixed(1)+"%";
						    	document.getElementById("mcontamt6").innerHTML = (text.budget3.mcontamt*100).toFixed(1)+"%";
						    	document.getElementById("receamt6").innerHTML = (text.budget3.receamt*100).toFixed(1)+"%";
						    	document.getElementById("taxincome6").innerHTML = (text.budget3.taxincome*100).toFixed(1)+"%";
						    	document.getElementById("ptaxincome6").innerHTML = (text.budget3.ptaxincome*100).toFixed(1)+"%";
						    	document.getElementById("mtaxincome6").innerHTML = (text.budget3.mtaxincome*100).toFixed(1)+"%";
						    	document.getElementById("staxincome6").innerHTML = (text.budget3.staxincome*100).toFixed(1)+"%";
						    	document.getElementById("ntaxincome6").innerHTML = (text.budget3.ntaxincome*100).toFixed(1)+"%";
						    	document.getElementById("pntaxincome6").innerHTML = (text.budget3.pntaxincome*100).toFixed(1)+"%";
						    	document.getElementById("mntaxincome6").innerHTML = (text.budget3.mntaxincome*100).toFixed(1)+"%";
						    	document.getElementById("sntaxincome6").innerHTML = (text.budget3.sntaxincome*100).toFixed(1)+"%";
						    	document.getElementById("subfee6").innerHTML = (text.budget3.subfee*100).toFixed(1)+"%";
						    	document.getElementById("psubfee6").innerHTML = (text.budget3.psubfee*100).toFixed(1)+"%";
						    	document.getElementById("ssubfee6").innerHTML = (text.budget3.ssubfee*100).toFixed(1)+"%";
						    	document.getElementById("msubfee6").innerHTML = (text.budget3.msubfee*100).toFixed(1)+"%";
						    	document.getElementById("bustax6").innerHTML = (text.budget3.bustax*100).toFixed(1)+"%";
						    	document.getElementById("netincome6").innerHTML = (text.budget3.netincome*100).toFixed(1)+"%";
						    	document.getElementById("pnetincome6").innerHTML = (text.budget3.pnetincome*100).toFixed(1)+"%";
						    	document.getElementById("snetincome6").innerHTML = (text.budget3.snetincome*100).toFixed(1)+"%";
						    	document.getElementById("mnetincome6").innerHTML = (text.budget3.mnetincome*100).toFixed(1)+"%";
						    	document.getElementById("currentcost6").innerHTML = (text.budget3.currentcost*100).toFixed(1)+"%";
						    	document.getElementById("servcost6").innerHTML = (text.budget3.servcost*100).toFixed(1)+"%";
						    	document.getElementById("salecost6").innerHTML = (text.budget3.salecost*100).toFixed(1)+"%";
						    	document.getElementById("deptmcost6").innerHTML = (text.budget3.deptmcost*100).toFixed(1)+"%";
						    	document.getElementById("deptdcost6").innerHTML = (text.budget3.deptdcost*100).toFixed(1)+"%";
						    	document.getElementById("commshar6").innerHTML = (text.budget3.commshar*100).toFixed(1)+"%";
						    	document.getElementById("comashar6").innerHTML = (text.budget3.comashar*100).toFixed(1)+"%";
						    	document.getElementById("comdshar6").innerHTML = (text.budget3.comdshar*100).toFixed(1)+"%";
						    	document.getElementById("baddebts6").innerHTML = (text.budget3.baddebts*100).toFixed(1)+"%";
						    	document.getElementById("assetlose6").innerHTML = (text.budget3.assetlose*100).toFixed(1)+"%";
						    	document.getElementById("instock6").innerHTML = (text.budget3.instock*100).toFixed(1)+"%" ;
						    	document.getElementById("outstock6").innerHTML = (text.budget3.outstock*100).toFixed(1)+"%";
						    	document.getElementById("payback6").innerHTML = (text.budget3.payback*100).toFixed(1)+"%";
						    	document.getElementById("servtax6").innerHTML = (text.budget3.servtax*100).toFixed(1)+"%";
						    	document.getElementById("bonus6").innerHTML = (text.budget3.bonus*100).toFixed(1)+"%";
						    	document.getElementById("profitBBonus6").innerHTML = (text.budget3.profitBBonus*100).toFixed(1)+"%";
						    	document.getElementById("profitABonus6").innerHTML = (text.budget3.profitABonus*100).toFixed(1)+"%";
		                		form.unmask();
		                		if(orgid == 1){
		                			nui.alert("数据汇总成功！如果希望汇总的数据有效，请点击页面下方的“保存预算损益”按钮");
		                		}else{
		                			nui.alert("数据汇总成功！如果希望汇总的数据有效，请点击页面下方的“保存预算损益”按钮，分摊数据会在保存之后进行刷新。");
		                		}
		                		
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                    CloseWindow();
		                }
		            });
			}
		}
		//锁定、解锁
		function locks(e){
			if(e==1){
				if (!confirm("预算锁定后，事业部、业务单元、成本部门的预算数据将不能修改提交！")) {
					return;
				}
			}else{
				if (!confirm("预算解锁后，事业部、业务单元、成本部门的预算数据将可以修改提交！")) {
					return;
				}
			}
			var data = {year:inputyear,locks:e};
		    var json = nui.encode(data);
			 form.loading("加载中....");
			 nui.ajax({
	                url: "com.primeton.eos.ame_budget.deptbudget.locks.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
	                	if(e==1){
		                	nui.alert("锁定成功！");
		                	budstatus = "1";
		                	document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(已锁定)";	
		                	document.getElementById("unlock").style.display = "";
	                   		document.getElementById("lock").style.display = "none";
	                   		//锁定状态下隐藏分包及外部采购非统计行
	                   		document.getElementById("psubline").style.display = "none";
	                   		document.getElementById("masubline").style.display = "none";
	                   		document.getElementById("ssubline").style.display = "none";
	                	}else{
	                		nui.alert("解锁成功！");
		                	budstatus = "2";
		                	document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(未锁定)";	
		                	document.getElementById("unlock").style.display = "none";
	               			document.getElementById("lock").style.display = "";
	               				//解锁状态下释放非统计行
	                   		document.getElementById("psubline").style.display = "";
	                   		document.getElementById("masubline").style.display = "";
	                   		document.getElementById("ssubline").style.display = "";
	                	}
	            		form.setData({budget:text.budgetPy}); 
	            		document.getElementById("contamt").innerHTML = text.budget1.contamt == null ? "":formatNumber(text.budget1.contamt);
	    				document.getElementById("pcontamt").innerHTML = text.budget1.pcontamt == null ? "":formatNumber(text.budget1.pcontamt);
				    	document.getElementById("scontamt").innerHTML = text.budget1.scontamt == null ? "":formatNumber(text.budget1.scontamt);
				    	document.getElementById("mcontamt").innerHTML = text.budget1.mcontamt == null ? "":formatNumber(text.budget1.mcontamt);
				    	document.getElementById("receamt").innerHTML = text.budget1.receamt == null ? "":formatNumber(text.budget1.receamt);
				    	document.getElementById("taxincome").innerHTML = text.budget1.taxincome == null ? "":formatNumber(text.budget1.taxincome);
				    	document.getElementById("ptaxincome").innerHTML = text.budget1.ptaxincome == null ? "":formatNumber(text.budget1.ptaxincome);
				    	document.getElementById("mtaxincome").innerHTML = text.budget1.mtaxincome == null ? "":formatNumber(text.budget1.mtaxincome);
				    	document.getElementById("staxincome").innerHTML = text.budget1.staxincome == null ? "":formatNumber(text.budget1.staxincome);
				    	document.getElementById("ntaxincome").innerHTML = text.budget1.ntaxincome == null ? "":formatNumber(text.budget1.ntaxincome);
				    	document.getElementById("pntaxincome").innerHTML = text.budget1.pntaxincome == null ? "":formatNumber(text.budget1.pntaxincome);
				    	document.getElementById("mntaxincome").innerHTML = text.budget1.mntaxincome == null ? "":formatNumber(text.budget1.mntaxincome);
				    	document.getElementById("sntaxincome").innerHTML = text.budget1.sntaxincome == null ? "":formatNumber(text.budget1.sntaxincome);
				    	document.getElementById("subfee").innerHTML = text.budget1.subfee == null ? "":formatNumber(text.budget1.subfee);
				    	document.getElementById("psubfee").innerHTML = text.budget1.psubfee == null ? "":formatNumber(text.budget1.psubfee);
				    	document.getElementById("ssubfee").innerHTML = text.budget1.ssubfee == null ? "":formatNumber(text.budget1.ssubfee);
				    	document.getElementById("msubfee").innerHTML = text.budget1.msubfee == null ? "":formatNumber(text.budget1.msubfee);
				    	document.getElementById("bustax").innerHTML = text.budget1.bustax == null ? "":formatNumber(text.budget1.bustax);
				    	document.getElementById("netincome").innerHTML = text.budget1.netincome == null ? "":formatNumber(text.budget1.netincome);
				    	document.getElementById("pnetincome").innerHTML = text.budget1.pnetincome == null ? "":formatNumber(text.budget1.pnetincome);
				    	document.getElementById("snetincome").innerHTML = text.budget1.snetincome == null ? "":formatNumber(text.budget1.snetincome);
				    	document.getElementById("mnetincome").innerHTML = text.budget1.mnetincome == null ? "":formatNumber(text.budget1.mnetincome);
				    	document.getElementById("currentcost").innerHTML = text.budget1.currentcost == null ? "":formatNumber(text.budget1.currentcost);
				    	document.getElementById("servcost").innerHTML = text.budget1.servcost == null ? "":formatNumber(text.budget1.servcost);
				    	document.getElementById("salecost").innerHTML = text.budget1.salecost == null ? "":formatNumber(text.budget1.salecost);
				    	document.getElementById("deptmcost").innerHTML = text.budget1.deptmcost == null ? "":formatNumber(text.budget1.deptmcost);
				    	document.getElementById("deptdcost").innerHTML = text.budget1.deptdcost == null ? "":formatNumber(text.budget1.deptdcost);
				    	document.getElementById("commshar").innerHTML = text.budget1.commshar == null ? "":formatNumber(text.budget1.commshar);
				    	document.getElementById("comashar").innerHTML = text.budget1.comashar == null ? "":formatNumber(text.budget1.comashar);
				    	document.getElementById("comdshar").innerHTML = text.budget1.comdshar == null ? "":formatNumber(text.budget1.comdshar);
				    	document.getElementById("baddebts").innerHTML = text.budget1.baddebts == null ? "":formatNumber(text.budget1.baddebts);
				    	document.getElementById("assetlose").innerHTML = text.budget1.assetlose == null ? "":formatNumber(text.budget1.assetlose);
				    	document.getElementById("instock").innerHTML = text.budget1.instock == null ? "":formatNumber(text.budget1.instock);
				    	document.getElementById("outstock").innerHTML = text.budget1.outstock == null ? "":formatNumber(text.budget1.outstock);
				    	document.getElementById("payback").innerHTML = text.budget1.payback == null ? "":formatNumber(text.budget1.payback);
				    	document.getElementById("servtax").innerHTML = text.budget1.servtax == null ? "":formatNumber(text.budget1.servtax);
				    	document.getElementById("bonus").innerHTML = text.budget1.bonus == null ? "":formatNumber(text.budget1.bonus);
				    	document.getElementById("profitBBonus").innerHTML = text.budget1.profitBBonus == null ? "":formatNumber(text.budget1.profitBBonus);
				    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
						document.getElementById("contamt5").innerHTML = text.budget2.contamt == null ? "":formatNumber(text.budget2.contamt);
	    				document.getElementById("pcontamt5").innerHTML = text.budget2.pcontamt == null ? "":formatNumber(text.budget2.pcontamt);
				    	document.getElementById("scontamt5").innerHTML = text.budget2.scontamt == null ? "":formatNumber(text.budget2.scontamt);
				    	document.getElementById("mcontamt5").innerHTML = text.budget2.mcontamt == null ? "":formatNumber(text.budget2.mcontamt);
				    	document.getElementById("receamt5").innerHTML = text.budget2.receamt == null ? "":formatNumber(text.budget2.receamt);
				    	document.getElementById("taxincome5").innerHTML = text.budget2.taxincome == null ? "":formatNumber(text.budget2.taxincome);
				    	document.getElementById("ptaxincome5").innerHTML = text.budget2.ptaxincome == null ? "":formatNumber(text.budget2.ptaxincome);
				    	document.getElementById("mtaxincome5").innerHTML = text.budget2.mtaxincome == null ? "":formatNumber(text.budget2.mtaxincome);
				    	document.getElementById("staxincome5").innerHTML = text.budget2.staxincome == null ? "":formatNumber(text.budget2.staxincome);
				    	document.getElementById("ntaxincome5").innerHTML = text.budget2.ntaxincome == null ? "":formatNumber(text.budget2.ntaxincome);
				    	document.getElementById("pntaxincome5").innerHTML = text.budget2.pntaxincome == null ? "":formatNumber(text.budget2.pntaxincome);
				    	document.getElementById("mntaxincome5").innerHTML = text.budget2.mntaxincome == null ? "":formatNumber(text.budget2.mntaxincome);
				    	document.getElementById("sntaxincome5").innerHTML = text.budget2.sntaxincome == null ? "":formatNumber(text.budget2.sntaxincome);
				    	document.getElementById("subfee5").innerHTML = text.budget2.subfee == null ? "":formatNumber(text.budget2.subfee);
				    	document.getElementById("psubfee5").innerHTML = text.budget2.psubfee == null ? "":formatNumber(text.budget2.psubfee);
				    	document.getElementById("ssubfee5").innerHTML = text.budget2.ssubfee == null ? "":formatNumber(text.budget2.ssubfee);
				    	document.getElementById("msubfee5").innerHTML = text.budget2.msubfee == null ? "":formatNumber(text.budget2.msubfee);
				    	document.getElementById("bustax5").innerHTML = text.budget2.bustax == null ? "":formatNumber(text.budget2.bustax);
				    	document.getElementById("netincome5").innerHTML = text.budget2.netincome == null ? "":formatNumber(text.budget2.netincome);
				    	document.getElementById("pnetincome5").innerHTML = text.budget2.pnetincome == null ? "":formatNumber(text.budget2.pnetincome);
				    	document.getElementById("snetincome5").innerHTML = text.budget2.snetincome == null ? "":formatNumber(text.budget2.snetincome);
				    	document.getElementById("mnetincome5").innerHTML = text.budget2.mnetincome == null ? "":formatNumber(text.budget2.mnetincome);
				    	document.getElementById("currentcost5").innerHTML = text.budget2.currentcost == null ? "":formatNumber(text.budget2.currentcost);
				    	document.getElementById("servcost5").innerHTML = text.budget2.servcost == null ? "":formatNumber(text.budget2.servcost);
				    	document.getElementById("salecost5").innerHTML = text.budget2.salecost == null ? "":formatNumber(text.budget2.salecost);
				    	document.getElementById("deptmcost5").innerHTML = text.budget2.deptmcost == null ? "":formatNumber(text.budget2.deptmcost);
				    	document.getElementById("deptdcost5").innerHTML = text.budget2.deptdcost == null ? "":formatNumber(text.budget2.deptdcost);
				    	document.getElementById("commshar5").innerHTML = text.budget2.commshar == null ? "":formatNumber(text.budget2.commshar);
				    	document.getElementById("comashar5").innerHTML = text.budget2.comashar == null ? "":formatNumber(text.budget2.comashar);
				    	document.getElementById("comdshar5").innerHTML = text.budget2.comdshar == null ? "":formatNumber(text.budget2.comdshar);
				    	document.getElementById("baddebts5").innerHTML = text.budget2.baddebts == null ? "":formatNumber(text.budget2.baddebts);
				    	document.getElementById("assetlose5").innerHTML = text.budget2.assetlose == null ? "":formatNumber(text.budget2.assetlose);
				    	document.getElementById("instock5").innerHTML = text.budget2.instock == null ? "":formatNumber(text.budget2.instock);
				    	document.getElementById("outstock5").innerHTML = text.budget2.outstock == null ? "":formatNumber(text.budget2.outstock);
				    	document.getElementById("payback5").innerHTML = text.budget2.payback == null ? "":formatNumber(text.budget2.payback);
				    	document.getElementById("servtax5").innerHTML = text.budget2.servtax == null ? "":formatNumber(text.budget2.servtax);
				    	document.getElementById("bonus5").innerHTML = text.budget2.bonus == null ? "":formatNumber(text.budget2.bonus);
				    	document.getElementById("profitBBonus5").innerHTML = text.budget2.profitBBonus == null ? "":formatNumber(text.budget2.profitBBonus);
				    	document.getElementById("profitABonus5").innerHTML = text.budget2.profitABonus == null ? "":formatNumber(text.budget2.profitABonus);
				    	document.getElementById("contamt6").innerHTML = (text.budget3.contamt*100).toFixed(1)+"%";
				    	document.getElementById("pcontamt6").innerHTML = (text.budget3.pcontamt*100).toFixed(1)+"%";
				    	document.getElementById("scontamt6").innerHTML = (text.budget3.scontamt*100).toFixed(1)+"%";
				    	document.getElementById("mcontamt6").innerHTML = (text.budget3.mcontamt*100).toFixed(1)+"%";
				    	document.getElementById("receamt6").innerHTML = (text.budget3.receamt*100).toFixed(1)+"%";
				    	document.getElementById("taxincome6").innerHTML = (text.budget3.taxincome*100).toFixed(1)+"%";
				    	document.getElementById("ptaxincome6").innerHTML = (text.budget3.ptaxincome*100).toFixed(1)+"%";
				    	document.getElementById("mtaxincome6").innerHTML = (text.budget3.mtaxincome*100).toFixed(1)+"%";
				    	document.getElementById("staxincome6").innerHTML = (text.budget3.staxincome*100).toFixed(1)+"%";
				    	document.getElementById("ntaxincome6").innerHTML = (text.budget3.ntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("pntaxincome6").innerHTML = (text.budget3.pntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("mntaxincome6").innerHTML = (text.budget3.mntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("sntaxincome6").innerHTML = (text.budget3.sntaxincome*100).toFixed(1)+"%";
				    	document.getElementById("subfee6").innerHTML = (text.budget3.subfee*100).toFixed(1)+"%";
				    	document.getElementById("psubfee6").innerHTML = (text.budget3.psubfee*100).toFixed(1)+"%";
				    	document.getElementById("ssubfee6").innerHTML = (text.budget3.ssubfee*100).toFixed(1)+"%";
				    	document.getElementById("msubfee6").innerHTML = (text.budget3.msubfee*100).toFixed(1)+"%";
				    	document.getElementById("bustax6").innerHTML = (text.budget3.bustax*100).toFixed(1)+"%";
				    	document.getElementById("netincome6").innerHTML = (text.budget3.netincome*100).toFixed(1)+"%";
				    	document.getElementById("pnetincome6").innerHTML = (text.budget3.pnetincome*100).toFixed(1)+"%";
				    	document.getElementById("snetincome6").innerHTML = (text.budget3.snetincome*100).toFixed(1)+"%";
				    	document.getElementById("mnetincome6").innerHTML = (text.budget3.mnetincome*100).toFixed(1)+"%";
				    	document.getElementById("currentcost6").innerHTML = (text.budget3.currentcost*100).toFixed(1)+"%";
				    	document.getElementById("servcost6").innerHTML = (text.budget3.servcost*100).toFixed(1)+"%";
				    	document.getElementById("salecost6").innerHTML = (text.budget3.salecost*100).toFixed(1)+"%";
				    	document.getElementById("deptmcost6").innerHTML = (text.budget3.deptmcost*100).toFixed(1)+"%";
				    	document.getElementById("deptdcost6").innerHTML = (text.budget3.deptdcost*100).toFixed(1)+"%";
				    	document.getElementById("commshar6").innerHTML = (text.budget3.commshar*100).toFixed(1)+"%";
				    	document.getElementById("comashar6").innerHTML = (text.budget3.comashar*100).toFixed(1)+"%";
				    	document.getElementById("comdshar6").innerHTML = (text.budget3.comdshar*100).toFixed(1)+"%";
				    	document.getElementById("baddebts6").innerHTML = (text.budget3.baddebts*100).toFixed(1)+"%";
				    	document.getElementById("assetlose6").innerHTML = (text.budget3.assetlose*100).toFixed(1)+"%";
				    	document.getElementById("instock6").innerHTML = (text.budget3.instock*100).toFixed(1)+"%" ;
				    	document.getElementById("outstock6").innerHTML = (text.budget3.outstock*100).toFixed(1)+"%";
				    	document.getElementById("payback6").innerHTML = (text.budget3.payback*100).toFixed(1)+"%";
				    	document.getElementById("servtax6").innerHTML = (text.budget3.servtax*100).toFixed(1)+"%";
				    	document.getElementById("bonus6").innerHTML = (text.budget3.bonus*100).toFixed(1)+"%";
				    	document.getElementById("profitBBonus6").innerHTML = (text.budget3.profitBBonus*100).toFixed(1)+"%";
				    	document.getElementById("profitABonus6").innerHTML = (text.budget3.profitABonus*100).toFixed(1)+"%";
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
		}
		//产品税率
		var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'))
		//服务税率
		var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'))
		//MA税率
		var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'))
		//Q1季度计算
		function doCal1(){
			if(budstatus == 1&&orgid!=1){
				alert("预算已锁定，调整预算数据将不能保存！");
				return;
			}
			var pcontamt1=nui.get("pcontamt1").getValue(); //产品合同额
			var scontamt1=nui.get("scontamt1").getValue(); //服务合同额
			var mcontamt1=nui.get("mcontamt1").getValue(); //MA合同额
			var receamt1=nui.get("receamt1").getValue(); //收款额
			var ptaxincome1=nui.get("ptaxincome1").getValue(); //产品收入
			var staxincome1=nui.get("staxincome1").getValue(); //服务收入
			var mtaxincome1=nui.get("mtaxincome1").getValue(); //MA收入
			var psubfee1=nui.get("psubfee1").getValue(); //产品分包及外部采购
			var ssubfee1=nui.get("ssubfee1").getValue(); //服务分包及外部采购
			var msubfee1=nui.get("msubfee1").getValue(); //MA分包及外部采购
			var servcost1=nui.get("servcost1").getValue(); //服务成本
			var salecost1=nui.get("salecost1").getValue(); //销售费用
			var deptmcost1=nui.get("deptmcost1").getValue(); //部门管理费用
			var deptdcost1=nui.get("deptdcost1").getValue(); //部门研发费用
			var commshar1=nui.get("commshar1").getValue(); //公司管理分摊
			var comashar1=nui.get("comashar1").getValue(); //公司市场分摊
			var comdshar1=nui.get("comdshar1").getValue(); //公司研发分摊
			var baddebts1=nui.get("baddebts1").getValue(); //坏账核销
			var assetlose1=nui.get("assetlose1").getValue();//资产减值损失
			var instock1=nui.get("instock1").getValue(); //转入存货成本
			var outstock1=nui.get("outstock1").getValue(); //转出存货成本
			var servtax1=nui.get("servtax1").getValue(); //服务税抵扣
			var bonus1=0; //奖金
			var contamt1=0; //合同额
			var taxincome1=0; //营业收入(含税)
			var ntaxincome1=0; //营业毛收入(不含税)
			var pntaxincome1=0; //产品毛收入
			var sntaxincome1=0; //MA毛收入
			var mntaxincome1=0; //服务毛收入
			var subfee1=0; //分包及外部采购
			var bustax1=0; //营业税金及附加
			var netincome1=0; //营业净收入
			var pnetincome1=0; //产品净收入
			var snetincome1=0; // 服务净收入
			var mnetincome1=0; // MA净收入
			var currentcost1=0; // 当期发生成本
			var payback1=0; //退税
			var profitBBonus1=0; //奖金前利润
			var profitABonus1=0; //奖金后利润
			if(pcontamt1==null||pcontamt1==""){
	    		pcontamt1 = 0;
	    	}
	    	if(scontamt1==null||scontamt1==""){
	    		scontamt1 = 0;
	    	}
	    	if(mcontamt1==null||mcontamt1==""){
	    		mcontamt1 = 0;
	    	}
	    	if(receamt1==null||receamt1==""){
	    		receamt1 = 0;
	    	}
	    	if(ptaxincome1==null||ptaxincome1==""){
	    		ptaxincome1 = 0;
	    	}
	    	if(staxincome1==null||staxincome1==""){
	    		staxincome1 = 0;
	    	}
	    	if(mtaxincome1==null||mtaxincome1==""){
	    		mtaxincome1 = 0;
	    	}
	    	if(psubfee1==null||psubfee1==""){
	    		psubfee1 = 0;
	    	}
	    	if(ssubfee1==null||ssubfee1==""){
	    		ssubfee1 = 0;
	    	}
	    	if(msubfee1==null||msubfee1==""){
	    		msubfee1 = 0;
	    	}
	    	if(deptdcost1==null||deptdcost1==""){
	    		deptdcost1 = 0;
	    	}
	    	if(servcost1==null||servcost1==""){
	    		servcost1 = 0;
	    	}
	    	if(salecost1==null||salecost1==""){
	    		salecost1 = 0;
	    	}
	    	if(deptmcost1==null||deptmcost1==""){
	    		deptmcost1 = 0;
	    	}
	    	if(commshar1==null||commshar1==""){
	    		commshar1 = 0;
	    	}
	    	if(comashar1==null||comashar1==""){
	    		comashar1 = 0;
	    	}
	    	if(comdshar1==null||comdshar1==""){
	    		comdshar1 = 0;
	    	}
	    	if(assetlose1==null||assetlose1==""){
	    		assetlose1 = 0;
	    	}
	    	if(instock1==null||instock1==""){
	    		instock1 = 0;
	    	}
	    	if(outstock1==null||outstock1==""){
	    		outstock1 = 0;
	    	}
	    	if(bonus1==null||bonus1==""){
	    		bonus1 = 0;
	    	}
	    	if(baddebts1==null||baddebts1==""){
	    		baddebts1 = 0;
	    	}
	    	if(servtax1==null||servtax1==""){
	    		servtax1 = 0;
	    	}
	    	contamt1=parseFloat(pcontamt1)+parseFloat(scontamt1)+parseFloat(mcontamt1);
	    	taxincome1=parseFloat(ptaxincome1)+parseFloat(staxincome1)+parseFloat(mtaxincome1);
	    	pntaxincome1=Math.round(parseFloat(ptaxincome1)/(1+productrate));
	    	sntaxincome1=Math.round(parseFloat(staxincome1)/(1+servicerate));
	    	mntaxincome1=Math.round(parseFloat(mtaxincome1)/(1+marate));
	    	ntaxincome1=pntaxincome1+sntaxincome1+mntaxincome1;
	    	subfee1=parseFloat(psubfee1)+parseFloat(ssubfee1)+parseFloat(msubfee1);
	    	bustax1=Math.round(parseFloat(pntaxincome1)*productrate*0.07+parseFloat(sntaxincome1)*servicerate*0.07+parseFloat(mntaxincome1)*marate*0.07);
	    	pnetincome1=Math.round(pntaxincome1-parseFloat(psubfee1)-pntaxincome1*productrate*0.07);
	    	snetincome1=Math.round(sntaxincome1-parseFloat(ssubfee1)-sntaxincome1*servicerate*0.07);
	    	mnetincome1=Math.round(mntaxincome1-parseFloat(msubfee1)-mntaxincome1*marate*0.07);
	    	currentcost1=parseFloat(comdshar1)+parseFloat(comashar1)+parseFloat(commshar1)+parseFloat(deptmcost1)+parseFloat(salecost1)+parseFloat(servcost1)+parseFloat(deptdcost1)
	    	-parseFloat(outstock1)+parseFloat(instock1)+baddebts1;
	    	netincome1= pnetincome1+mnetincome1+snetincome1;
	    	payback1=parseFloat(pntaxincome1)*0.14;
	    	profitBBonus1=netincome1-currentcost1+payback1-parseFloat(assetlose1)-parseFloat(servtax1);
	    	//bonus1=profitBBonus1*0.4;//计算规则还未搞明白
	    	profitABonus1 = profitBBonus1-bonus1;
	    	nui.get("contamt1").setValue(contamt1);
	    	nui.get("taxincome1").setValue(taxincome1);
	    	nui.get("pntaxincome1").setValue(pntaxincome1);
	    	nui.get("sntaxincome1").setValue(sntaxincome1);
	    	nui.get("mntaxincome1").setValue(mntaxincome1);
	    	nui.get("ntaxincome1").setValue(ntaxincome1);
	    	nui.get("bustax1").setValue(bustax1);
	    	nui.get("pnetincome1").setValue(pnetincome1);
	    	nui.get("snetincome1").setValue(snetincome1);
	    	nui.get("mnetincome1").setValue(mnetincome1);
	    	nui.get("netincome1").setValue(netincome1);
	    	nui.get("subfee1").setValue(subfee1);
	    	nui.get("currentcost1").setValue(currentcost1);
	    	nui.get("payback1").setValue(payback1);
	    	nui.get("profitBBonus1").setValue(profitBBonus1);
	    	nui.get("profitABonus1").setValue(profitABonus1);
	    	calSum();
		}
		//Q2季度计算
		function doCal2(){
			if(budstatus == 1&&orgid!=1){
				alert("预算已锁定，调整预算数据将不能保存！");
				return;
			}
			var pcontamt2=nui.get("pcontamt2").getValue(); //产品合同额
			var scontamt2=nui.get("scontamt2").getValue(); //服务合同额
			var mcontamt2=nui.get("mcontamt2").getValue(); //MA合同额
			var receamt2=nui.get("receamt2").getValue(); //收款额
			var ptaxincome2=nui.get("ptaxincome2").getValue(); //产品收入
			var staxincome2=nui.get("staxincome2").getValue(); //服务收入
			var mtaxincome2=nui.get("mtaxincome2").getValue(); //MA收入
			var psubfee2=nui.get("psubfee2").getValue(); //产品分包及外部采购
			var ssubfee2=nui.get("ssubfee2").getValue(); //服务分包及外部采购
			var msubfee2=nui.get("msubfee2").getValue(); //MA分包及外部采购
			var servcost2=nui.get("servcost2").getValue(); //服务成本
			var salecost2=nui.get("salecost2").getValue(); //销售费用
			var deptmcost2=nui.get("deptmcost2").getValue(); //部门管理费用
			var deptdcost2=nui.get("deptdcost2").getValue(); //部门研发费用
			var commshar2=nui.get("commshar2").getValue(); //公司管理分摊
			var comashar2=nui.get("comashar2").getValue(); //公司市场分摊
			var comdshar2=nui.get("comdshar2").getValue(); //公司研发分摊
			var baddebts2=nui.get("baddebts2").getValue(); //坏账核销
			var assetlose2=nui.get("assetlose2").getValue();//资产减值损失
			var instock2=nui.get("instock2").getValue(); //转入存货成本
			var outstock2=nui.get("outstock2").getValue(); //转出存货成本
			var servtax2=nui.get("servtax2").getValue(); //服务税抵扣
			var bonus2=nui.get("bonus2").getValue(); //奖金
			var contamt2=0; //合同额
			var taxincome2=0; //营业收入(含税)
			var ntaxincome2=0; //营业毛收入(不含税)
			var pntaxincome2=0; //产品毛收入
			var sntaxincome2=0; //MA毛收入
			var mntaxincome2=0; //服务毛收入
			var subfee2=0; //分包及外部采购
			var bustax2=0; //营业税金及附加
			var netincome2=0; //营业净收入
			var pnetincome2=0; //产品净收入
			var snetincome2=0; // 服务净收入
			var mnetincome2=0; // MA净收入
			var currentcost2=0; // 当期发生成本
			var payback2=0; //退税
			var profitBBonus2=0; //奖金前利润
			var profitABonus2=0; //奖金后利润
			if(pcontamt2==null||pcontamt2==""){
	    		pcontamt2 = 0;
	    	}
	    	if(scontamt2==null||scontamt2==""){
	    		scontamt2 = 0;
	    	}
	    	if(mcontamt2==null||mcontamt2==""){
	    		mcontamt2 = 0;
	    	}
	    	if(receamt2==null||receamt2==""){
	    		receamt2 = 0;
	    	}
	    	if(ptaxincome2==null||ptaxincome2==""){
	    		ptaxincome2 = 0;
	    	}
	    	if(staxincome2==null||staxincome2==""){
	    		staxincome2 = 0;
	    	}
	    	if(mtaxincome2==null||mtaxincome2==""){
	    		mtaxincome2 = 0;
	    	}
	    	if(psubfee2==null||psubfee2==""){
	    		psubfee2 = 0;
	    	}
	    	if(ssubfee2==null||ssubfee2==""){
	    		ssubfee2 = 0;
	    	}
	    	if(msubfee2==null||msubfee2==""){
	    		msubfee2 = 0;
	    	}
	    	if(deptdcost2==null||deptdcost2==""){
	    		deptdcost2 = 0;
	    	}
	    	if(servcost2==null||servcost2==""){
	    		servcost2 = 0;
	    	}
	    	if(salecost2==null||salecost2==""){
	    		salecost2 = 0;
	    	}
	    	if(deptmcost2==null||deptmcost2==""){
	    		deptmcost2 = 0;
	    	}
	    	if(commshar2==null||commshar2==""){
	    		commshar2 = 0;
	    	}
	    	if(comashar2==null||comashar2==""){
	    		comashar2 = 0;
	    	}
	    	if(comdshar2==null||comdshar2==""){
	    		comdshar2 = 0;
	    	}
	    	if(assetlose2==null||assetlose2==""){
	    		assetlose2 = 0;
	    	}
	    	if(instock2==null||instock2==""){
	    		instock2 = 0;
	    	}
	    	if(outstock2==null||outstock2==""){
	    		outstock2 = 0;
	    	}
	    	if(bonus2==null||bonus2==""){
	    		bonus2 = 0;
	    	}
	    	if(baddebts2==null||baddebts2==""){
	    		baddebts2 = 0;
	    	}
	    	if(servtax2==null||servtax2==""){
	    		servtax2 = 0;
	    	}
	    	contamt2=parseFloat(pcontamt2)+parseFloat(scontamt2)+parseFloat(mcontamt2);
	    	taxincome2=parseFloat(ptaxincome2)+parseFloat(staxincome2)+parseFloat(mtaxincome2);
	    	pntaxincome2=Math.round(parseFloat(ptaxincome2)/(1+productrate));
	    	sntaxincome2=Math.round(parseFloat(staxincome2)/(1+servicerate));
	    	mntaxincome2=Math.round(parseFloat(mtaxincome2)/(1+marate));
	    	ntaxincome2=pntaxincome2+sntaxincome2+mntaxincome2;
	    	subfee2=parseFloat(psubfee2)+parseFloat(ssubfee2)+parseFloat(msubfee2);
	    	bustax2=Math.round(parseFloat(pntaxincome2)*productrate*0.07+parseFloat(sntaxincome2)*servicerate*0.07+parseFloat(mntaxincome2)*marate*0.07);
	    	pnetincome2=Math.round(pntaxincome2-parseFloat(psubfee2)-pntaxincome2*productrate*0.07);
	    	snetincome2=Math.round(sntaxincome2-parseFloat(ssubfee2)-sntaxincome2*servicerate*0.07);
	    	mnetincome2=Math.round(mntaxincome2-parseFloat(msubfee2)-mntaxincome2*marate*0.07);
	    	currentcost2=parseFloat(comdshar2)+parseFloat(comashar2)+parseFloat(commshar2)+parseFloat(deptmcost2)+parseFloat(salecost2)+parseFloat(servcost2)+parseFloat(deptdcost2)
	    	-parseFloat(outstock2)+parseFloat(instock2)+baddebts2;
	    	netincome2= pnetincome2+snetincome2+mnetincome2;
	    	payback2=parseFloat(pntaxincome2)*0.14;
	    	profitBBonus2=netincome2-currentcost2+payback2-parseFloat(assetlose2)-parseFloat(servtax2);
	    	profitABonus2 = profitBBonus2-bonus2;
	    	nui.get("contamt2").setValue(contamt2);
	    	nui.get("taxincome2").setValue(taxincome2);
	    	nui.get("pntaxincome2").setValue(pntaxincome2);
	    	nui.get("sntaxincome2").setValue(sntaxincome2);
	    	nui.get("mntaxincome2").setValue(mntaxincome2);
	    	nui.get("ntaxincome2").setValue(ntaxincome2);
	    	nui.get("bustax2").setValue(bustax2);
	    	nui.get("pnetincome2").setValue(pnetincome2);
	    	nui.get("snetincome2").setValue(snetincome2);
	    	nui.get("mnetincome2").setValue(mnetincome2);
	    	nui.get("netincome2").setValue(netincome2);
	    	nui.get("subfee2").setValue(subfee2);
	    	nui.get("currentcost2").setValue(currentcost2);
	    	nui.get("payback2").setValue(payback2);
	    	nui.get("profitBBonus2").setValue(profitBBonus2);
	    	nui.get("profitABonus2").setValue(profitABonus2);
	    	calSum();
		}
		//Q3季度计算
		function doCal3(){
			if(budstatus == 1&&orgid!=1){
				alert("预算已锁定，调整预算数据将不能保存！");
				return;
			}
			var pcontamt3=nui.get("pcontamt3").getValue(); //产品合同额
			var scontamt3=nui.get("scontamt3").getValue(); //服务合同额
			var mcontamt3=nui.get("mcontamt3").getValue(); //MA合同额
			var receamt3=nui.get("receamt3").getValue(); //收款额
			var ptaxincome3=nui.get("ptaxincome3").getValue(); //产品收入
			var staxincome3=nui.get("staxincome3").getValue(); //服务收入
			var mtaxincome3=nui.get("mtaxincome3").getValue(); //MA收入
			var psubfee3=nui.get("psubfee3").getValue(); //产品分包及外部采购
			var ssubfee3=nui.get("ssubfee3").getValue(); //服务分包及外部采购
			var msubfee3=nui.get("msubfee3").getValue(); //MA分包及外部采购
			var servcost3=nui.get("servcost3").getValue(); //服务成本
			var salecost3=nui.get("salecost3").getValue(); //销售费用
			var deptmcost3=nui.get("deptmcost3").getValue(); //部门管理费用
			var deptdcost3=nui.get("deptdcost3").getValue(); //部门研发费用
			var commshar3=nui.get("commshar3").getValue(); //公司管理分摊
			var comashar3=nui.get("comashar3").getValue(); //公司市场分摊
			var comdshar3=nui.get("comdshar3").getValue(); //公司研发分摊
			var baddebts3=nui.get("baddebts3").getValue(); //坏账核销
			var assetlose3=nui.get("assetlose3").getValue();//资产减值损失
			var instock3=nui.get("instock3").getValue(); //转入存货成本
			var outstock3=nui.get("outstock3").getValue(); //转出存货成本
			var servtax3=nui.get("servtax3").getValue(); //服务税抵扣
			var bonus3=nui.get("bonus3").getValue(); //奖金
			var contamt3=0; //合同额
			var taxincome3=0; //营业收入(含税)
			var ntaxincome3=0; //营业毛收入(不含税)
			var pntaxincome3=0; //产品毛收入
			var sntaxincome3=0; //MA毛收入
			var mntaxincome3=0; //服务毛收入
			var subfee3=0; //分包及外部采购
			var bustax3=0; //营业税金及附加
			var netincome3=0; //营业净收入
			var pnetincome3=0; //产品净收入
			var snetincome3=0; // 服务净收入
			var mnetincome3=0; // MA净收入
			var currentcost3=0; // 当期发生成本
			var payback3=0; //退税
			var profitBBonus3=0; //奖金前利润
			var profitABonus3=0; //奖金后利润
			if(pcontamt3==null||pcontamt3==""){
	    		pcontamt3 = 0;
	    	}
	    	if(scontamt3==null||scontamt3==""){
	    		scontamt3 = 0;
	    	}
	    	if(mcontamt3==null||mcontamt3==""){
	    		mcontamt3 = 0;
	    	}
	    	if(receamt3==null||receamt3==""){
	    		receamt3 = 0;
	    	}
	    	if(ptaxincome3==null||ptaxincome3==""){
	    		ptaxincome3 = 0;
	    	}
	    	if(staxincome3==null||staxincome3==""){
	    		staxincome3 = 0;
	    	}
	    	if(mtaxincome3==null||mtaxincome3==""){
	    		mtaxincome3 = 0;
	    	}
	    	if(psubfee3==null||psubfee3==""){
	    		psubfee3 = 0;
	    	}
	    	if(ssubfee3==null||ssubfee3==""){
	    		ssubfee3 = 0;
	    	}
	    	if(msubfee3==null||msubfee3==""){
	    		msubfee3 = 0;
	    	}
	    	if(deptdcost3==null||deptdcost3==""){
	    		deptdcost3 = 0;
	    	}
	    	if(servcost3==null||servcost3==""){
	    		servcost3 = 0;
	    	}
	    	if(salecost3==null||salecost3==""){
	    		salecost3 = 0;
	    	}
	    	if(deptmcost3==null||deptmcost3==""){
	    		deptmcost3 = 0;
	    	}
	    	if(commshar3==null||commshar3==""){
	    		commshar3 = 0;
	    	}
	    	if(comashar3==null||comashar3==""){
	    		comashar3 = 0;
	    	}
	    	if(comdshar3==null||comdshar3==""){
	    		comdshar3 = 0;
	    	}
	    	if(assetlose3==null||assetlose3==""){
	    		assetlose3 = 0;
	    	}
	    	if(instock3==null||instock3==""){
	    		instock3 = 0;
	    	}
	    	if(outstock3==null||outstock3==""){
	    		outstock3 = 0;
	    	}
	    	if(bonus3==null||bonus3==""){
	    		bonus3 = 0;
	    	}
	    	if(baddebts3==null||baddebts3==""){
	    		baddebts3 = 0;
	    	}
	    	if(servtax3==null||servtax3==""){
	    		servtax3 = 0;
	    	}
	    	contamt3=parseFloat(pcontamt3)+parseFloat(scontamt3)+parseFloat(mcontamt3);
	    	taxincome3=parseFloat(ptaxincome3)+parseFloat(staxincome3)+parseFloat(mtaxincome3);
	    	pntaxincome3=Math.round(parseFloat(ptaxincome3)/(1+productrate));
	    	sntaxincome3=Math.round(parseFloat(staxincome3)/(1+servicerate));
	    	mntaxincome3=Math.round(parseFloat(mtaxincome3)/(1+marate));
	    	ntaxincome3=pntaxincome3+sntaxincome3+mntaxincome3;
	    	subfee3=parseFloat(psubfee3)+parseFloat(ssubfee3)+parseFloat(msubfee3);
	    	bustax3=Math.round(parseFloat(pntaxincome3)*productrate*0.07+parseFloat(sntaxincome3)*servicerate*0.07+parseFloat(mntaxincome3)*marate*0.07);
	    	pnetincome3=Math.round(pntaxincome3-parseFloat(psubfee3)-pntaxincome3*productrate*0.07);
	    	snetincome3=Math.round(sntaxincome3-parseFloat(ssubfee3)-sntaxincome3*servicerate*0.07);
	    	mnetincome3=Math.round(mntaxincome3-parseFloat(msubfee3)-mntaxincome3*marate*0.07);
	    	currentcost3=parseFloat(comdshar3)+parseFloat(comashar3)+parseFloat(commshar3)+parseFloat(deptmcost3)+parseFloat(salecost3)+parseFloat(servcost3)+parseFloat(deptdcost3)
	    	-parseFloat(outstock3)+parseFloat(instock3)+baddebts3;
	    	netincome3= pnetincome3+mnetincome3+snetincome3;
	    	payback3=parseFloat(pntaxincome3)*0.14;
	    	profitBBonus3=netincome3-currentcost3+payback3-parseFloat(assetlose3)-parseFloat(servtax3);
	    	profitABonus3=profitBBonus3-bonus3;
	    	nui.get("contamt3").setValue(contamt3);
	    	nui.get("taxincome3").setValue(taxincome3);
	    	nui.get("pntaxincome3").setValue(pntaxincome3);
	    	nui.get("sntaxincome3").setValue(sntaxincome3);
	    	nui.get("mntaxincome3").setValue(mntaxincome3);
	    	nui.get("ntaxincome3").setValue(ntaxincome3);
	    	nui.get("bustax3").setValue(bustax3);
	    	nui.get("pnetincome3").setValue(pnetincome3);
	    	nui.get("snetincome3").setValue(snetincome3);
	    	nui.get("mnetincome3").setValue(mnetincome3);
	    	nui.get("netincome3").setValue(netincome3);
	    	nui.get("subfee3").setValue(subfee3);
	    	nui.get("currentcost3").setValue(currentcost3);
	    	nui.get("payback3").setValue(payback3);
	    	nui.get("profitBBonus3").setValue(profitBBonus3);
	    	nui.get("profitABonus3").setValue(profitABonus3);
	    	calSum();
		}
		//Q4季度计算
		function doCal4(){
			if(budstatus == 1&&orgid!=1){
				alert("预算已锁定，调整预算数据将不能保存！");
				return;
			}
			var pcontamt4=nui.get("pcontamt4").getValue(); //产品合同额
			var scontamt4=nui.get("scontamt4").getValue(); //服务合同额
			var mcontamt4=nui.get("mcontamt4").getValue(); //MA合同额
			var receamt4=nui.get("receamt4").getValue(); //收款额
			var ptaxincome4=nui.get("ptaxincome4").getValue(); //产品收入
			var staxincome4=nui.get("staxincome4").getValue(); //服务收入
			var mtaxincome4=nui.get("mtaxincome4").getValue(); //MA收入
			var psubfee4=nui.get("psubfee4").getValue(); //产品分包及外部采购
			var ssubfee4=nui.get("ssubfee4").getValue(); //服务分包及外部采购
			var msubfee4=nui.get("msubfee4").getValue(); //MA分包及外部采购
			var servcost4=nui.get("servcost4").getValue(); //服务成本
			var salecost4=nui.get("salecost4").getValue(); //销售费用
			var deptmcost4=nui.get("deptmcost4").getValue(); //部门管理费用
			var deptdcost4=nui.get("deptdcost4").getValue(); //部门研发费用
			var commshar4=nui.get("commshar4").getValue(); //公司管理分摊
			var comashar4=nui.get("comashar4").getValue(); //公司市场分摊
			var comdshar4=nui.get("comdshar4").getValue(); //公司研发分摊
			var baddebts4=nui.get("baddebts4").getValue(); //坏账核销
			var assetlose4=nui.get("assetlose4").getValue();//资产减值损失
			var instock4=nui.get("instock4").getValue(); //转入存货成本
			var outstock4=nui.get("outstock4").getValue(); //转出存货成本
			var servtax4=nui.get("servtax4").getValue(); //服务税抵扣
			var bonus4=nui.get("bonus4").getValue(); //奖金
			var contamt4=0; //合同额
			var taxincome4=0; //营业收入(含税)
			var ntaxincome4=0; //营业毛收入(不含税)
			var pntaxincome4=0; //产品毛收入
			var sntaxincome4=0; //MA毛收入
			var mntaxincome4=0; //服务毛收入
			var subfee4=0; //分包及外部采购
			var bustax4=0; //营业税金及附加
			var netincome4=0; //营业净收入
			var pnetincome4=0; //产品净收入
			var snetincome4=0; // 服务净收入
			var mnetincome4=0; // MA净收入
			var currentcost4=0; // 当期发生成本
			var payback4=0; //退税
			var profitBBonus4=0; //奖金前利润
			var profitABonus4=0; //奖金后利润
			if(pcontamt4==null||pcontamt4==""){
	    		pcontamt4 = 0;
	    	}
	    	if(scontamt4==null||scontamt4==""){
	    		scontamt4 = 0;
	    	}
	    	if(mcontamt4==null||mcontamt4==""){
	    		mcontamt4 = 0;
	    	}
	    	if(receamt4==null||receamt4==""){
	    		receamt4 = 0;
	    	}
	    	if(ptaxincome4==null||ptaxincome4==""){
	    		ptaxincome4 = 0;
	    	}
	    	if(staxincome4==null||staxincome4==""){
	    		staxincome4 = 0;
	    	}
	    	if(mtaxincome4==null||mtaxincome4==""){
	    		mtaxincome4 = 0;
	    	}
	    	if(psubfee4==null||psubfee4==""){
	    		psubfee4 = 0;
	    	}
	    	if(ssubfee4==null||ssubfee4==""){
	    		ssubfee4 = 0;
	    	}
	    	if(msubfee4==null||msubfee4==""){
	    		msubfee4 = 0;
	    	}
	    	if(deptdcost4==null||deptdcost4==""){
	    		deptdcost4 = 0;
	    	}
	    	if(servcost4==null||servcost4==""){
	    		servcost4 = 0;
	    	}
	    	if(salecost4==null||salecost4==""){
	    		salecost4 = 0;
	    	}
	    	if(deptmcost4==null||deptmcost4==""){
	    		deptmcost4 = 0;
	    	}
	    	if(commshar4==null||commshar4==""){
	    		commshar4 = 0;
	    	}
	    	if(comashar4==null||comashar4==""){
	    		comashar4 = 0;
	    	}
	    	if(comdshar4==null||comdshar4==""){
	    		comdshar4 = 0;
	    	}
	    	if(assetlose4==null||assetlose4==""){
	    		assetlose4 = 0;
	    	}
	    	if(instock4==null||instock4==""){
	    		instock4 = 0;
	    	}
	    	if(outstock4==null||outstock4==""){
	    		outstock4 = 0;
	    	}
	    	if(bonus4==null||bonus4==""){
	    		bonus4 = 0;
	    	}
	    	if(baddebts4==null||baddebts4==""){
	    		baddebts4 = 0;
	    	}
	    	if(servtax4==null||servtax4==""){
	    		servtax4 = 0;
	    	}
	    	contamt4=parseFloat(pcontamt4)+parseFloat(scontamt4)+parseFloat(mcontamt4);
	    	taxincome4=parseFloat(ptaxincome4)+parseFloat(staxincome4)+parseFloat(mtaxincome4);
	    	pntaxincome4=Math.round(parseFloat(ptaxincome4)/(1+productrate));
	    	sntaxincome4=Math.round(parseFloat(staxincome4)/(1+servicerate));
	    	mntaxincome4=Math.round(parseFloat(mtaxincome4)/(1+marate));
	    	ntaxincome4=pntaxincome4+sntaxincome4+mntaxincome4;
	    	subfee4=parseFloat(psubfee4)+parseFloat(ssubfee4)+parseFloat(msubfee4);
	    	bustax4=Math.round(parseFloat(pntaxincome4)*productrate*0.07+parseFloat(sntaxincome4)*servicerate*0.07+parseFloat(mntaxincome4)*marate*0.07);
	    	pnetincome4=Math.round(pntaxincome4-parseFloat(psubfee4)-pntaxincome4*productrate*0.07);
	    	snetincome4=Math.round(sntaxincome4-parseFloat(ssubfee4)-sntaxincome4*servicerate*0.07);
	    	mnetincome4=Math.round(mntaxincome4-parseFloat(msubfee4)-mntaxincome4*marate*0.07);
	    	currentcost4=parseFloat(comdshar4)+parseFloat(comashar4)+parseFloat(commshar4)+parseFloat(deptmcost4)+parseFloat(salecost4)+parseFloat(servcost4)+parseFloat(deptdcost4)
	    	-parseFloat(outstock4)+parseFloat(instock4)+baddebts4;
	    	netincome4= pnetincome4+mnetincome4+snetincome4;
	    	payback4=parseFloat(pntaxincome4)*0.14;
	    	profitBBonus4=netincome4-currentcost4+payback4-parseFloat(assetlose4)-parseFloat(servtax4);
	    	profitABonus4=profitBBonus4-bonus4;
	    	nui.get("contamt4").setValue(contamt4);
	    	nui.get("taxincome4").setValue(taxincome4);
	    	nui.get("pntaxincome4").setValue(pntaxincome4);
	    	nui.get("sntaxincome4").setValue(sntaxincome4);
	    	nui.get("mntaxincome4").setValue(mntaxincome4);
	    	nui.get("ntaxincome4").setValue(ntaxincome4);
	    	nui.get("bustax4").setValue(bustax4);
	    	nui.get("pnetincome4").setValue(pnetincome4);
	    	nui.get("snetincome4").setValue(snetincome4);
	    	nui.get("mnetincome4").setValue(mnetincome4);
	    	nui.get("netincome4").setValue(netincome4);
	    	nui.get("subfee4").setValue(subfee4);
	    	nui.get("currentcost4").setValue(currentcost4);
	    	nui.get("payback4").setValue(payback4);
	    	nui.get("profitBBonus4").setValue(profitBBonus4);
	    	nui.get("profitABonus4").setValue(profitABonus4);
	    	calSum();
	    	
		}
		//预计合计
		function calSum(){
	    	//获取其他季度的值
	    	var contamt1=nui.get("contamt1").getValue();
	    	var contamt3=nui.get("contamt3").getValue();
	    	var contamt2=nui.get("contamt2").getValue();
	    	var contamt4=nui.get("contamt4").getValue();
	    	var pcontamt1=nui.get("pcontamt1").getValue();
	    	var pcontamt3=nui.get("pcontamt3").getValue();
	    	var pcontamt2=nui.get("pcontamt2").getValue();
	    	var pcontamt4=nui.get("pcontamt4").getValue();
	    	var scontamt1=nui.get("scontamt1").getValue();
	    	var scontamt3=nui.get("scontamt3").getValue();
	    	var scontamt2=nui.get("scontamt2").getValue();
	    	var scontamt4=nui.get("scontamt4").getValue();
	    	var mcontamt1=nui.get("mcontamt1").getValue();
	    	var mcontamt3=nui.get("mcontamt3").getValue();
	    	var mcontamt2=nui.get("mcontamt2").getValue();
	    	var mcontamt4=nui.get("mcontamt4").getValue();
	    	var receamt1=nui.get("receamt1").getValue();
	    	var receamt3=nui.get("receamt3").getValue();
	    	var receamt2=nui.get("receamt2").getValue();
	    	var receamt4=nui.get("receamt4").getValue();
	    	var taxincome1=nui.get("taxincome1").getValue();
	    	var taxincome3=nui.get("taxincome3").getValue();
	    	var taxincome2=nui.get("taxincome2").getValue();
	    	var taxincome4=nui.get("taxincome4").getValue();
	    	var ptaxincome1=nui.get("ptaxincome1").getValue();
	    	var ptaxincome3=nui.get("ptaxincome3").getValue();
	    	var ptaxincome2=nui.get("ptaxincome2").getValue();
	    	var ptaxincome4=nui.get("ptaxincome4").getValue();
	    	var staxincome1=nui.get("staxincome1").getValue();
	    	var staxincome3=nui.get("staxincome3").getValue();
	    	var staxincome2=nui.get("staxincome2").getValue();
	    	var staxincome4=nui.get("staxincome4").getValue();
	    	var mtaxincome1=nui.get("mtaxincome1").getValue();
	    	var mtaxincome3=nui.get("mtaxincome3").getValue();
	    	var mtaxincome2=nui.get("mtaxincome2").getValue();
	    	var mtaxincome4=nui.get("mtaxincome4").getValue();
			var ntaxincome1=nui.get("ntaxincome1").getValue();
	    	var ntaxincome3=nui.get("ntaxincome3").getValue();
	    	var ntaxincome2=nui.get("ntaxincome2").getValue();
	    	var ntaxincome4=nui.get("ntaxincome4").getValue();
	    	var pntaxincome1=nui.get("pntaxincome1").getValue();
	    	var pntaxincome3=nui.get("pntaxincome3").getValue();
	    	var pntaxincome2=nui.get("pntaxincome2").getValue();
	    	var pntaxincome4=nui.get("pntaxincome4").getValue();
	    	var sntaxincome1=nui.get("sntaxincome1").getValue();
	    	var sntaxincome3=nui.get("sntaxincome3").getValue();
	    	var sntaxincome2=nui.get("sntaxincome2").getValue();
	    	var sntaxincome4=nui.get("sntaxincome4").getValue();
	    	var mntaxincome1=nui.get("mntaxincome1").getValue();
	    	var mntaxincome3=nui.get("mntaxincome3").getValue();
	    	var mntaxincome2=nui.get("mntaxincome2").getValue();
	    	var mntaxincome4=nui.get("mntaxincome4").getValue();
	    	var subfee1=nui.get("subfee1").getValue();
	    	var subfee3=nui.get("subfee3").getValue();
	    	var subfee2=nui.get("subfee2").getValue();
	    	var subfee4=nui.get("subfee4").getValue();
	    	var psubfee1=nui.get("psubfee1").getValue();
	    	var psubfee3=nui.get("psubfee3").getValue();
	    	var psubfee2=nui.get("psubfee2").getValue();
	    	var psubfee4=nui.get("psubfee4").getValue();
	    	var ssubfee1=nui.get("ssubfee1").getValue();
	    	var ssubfee3=nui.get("ssubfee3").getValue();
	    	var ssubfee2=nui.get("ssubfee2").getValue();
	    	var ssubfee4=nui.get("ssubfee4").getValue();
	    	var msubfee1=nui.get("msubfee1").getValue();
	    	var msubfee3=nui.get("msubfee3").getValue();
	    	var msubfee2=nui.get("msubfee2").getValue();
	    	var msubfee4=nui.get("msubfee4").getValue();
	    	var bustax1=nui.get("bustax1").getValue();
	    	var bustax3=nui.get("bustax3").getValue();
	    	var bustax2=nui.get("bustax2").getValue();
	    	var bustax4=nui.get("bustax4").getValue();
	    	var netincome1=nui.get("netincome1").getValue();
	    	var netincome3=nui.get("netincome3").getValue();
	    	var netincome2=nui.get("netincome2").getValue();
	    	var netincome4=nui.get("netincome4").getValue();
	    	var pnetincome1=nui.get("pnetincome1").getValue();
	    	var pnetincome3=nui.get("pnetincome3").getValue();
	    	var pnetincome2=nui.get("pnetincome2").getValue();
	    	var pnetincome4=nui.get("pnetincome4").getValue();
	    	var snetincome1=nui.get("snetincome1").getValue();
	    	var snetincome3=nui.get("snetincome3").getValue();
	    	var snetincome2=nui.get("snetincome2").getValue();
	    	var snetincome4=nui.get("snetincome4").getValue();
	    	var mnetincome1=nui.get("mnetincome1").getValue();
	    	var mnetincome3=nui.get("mnetincome3").getValue();
	    	var mnetincome2=nui.get("mnetincome2").getValue();
	    	var mnetincome4=nui.get("mnetincome4").getValue();
	    	var currentcost1=nui.get("currentcost1").getValue();
	    	var currentcost3=nui.get("currentcost3").getValue();
	    	var currentcost2=nui.get("currentcost2").getValue();
	    	var currentcost4=nui.get("currentcost4").getValue();
	    	var servcost1=nui.get("servcost1").getValue();
	    	var servcost3=nui.get("servcost3").getValue();
	    	var servcost2=nui.get("servcost2").getValue();
	    	var servcost4=nui.get("servcost4").getValue();
	    	var salecost1=nui.get("salecost1").getValue();
	    	var salecost3=nui.get("salecost3").getValue();
	    	var salecost2=nui.get("salecost2").getValue();
	    	var salecost4=nui.get("salecost4").getValue();
	    	var deptmcost1=nui.get("deptmcost1").getValue();
	    	var deptmcost3=nui.get("deptmcost3").getValue();
	    	var deptmcost2=nui.get("deptmcost2").getValue();
	    	var deptmcost4=nui.get("deptmcost4").getValue();
	    	var deptdcost1=nui.get("deptdcost1").getValue();
	    	var deptdcost3=nui.get("deptdcost3").getValue();
	    	var deptdcost2=nui.get("deptdcost2").getValue();
	    	var deptdcost4=nui.get("deptdcost4").getValue();
	    	var commshar1=nui.get("commshar1").getValue();
	    	var commshar3=nui.get("commshar3").getValue();
	    	var commshar2=nui.get("commshar2").getValue();
	    	var commshar4=nui.get("commshar4").getValue();
	    	var comashar1=nui.get("comashar1").getValue();
	    	var comashar3=nui.get("comashar3").getValue();
	    	var comashar2=nui.get("comashar2").getValue();
	    	var comashar4=nui.get("comashar4").getValue();
	    	var comdshar1=nui.get("comdshar1").getValue();
	    	var comdshar3=nui.get("comdshar3").getValue();
	    	var comdshar2=nui.get("comdshar2").getValue();
	    	var comdshar4=nui.get("comdshar4").getValue();
	    	var baddebts1=nui.get("baddebts1").getValue();
	    	var baddebts3=nui.get("baddebts3").getValue();
	    	var baddebts2=nui.get("baddebts2").getValue();
	    	var baddebts4=nui.get("baddebts4").getValue();
	    	var assetlose1=nui.get("assetlose1").getValue();
	    	var assetlose3=nui.get("assetlose3").getValue();
	    	var assetlose2=nui.get("assetlose2").getValue();
	    	var assetlose4=nui.get("assetlose4").getValue();
	    	var instock1=nui.get("instock1").getValue();
	    	var instock3=nui.get("instock3").getValue();
	    	var instock2=nui.get("instock2").getValue();
	    	var instock4=nui.get("instock4").getValue();
	    	var outstock1=nui.get("outstock1").getValue();
	    	var outstock3=nui.get("outstock3").getValue();
	    	var outstock2=nui.get("outstock2").getValue();
	    	var outstock4=nui.get("outstock4").getValue();
	    	var payback1=nui.get("payback1").getValue();
	    	var payback3=nui.get("payback3").getValue();
	    	var payback2=nui.get("payback2").getValue();
	    	var payback4=nui.get("payback4").getValue();
	    	var bonus1=nui.get("bonus1").getValue();
	    	var bonus3=nui.get("bonus3").getValue();
	    	var bonus2=nui.get("bonus2").getValue();
	    	var bonus4=nui.get("bonus4").getValue();
	    	var servtax1=nui.get("servtax1").getValue();
	    	var servtax3=nui.get("servtax3").getValue();
	    	var servtax2=nui.get("servtax2").getValue();
	    	var servtax4=nui.get("servtax4").getValue();
	    	var profitBBonus1=nui.get("profitBBonus1").getValue();
	    	var profitBBonus3=nui.get("profitBBonus3").getValue();
	    	var profitBBonus2=nui.get("profitBBonus2").getValue();
	    	var profitBBonus4=nui.get("profitBBonus4").getValue();
	    	var profitABonus1=nui.get("profitABonus1").getValue();
	    	var profitABonus3=nui.get("profitABonus3").getValue();
	    	var profitABonus2=nui.get("profitABonus2").getValue();
	    	var profitABonus4=nui.get("profitABonus4").getValue();
	    	//计算 
	    	var contamt=contamt1+contamt2+contamt3+contamt4;
	    	var pcontamt=pcontamt1+pcontamt2+pcontamt3+pcontamt4;
	    	var scontamt=scontamt1+scontamt2+scontamt3+scontamt4;
	    	var mcontamt=mcontamt1+mcontamt2+mcontamt3+mcontamt4;
	    	var receamt=receamt1+receamt2+receamt3+receamt4;
	    	var taxincome=taxincome1+taxincome2+taxincome3+taxincome4;
	    	var ptaxincome=ptaxincome1+ptaxincome2+ptaxincome3+ptaxincome4;
	    	var staxincome=staxincome1+staxincome2+staxincome3+staxincome4;
	    	var mtaxincome=mtaxincome1+mtaxincome2+mtaxincome3+mtaxincome4;
	    	var ntaxincome=ntaxincome1+ntaxincome2+ntaxincome3+ntaxincome4;
	    	var pntaxincome=pntaxincome1+pntaxincome2+pntaxincome3+pntaxincome4;
	    	var sntaxincome=sntaxincome1+sntaxincome2+sntaxincome3+sntaxincome4;
	    	var mntaxincome=mntaxincome1+mntaxincome2+mntaxincome3+mntaxincome4;
	    	var subfee=subfee1+subfee2+subfee3+subfee4;
	    	var psubfee=psubfee1+psubfee2+psubfee3+psubfee4;
	    	var msubfee=msubfee1+msubfee2+msubfee3+msubfee4;
	    	var ssubfee=ssubfee1+ssubfee2+ssubfee3+ssubfee4; 
	    	var bustax=bustax1+bustax2+bustax3+bustax4;
	    	var netincome=netincome1+netincome2+netincome3+netincome4;
	    	var pnetincome=pnetincome1+pnetincome2+pnetincome3+pnetincome4;
	    	var snetincome=snetincome1+snetincome2+snetincome3+snetincome4;
	    	var mnetincome=mnetincome1+mnetincome2+mnetincome3+mnetincome4;
	    	var currentcost=currentcost1+currentcost2+currentcost3+currentcost4;
	    	var servcost=servcost1+servcost2+servcost3+servcost4;
	    	var salecost=salecost1+salecost2+salecost3+salecost4;
	    	var deptmcost=deptmcost1+deptmcost2+deptmcost3+deptmcost4;
	    	var deptdcost=deptdcost1+deptdcost2+deptdcost3+deptdcost4;
	    	var commshar=commshar1+commshar2+commshar3+commshar4;
	    	var comashar=comashar1+comashar2+comashar3+comashar4;
	    	var comdshar=comdshar1+comdshar2+comdshar3+comdshar4;
	    	var baddebts=baddebts1+baddebts2+baddebts3+baddebts4;
	    	var assetlose=assetlose1+assetlose2+assetlose3+assetlose4;
	    	var instock=instock1+instock2+instock3+instock4;
	    	var outstock=outstock1+outstock2+outstock3+outstock4;
	    	var payback=payback1+payback2+payback3+payback4;
	    	var bonus=bonus1+bonus2+bonus3+bonus4;
	    	var servtax=servtax1+servtax2+servtax3+servtax4;
	    	var profitBBonus=profitBBonus1+profitBBonus2+profitBBonus3+profitBBonus4;
	    	var profitABonus=profitABonus1+profitABonus2+profitABonus3+profitABonus4;
	    	document.getElementById("contamt").innerHTML = contamt == null ? "":formatNumber(contamt);
	    	document.getElementById("pcontamt").innerHTML = pcontamt == null ? "":formatNumber(pcontamt);
	    	document.getElementById("scontamt").innerHTML = scontamt == null ? "":formatNumber(scontamt);
	    	document.getElementById("mcontamt").innerHTML = mcontamt == null ? "":formatNumber(mcontamt);
	    	document.getElementById("receamt").innerHTML = receamt == null ? "":formatNumber(receamt);
	    	document.getElementById("taxincome").innerHTML = taxincome == null ? "":formatNumber(taxincome);
	    	document.getElementById("ptaxincome").innerHTML = ptaxincome == null ? "":formatNumber(ptaxincome);
	    	document.getElementById("mtaxincome").innerHTML = mtaxincome == null ? "":formatNumber(mtaxincome);
	    	document.getElementById("staxincome").innerHTML = staxincome == null ? "":formatNumber(staxincome);
	    	document.getElementById("ntaxincome").innerHTML = ntaxincome == null ? "":formatNumber(ntaxincome);
	    	document.getElementById("pntaxincome").innerHTML = pntaxincome == null ? "":formatNumber(pntaxincome);
	    	document.getElementById("mntaxincome").innerHTML = mntaxincome == null ? "":formatNumber(mntaxincome);
	    	document.getElementById("sntaxincome").innerHTML = sntaxincome == null ? "":formatNumber(sntaxincome);
	    	document.getElementById("subfee").innerHTML = subfee == null ? "":formatNumber(subfee);
	    	document.getElementById("psubfee").innerHTML = psubfee == null ? "":formatNumber(psubfee);
	    	document.getElementById("ssubfee").innerHTML = ssubfee == null ? "":formatNumber(ssubfee);
	    	document.getElementById("msubfee").innerHTML = msubfee == null ? "":formatNumber(msubfee);
	    	document.getElementById("bustax").innerHTML = bustax == null ? "":formatNumber(bustax);
	    	document.getElementById("netincome").innerHTML = netincome == null ? "":formatNumber(netincome);
	    	document.getElementById("pnetincome").innerHTML = pnetincome == null ? "":formatNumber(pnetincome);
	    	document.getElementById("snetincome").innerHTML = snetincome == null ? "":formatNumber(snetincome);
	    	document.getElementById("mnetincome").innerHTML = mnetincome == null ? "":formatNumber(mnetincome);
	    	document.getElementById("currentcost").innerHTML = currentcost == null ? "":formatNumber(currentcost);
	    	document.getElementById("servcost").innerHTML = servcost == null ? "":formatNumber(servcost);
	    	document.getElementById("salecost").innerHTML = salecost == null ? "":formatNumber(salecost);
	    	document.getElementById("deptmcost").innerHTML = deptmcost == null ? "":formatNumber(deptmcost);
	    	document.getElementById("deptdcost").innerHTML = deptdcost == null ? "":formatNumber(deptdcost);
	    	document.getElementById("commshar").innerHTML = commshar == null ? "":formatNumber(commshar);
	    	document.getElementById("comashar").innerHTML = comashar == null ? "":formatNumber(comashar);
	    	document.getElementById("comdshar").innerHTML = comdshar == null ? "":formatNumber(comdshar);
	    	document.getElementById("baddebts").innerHTML = baddebts == null ? "":formatNumber(baddebts);
	    	document.getElementById("assetlose").innerHTML = assetlose == null ? "":formatNumber(assetlose);
	    	document.getElementById("instock").innerHTML = instock == null ? "":formatNumber(instock);
	    	document.getElementById("outstock").innerHTML = outstock == null ? "":formatNumber(outstock);
	    	document.getElementById("payback").innerHTML = payback == null ? "":formatNumber(payback);
	    	document.getElementById("bonus").innerHTML = bonus == null ? "":formatNumber(bonus);
	    	document.getElementById("servtax").innerHTML = servtax == null ? "":formatNumber(servtax);
	    	document.getElementById("profitBBonus").innerHTML = profitBBonus == null ? "":formatNumber(profitBBonus);
	    	document.getElementById("profitABonus").innerHTML = profitABonus == null ? "":formatNumber(profitABonus);
	    	calGrowth(); 
		}
		//计算同比增长
		function calGrowth(){
			//获取实际执行数据与预算数据
			var contamt=delcommafy(document.getElementById("contamt").innerHTML);
	    	var contamt5=delcommafy(document.getElementById("contamt5").innerHTML);
	    	var pcontamt=delcommafy(document.getElementById("pcontamt").innerHTML);
	    	var pcontamt5=delcommafy(document.getElementById("pcontamt5").innerHTML);
	    	var scontamt=delcommafy(document.getElementById("scontamt").innerHTML);
	    	var scontamt5=delcommafy(document.getElementById("scontamt5").innerHTML);
	    	var mcontamt=delcommafy(document.getElementById("mcontamt").innerHTML);
	    	var mcontamt5=delcommafy(document.getElementById("mcontamt5").innerHTML);
	    	var receamt=delcommafy(document.getElementById("receamt").innerHTML);
	    	var receamt5=delcommafy(document.getElementById("receamt5").innerHTML);
	    	var taxincome=delcommafy(document.getElementById("taxincome").innerHTML);
	    	var taxincome5=delcommafy(document.getElementById("taxincome5").innerHTML);
	    	var ptaxincome=delcommafy(document.getElementById("ptaxincome").innerHTML);
	    	var ptaxincome5=delcommafy(document.getElementById("ptaxincome5").innerHTML);
	    	var staxincome=delcommafy(document.getElementById("staxincome").innerHTML);
	    	var staxincome5=delcommafy(document.getElementById("staxincome5").innerHTML);
	    	var mtaxincome=delcommafy(document.getElementById("mtaxincome").innerHTML);
	    	var mtaxincome5=delcommafy(document.getElementById("mtaxincome5").innerHTML);
			var ntaxincome=delcommafy(document.getElementById("ntaxincome").innerHTML);
	    	var ntaxincome5=delcommafy(document.getElementById("ntaxincome5").innerHTML);
	    	var pntaxincome=delcommafy(document.getElementById("pntaxincome").innerHTML);
	    	var pntaxincome5=delcommafy(document.getElementById("pntaxincome5").innerHTML);
	    	var sntaxincome=delcommafy(document.getElementById("sntaxincome").innerHTML);
	    	var sntaxincome5=delcommafy(document.getElementById("sntaxincome5").innerHTML);
	    	var mntaxincome=delcommafy(document.getElementById("mntaxincome").innerHTML);
	    	var mntaxincome5=delcommafy(document.getElementById("mntaxincome5").innerHTML);
	    	var subfee=delcommafy(document.getElementById("subfee").innerHTML);
	    	var subfee5=delcommafy(document.getElementById("subfee5").innerHTML);
	    	var psubfee=delcommafy(document.getElementById("psubfee").innerHTML);
	    	var psubfee5=delcommafy(document.getElementById("psubfee5").innerHTML);
	    	var ssubfee=delcommafy(document.getElementById("ssubfee").innerHTML);
	    	var ssubfee5=delcommafy(document.getElementById("ssubfee5").innerHTML);
	    	var msubfee=delcommafy(document.getElementById("msubfee").innerHTML);
	    	var msubfee5=delcommafy(document.getElementById("msubfee5").innerHTML);
	    	var bustax=delcommafy(document.getElementById("bustax").innerHTML);
	    	var bustax5=delcommafy(document.getElementById("bustax5").innerHTML);
	    	var netincome=delcommafy(document.getElementById("netincome").innerHTML);
	    	var netincome5=delcommafy(document.getElementById("netincome5").innerHTML);
	    	var pnetincome=delcommafy(document.getElementById("pnetincome").innerHTML);
	    	var pnetincome5=delcommafy(document.getElementById("pnetincome5").innerHTML);
	    	var snetincome=delcommafy(document.getElementById("snetincome").innerHTML);
	    	var snetincome5=delcommafy(document.getElementById("snetincome5").innerHTML);
	    	var mnetincome=delcommafy(document.getElementById("mnetincome").innerHTML);
	    	var mnetincome5=delcommafy(document.getElementById("mnetincome5").innerHTML);
	    	var currentcost=delcommafy(document.getElementById("currentcost").innerHTML);
	    	var currentcost5=delcommafy(document.getElementById("currentcost5").innerHTML);
	    	var servcost=delcommafy(document.getElementById("servcost").innerHTML);
	    	var servcost5=delcommafy(document.getElementById("servcost5").innerHTML);
	    	var salecost=delcommafy(document.getElementById("salecost").innerHTML);
	    	var salecost5=delcommafy(document.getElementById("salecost5").innerHTML);
	    	var deptmcost=delcommafy(document.getElementById("deptmcost").innerHTML);
	    	var deptmcost5=delcommafy(document.getElementById("deptmcost5").innerHTML);
	    	var deptdcost=delcommafy(document.getElementById("deptdcost").innerHTML);
	    	var deptdcost5=delcommafy(document.getElementById("deptdcost5").innerHTML);
	    	var commshar=delcommafy(document.getElementById("commshar").innerHTML);
	    	var commshar5=delcommafy(document.getElementById("commshar5").innerHTML);
	    	var comashar=delcommafy(document.getElementById("comashar").innerHTML);
	    	var comashar5=delcommafy(document.getElementById("comashar5").innerHTML);
	    	var comdshar=delcommafy(document.getElementById("comdshar").innerHTML);
	    	var comdshar5=delcommafy(document.getElementById("comdshar5").innerHTML);
	    	var baddebts=delcommafy(document.getElementById("baddebts").innerHTML);
	    	var baddebts5=delcommafy(document.getElementById("baddebts5").innerHTML);
	    	var assetlose=delcommafy(document.getElementById("assetlose").innerHTML);
	    	var assetlose5=delcommafy(document.getElementById("assetlose5").innerHTML);
	    	var instock=delcommafy(document.getElementById("instock").innerHTML);
	    	var instock5=delcommafy(document.getElementById("instock5").innerHTML);
	    	var outstock=delcommafy(document.getElementById("outstock").innerHTML);
	    	var outstock5=delcommafy(document.getElementById("outstock5").innerHTML);
	    	var payback=delcommafy(document.getElementById("payback").innerHTML);
	    	var payback5=delcommafy(document.getElementById("payback5").innerHTML);
	    	var servtax=delcommafy(document.getElementById("servtax").innerHTML);
	    	var servtax5=delcommafy(document.getElementById("servtax5").innerHTML);
	    	var bonus=delcommafy(document.getElementById("bonus").innerHTML);
	    	var bonus5=delcommafy(document.getElementById("bonus5").innerHTML);
	    	var profitBBonus=delcommafy(document.getElementById("profitBBonus").innerHTML);
	    	var profitBBonus5=delcommafy(document.getElementById("profitBBonus5").innerHTML);
	    	var profitABonus=delcommafy(document.getElementById("profitABonus").innerHTML);
	    	var profitABonus5=delcommafy(document.getElementById("profitABonus5").innerHTML);
	    	//计算同比增长
	    	var contamt6=0;
	    	var pcontamt6=0;
	    	var scontamt6=0;
	    	var mcontamt6=0;
	    	var receamt6=0;
	    	var taxincome6=0;
	    	var ptaxincome6=0;
	    	var staxincome6=0;
	    	var mtaxincome6=0;
	    	var ntaxincome6=0;
	    	var pntaxincome6=0;
	    	var sntaxincome6=0;
	    	var mntaxincome6=0;
	    	var subfee6=0;
	    	var psubfee6=0;
	    	var msubfee6=0;
	    	var ssubfee6=0;
	    	var bustax6=0;
	    	var netincome6=0;
	    	var pnetincome6=0;
	    	var snetincome6=0;
	    	var mnetincome6=0;
	    	var currentcost6=0;
	    	var servcost6=0;
	    	var salecost6=0;
	    	var deptmcost6=0;
	    	var deptdcost6=0;
	    	var commshar6=0;
	    	var comashar6=0;
	    	var comdshar6=0;
	    	var baddebts6=0;
	    	var assetlose6=0;
	    	var instock6=0;
	    	var outstock6=0;
	    	var payback6=0;
	    	var servtax6=0;
	    	var bonus6=0;
	    	var profitBBonus6=0;
	    	if(contamt5 !=0 && contamt5 != "" && contamt5!=null){
				 contamt6=(contamt/contamt5-1).toFixed(3);
			}
			if(pcontamt5 !=0 && pcontamt5 != "" && pcontamt5!=null){
				 pcontamt6=(pcontamt/pcontamt5-1).toFixed(3);
			}
			if(scontamt5 !=0 && scontamt5 != "" && scontamt5!=null){
				scontamt6=(scontamt/scontamt5-1).toFixed(3);
			}
			if(mcontamt5 !=0 && mcontamt5 != "" && mcontamt5!=null){
				mcontamt6=(mcontamt/mcontamt5-1).toFixed(3);
			}
			if(receamt5 !=0 && receamt5 != "" && receamt5!=null){
				receamt6=(receamt/receamt5-1).toFixed(3);
			}
			if(taxincome5 !=0 && taxincome5 != "" && taxincome5!=null){
				taxincome6=(taxincome/taxincome5-1).toFixed(3);
			}
			if(ptaxincome5 !=0 && ptaxincome5 != "" && ptaxincome5!=null){
				ptaxincome6=(ptaxincome/ptaxincome5-1).toFixed(3);
			}
			if(staxincome5 !=0 && staxincome5 != "" && staxincome5!=null){
				staxincome6=(staxincome/staxincome5-1).toFixed(3);
			}
			if(mtaxincome5 !=0 && mtaxincome5 != "" && mtaxincome5!=null){
				mtaxincome6=(mtaxincome/mtaxincome5-1).toFixed(3);
			}
			if(ntaxincome5 !=0 && ntaxincome5 != "" && ntaxincome5!=null){
				ntaxincome6=(ntaxincome/ntaxincome5-1).toFixed(3);
			}
			if(pntaxincome5 !=0 && pntaxincome5 != "" && pntaxincome5!=null){
				pntaxincome6=(pntaxincome/pntaxincome5-1).toFixed(3);
			}
			if(sntaxincome5 !=0 && sntaxincome5 != "" && sntaxincome5!=null){
				sntaxincome6=(sntaxincome/sntaxincome5-1).toFixed(3);
			}
			if(mntaxincome5 !=0 && mntaxincome5 != "" && mntaxincome5!=null){
				mntaxincome6=(mntaxincome/mntaxincome5-1).toFixed(3);
			}
			if(subfee5 !=0 && subfee5 != "" && subfee5!=null){
				subfee6=(subfee/subfee5-1).toFixed(3);
			}
			if(psubfee5 !=0 && psubfee5 != "" && psubfee5!=null){
				psubfee6=(psubfee/psubfee5-1).toFixed(3);
			}
			if(msubfee5 !=0 && msubfee5 != "" && msubfee5!=null){
				msubfee6=(msubfee/msubfee5-1).toFixed(3);
			}
			if(ssubfee5 !=0 && ssubfee5 != "" && ssubfee5!=null){
				ssubfee6=(ssubfee/ssubfee5-1).toFixed(3);
			}
			if(bustax5 !=0 && bustax5 != "" && bustax5!=null){
				bustax6=(bustax/bustax5-1).toFixed(3);
			}
			if(netincome5 !=0 && netincome5 != "" && netincome5!=null){
				netincome6=(netincome/netincome5-1).toFixed(3);
			}
			if(pnetincome5 !=0 && pnetincome5 != "" && pnetincome5!=null){
				pnetincome6=(pnetincome/pnetincome5-1).toFixed(3);
			}
			if(snetincome5 !=0 && snetincome5 != "" && snetincome5!=null){
				snetincome6=(snetincome/snetincome5-1).toFixed(3);
			}
			if(mnetincome5 !=0 && mnetincome5 != "" && mnetincome5!=null){
				mnetincome6=(mnetincome/mnetincome5-1).toFixed(3);
			}
			if(currentcost5 !=0 && currentcost5 != "" && currentcost5!=null){
				currentcost6=(currentcost/currentcost5-1).toFixed(3);
			}
			if(servcost5 !=0 && servcost5 != "" && servcost5!=null){
				servcost6=(servcost/servcost5-1).toFixed(3);
			}
			if(salecost5 !=0 && salecost5 != "" && salecost5!=null){
				salecost6=(salecost/salecost5-1).toFixed(3);
			}
			if(deptmcost5 !=0 && deptmcost5 != "" && deptmcost5!=null){
				deptmcost6=(deptmcost/deptmcost5-1).toFixed(3);
			}
			if(deptdcost5 !=0 && deptdcost5 != "" && deptdcost5!=null){
				deptdcost6=(deptdcost/deptdcost5-1).toFixed(3);
			}
			if(commshar5 !=0 && commshar5 != "" && commshar5!=null){
				commshar6=(commshar/commshar5-1).toFixed(3);
			}
			if(comdshar5 !=0 && comdshar5 != "" && comdshar5!=null){
				comdshar6=(comdshar/comdshar5-1).toFixed(3);
			}
			if(baddebts5 !=0 && baddebts5 != "" && baddebts5!=null){
				baddebts6=(baddebts/baddebts5-1).toFixed(3);
			}
			if(assetlose5 !=0 && assetlose5 != "" && assetlose5!=null){
				assetlose6=(assetlose/assetlose5-1).toFixed(3);
			}
			if(instock5 !=0 && instock5 != "" && instock5!=null){
				instock6=(instock/instock5-1).toFixed(3);
			}
			if(outstock5 !=0 && outstock5 != "" && outstock5!=null){
				outstock6=(outstock/outstock5-1).toFixed(3);
			}
			if(payback5 !=0 && payback5 != "" && payback5!=null){
				payback6=(payback/payback5-1).toFixed(3);
			}
			if(servtax5 !=0 && servtax5 != "" && servtax5!=null){
				servtax6=(servtax/servtax5-1).toFixed(3);
			}
			if(bonus5 !=0 && bonus5 != "" && bonus5!=null){
				bonus6=(bonus/bonus5-1).toFixed(3);
			}
			if(profitBBonus5 !=0 && profitBBonus5 != "" && profitBBonus5!=null){
				profitBBonus6=(profitBBonus/profitBBonus5-1).toFixed(3);
			}
			if(profitABonus5 !=0 && profitABonus != "" && profitABonus5!=null){
				profitABonus6=(profitABonus/profitABonus5-1).toFixed(3);
			}
			document.getElementById("contamt6").innerHTML = (contamt6*100).toFixed(1)+"%";
	    	document.getElementById("pcontamt6").innerHTML = (pcontamt6*100).toFixed(1)+"%";
	    	document.getElementById("scontamt6").innerHTML = (scontamt6*100).toFixed(1)+"%";
	    	document.getElementById("mcontamt6").innerHTML = (mcontamt6*100).toFixed(1)+"%";
	    	document.getElementById("receamt6").innerHTML = (receamt6*100).toFixed(1)+"%";
	    	document.getElementById("taxincome6").innerHTML = (taxincome6*100).toFixed(1)+"%";
	    	document.getElementById("ptaxincome6").innerHTML = (ptaxincome6*100).toFixed(1)+"%";
	    	document.getElementById("mtaxincome6").innerHTML = (mtaxincome6*100).toFixed(1)+"%";
	    	document.getElementById("staxincome6").innerHTML = (staxincome6*100).toFixed(1)+"%";
	    	document.getElementById("ntaxincome6").innerHTML = (ntaxincome6*100).toFixed(1)+"%";
	    	document.getElementById("pntaxincome6").innerHTML = (pntaxincome6*100).toFixed(1)+"%";
	    	document.getElementById("mntaxincome6").innerHTML = (mntaxincome6*100).toFixed(1)+"%";
	    	document.getElementById("sntaxincome6").innerHTML = (sntaxincome6*100).toFixed(1)+"%";
	    	document.getElementById("subfee6").innerHTML = (subfee6*100).toFixed(1)+"%";
	    	document.getElementById("psubfee6").innerHTML = (psubfee6*100).toFixed(1)+"%";
	    	document.getElementById("ssubfee6").innerHTML = (ssubfee6*100).toFixed(1)+"%";
	    	document.getElementById("msubfee6").innerHTML = (msubfee6*100).toFixed(1)+"%";
	    	document.getElementById("bustax6").innerHTML = (bustax6*100).toFixed(1)+"%";
	    	document.getElementById("netincome6").innerHTML = (netincome6*100).toFixed(1)+"%";
	    	document.getElementById("pnetincome6").innerHTML = (pnetincome6*100).toFixed(1)+"%";
	    	document.getElementById("snetincome6").innerHTML = (snetincome6*100).toFixed(1)+"%";
	    	document.getElementById("mnetincome6").innerHTML = (mnetincome6*100).toFixed(1)+"%";
	    	document.getElementById("currentcost6").innerHTML = (currentcost6*100).toFixed(1)+"%";
	    	document.getElementById("servcost6").innerHTML = (servcost6*100).toFixed(1)+"%";
	    	document.getElementById("salecost6").innerHTML = (salecost6*100).toFixed(1)+"%";
	    	document.getElementById("deptmcost6").innerHTML = (deptmcost6*100).toFixed(1)+"%";
	    	document.getElementById("deptdcost6").innerHTML = (deptdcost6*100).toFixed(1)+"%";
	    	document.getElementById("commshar6").innerHTML = (commshar6*100).toFixed(1)+"%";
	    	document.getElementById("comashar6").innerHTML = (comashar6*100).toFixed(1)+"%";
	    	document.getElementById("comdshar6").innerHTML = (comdshar6*100).toFixed(1)+"%";
	    	document.getElementById("baddebts6").innerHTML = (baddebts6*100).toFixed(1)+"%";
	    	document.getElementById("assetlose6").innerHTML = (assetlose6*100).toFixed(1)+"%";
	    	document.getElementById("instock6").innerHTML = (instock6*100).toFixed(1)+"%" ;
	    	document.getElementById("outstock6").innerHTML = (outstock6*100).toFixed(1)+"%";
	    	document.getElementById("payback6").innerHTML = (payback6*100).toFixed(1)+"%";
	    	document.getElementById("servtax6").innerHTML = (servtax6*100).toFixed(1)+"%";
	    	document.getElementById("bonus6").innerHTML = (bonus6*100).toFixed(1)+"%";
	    	document.getElementById("profitBBonus6").innerHTML = (profitBBonus6*100).toFixed(1)+"%";
	    	document.getElementById("profitABonus6").innerHTML = (profitABonus6*100).toFixed(1)+"%";					
		}
		//格式化为千分位形式
		function formatNumber(num) {
			var num = num.toFixed(0);
		    num = (num || 0).toString(), result = '';
		    while (num.length > 3) {
		        result = ',' + num.slice(-3) + result;
		        num = num.slice(0, num.length - 3);
		    }
		    if (num) { result = num + result; }
		    return result;
		}
		//去除千分位
		function delcommafy(num){
		  num=num.replace(/,/gi,'');
		  return parseFloat(num);
		}
		//导出excel
		function exportDeptbudget1(e){
			hideWindow()
			Filepath="<%=request.getSession().getServletContext().getRealPath("/reportFiles/"+"ame_depbudgetexport.raq").replace("\\","\\\\")  %>";
			var data = {orgid:orgid,year:inputyear,Filepath:Filepath};
		    if(e=='0'){
	    		data.orgdegree=orgdegree;
			}
			form.loading();
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.primeton.eos.ame_budget.deptbudget.exportdepbudget.biz.ext",
		        data: json,
		        type: 'POST',
		        cache: false,
		        contentType: 'text/json',
		        success: function (text) {
	        		if(text.a==0){
	        			nui.alert("导出数据失败！");
	        			form.unmask();
	        			return;
	        		}
	        		nui.alert("导出数据成功！","系统提示",function(){
	        			var filePath = text.url;
	                	var fileName = "Deptbudget";
	                	var myDate = new Date();
	                	var year = myDate.getYear();
	                	var month = myDate.getMonth()+1;
	                	var day = myDate.getDate();
	                	var hours = myDate.getHours();
	                	var minutes = myDate.getMinutes();
	                	var seconds = myDate.getSeconds();
	                	var curDateTime = year;
	                	if(month>9)
							curDateTime = curDateTime + "" + month;
						else
							curDateTime = curDateTime + "0" + month;
	                	if(day>9)
							curDateTime = curDateTime + "" + day;
						else
							curDateTime = curDateTime + "0" + day;
						if(hours>9)
							curDateTime = curDateTime + "" + hours;
						else
							curDateTime = curDateTime + "0" + hours;
						if(minutes>9)
							curDateTime = curDateTime + "" + minutes;
						else
							curDateTime = curDateTime + "0" + minutes;
						if(seconds>9)
							curDateTime = curDateTime + "" + seconds;
						else
							curDateTime = curDateTime + "0" + seconds;
						fileName = fileName + curDateTime + ".xls";
						var frm = document.getElementById("viewlist1");
	                	frm.elements["downloadFile"].value = filePath;
	                	frm.elements["fileName"].value = fileName;
					    frm.submit();
	        			//window.open("com.primeton.components.web.fileupload.getfileByAbsoPath.flow?fileType=xls文件&fileName=ExportDeptbudget.xls&filePath=" + text.url);
	        		});
	        		form.unmask();
		        },
		        error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
		}
		
		//导出前数据准备
		
		function dataPrepare(){
			var budgetname = inputyear+orgname+"预算";
			var	contamt5=document.getElementById("contamt5").innerHTML; 
			var	pcontamt5=document.getElementById("pcontamt5").innerHTML;                 
			var	scontamt5=document.getElementById("scontamt5").innerHTML;               
			var	mcontamt5=document.getElementById("mcontamt5").innerHTML;               
			var	receamt5=document.getElementById("receamt5").innerHTML; 
			var	taxincome5=document.getElementById("taxincome5").innerHTML;                
			var	ptaxincome5=document.getElementById("ptaxincome5").innerHTML;           
			var	mtaxincome5=document.getElementById("mtaxincome5").innerHTML;           
			var	staxincome5=document.getElementById("staxincome5").innerHTML; 
			var	ntaxincome5=document.getElementById("ntaxincome5").innerHTML;                
			var	pntaxincome5=document.getElementById("pntaxincome5").innerHTML;           
			var	mntaxincome5=document.getElementById("mntaxincome5").innerHTML;           
			var	sntaxincome5=document.getElementById("sntaxincome5").innerHTML; 
			var	subfee5=document.getElementById("subfee5").innerHTML;          
			var	psubfee5=document.getElementById("psubfee5").innerHTML;                 
			var	ssubfee5=document.getElementById("ssubfee5").innerHTML;                 
			var	msubfee5=document.getElementById("msubfee5").innerHTML;
			var	bustax5=document.getElementById("bustax5").innerHTML;                 
			var	netincome5=document.getElementById("netincome5").innerHTML;             
			var	pnetincome5=document.getElementById("pnetincome5").innerHTML;           
			var	snetincome5=document.getElementById("snetincome5").innerHTML;           
			var	mnetincome5=document.getElementById("mnetincome5").innerHTML; 
			var	currentcost5=document.getElementById("currentcost5").innerHTML;           
			var	servcost5=document.getElementById("servcost5").innerHTML;               
			var	salecost5=document.getElementById("salecost5").innerHTML;               
			var	deptmcost5=document.getElementById("deptmcost5").innerHTML;             
			var	deptdcost5=document.getElementById("deptdcost5").innerHTML;             
			var	commshar5=document.getElementById("commshar5").innerHTML;               
			var	comashar5=document.getElementById("comashar5").innerHTML;               
			var	comdshar5=document.getElementById("comdshar5").innerHTML; 
			var	baddebts5=document.getElementById("baddebts5").innerHTML;               
			var	assetlose5=document.getElementById("assetlose5").innerHTML; 
			var	payback5=document.getElementById("payback5").innerHTML;             
			var	instock5=document.getElementById("instock5").innerHTML;                 
			var	outstock5=document.getElementById("outstock5").innerHTML;
			var	servtax5=document.getElementById("servtax5").innerHTML;                  
			var	bonus5=document.getElementById("bonus5").innerHTML;  
			var	profitBBonus5=document.getElementById("profitBBonus5").innerHTML;  
			var	profitABonus5=document.getElementById("profitABonus5").innerHTML;                     
			var budget = "";
			var form = new nui.Form("#form1");
	        var data = form.getData();
	        for(var i=0;i<data.budget.length;i++){
	           eval("var pcontamt"+ (i+1) + "=" + data.budget[i].pcontamt);
	           eval("var scontamt"+ (i+1) + "=" + data.budget[i].scontamt);
	           eval("var mcontamt"+ (i+1) + "=" + data.budget[i].mcontamt);
	           eval("var receamt"+ (i+1) + "=" + data.budget[i].receamt);
	           eval("var ptaxincome"+ (i+1) + "=" + data.budget[i].ptaxincome);
	           eval("var mtaxincome"+ (i+1) + "=" + data.budget[i].mtaxincome);
	           eval("var staxincome"+ (i+1) + "=" + data.budget[i].staxincome);
	           eval("var psubfee"+ (i+1) + "=" + data.budget[i].psubfee);
	           eval("var msubfee"+ (i+1) + "=" + data.budget[i].msubfee);
	           eval("var ssubfee"+ (i+1) + "=" + data.budget[i].ssubfee);
	           eval("var salecost"+ (i+1) + "=" + data.budget[i].salecost);
	           eval("var servcost"+ (i+1) + "=" + data.budget[i].servcost);
	           eval("var deptmcost"+ (i+1) + "=" + data.budget[i].deptmcost);
	           eval("var deptdcost"+ (i+1) + "=" + data.budget[i].deptdcost);
	           eval("var commshar"+ (i+1) + "=" + data.budget[i].commshar);
	           eval("var comdshar"+ (i+1) + "=" + data.budget[i].comdshar);
	           eval("var comashar"+ (i+1) + "=" + data.budget[i].comashar);
	           eval("var baddebts"+ (i+1) + "=" + data.budget[i].baddebts);
	           eval("var assetlose"+ (i+1) + "=" + data.budget[i].assetlose);
	           eval("var instock"+ (i+1) + "=" + data.budget[i].instock);
	           eval("var outstock"+ (i+1) + "=" + data.budget[i].outstock);
	           eval("var bonus"+ (i+1) + "=" + data.budget[i].bonus);
	           eval("var servtax"+ (i+1) + "=" + data.budget[i].servtax);
	        }
	        for(var i=0;i<data.budget.length;i++){
	           eval("var contamt_a"+ (i+1) + "=" + data.budget_sj[i].contamt);
	           eval("var pcontamt_a"+ (i+1) + "=" + data.budget_sj[i].pcontamt);
	           eval("var scontamt_a"+ (i+1) + "=" + data.budget_sj[i].scontamt);
	           eval("var mcontamt_a"+ (i+1) + "=" + data.budget_sj[i].mcontamt);
	           eval("var receamt_a"+ (i+1) + "=" + data.budget_sj[i].receamt);
	           eval("var bustax_a"+ (i+1) + "=" + data.budget_sj[i].bustax);
	           eval("var taxincome_a"+ (i+1) + "=" + data.budget_sj[i].taxincome);
	           eval("var ptaxincome_a"+ (i+1) + "=" + data.budget_sj[i].ptaxincome);
	           eval("var mtaxincome_a"+ (i+1) + "=" + data.budget_sj[i].mtaxincome);
	           eval("var staxincome_a"+ (i+1) + "=" + data.budget_sj[i].staxincome);
	           eval("var ntaxincome_a"+ (i+1) + "=" + data.budget_sj[i].ntaxincome);
	           eval("var pntaxincome_a"+ (i+1) + "=" + data.budget_sj[i].pntaxincome);
	           eval("var mntaxincome_a"+ (i+1) + "=" + data.budget_sj[i].mntaxincome);
	           eval("var sntaxincome_a"+ (i+1) + "=" + data.budget_sj[i].sntaxincome);
	           eval("var netincome_a"+ (i+1) + "=" + data.budget_sj[i].netincome);
	           eval("var pnetincome_a"+ (i+1) + "=" + data.budget_sj[i].pnetincome);
	           eval("var mnetincome_a"+ (i+1) + "=" + data.budget_sj[i].mnetincome);
	           eval("var snetincome_a"+ (i+1) + "=" + data.budget_sj[i].snetincome);
	           eval("var subfee_a"+ (i+1) + "=" + data.budget_sj[i].subfee);
	           eval("var psubfee_a"+ (i+1) + "=" + data.budget_sj[i].psubfee);
	           eval("var msubfee_a"+ (i+1) + "=" + data.budget_sj[i].msubfee);
	           eval("var ssubfee_a"+ (i+1) + "=" + data.budget_sj[i].ssubfee);
	           eval("var currentcost_a"+ (i+1) + "=" + data.budget_sj[i].currentcost);
	           eval("var salecost_a"+ (i+1) + "=" + data.budget_sj[i].salecost);
	           eval("var servcost_a"+ (i+1) + "=" + data.budget_sj[i].servcost);
	           eval("var deptmcost_a"+ (i+1) + "=" + data.budget_sj[i].deptmcost);
	           eval("var deptdcost_a"+ (i+1) + "=" + data.budget_sj[i].deptdcost);
	           eval("var commshar_a"+ (i+1) + "=" + data.budget_sj[i].commshar);
	           eval("var comdshar_a"+ (i+1) + "=" + data.budget_sj[i].comdshar);
	           eval("var comashar_a"+ (i+1) + "=" + data.budget_sj[i].comashar);
	           eval("var baddebts_a"+ (i+1) + "=" + data.budget_sj[i].baddebts);
	           eval("var assetlose_a"+ (i+1) + "=" + data.budget_sj[i].assetlose);
	           eval("var payback_a"+ (i+1) + "=" + data.budget_sj[i].payback);
	           eval("var instock_a"+ (i+1) + "=" + data.budget_sj[i].instock);
	           eval("var outstock_a"+ (i+1) + "=" + data.budget_sj[i].outstock);
	           eval("var bonus_a"+ (i+1) + "=" + data.budget_sj[i].bonus);
	           eval("var servtax_a"+ (i+1) + "=" + data.budget_sj[i].servtax);
	           eval("var profitBBonus_a"+ (i+1) + "=" + data.budget_sj[i].profitBBonus);
	           eval("var profitABonus_a"+ (i+1) + "=" + data.budget_sj[i].profitABonus);
	        }
	          var contamt_a5 = data.budget_hj.contamt;
	          var pcontamt_a5 = data.budget_hj.pcontamt;
	          var scontamt_a5 = data.budget_hj.scontamt;
	          var mcontamt_a5 = data.budget_hj.mcontamt;
	          var receamt_a5  = data.budget_hj.receamt;
	          var bustax_a5 = data.budget_hj.bustax;
	          var taxincome_a5 = data.budget_hj.taxincome;
	          var ptaxincome_a5 = data.budget_hj.ptaxincome;
	          var mtaxincome_a5 = data.budget_hj.mtaxincome;
	          var staxincome_a5 = data.budget_hj.staxincome;
	          var ntaxincome_a5 = data.budget_hj.ntaxincome;
	          var pntaxincome_a5 = data.budget_hj.pntaxincome;
	          var mntaxincome_a5 = data.budget_hj.mntaxincome;
	          var sntaxincome_a5 = data.budget_hj.sntaxincome;
	          var netincome_a5 = data.budget_hj.netincome;
	          var pnetincome_a5 = data.budget_hj.pnetincome;
	          var snetincome_a5 = data.budget_hj.snetincome;
	          var mnetincome_a5 = data.budget_hj.mnetincome;
	          var subfee_a5 = data.budget_hj.subfee;
	          var psubfee_a5 = data.budget_hj.psubfee;
	          var msubfee_a5 = data.budget_hj.msubfee;
	          var ssubfee_a5 = data.budget_hj.ssubfee;
	          var currentcost_a5 = data.budget_hj.currentcost;
	          var salecost_a5 = data.budget_hj.salecost;
	          var servcost_a5 = data.budget_hj.servcost;
	          var deptmcost_a5 = data.budget_hj.deptmcost;
	          var deptdcost_a5 = data.budget_hj.deptdcost;
	          var commshar_a5 = data.budget_hj.commshar;
	          var comdshar_a5 = data.budget_hj.comdshar;
	          var comashar_a5 = data.budget_hj.comashar;
	          var baddebts_a5 = data.budget_hj.baddebts;
	          var assetlose_a5 = data.budget_hj.assetlose;
	          var instock_a5 = data.budget_hj.instock;
	          var outstock_a5 = data.budget_hj.outstock;
	          var bonus_a5 = data.budget_hj.bonus;
	          var servtax_a5 = data.budget_hj.servtax;
	          var payback_a5 = data.budget_hj.payback;
	          var profitBBonus_a5 = data.budget_hj.profitBBonus;
	          var profitABonus_a5 = data.budget_hj.profitABonus;
	        budget = {budgetname:budgetname,orgid:orgid,
	        contamt_a1:contamt_a1,contamt_a2:contamt_a2,contamt_a3:contamt_a3,contamt_a4:contamt_a4,
	        pcontamt1:pcontamt1,pcontamt2:pcontamt2,pcontamt3:pcontamt3,pcontamt4:pcontamt4,pcontamt5:pcontamt5,pcontamt_a1:pcontamt_a1,pcontamt_a2:pcontamt_a2,pcontamt_a3:pcontamt_a3,pcontamt_a4:pcontamt_a4,pcontamt_a5:pcontamt_a5,
	        scontamt1:scontamt1,scontamt2:scontamt2,scontamt3:scontamt3,scontamt4:scontamt4,scontamt5:scontamt5,scontamt_a1:scontamt_a1,scontamt_a2:scontamt_a2,scontamt_a3:scontamt_a3,scontamt_a4:scontamt_a4,scontamt_a5:scontamt_a5,
	        mcontamt1:mcontamt1,mcontamt2:mcontamt2,mcontamt3:mcontamt3,mcontamt4:mcontamt4,mcontamt5:mcontamt5,mcontamt_a1:mcontamt_a1,mcontamt_a2:mcontamt_a2,mcontamt_a3:mcontamt_a3,mcontamt_a4:mcontamt_a4,mcontamt_a5:mcontamt_a5,
	        receamt1:receamt1,receamt2:receamt2,receamt3:receamt3,receamt4:receamt4,receamt5:receamt5,receamt_a1:receamt_a1,receamt_a2:receamt_a2,receamt_a3:receamt_a3,receamt_a4:receamt_a4,receamt_a5:receamt_a5,
	        taxincome_a1:taxincome_a1,taxincome_a2:taxincome_a2,taxincome_a3:taxincome_a3,taxincome_a4:taxincome_a4,
	        ptaxincome1:ptaxincome1,ptaxincome2:ptaxincome2,ptaxincome3:ptaxincome3,ptaxincome4:ptaxincome4,ptaxincome5:ptaxincome5,ptaxincome_a1:ptaxincome_a1,ptaxincome_a2:ptaxincome_a2,ptaxincome_a3:ptaxincome_a3,ptaxincome_a4:ptaxincome_a4,ptaxincome_a5:ptaxincome_a5,
	        mtaxincome1:mtaxincome1,mtaxincome2:mtaxincome2,mtaxincome3:mtaxincome3,mtaxincome4:mtaxincome4,mtaxincome5:mtaxincome5,mtaxincome_a1:mtaxincome_a1,mtaxincome_a2:mtaxincome_a2,mtaxincome_a3:mtaxincome_a3,mtaxincome_a4:mtaxincome_a4,mtaxincome_a5:mtaxincome_a5,
			staxincome1:staxincome1,staxincome2:staxincome2,staxincome3:staxincome3,staxincome4:staxincome4,staxincome5:staxincome5,staxincome_a1:staxincome_a1,staxincome_a2:staxincome_a2,staxincome_a3:staxincome_a3,staxincome_a4:staxincome_a4,staxincome_a5:staxincome_a5,
			ntaxincome_a1:ntaxincome_a1,ntaxincome_a2:ntaxincome_a2,ntaxincome_a3:ntaxincome_a3,ntaxincome_a4:ntaxincome_a4,
			pntaxincome_a1:pntaxincome_a1,pntaxincome_a2:pntaxincome_a2,pntaxincome_a3:pntaxincome_a3,pntaxincome_a4:pntaxincome_a4,
			sntaxincome_a1:sntaxincome_a1,sntaxincome_a2:sntaxincome_a2,sntaxincome_a3:sntaxincome_a3,sntaxincome_a4:sntaxincome_a4,
			mntaxincome_a1:mntaxincome_a1,mntaxincome_a2:mntaxincome_a2,mntaxincome_a3:mntaxincome_a3,mntaxincome_a4:mntaxincome_a4,
			netincome_a1:netincome_a1,netincome_a2:netincome_a2,netincome_a3:netincome_a3,netincome_a4:netincome_a4,
			pnetincome_a1:pnetincome_a1,pnetincome_a2:pnetincome_a2,pnetincome_a3:pnetincome_a3,pnetincome_a4:pnetincome_a4,
			mnetincome_a1:mnetincome_a1,mnetincome_a2:mnetincome_a2,mnetincome_a3:mnetincome_a3,mnetincome_a4:mnetincome_a4,
			snetincome_a1:snetincome_a1,snetincome_a2:snetincome_a2,snetincome_a3:snetincome_a3,snetincome_a4:snetincome_a4,
			bustax_a1:bustax_a1,bustax_a2:bustax_a2,bustax_a3:bustax_a3,bustax_a4:bustax_a4,
			currentcost_a1:currentcost_a1,currentcost_a2:currentcost_a2,currentcost_a3:currentcost_a3,currentcost_a4:currentcost_a4,
			subfee_a1:subfee_a1,subfee_a2:subfee_a2,subfee_a3:subfee_a3,subfee_a4:subfee_a4,
			payback_a1:payback_a1,payback_a2:payback_a2,payback_a3:payback_a3,payback_a4:payback_a4,
			profitBBonus_a1:profitBBonus_a1,profitBBonus_a2:profitBBonus_a2,profitBBonus_a3:profitBBonus_a3,profitBBonus_a4:profitBBonus_a4,
			profitABonus_a1:profitABonus_a1,profitABonus_a2:profitABonus_a2,profitABonus_a3:profitABonus_a3,profitABonus_a4:profitABonus_a4,
			psubfee1:psubfee1,psubfee2:psubfee2,psubfee3:psubfee3,psubfee4:psubfee4,psubfee5:psubfee5,psubfee_a1:psubfee_a1,psubfee_a2:psubfee_a2,psubfee_a3:psubfee_a3,psubfee_a4:psubfee_a4,psubfee_a5:psubfee_a5,
			ssubfee1:ssubfee1,ssubfee2:ssubfee2,ssubfee3:ssubfee3,ssubfee4:ssubfee4,ssubfee5:ssubfee5,ssubfee_a1:ssubfee_a1,ssubfee_a2:ssubfee_a2,ssubfee_a3:ssubfee_a3,ssubfee_a4:ssubfee_a4,ssubfee_a5:ssubfee_a5,
			msubfee1:msubfee1,msubfee2:msubfee2,msubfee3:msubfee3,msubfee4:msubfee4,msubfee5:msubfee5,msubfee_a1:msubfee_a1,msubfee_a2:msubfee_a2,msubfee_a3:msubfee_a3,msubfee_a4:msubfee_a4,msubfee_a5:msubfee_a5,
			servcost1:servcost1,servcost2:servcost2,servcost3:servcost3,servcost4:servcost4,servcost5:servcost5,servcost_a1:servcost_a1,servcost_a2:servcost_a2,servcost_a3:servcost_a3,servcost_a4:servcost_a4,servcost_a5:servcost_a5,
			salecost1:salecost1,salecost2:salecost2,salecost3:salecost3,salecost4:salecost4,salecost5:salecost5,salecost_a1:salecost_a1,salecost_a2:salecost_a2,salecost_a3:salecost_a3,salecost_a4:salecost_a4,salecost_a5:salecost_a5,
			deptmcost1:deptmcost1,deptmcost2:deptmcost2,deptmcost3:deptmcost3,deptmcost4:deptmcost4,deptmcost5:deptmcost5,deptmcost_a1:deptmcost_a1,deptmcost_a2:deptmcost_a2,deptmcost_a3:deptmcost_a3,deptmcost_a4:deptmcost_a4,deptmcost_a5:deptmcost_a5,
			deptdcost1:deptdcost1,deptdcost2:deptdcost2,deptdcost3:deptdcost3,deptdcost4:deptdcost4,deptdcost5:deptdcost5,deptdcost_a1:deptdcost_a1,deptdcost_a2:deptdcost_a2,deptdcost_a3:deptdcost_a3,deptdcost_a4:deptdcost_a4,deptdcost_a5:deptdcost_a5,
			commshar1:commshar1,commshar2:commshar2,commshar3:commshar3,commshar4:commshar4,commshar5:commshar5,commshar_a1:commshar_a1,commshar_a2:commshar_a2,commshar_a3:commshar_a3,commshar_a4:commshar_a4,commshar_a5:commshar_a5,
			comashar1:comashar1,comashar2:comashar2,comashar3:comashar3,comashar4:comashar4,comashar5:comashar5,comashar_a1:comashar_a1,comashar_a2:comashar_a2,comashar_a3:comashar_a3,comashar_a4:comashar_a4,comashar_a5:comashar_a5,
			comdshar1:comdshar1,comdshar2:comdshar2,comdshar3:comdshar3,comdshar4:comdshar4,comdshar5:comdshar5,comdshar_a1:comdshar_a1,comdshar_a2:comdshar_a2,comdshar_a3:comdshar_a3,comdshar_a4:comdshar_a4,comdshar_a5:comdshar_a5,
			assetlose1:assetlose1,assetlose2:assetlose2,assetlose3:assetlose3,assetlose4:assetlose4,assetlose5:assetlose5,assetlose_a1:assetlose_a1,assetlose_a2:assetlose_a2,assetlose_a3:assetlose_a3,assetlose_a4:assetlose_a4,assetlose_a5:assetlose_a5,
			baddebts1:baddebts1,baddebts2:baddebts2,baddebts3:baddebts3,baddebts4:baddebts4,baddebts5:baddebts5,baddebts_a1:baddebts_a1,baddebts_a2:baddebts_a2,baddebts_a3:baddebts_a3,baddebts_a4:baddebts_a4,baddebts_a5:baddebts_a5,
			instock1:instock1,instock2:instock2,instock3:instock3,instock4:instock4,instock5:instock5,instock_a1:instock_a1,instock_a2:instock_a2,instock_a3:instock_a3,instock_a4:instock_a4,instock_a5:instock_a5,
			outstock1:outstock1,outstock2:outstock2,outstock3:outstock3,outstock4:outstock4,outstock5:outstock5,outstock_a1:outstock_a1,outstock_a2:outstock_a2,outstock_a3:outstock_a3,outstock_a4:outstock_a4,outstock_a5:outstock_a5,
			bonus1:bonus1,bonus2:bonus2,bonus3:bonus3,bonus4:bonus4,bonus5:bonus5,bonus_a1:bonus_a1,bonus_a2:bonus_a2,bonus_a3:bonus_a3,bonus_a4:bonus_a4,bonus_a5:bonus_a5,
			servtax1:servtax1,servtax2:servtax2,servtax3:servtax3,servtax4:servtax4,servtax5:servtax5,servtax_a1:servtax_a1,servtax_a2:servtax_a2,servtax_a3:servtax_a3,servtax_a4:servtax_a4,servtax_a5:servtax_a5,
			contamt5:contamt5,taxincome5:taxincome5,ntaxincome5:ntaxincome5,pntaxincome5:pntaxincome5,sntaxincome5:sntaxincome5,mntaxincome5:mntaxincome5,contamt_a5:contamt_a5,taxincome_a5:taxincome_a5,ntaxincome_a5:ntaxincome_a5,pntaxincome_a5:pntaxincome_a5,sntaxincome_a5:sntaxincome_a5,mntaxincome_a5:mntaxincome_a5,
			bustax5:bustax5,subfee5:subfee5,currentcost5:currentcost5,netincome5:netincome5,pnetincome5:pnetincome5,snetincome5:snetincome5,mnetincome5:mnetincome5,bustax_a5:bustax_a5,subfee_a5:subfee_a5,currentcost_a5:currentcost_a5,netincome_a5:netincome_a5,pnetincome_a5:pnetincome_a5,snetincome_a5:snetincome_a5,mnetincome_a5:mnetincome_a5,
			payback5:payback5,profitBBonus5:profitBBonus5,profitABonus5:profitABonus5,payback_a5:payback_a5,profitBBonus_a5:profitBBonus_a5,profitABonus_a5:profitABonus_a5
	        };
	        exportCurrent(budget);
		}
		//导出当前页面预算数据
		 function exportCurrent(budget){
			        hideWindow();
			        form.loading();
			         var json = {"budget": budget};
						nui.ajax({
			                url: "com.primeton.eos.ame_budget.deptbudget.exportCurDep.biz.ext",
			                type: "post",
			                data: json,
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			             		if(o.a==1){
	        			nui.alert("导出数据失败！");
	        			form.unmask();
	        			return;
	        		}else{
	        		nui.alert("导出数据成功！","系统提示")
			                	var filePath = o.downloadFile;
			                	var fileName = "Deptbudget";
			                	var myDate = new Date();
			                	var year = myDate.getYear();
			                	var month = myDate.getMonth()+1;
			                	var day = myDate.getDate();
			                	var hours = myDate.getHours();
			                	var minutes = myDate.getMinutes();
			                	var seconds = myDate.getSeconds();
			                	var curDateTime = year;
			                	if(month>9){
									curDateTime = curDateTime + "" + month;
									alert(curDateTime);
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
							    form.unmask();
							    }
			                },
			                error: function () {
			                	alert("error");
			                }
			            });	
			    }  
		//导出
	    function exportDeptbudget() {
	        var win = nui.get("win1");
	        win.showAtPos("center", "middle");
	    }
	    function hideWindow() {
	        var win = nui.get("win1");
	        win.hide();
	    }
	   
	    // 导入
	    function impbudget(){
			/* if(orgdegree == 1){
	        	if(!confirm("公司级预算导入时会覆盖除“服务成本”和“销售费用” 以外的所有数据，是否确定导入？")){
	        		return;
	        	}
	    	}else if(orgdegree == 2){
	    		if(!confirm("事业部级预算导入时会覆盖除“公司分摊成本” 以外的所有数据，是否确定导入？")){
	        		return;
	        	}
	    	}else if(orgdegree == 3){
	    		if(!confirm("业务单元级预算导入时会覆盖除“公司分摊成本”、“服务成本”、“销售费用”、“部门管理费用”、“部门研发费用” 以外的所有数据，是否确定导入？")){
	        		return;
	        	}
	    	} */
	    	if(budstatus == 1&&orgid!=1){
				alert("预算已锁定，调整预算数据将不能保存！");
				return;
			}
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_budget/deptBudget/impDepBudget.jsp",
	            title: "导入预算版本", 
				width: 440,
	            height: 170,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	            },
	            ondestroy: function (action) {
	            	if(action == "ok"){
		            	var iframe = this.getIFrameEl();
		            	var data = iframe.contentWindow.getData();
		            	data = nui.decode(data);
		            	var aa=[];
		            	aa[0]=data.q1;
		            	aa[1]=data.q2;
		            	aa[2]=data.q3;
		            	aa[3]=data.q4;
		            	if(orgdegree == 1){
			            	
		            	}else if(orgdegree == 2){
		            		aa[0].commshar =  nui.get("commshar1").getValue();
		            		aa[1].commshar =  nui.get("commshar2").getValue();
		            		aa[2].commshar =  nui.get("commshar3").getValue();
		            		aa[3].commshar =  nui.get("commshar4").getValue();
		            		aa[0].comashar =  nui.get("comashar1").getValue();
		            		aa[1].comashar =  nui.get("comashar2").getValue();
		            		aa[2].comashar =  nui.get("comashar3").getValue();
		            		aa[3].comashar =  nui.get("comashar4").getValue();
		            		aa[0].comdshar =  nui.get("comdshar1").getValue();
		            		aa[1].comdshar =  nui.get("comdshar2").getValue();
		            		aa[2].comdshar =  nui.get("comdshar3").getValue();
		            		aa[3].comdshar =  nui.get("comdshar4").getValue();
		            	}else if(orgdegree == 3){
		            		aa[0].servcost =  nui.get("servcost1").getValue();
			            	aa[1].servcost =  nui.get("servcost2").getValue();
			            	aa[2].servcost =  nui.get("servcost3").getValue();
			            	aa[3].servcost =  nui.get("servcost4").getValue();
			            	aa[0].salecost =  nui.get("salecost1").getValue();
			            	aa[1].salecost =  nui.get("salecost2").getValue();
			            	aa[2].salecost =  nui.get("salecost3").getValue();
			            	aa[3].salecost =  nui.get("salecost4").getValue();
		            		aa[0].commshar =  nui.get("commshar1").getValue();
		            		aa[1].commshar =  nui.get("commshar2").getValue();
		            		aa[2].commshar =  nui.get("commshar3").getValue();
		            		aa[3].commshar =  nui.get("commshar4").getValue();
		            		aa[0].comashar =  nui.get("comashar1").getValue();
		            		aa[1].comashar =  nui.get("comashar2").getValue();
		            		aa[2].comashar =  nui.get("comashar3").getValue();
		            		aa[3].comashar =  nui.get("comashar4").getValue();
		            		aa[0].comdshar =  nui.get("comdshar1").getValue();
		            		aa[1].comdshar =  nui.get("comdshar2").getValue();
		            		aa[2].comdshar =  nui.get("comdshar3").getValue();
		            		aa[3].comdshar =  nui.get("comdshar4").getValue();
		            		aa[0].deptdcost =  nui.get("deptdcost1").getValue();
			            	aa[1].deptdcost =  nui.get("deptdcost2").getValue();
			            	aa[2].deptdcost =  nui.get("deptdcost3").getValue();
			            	aa[3].deptdcost =  nui.get("deptdcost4").getValue();
			            	aa[0].deptmcost =  nui.get("deptmcost1").getValue();
			            	aa[1].deptmcost =  nui.get("deptmcost2").getValue();
			            	aa[2].deptmcost =  nui.get("deptmcost3").getValue();
			            	aa[3].deptmcost =  nui.get("deptmcost4").getValue();
		            	}
		            	var text ={budget:aa};
		            	form.setData(text);
		            	doCal1();
		            	doCal2();
		            	doCal3();
		            	doCal4();
		            	alert("预算导入成功! 如果希望导入的数据有效，请点击页面下方的“保存预算损益”按钮");
	            	}
	            }
	        });
	    }
	    function showsj(e){
	     	var tab = document.getElementById("table_file");
	     	var trs = tab.rows;
	     	if(e.checked == true){
	     		document.getElementById("a1").style.display = '';
	     		document.getElementById("a2").style.display = '';
	     		document.getElementById("a3").style.display = '';
	     		document.getElementById("a4").style.display = '';
	     		document.getElementById("a5").style.display = '';
	     		for(var i = 0, len = trs.length; i < len; i++){
		            var cell4 = trs[i].cells[4];
		            var cell6 = trs[i].cells[6];
		            var cell8 = trs[i].cells[8];
		            var cell10 = trs[i].cells[10];
		            var cell12 = trs[i].cells[12];
		            cell4.style.display = '';
		            cell6.style.display = '';
		            cell8.style.display = '';
		            cell10.style.display = '';
		            cell12.style.display = '';
		        }
	     	}else{
	     		document.getElementById("a1").style.display = 'none';
	     		document.getElementById("a2").style.display = 'none';
	     		document.getElementById("a3").style.display = 'none';
	     		document.getElementById("a4").style.display = 'none';
	     		document.getElementById("a5").style.display = 'none';
		        for(var i = 0, len = trs.length; i < len; i++){
		            var cell4 = trs[i].cells[4];
		            var cell6 = trs[i].cells[6];
		            var cell8 = trs[i].cells[8];
		            var cell10 = trs[i].cells[10];
		            var cell12 = trs[i].cells[12];
		            cell4.style.display = 'none';
		            cell6.style.display = 'none';
		            cell8.style.display = 'none';
		            cell10.style.display = 'none';
		            cell12.style.display = 'none';
		        }
	     	}
	    }
	</script>
</body>
</div>
</html>