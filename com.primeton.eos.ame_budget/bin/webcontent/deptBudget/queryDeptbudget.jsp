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
                    <td style="width: 95px;">
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
			                <td style="background:#9ACD32;">五、退税</td>
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
			                <td style="background:#9ACD32;">六、采购进项税返还</td>
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
			                <td style="background:#9ACD32;">七、包含退税后的总收入</td>
			                <td style="background:#9ACD32;" align="center" id="wptotalfee6"></td>
			                <td style="background:#9ACD32;" align="center" id="wptotalfee5"></td>
			                <td style="background:#9ACD32;" align="center" id="wptotalfee"></td>
			                <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" id="wptotalfee1" allowInput="false"/>
			                </td>
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="wptotalfee_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" id="wptotalfee2" allowInput="false"/>
			                </td> 
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="wptotalfee_a2"/>
			                </td> 
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" id="wptotalfee3" allowInput="false"/>
			                </td>
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="wptotalfee_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="wptotalfee4"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].wptotalfee" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="wptotalfee_a4"/>
			                </td>                     
			            </tr>
						<tr>
			                <td style="background:#9ACD32;">八、奖前总成本</td>
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
			                <td style="padding-left:15px;">其中：自有服务成本</td>
			                <td align="center" id="selfservcost6"></td>
			                <td align="center" id="selfservcost5"></td>
			                <td align="center" id="selfservcost"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.selfservcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].selfservcost" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="selfservcost1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].selfservcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfservcost_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].selfservcost" style="width:100%;" inputStyle="text-align:right;" id="selfservcost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].selfservcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfservcost_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].selfservcost" style="width:100%;" inputStyle="text-align:right;" id="selfservcost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].selfservcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfservcost_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].selfservcost" style="width:100%;" inputStyle="text-align:right;" id="selfservcost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].selfservcost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfservcost_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:15px;">其中：人月外包</td>
			                <td align="center" id="pmsubfee6"></td>
			                <td align="center" id="pmsubfee5"></td>
			                <td align="center" id="pmsubfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.pmsubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].pmsubfee" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="pmsubfee1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].pmsubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pmsubfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].pmsubfee" style="width:100%;" inputStyle="text-align:right;" id="pmsubfee2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].pmsubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pmsubfee_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].pmsubfee" style="width:100%;" inputStyle="text-align:right;" id="pmsubfee3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].pmsubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pmsubfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].pmsubfee" style="width:100%;" inputStyle="text-align:right;" id="pmsubfee4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].pmsubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="pmsubfee_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:15px;">其中：其他采购</td>
			                <td align="center" id="prosubfee6"></td>
			                <td align="center" id="prosubfee5"></td>
			                <td align="center" id="prosubfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.prosubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].prosubfee" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="prosubfee1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].prosubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="prosubfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].prosubfee" style="width:100%;" inputStyle="text-align:right;" id="prosubfee2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].prosubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="prosubfee_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].prosubfee" style="width:100%;" inputStyle="text-align:right;" id="prosubfee3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].prosubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="prosubfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].prosubfee" style="width:100%;" inputStyle="text-align:right;" id="prosubfee4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].prosubfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="prosubfee_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:15px;">其中：净买入</td>
			                <td align="center" id="inoutfee6"></td>
			                <td align="center" id="inoutfee5"></td>
			                <td align="center" id="inoutfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.inoutfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].inoutfee" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="inoutfee1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].inoutfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="inoutfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].inoutfee" style="width:100%;" inputStyle="text-align:right;" id="inoutfee2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].inoutfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="inoutfee_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].inoutfee" style="width:100%;" inputStyle="text-align:right;" id="inoutfee3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].inoutfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="inoutfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].inoutfee" style="width:100%;" inputStyle="text-align:right;" id="inoutfee4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].inoutfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="inoutfee_a4"/>
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
			            <tr>
			                <td style="padding-left:15px;">其中：自有销售费用</td>
			                <td align="center" id="selfsalecost6"></td>
			                <td align="center" id="selfsalecost5"></td>
			                <td align="center" id="selfsalecost"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.selfsalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].selfsalecost" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="selfsalecost1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].selfsalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfsalecost_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].selfsalecost" style="width:100%;" inputStyle="text-align:right;" id="selfsalecost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].selfsalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfsalecost_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].selfsalecost" style="width:100%;" inputStyle="text-align:right;" id="selfsalecost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].selfsalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfsalecost_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].selfsalecost" style="width:100%;" inputStyle="text-align:right;" id="selfsalecost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].selfsalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="selfsalecost_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:15px;">其中：非额度销售费用</td>
			                <td align="center" id="nquosalecost6"></td>
			                <td align="center" id="nquosalecost5"></td>
			                <td align="center" id="nquosalecost"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.nquosalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].nquosalecost" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="nquosalecost1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].nquosalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="nquosalecost_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].nquosalecost" style="width:100%;" inputStyle="text-align:right;" id="nquosalecost2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].nquosalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="nquosalecost_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].nquosalecost" style="width:100%;" inputStyle="text-align:right;" id="nquosalecost3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].nquosalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="nquosalecost_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].nquosalecost" style="width:100%;" inputStyle="text-align:right;" id="nquosalecost4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].nquosalecost" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="nquosalecost_a4"/>
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
			                <td style="padding-left:15px;">其中：起步费</td>
			                <td align="center" id="startfee6"></td>
			                <td align="center" id="startfee5"></td>
			                <td align="center" id="startfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.startfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].startfee" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="startfee1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].startfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="startfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].startfee" style="width:100%;" inputStyle="text-align:right;" id="startfee2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].startfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="startfee_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].startfee" style="width:100%;" inputStyle="text-align:right;" id="startfee3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].startfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="startfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].startfee" style="width:100%;" inputStyle="text-align:right;" id="startfee4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].startfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="startfee_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:15px;">其中：研发分成费</td>
			                <td align="center" id="bsfee6"></td>
			                <td align="center" id="bsfee5"></td>
			                <td align="center" id="bsfee"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.bsfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].bsfee" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="bsfee1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].bsfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bsfee_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].bsfee" style="width:100%;" inputStyle="text-align:right;" id="bsfee2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].bsfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bsfee_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].bsfee" style="width:100%;" inputStyle="text-align:right;" id="bsfee3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].bsfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bsfee_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].bsfee" style="width:100%;" inputStyle="text-align:right;" id="bsfee4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].bsfee" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bsfee_a4"/>
			                </td>                        
			            </tr>
			            <tr>
			                <td style="padding-left:15px;">其中：超额返利（减项）</td>
			                <td align="center" id="rebate6"></td>
			                <td align="center" id="rebate5"></td>
			                <td align="center" id="rebate"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.rebate" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td>
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].rebate" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="rebate1" onvaluechanged="doCal1()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].rebate" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="rebate_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].rebate" style="width:100%;" inputStyle="text-align:right;" id="rebate2" allowInput="false" onvaluechanged="doCal2()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].rebate" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="rebate_a2"/>
			                </td>  
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].rebate" style="width:100%;" inputStyle="text-align:right;" id="rebate3" allowInput="false" onvaluechanged="doCal3()"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].rebate" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="rebate_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].rebate" style="width:100%;" inputStyle="text-align:right;" id="rebate4" allowInput="false" onvaluechanged="doCal4()"/>
			                </td> 
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].rebate" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="rebate_a4"/>
			                </td>                        
			            </tr>
			             <tr>
			                <td style="padding-left: 10px;" id="hzhx">8.6坏账核销</td>
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
			                <td style="padding-left: 10px;">8.7营业税金及附加</td>
			                <td align="center" id="bustax6"></td>
			                <td align="center" id="bustax5"></td>
			                <td align="center" id="bustax"></td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.bustax" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].bustax" style="width:100%;" inputStyle="text-align:right;"  allowInput="false" id="bustax1"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].bustax" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bustax_a1"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].bustax" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="bustax2"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].bustax" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bustax_a2"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].bustax" style="width:100%;" inputStyle="text-align:right;"  allowInput="false" id="bustax3"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].bustax" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bustax_a3"/>
			                </td> 
			                <td align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].bustax" style="width:100%;" inputStyle="text-align:right;" allowInput="false" id="bustax4"/>
			                </td>
			                <td align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].bustax" style="width:100%;" inputStyle="text-align:right;" borderStyle="border:0" allowInput="false" id="bustax_a4"/>
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
			                <td style="background:#9ACD32;">十、奖金前利润</td>
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
			                <td style="background:#9ACD32;">十一、奖金后利润</td>
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
			                <td style="background:#9ACD32;">十二、经营净现金流</td>
			                <td style="background:#9ACD32;" align="center" id="cashflow6"></td>
			                <td style="background:#9ACD32;" align="center" id="cashflow5"></td>
			                <td style="background:#9ACD32;" align="center" id="cashflow"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.cashflow" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].cashflow" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="cashflow1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].cashflow" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="cashflow_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].cashflow" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="cashflow2" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].cashflow" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="cashflow_a2"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].cashflow" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="cashflow3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].cashflow" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="cashflow_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].cashflow" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="cashflow4" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].cashflow" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="cashflow_a4"/>
			                </td>                       
			            </tr>
			            <tr>
			                <td style="background:#9ACD32;">十三、经营净现金流与奖前利润正偏离</td>
			                <td style="background:#9ACD32;" align="center" id="deviation6"></td>
			                <td style="background:#9ACD32;" align="center" id="deviation5"></td>
			                <td style="background:#9ACD32;" align="center" id="deviation"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.deviation" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].deviation" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="deviation1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].deviation" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="deviation_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].deviation" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="deviation2" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].deviation" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="deviation_a2"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].deviation" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="deviation3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].deviation" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="deviation_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].deviation" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="deviation4" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].deviation" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="deviation_a4"/>
			                </td>                       
			            </tr>
			            <tr>
			                <td style="background:#9ACD32;">十四、应收账款</td>
			                <td style="background:#9ACD32;" align="center" id="accounts6"></td>
			                <td style="background:#9ACD32;" align="center" id="accounts5"></td>
			                <td style="background:#9ACD32;" align="center" id="accounts"></td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_hj.accounts" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[0].accounts" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="accounts1" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[0].accounts" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="accounts_a1"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[1].accounts" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="accounts2" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[1].accounts" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="accounts_a2"/>
			                </td>  
			                 <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[2].accounts" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="accounts3" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[2].accounts" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="accounts_a3"/>
			                </td> 
			                <td style="background:#9ACD32;" align="center">    
			                    <input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget[3].accounts" style="width:100%;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;" allowInput="false" id="accounts4" />
			                </td>
			                <td  style="background:#9ACD32;" align="center">
			                	<input class="nui-spinner" format="n0" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" name="budget_sj[3].accounts" style="width:100%;background:#9ACD32;" inputStyle="text-align:right;background:#9ACD32;" borderStyle="background:#9ACD32;border:0" allowInput="false" id="accounts_a4"/>
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
	    		<a class="nui-button" onclick="exportBudgets('1')" style="width: 140px;">导出本部门预算损益</a>
		        <a class="nui-button" onclick="exportBudgets('2')" style="width: 200px;">导出本部门及下级部门预算损益</a>
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
		var orgFlag = '<%=request.getParameter("orgFlag") %>';//判断orgid是否是叶子节点
		var ftcaltype;//分摊计算类型
		var budstatus;
		var msharSet;//管理分摊计算设置
		var stSet;//起步费计算设置
		var baSet;//基础比例分成费计算设置
		var reSet;//超额返利计算设置
		var asharSet;//市场分摊计算设置
		var bonusSet;//奖金计算设置
		var paybackPara;//退税比例
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
			if(orgFlag==2||orgFlag==1){
				document.getElementById("table1").style.display = "";
				nui.get("selfservcost1").setAllowInput(true);
				nui.get("selfservcost2").setAllowInput(true);
				nui.get("selfservcost3").setAllowInput(true);
				nui.get("selfservcost4").setAllowInput(true);
				nui.get("selfservcost1").setBorderStyle("background:#FFFFE6");
				nui.get("selfservcost2").setBorderStyle("background:#FFFFE6");
				nui.get("selfservcost3").setBorderStyle("background:#FFFFE6");
				nui.get("selfservcost4").setBorderStyle("background:#FFFFE6");
				nui.get("pmsubfee1").setAllowInput(true);
				nui.get("pmsubfee2").setAllowInput(true);
				nui.get("pmsubfee3").setAllowInput(true);
				nui.get("pmsubfee4").setAllowInput(true);
				nui.get("pmsubfee1").setBorderStyle("background:#FFFFE6");
				nui.get("pmsubfee2").setBorderStyle("background:#FFFFE6");
				nui.get("pmsubfee3").setBorderStyle("background:#FFFFE6");
				nui.get("pmsubfee4").setBorderStyle("background:#FFFFE6");
				nui.get("prosubfee1").setAllowInput(true);
				nui.get("prosubfee2").setAllowInput(true);
				nui.get("prosubfee3").setAllowInput(true);
				nui.get("prosubfee4").setAllowInput(true);
				nui.get("prosubfee1").setBorderStyle("background:#FFFFE6");
				nui.get("prosubfee2").setBorderStyle("background:#FFFFE6");
				nui.get("prosubfee3").setBorderStyle("background:#FFFFE6");
				nui.get("prosubfee4").setBorderStyle("background:#FFFFE6");
				nui.get("inoutfee1").setAllowInput(true);
				nui.get("inoutfee2").setAllowInput(true);
				nui.get("inoutfee3").setAllowInput(true);
				nui.get("inoutfee4").setAllowInput(true);
				nui.get("inoutfee1").setBorderStyle("background:#FFFFE6");
				nui.get("inoutfee2").setBorderStyle("background:#FFFFE6");
				nui.get("inoutfee3").setBorderStyle("background:#FFFFE6");
				nui.get("inoutfee4").setBorderStyle("background:#FFFFE6");
				nui.get("selfsalecost1").setAllowInput(true);
				nui.get("selfsalecost2").setAllowInput(true);
				nui.get("selfsalecost3").setAllowInput(true);
				nui.get("selfsalecost4").setAllowInput(true);
				nui.get("selfsalecost1").setBorderStyle("background:#FFFFE6");
				nui.get("selfsalecost2").setBorderStyle("background:#FFFFE6");
				nui.get("selfsalecost3").setBorderStyle("background:#FFFFE6");
				nui.get("selfsalecost4").setBorderStyle("background:#FFFFE6");
				nui.get("nquosalecost1").setAllowInput(true);
				nui.get("nquosalecost2").setAllowInput(true);
				nui.get("nquosalecost3").setAllowInput(true);
				nui.get("nquosalecost4").setAllowInput(true);
				nui.get("nquosalecost1").setBorderStyle("background:#FFFFE6");
				nui.get("nquosalecost2").setBorderStyle("background:#FFFFE6");
				nui.get("nquosalecost3").setBorderStyle("background:#FFFFE6");
				nui.get("nquosalecost4").setBorderStyle("background:#FFFFE6");
				
				if(orgFlag== 1){
					document.getElementById("gsglft").innerHTML = "8.3管理费用";
					document.getElementById("gsscft").innerHTML = "8.4市场费用";
					document.getElementById("gsyfft").innerHTML = "8.5研发费用";
					if(inputyear=="2017"){
						degreeData = [{id: '1',text: '汇总合同数据'},{id:'2',text: '汇总收入数据'},{id:'3',text: '汇总收款数据'},{id:'4',text: '汇总分包及外部采购数据'},
						{id:'G',text: '汇总自有服务成本数据'},{id:'H',text: '汇总人月外包'},{id:'I',text: '汇总其他采购'},{id:'J',text: '汇总净买入'},{id:'K',text: '汇总自有销售费用'}
						,{id:'O',text: '汇总非额度销售费用'},{id:'9',text: '汇总管理费用数据'},{id:'C',text: '汇总资产减值损失数据'},{id:'D',text: '汇总存货数据'},{id:'E',text: '汇总坏账核销数据'},{id:'F',text: '汇总服务税抵扣数据'}];
					}else{
						degreeData = [{id: '1',text: '汇总合同数据'},{id:'2',text: '汇总收入数据'},{id:'3',text: '汇总收款数据'},
						{id:'G',text: '汇总自有服务成本数据'},{id:'H',text: '汇总人月外包'},{id:'I',text: '汇总其他采购'},{id:'J',text: '汇总净买入'},{id:'K',text: '汇总自有销售费用'}
						,{id:'O',text: '汇总非额度销售费用'},{id:'C',text: '汇总资产减值损失数据'},{id:'D',text: '汇总存货数据'},{id:'E',text: '汇总坏账核销数据'},{id:'F',text: '汇总服务税抵扣数据'}];
					}
	                nui.get("hzsj").setData(degreeData);
				}else{
					document.getElementById("gsglft").innerHTML = "8.3管理分摊";
					document.getElementById("gsscft").innerHTML = "8.4市场分摊";
					document.getElementById("gsyfft").innerHTML = "8.5研发分成";
					if(inputyear=="2017"){
						var degreeData = [{id: '1',text: '汇总合同数据'},{id:'2',text: '汇总收入数据'},{id:'3',text: '汇总收款数据'},{id:'4',text: '汇总分包及外部采购数据'},
	                    {id:'G',text: '汇总自有服务成本数据'},{id:'H',text: '汇总人月外包'},{id:'I',text: '汇总其他采购'},{id:'J',text: '汇总净买入'},{id:'K',text: '汇总自有销售费用'}
						,{id:'O',text: '汇总非额度销售费用'},{id:'C',text: '汇总资产减值损失数据'},{id:'D',text: '汇总存货数据'},{id:'E',text: '汇总坏账核销数据'},{id:'F',text: '汇总服务税抵扣数据'}];
						 nui.get("hzsj").setData(degreeData);
					}else{
						var degreeData = [{id: '1',text: '汇总合同数据'},{id:'2',text: '汇总收入数据'},{id:'3',text: '汇总收款数据'},
						{id:'G',text: '汇总自有服务成本数据'},{id:'H',text: '汇总人月外包'},{id:'I',text: '汇总其他采购'},{id:'J',text: '汇总净买入'},{id:'K',text: '汇总自有销售费用'}
						,{id:'O',text: '汇总非额度销售费用'} ,{id:'C',text: '汇总资产减值损失数据'},{id:'D',text: '汇总存货数据'},{id:'E',text: '汇总坏账核销数据'},{id:'F',text: '汇总服务税抵扣数据'}];
	                    nui.get("hzsj").setData(degreeData);
					}
				}
			}else{
				document.getElementById("table1").style.display = "none";
				nui.get("selfservcost1").setAllowInput(false);
				nui.get("selfservcost2").setAllowInput(false);
				nui.get("selfservcost3").setAllowInput(false);
				nui.get("selfservcost4").setAllowInput(false);
				nui.get("selfservcost1").setBorderStyle("background:");
				nui.get("selfservcost2").setBorderStyle("background:");
				nui.get("selfservcost3").setBorderStyle("background:");
				nui.get("selfservcost4").setBorderStyle("background:");
				nui.get("pmsubfee1").setAllowInput(false);
				nui.get("pmsubfee2").setAllowInput(false);
				nui.get("pmsubfee3").setAllowInput(false);
				nui.get("pmsubfee4").setAllowInput(false);
				nui.get("pmsubfee1").setBorderStyle("background:");
				nui.get("pmsubfee2").setBorderStyle("background:");
				nui.get("pmsubfee3").setBorderStyle("background:");
				nui.get("pmsubfee4").setBorderStyle("background:");
				nui.get("prosubfee1").setAllowInput(false);
				nui.get("prosubfee2").setAllowInput(false);
				nui.get("prosubfee3").setAllowInput(false);
				nui.get("prosubfee4").setAllowInput(false);
				nui.get("prosubfee1").setBorderStyle("background:");
				nui.get("prosubfee2").setBorderStyle("background:");
				nui.get("prosubfee3").setBorderStyle("background:");
				nui.get("prosubfee4").setBorderStyle("background:");
				nui.get("inoutfee1").setAllowInput(false);
				nui.get("inoutfee2").setAllowInput(false);
				nui.get("inoutfee3").setAllowInput(false);
				nui.get("inoutfee4").setAllowInput(false);
				nui.get("inoutfee1").setBorderStyle("background:");
				nui.get("inoutfee2").setBorderStyle("background:");
				nui.get("inoutfee3").setBorderStyle("background:");
				nui.get("inoutfee4").setBorderStyle("background:");
				nui.get("selfsalecost1").setAllowInput(false);
				nui.get("selfsalecost2").setAllowInput(false);
				nui.get("selfsalecost3").setAllowInput(false);
				nui.get("selfsalecost4").setAllowInput(false);
				nui.get("selfsalecost1").setBorderStyle("background:");
				nui.get("selfsalecost2").setBorderStyle("background:");
				nui.get("selfsalecost3").setBorderStyle("background:");
				nui.get("selfsalecost4").setBorderStyle("background:");
				nui.get("nquosalecost1").setAllowInput(false);
				nui.get("nquosalecost2").setAllowInput(false);
				nui.get("nquosalecost3").setAllowInput(false);
				nui.get("nquosalecost4").setAllowInput(false);
				nui.get("nquosalecost1").setBorderStyle("background:");
				nui.get("nquosalecost2").setBorderStyle("background:");
				nui.get("nquosalecost3").setBorderStyle("background:");
				nui.get("nquosalecost4").setBorderStyle("background:");
				
				document.getElementById("gsglft").innerHTML = "8.3管理分摊";
				document.getElementById("gsscft").innerHTML = "8.4市场分摊";
				document.getElementById("gsyfft").innerHTML = "8.5研发分成";
			}
			form.loading("加载中....");
			var data = {orgid:orgid,year:inputyear,orgseq:orgseq,parentorgid:parentorgid};
		    var json = nui.encode(data);
			 nui.ajax({
	                url: "com.primeton.eos.ame_budget.deptbudget.getDeptBudget.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
						form.setData(text);
						ftcaltype = text.ftcaltype;
						paybackPara = text.paybackPara;
						form.unmask();
						msharSet = text.commshar;
						stSet = text.startshar
						baSet = text.baseshar
						reSet = text.rebateshar
						asharSet = text.comashar
						bonusSet = text.bonusPara
						if(bonusSet.caltype == "1"){//奖金为手动填写
							nui.get("bonus1").setAllowInput(true);
							nui.get("bonus2").setAllowInput(true);
							nui.get("bonus3").setAllowInput(true);
							nui.get("bonus4").setAllowInput(true);
							nui.get("bonus1").setBorderStyle("background:#FFFFE6");
							nui.get("bonus2").setBorderStyle("background:#FFFFE6");
							nui.get("bonus3").setBorderStyle("background:#FFFFE6");
							nui.get("bonus4").setBorderStyle("background:#FFFFE6");
						}
						if(msharSet.caltype == "1"){//管理分摊为手动填写
							nui.get("commshar1").setAllowInput(true);
							nui.get("commshar2").setAllowInput(true);
							nui.get("commshar3").setAllowInput(true);
							nui.get("commshar4").setAllowInput(true);
							nui.get("commshar1").setBorderStyle("background:#FFFFE6");
							nui.get("commshar2").setBorderStyle("background:#FFFFE6");
							nui.get("commshar3").setBorderStyle("background:#FFFFE6");
							nui.get("commshar4").setBorderStyle("background:#FFFFE6");
						}
						if(stSet.caltype == "1"){//管理分摊为手动填写
							nui.get("startfee1").setAllowInput(true);
							nui.get("startfee2").setAllowInput(true);
							nui.get("startfee3").setAllowInput(true);
							nui.get("startfee4").setAllowInput(true);
							nui.get("startfee1").setBorderStyle("background:#FFFFE6");
							nui.get("startfee2").setBorderStyle("background:#FFFFE6");
							nui.get("startfee3").setBorderStyle("background:#FFFFE6");
							nui.get("startfee4").setBorderStyle("background:#FFFFE6");
						}
						if(baSet.caltype == "1"){//管理分摊为手动填写
							nui.get("bsfee1").setAllowInput(true);
							nui.get("bsfee2").setAllowInput(true);
							nui.get("bsfee3").setAllowInput(true);
							nui.get("bsfee4").setAllowInput(true);
							nui.get("bsfee1").setBorderStyle("background:#FFFFE6");
							nui.get("bsfee2").setBorderStyle("background:#FFFFE6");
							nui.get("bsfee3").setBorderStyle("background:#FFFFE6");
							nui.get("bsfee4").setBorderStyle("background:#FFFFE6");
						}
						if(reSet.caltype == "1"){//研发分摊为手动填写
							nui.get("rebate1").setAllowInput(true);
							nui.get("rebate2").setAllowInput(true);
							nui.get("rebate3").setAllowInput(true);
							nui.get("rebate4").setAllowInput(true);
							nui.get("rebate1").setBorderStyle("background:#FFFFE6");
							nui.get("rebate2").setBorderStyle("background:#FFFFE6");
							nui.get("rebate3").setBorderStyle("background:#FFFFE6");
							nui.get("rebate4").setBorderStyle("background:#FFFFE6");
						}
						if(asharSet.caltype == "1"){//市场分摊为手动填写
							nui.get("comashar1").setAllowInput(true);
							nui.get("comashar2").setAllowInput(true);
							nui.get("comashar3").setAllowInput(true);
							nui.get("comashar4").setAllowInput(true);
							nui.get("comashar1").setBorderStyle("background:#FFFFE6");
							nui.get("comashar2").setBorderStyle("background:#FFFFE6");
							nui.get("comashar3").setBorderStyle("background:#FFFFE6");
							nui.get("comashar4").setBorderStyle("background:#FFFFE6");
						}
						
						
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
				    	document.getElementById("bustax").innerHTML = text.budget1.bustax == null ? "":formatNumber(text.budget1.bustax);
				    	document.getElementById("currentcost").innerHTML = text.budget1.currentcost == null ? "":formatNumber(text.budget1.currentcost);
				    	document.getElementById("selfservcost").innerHTML = text.budget1.selfservcost == null ? "":formatNumber(text.budget1.selfservcost);
				    	document.getElementById("pmsubfee").innerHTML = text.budget1.pmsubfee == null ? "":formatNumber(text.budget1.pmsubfee);
				    	document.getElementById("prosubfee").innerHTML = text.budget1.prosubfee == null ? "":formatNumber(text.budget1.prosubfee);
				    	document.getElementById("inoutfee").innerHTML = text.budget1.inoutfee == null ? "":formatNumber(text.budget1.inoutfee);
				    	document.getElementById("servcost").innerHTML = text.budget1.servcost == null ? "":formatNumber(text.budget1.servcost);
				    	document.getElementById("salecost").innerHTML = text.budget1.salecost == null ? "":formatNumber(text.budget1.salecost);
				    	document.getElementById("selfsalecost").innerHTML = text.budget1.selfsalecost == null ? "":formatNumber(text.budget1.selfsalecost);
				    	document.getElementById("nquosalecost").innerHTML = text.budget1.nquosalecost == null ? "":formatNumber(text.budget1.nquosalecost);
				    	document.getElementById("commshar").innerHTML = text.budget1.commshar == null ? "":formatNumber(text.budget1.commshar);
				    	document.getElementById("comashar").innerHTML = text.budget1.comashar == null ? "":formatNumber(text.budget1.comashar);
				    	document.getElementById("comdshar").innerHTML = text.budget1.comdshar == null ? "":formatNumber(text.budget1.comdshar);
				    	document.getElementById("startfee").innerHTML = text.budget1.startfee == null ? "":formatNumber(text.budget1.startfee);
				    	document.getElementById("bsfee").innerHTML = text.budget1.bsfee == null ? "":formatNumber(text.budget1.bsfee);
				    	document.getElementById("rebate").innerHTML = text.budget1.rebate == null ? "":formatNumber(text.budget1.rebate);
				    	document.getElementById("accounts").innerHTML = text.budget1.accounts == null ? "":formatNumber(text.budget1.accounts);
				    	document.getElementById("baddebts").innerHTML = text.budget1.baddebts == null ? "":formatNumber(text.budget1.baddebts);
				    	document.getElementById("assetlose").innerHTML = text.budget1.assetlose == null ? "":formatNumber(text.budget1.assetlose);
				    	document.getElementById("instock").innerHTML = text.budget1.instock == null ? "":formatNumber(text.budget1.instock);
				    	document.getElementById("outstock").innerHTML = text.budget1.outstock == null ? "":formatNumber(text.budget1.outstock);
				    	document.getElementById("payback").innerHTML = text.budget1.payback == null ? "":formatNumber(text.budget1.payback);
				    	document.getElementById("servtax").innerHTML = text.budget1.servtax == null ? "":formatNumber(text.budget1.servtax);
				    	document.getElementById("bonus").innerHTML = text.budget1.bonus == null ? "":formatNumber(text.budget1.bonus);
				    	document.getElementById("profitBBonus").innerHTML = text.budget1.profitBBonus == null ? "":formatNumber(text.budget1.profitBBonus);
				    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
				    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
				    	document.getElementById("wptotalfee").innerHTML = text.budget1.wptotalfee == null ? "":formatNumber(text.budget1.wptotalfee);
				    	document.getElementById("cashflow").innerHTML = text.budget1.cashflow == null ? "":formatNumber(text.budget1.cashflow);
				    	document.getElementById("deviation").innerHTML = text.budget1.deviation == null ? "":formatNumber(text.budget1.deviation);
				    	document.getElementById("wptotalfee5").innerHTML = text.budget2.wptotalfee == null ? "":formatNumber(text.budget2.wptotalfee);
				    	document.getElementById("cashflow5").innerHTML = text.budget2.cashflow == null ? "":formatNumber(text.budget2.cashflow);
				    	document.getElementById("deviation5").innerHTML = text.budget2.deviation == null ? "":formatNumber(text.budget2.deviation);
				    	document.getElementById("cashflow6").innerHTML = (text.budget3.cashflow*100).toFixed(1)+"%";
				    	document.getElementById("wptotalfee6").innerHTML = (text.budget3.wptotalfee*100).toFixed(1)+"%";
				    	document.getElementById("deviation6").innerHTML = (text.budget3.deviation*100).toFixed(1)+"%";
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
				    	document.getElementById("bustax5").innerHTML = text.budget2.bustax == null ? "":formatNumber(text.budget2.bustax);
				    	document.getElementById("currentcost5").innerHTML = text.budget2.currentcost == null ? "":formatNumber(text.budget2.currentcost);
				    	document.getElementById("servcost5").innerHTML = text.budget2.servcost == null ? "":formatNumber(text.budget2.servcost);
				    	document.getElementById("selfservcost5").innerHTML = text.budget2.selfservcost == null ? "":formatNumber(text.budget2.selfservcost);
				    	document.getElementById("pmsubfee5").innerHTML = text.budget2.pmsubfee == null ? "":formatNumber(text.budget2.pmsubfee);
				    	document.getElementById("prosubfee5").innerHTML = text.budget2.prosubfee == null ? "":formatNumber(text.budget2.prosubfee);
				    	document.getElementById("inoutfee5").innerHTML = text.budget2.inoutfee == null ? "":formatNumber(text.budget2.inoutfee);
				    	document.getElementById("salecost5").innerHTML = text.budget2.salecost == null ? "":formatNumber(text.budget2.salecost);
				    	document.getElementById("selfsalecost5").innerHTML = text.budget2.selfsalecost == null ? "":formatNumber(text.budget2.selfsalecost);
				    	document.getElementById("nquosalecost5").innerHTML = text.budget2.nquosalecost == null ? "":formatNumber(text.budget2.nquosalecost);
				    	document.getElementById("commshar5").innerHTML = text.budget2.commshar == null ? "":formatNumber(text.budget2.commshar);
				    	document.getElementById("comashar5").innerHTML = text.budget2.comashar == null ? "":formatNumber(text.budget2.comashar);
				    	document.getElementById("comdshar5").innerHTML = text.budget2.comdshar == null ? "":formatNumber(text.budget2.comdshar);
				    	document.getElementById("startfee5").innerHTML = text.budget2.startfee == null ? "":formatNumber(text.budget2.startfee);
				    	document.getElementById("bsfee5").innerHTML = text.budget2.bsfee == null ? "":formatNumber(text.budget2.bsfee);
				    	document.getElementById("rebate5").innerHTML = text.budget2.rebate == null ? "":formatNumber(text.budget2.rebate);
				    	document.getElementById("accounts5").innerHTML = text.budget2.accounts == null ? "":formatNumber(text.budget2.accounts);
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
				    	document.getElementById("bustax6").innerHTML = (text.budget3.bustax*100).toFixed(1)+"%";
				    	document.getElementById("currentcost6").innerHTML = (text.budget3.currentcost*100).toFixed(1)+"%";
				    	document.getElementById("servcost6").innerHTML = (text.budget3.servcost*100).toFixed(1)+"%";
				    	document.getElementById("selfservcost6").innerHTML = (text.budget3.selfservcost*100).toFixed(1)+"%";
				    	document.getElementById("pmsubfee6").innerHTML = (text.budget3.pmsubfee*100).toFixed(1)+"%";
				    	document.getElementById("prosubfee6").innerHTML = (text.budget3.prosubfee*100).toFixed(1)+"%";
				    	document.getElementById("inoutfee6").innerHTML = (text.budget3.inoutfee*100).toFixed(1)+"%";
				    	document.getElementById("salecost6").innerHTML = (text.budget3.salecost*100).toFixed(1)+"%";
				    	document.getElementById("selfsalecost6").innerHTML = (text.budget3.selfsalecost*100).toFixed(1)+"%";
				    	document.getElementById("nquosalecost6").innerHTML = (text.budget3.nquosalecost*100).toFixed(1)+"%";
				    	document.getElementById("commshar6").innerHTML = (text.budget3.commshar*100).toFixed(1)+"%";
				    	document.getElementById("comashar6").innerHTML = (text.budget3.comashar*100).toFixed(1)+"%";
				    	document.getElementById("comdshar6").innerHTML = (text.budget3.comdshar*100).toFixed(1)+"%";
				    	document.getElementById("startfee6").innerHTML = (text.budget3.startfee*100).toFixed(1)+"%";
				    	document.getElementById("bsfee6").innerHTML = (text.budget3.bsfee*100).toFixed(1)+"%";
				    	document.getElementById("rebate6").innerHTML = (text.budget3.rebate*100).toFixed(1)+"%";
				    	document.getElementById("accounts6").innerHTML = (text.budget3.accounts*100).toFixed(1)+"%";
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
							if(inputyear=="2017"){
								degreeData = [{id:'4',text: '汇总分包及外部采购数据'},{id:'5',text: '汇总服务成本数据'},{id:'6',text: '汇总销售费用数据'},{id:'7',text: '汇总部门管理费用数据'},{id:'8',text: '汇总部门研发费用数据'}];
							}else{
								degreeData = [{id:'5',text: '汇总服务成本数据'},{id:'6',text: '汇总销售费用数据'},{id:'7',text: '汇总部门管理费用数据'},{id:'8',text: '汇总部门研发费用数据'}];
							}
		               		 nui.get("hzsj").setData(degreeData);
							
						}
						
						if(text.ishavecl=="0"){//没有子利润部门只汇总成本数据
					    	degreeData = [{id:'G',text: '汇总自有服务成本数据'},{id:'H',text: '汇总人月外包'},{id:'I',text: '汇总其他采购'},{id:'J',text: '汇总净买入'},{id:'K',text: '汇总自有销售费用'}
							,{id:'O',text: '汇总非额度销售费用'} ,];
	                    	nui.get("hzsj").setData(degreeData);
						}
	                   	//锁定解锁：1、锁定  2、解锁
	                   	budstatus = text.budstatus;
	                   	if(budstatus=="1"){
	                   		if(orgid==1){
	                   			nui.get("commshar1").setAllowInput(false);
								nui.get("commshar2").setAllowInput(false);
								nui.get("commshar3").setAllowInput(false);
								nui.get("commshar4").setAllowInput(false);
								nui.get("commshar1").setBorderStyle("background:");
								nui.get("commshar2").setBorderStyle("background:");
								nui.get("commshar3").setBorderStyle("background:");
								nui.get("commshar4").setBorderStyle("background:");
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
	                   		/* document.getElementById("psubline").style.display = "";
	                   		document.getElementById("masubline").style.display = "";
	                   		document.getElementById("ssubline").style.display = ""; */
	                   		callBack();//解锁状态下计算所有预算信息，目的是为了计算，按自有成本比例分摊的管理分摊成本
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
	    	var profitBBonus = document.getElementById("profitBBonus").innerHTML;
	       	var servcost = document.getElementById("servcost").innerHTML;
	       	var salecost = document.getElementById("salecost").innerHTML;
	       	var commshar = document.getElementById("commshar").innerHTML;
	       	var comashar = document.getElementById("comashar").innerHTML;
	       	var comdshar = document.getElementById("comdshar").innerHTML;
	       	var bustax = document.getElementById("bustax").innerHTML; 
	       	var taxincome = document.getElementById("taxincome").innerHTML;
	       	var receamt = document.getElementById("receamt").innerHTML;
	       	var fee = delcommafy(profitBBonus)+delcommafy(servcost)+delcommafy(salecost)+delcommafy(commshar)+delcommafy(comdshar)+delcommafy(comashar)+delcommafy(bustax);
	       	var maxfee = delcommafy(taxincome) - fee > 0 ? delcommafy(taxincome) : fee;
	       form.loading("加载中....");
	       if(confirm("保存预算损益会重新计算相关分摊数据，是否保存当前页面的预算损益数据？")){
	       	if(delcommafy(receamt)<maxfee){
	       		if(confirm("收款小于（含税收入，总成本+税金+奖前利润，其中总成本=事业部服务成本+销售费用+管理、市场、研发分成）中的最大值，是否继续提交？")){
	       		}else{
	       			form.unmask();
	       			return;
	       		}
	       	}
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
		                		doCal1();
				            	doCal2();
				            	doCal3();
				            	doCal4(1);
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
				if (!confirm("预算锁定后，阿米巴及成本部门的预算数据将不能修改提交！")) {
					return;
				}
			}else{
				if (!confirm("预算解锁后，阿米巴及成本部门的预算数据将可以修改提交！")) {
					return;
				}
			}
			var data = {year:inputyear,locks:e};
		    var json = nui.encode(data);
			 form.loading("加载中....");
			 nui.ajax({
	                url: "com.primeton.eos.ame_budget.deptbudget.locksNew.biz.ext",
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
	                	}else{
	                		nui.alert("解锁成功！");
		                	budstatus = "2";
		                	document.getElementById("syb").innerHTML = inputyear+"年"+orgname+"预算"+"(未锁定)";	
		                	document.getElementById("unlock").style.display = "none";
	               			document.getElementById("lock").style.display = "";
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
				    	document.getElementById("bustax").innerHTML = text.budget1.bustax == null ? "":formatNumber(text.budget1.bustax);
				    	document.getElementById("currentcost").innerHTML = text.budget1.currentcost == null ? "":formatNumber(text.budget1.currentcost);
				    	document.getElementById("selfservcost").innerHTML = text.budget1.selfservcost == null ? "":formatNumber(text.budget1.selfservcost);
				    	document.getElementById("pmsubfee").innerHTML = text.budget1.pmsubfee == null ? "":formatNumber(text.budget1.pmsubfee);
				    	document.getElementById("prosubfee").innerHTML = text.budget1.prosubfee == null ? "":formatNumber(text.budget1.prosubfee);
				    	document.getElementById("inoutfee").innerHTML = text.budget1.inoutfee == null ? "":formatNumber(text.budget1.inoutfee);
				    	document.getElementById("servcost").innerHTML = text.budget1.servcost == null ? "":formatNumber(text.budget1.servcost);
				    	document.getElementById("salecost").innerHTML = text.budget1.salecost == null ? "":formatNumber(text.budget1.salecost);
				    	document.getElementById("selfsalecost").innerHTML = text.budget1.selfsalecost == null ? "":formatNumber(text.budget1.selfsalecost);
				    	document.getElementById("nquosalecost").innerHTML = text.budget1.nquosalecost == null ? "":formatNumber(text.budget1.nquosalecost);
				    	document.getElementById("commshar").innerHTML = text.budget1.commshar == null ? "":formatNumber(text.budget1.commshar);
				    	document.getElementById("comashar").innerHTML = text.budget1.comashar == null ? "":formatNumber(text.budget1.comashar);
				    	document.getElementById("comdshar").innerHTML = text.budget1.comdshar == null ? "":formatNumber(text.budget1.comdshar);
				    	document.getElementById("startfee").innerHTML = text.budget1.startfee == null ? "":formatNumber(text.budget1.startfee);
				    	document.getElementById("bsfee").innerHTML = text.budget1.bsfee == null ? "":formatNumber(text.budget1.bsfee);
				    	document.getElementById("rebate").innerHTML = text.budget1.rebate == null ? "":formatNumber(text.budget1.rebate);
				    	document.getElementById("accounts").innerHTML = text.budget1.accounts == null ? "":formatNumber(text.budget1.accounts);
				    	document.getElementById("baddebts").innerHTML = text.budget1.baddebts == null ? "":formatNumber(text.budget1.baddebts);
				    	document.getElementById("assetlose").innerHTML = text.budget1.assetlose == null ? "":formatNumber(text.budget1.assetlose);
				    	document.getElementById("instock").innerHTML = text.budget1.instock == null ? "":formatNumber(text.budget1.instock);
				    	document.getElementById("outstock").innerHTML = text.budget1.outstock == null ? "":formatNumber(text.budget1.outstock);
				    	document.getElementById("payback").innerHTML = text.budget1.payback == null ? "":formatNumber(text.budget1.payback);
				    	document.getElementById("servtax").innerHTML = text.budget1.servtax == null ? "":formatNumber(text.budget1.servtax);
				    	document.getElementById("bonus").innerHTML = text.budget1.bonus == null ? "":formatNumber(text.budget1.bonus);
				    	document.getElementById("profitBBonus").innerHTML = text.budget1.profitBBonus == null ? "":formatNumber(text.budget1.profitBBonus);
				    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
				    	document.getElementById("profitABonus").innerHTML = text.budget1.profitABonus == null ? "":formatNumber(text.budget1.profitABonus);
				    	document.getElementById("wptotalfee").innerHTML = text.budget1.wptotalfee == null ? "":formatNumber(text.budget1.wptotalfee);
				    	document.getElementById("cashflow").innerHTML = text.budget1.cashflow == null ? "":formatNumber(text.budget1.cashflow);
				    	document.getElementById("deviation").innerHTML = text.budget1.deviation == null ? "":formatNumber(text.budget1.deviation);
				    	document.getElementById("wptotalfee5").innerHTML = text.budget2.wptotalfee == null ? "":formatNumber(text.budget2.wptotalfee);
				    	document.getElementById("cashflow5").innerHTML = text.budget2.cashflow == null ? "":formatNumber(text.budget2.cashflow);
				    	document.getElementById("deviation5").innerHTML = text.budget2.deviation == null ? "":formatNumber(text.budget2.deviation);
				    	document.getElementById("cashflow6").innerHTML = (text.budget3.cashflow*100).toFixed(1)+"%";
				    	document.getElementById("wptotalfee6").innerHTML = (text.budget3.wptotalfee*100).toFixed(1)+"%";
				    	document.getElementById("deviation6").innerHTML = (text.budget3.deviation*100).toFixed(1)+"%";
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
				    	document.getElementById("bustax5").innerHTML = text.budget2.bustax == null ? "":formatNumber(text.budget2.bustax);
				    	document.getElementById("currentcost5").innerHTML = text.budget2.currentcost == null ? "":formatNumber(text.budget2.currentcost);
				    	document.getElementById("servcost5").innerHTML = text.budget2.servcost == null ? "":formatNumber(text.budget2.servcost);
				    	document.getElementById("selfservcost5").innerHTML = text.budget2.selfservcost == null ? "":formatNumber(text.budget2.selfservcost);
				    	document.getElementById("pmsubfee5").innerHTML = text.budget2.pmsubfee == null ? "":formatNumber(text.budget2.pmsubfee);
				    	document.getElementById("prosubfee5").innerHTML = text.budget2.prosubfee == null ? "":formatNumber(text.budget2.prosubfee);
				    	document.getElementById("inoutfee5").innerHTML = text.budget2.inoutfee == null ? "":formatNumber(text.budget2.inoutfee);
				    	document.getElementById("salecost5").innerHTML = text.budget2.salecost == null ? "":formatNumber(text.budget2.salecost);
				    	document.getElementById("selfsalecost5").innerHTML = text.budget2.selfsalecost == null ? "":formatNumber(text.budget2.selfsalecost);
				    	document.getElementById("nquosalecost5").innerHTML = text.budget2.nquosalecost == null ? "":formatNumber(text.budget2.nquosalecost);
				    	document.getElementById("commshar5").innerHTML = text.budget2.commshar == null ? "":formatNumber(text.budget2.commshar);
				    	document.getElementById("comashar5").innerHTML = text.budget2.comashar == null ? "":formatNumber(text.budget2.comashar);
				    	document.getElementById("comdshar5").innerHTML = text.budget2.comdshar == null ? "":formatNumber(text.budget2.comdshar);
				    	document.getElementById("startfee5").innerHTML = text.budget2.startfee == null ? "":formatNumber(text.budget2.startfee);
				    	document.getElementById("bsfee5").innerHTML = text.budget2.bsfee == null ? "":formatNumber(text.budget2.bsfee);
				    	document.getElementById("rebate5").innerHTML = text.budget2.rebate == null ? "":formatNumber(text.budget2.rebate);
				    	document.getElementById("accounts5").innerHTML = text.budget2.accounts == null ? "":formatNumber(text.budget2.accounts);
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
				    	document.getElementById("bustax6").innerHTML = (text.budget3.bustax*100).toFixed(1)+"%";
				    	document.getElementById("currentcost6").innerHTML = (text.budget3.currentcost*100).toFixed(1)+"%";
				    	document.getElementById("servcost6").innerHTML = (text.budget3.servcost*100).toFixed(1)+"%";
				    	document.getElementById("selfservcost6").innerHTML = (text.budget3.selfservcost*100).toFixed(1)+"%";
				    	document.getElementById("pmsubfee6").innerHTML = (text.budget3.pmsubfee*100).toFixed(1)+"%";
				    	document.getElementById("prosubfee6").innerHTML = (text.budget3.prosubfee*100).toFixed(1)+"%";
				    	document.getElementById("inoutfee6").innerHTML = (text.budget3.inoutfee*100).toFixed(1)+"%";
				    	document.getElementById("salecost6").innerHTML = (text.budget3.salecost*100).toFixed(1)+"%";
				    	document.getElementById("selfsalecost6").innerHTML = (text.budget3.selfsalecost*100).toFixed(1)+"%";
				    	document.getElementById("nquosalecost6").innerHTML = (text.budget3.nquosalecost*100).toFixed(1)+"%";
				    	document.getElementById("commshar6").innerHTML = (text.budget3.commshar*100).toFixed(1)+"%";
				    	document.getElementById("comashar6").innerHTML = (text.budget3.comashar*100).toFixed(1)+"%";
				    	document.getElementById("comdshar6").innerHTML = (text.budget3.comdshar*100).toFixed(1)+"%";
				    	document.getElementById("startfee6").innerHTML = (text.budget3.startfee*100).toFixed(1)+"%";
				    	document.getElementById("bsfee6").innerHTML = (text.budget3.bsfee*100).toFixed(1)+"%";
				    	document.getElementById("rebate6").innerHTML = (text.budget3.rebate*100).toFixed(1)+"%";
				    	document.getElementById("accounts6").innerHTML = (text.budget3.accounts*100).toFixed(1)+"%";
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
			var mtaxincome1=nui.get("mtaxincome1").getValue(); //MA收入
			var staxincome1=nui.get("staxincome1").getValue(); //服务收入
			var selfservcost1=nui.get("selfservcost1").getValue(); //自有服务成本
			var pmsubfee1=nui.get("pmsubfee1").getValue(); //人月外包
			var prosubfee1=nui.get("prosubfee1").getValue(); //其他采购
			var inoutfee1=nui.get("inoutfee1").getValue(); //净买入
			var selfsalecost1=nui.get("selfsalecost1").getValue(); //自有销售费用
			var nquosalecost1=nui.get("nquosalecost1").getValue(); //非额度销售费用
			var baddebts1=nui.get("baddebts1").getValue(); //坏账核销
			var assetlose1=nui.get("assetlose1").getValue();//资产减值损失
			var instock1=nui.get("instock1").getValue(); //转入存货成本
			var outstock1=nui.get("outstock1").getValue(); //转出存货成本
			var servtax1=nui.get("servtax1").getValue(); //服务税抵扣
			//其他季度产品毛收入ma毛收入用于计算汇总毛收入，用于计算起步费和超额返利
			var pntaxincome2=nui.get("pntaxincome2").getValue(); //产品毛收入
			var mntaxincome2=nui.get("mntaxincome2").getValue(); //MA毛收入
			var pntaxincome3=nui.get("pntaxincome3").getValue(); //产品毛收入
			var mntaxincome3=nui.get("mntaxincome3").getValue(); //MA毛收入
			var pntaxincome4=nui.get("pntaxincome4").getValue(); //产品毛收入
			var mntaxincome4=nui.get("mntaxincome4").getValue(); //MA毛收入
			//其他几个季度的收款额，用于计算应收账款
			var receamt2=nui.get("receamt2").getValue(); //收款额
			var receamt3=nui.get("receamt3").getValue(); //收款额
			var receamt4=nui.get("receamt4").getValue(); //收款额
			var taxincome2=nui.get("taxincome2").getValue(); //营业收入
			var taxincome3=nui.get("taxincome3").getValue(); //营业收入
			var taxincome4=nui.get("taxincome4").getValue(); //营业收入
			var bonus1=nui.get("bonus1").getValue(); ; //奖金
			var contamt1=0; //合同额
			var taxincome1=0; //营业收入(含税)
			var ntaxincome1=0; //营业毛收入(不含税)
			var pntaxincome1=0; //产品毛收入
			var sntaxincome1=0; //MA毛收入
			var mntaxincome1=0; //服务毛收入
			var bustax1=0; //营业税金及附加
			var currentcost1=0; // 当期发生成本
			var payback1=0; //退税
			var profitBBonus1=0; //奖金前利润
			var profitABonus1=0; //奖金后利润
			var commshar1=nui.get("commshar1").getValue(); //公司管理分摊
			var comashar1=nui.get("comashar1").getValue(); //公司市场分摊
			var comdshar1=nui.get("comdshar1").getValue(); //公司研发分摊
			var startfee1=nui.get("startfee1").getValue(); //起步费
			var bsfee1=nui.get("bsfee1").getValue(); //基础比例分成费
			var rebate1=nui.get("rebate1").getValue(); //超额返利
			var servcost1 = 0;//服务成本
			var salecost1=0; //销售费用
			var wptotalfee1=0; //包含退税后的总收入
			var cashflow1=0; //经营净现金流
			var deviation1=0; //经营净现金流与奖前利润正偏离
			var accounts1 = 0;//应收账款
			if(comashar1==null||comashar1==""){
	    		comashar1 = 0;
	    	}
	    	if(comdshar1==null||comdshar1==""){
	    		comdshar1 = 0;
	    	}
	    	if(commshar1==null||commshar1==""){
	    		commshar1 = 0;
	    	}
	    	if(startfee1==null||startfee1==""){
	    		startfee1 = 0;
	    	}
	    	if(bsfee1==null||bsfee1==""){
	    		bsfee1 = 0;
	    	}
	    	if(rebate1==null||rebate1==""){
	    		rebate1 = 0;
	    	}
			if(selfservcost1==null||selfservcost1==""){
	    		selfservcost1 = 0;
	    	}
	    	if(pmsubfee1==null||pmsubfee1==""){
	    		pmsubfee1 = 0;
	    	}
	    	if(prosubfee1==null||prosubfee1==""){
	    		prosubfee1 = 0;
	    	}
	    	if(inoutfee1==null||inoutfee1==""){
	    		inoutfee1 = 0;
	    	}
	    	if(selfsalecost1==null||selfsalecost1==""){
	    		selfsalecost1 = 0;
	    	}
	    	if(nquosalecost1==null||nquosalecost1==""){
	    		nquosalecost1 = 0;
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
	    	if(receamt1==null||receamt1==""){
	    		receamt1 = 0;
	    	}
	    	if(staxincome1==null||staxincome1==""){
	    		staxincome1 = 0;
	    	}
	    	if(ptaxincome1==null||ptaxincome1==""){
	    		ptaxincome1 = 0;
	    	}
	    	if(mtaxincome1==null||mtaxincome1==""){
	    		mtaxincome1 = 0;
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
	    	if(pntaxincome2==null||pntaxincome2==""){
	    		pntaxincome2 = 0;
	    	}
	    	if(mntaxincome2==null||mntaxincome2==""){
	    		mntaxincome2 = 0;
	    	}
	    	if(pntaxincome3==null||pntaxincome3==""){
	    		pntaxincome3 = 0;
	    	}
	    	if(mntaxincome3==null||mntaxincome3==""){
	    		mntaxincome3 = 0;
	    	}
	    	if(pntaxincome4==null||pntaxincome4==""){
	    		pntaxincome4 = 0;
	    	}
	    	if(mntaxincome4==null||mntaxincome4==""){
	    		mntaxincome4 = 0;
	    	}
	    	if(taxincome2==null||taxincome2==""){
	    		taxincome2 = 0;
	    	}
	    	if(taxincome3==null||taxincome3==""){
	    		taxincome3 = 0;
	    	}
	    	if(taxincome4==null||taxincome4==""){
	    		taxincome4 = 0;
	    	}
	    	if(receamt4==null||receamt4==""){
	    		receamt4 = 0;
	    	}
	    	if(receamt2==null||receamt2==""){
	    		receamt2 = 0;
	    	}
	    	if(receamt3==null||receamt3==""){
	    		receamt3 = 0;
	    	}
	    	var startfee5 = delcommafy(document.getElementById("startfee5").innerHTML);
	    	var bonus5 = delcommafy(document.getElementById("bonus5").innerHTML);
	    	pntaxincome1=Math.round(parseFloat(ptaxincome1)/(1+productrate));
	    	sntaxincome1=Math.round(parseFloat(staxincome1)/(1+servicerate));
	    	mntaxincome1=Math.round(parseFloat(mtaxincome1)/(1+marate));
	    	var pntaxincome = pntaxincome1+parseFloat(pntaxincome2)+parseFloat(pntaxincome3)+parseFloat(pntaxincome4);
	    	var mntaxincome = mntaxincome1+parseFloat(mntaxincome2)+parseFloat(mntaxincome3)+parseFloat(mntaxincome4);
	    	taxincome1=parseFloat(ptaxincome1)+parseFloat(staxincome1)+parseFloat(mtaxincome1);
	    	ntaxincome1=pntaxincome1+sntaxincome1+mntaxincome1;
			contamt1=parseFloat(pcontamt1)+parseFloat(scontamt1)+parseFloat(mcontamt1);
			bustax1=Math.round(parseFloat(pntaxincome1)*productrate*0.06+parseFloat(sntaxincome1)*servicerate*0.06+parseFloat(mntaxincome1)*marate*0.06);
	    	servcost1 = parseFloat(selfservcost1)+parseFloat(pmsubfee1)+parseFloat(prosubfee1)+parseFloat(inoutfee1);
	    	salecost1 = parseFloat(selfsalecost1)+parseFloat(nquosalecost1);
	    	payback1=parseFloat(pntaxincome1)*paybackPara;
	    	wptotalfee1=ntaxincome1+payback1+servtax1;
	    	if(stSet.caltype){//起步费
		    	if(stSet.caltype == "1"){
		    	}else{
		    		if(pntaxincome+mntaxincome!=0){
						startfee1=(startfee5*(pntaxincome1+mntaxincome1)/(pntaxincome+mntaxincome)).toFixed(2); //起步费
					}
		    	}
	    	}
	    	if(baSet.caltype){//基础比例分成
		    	if(baSet.caltype == "1"){
		    	}else{
					bsfee1 = ((pntaxincome1+mntaxincome1)*parseFloat(baSet.parameters)).toFixed(2);
		    	}
	    	}
	    	if(reSet.caltype){//超额返利
		    	if(reSet.caltype == "1"){
		    	}else{
					rebate1=0; //超额返利1-3季度没有值，数据体现在第四季度
		    	}
	    	}
	    	nui.get("ntaxincome1").setValue(ntaxincome1);
	    	comdshar1 =parseFloat(bsfee1)+ parseFloat(startfee1)-parseFloat(rebate1);//研发分成
	    	nui.get("comdshar1").setValue(comdshar1);
	    	if(msharSet.caltype!="1"){//如果不是手动填写
	    		commshar1 = calCommShar(1)==0?commshar1:calCommShar(1);//计算管理分摊，规则单独处理
	    	}
	    	
	    	currentcost1=parseFloat(comdshar1)+parseFloat(comashar1)+parseFloat(commshar1)+parseFloat(salecost1)+parseFloat(servcost1)
	    	-parseFloat(outstock1)+parseFloat(instock1)+baddebts1+bustax1;
	    	profitBBonus1=ntaxincome1-currentcost1+payback1+parseFloat(servtax1);
	    	if(bonusSet.caltype){//奖金占比
		    	if(bonusSet.caltype == "1"){
		    	}else{
					bonus1=profitBBonus1*bonusSet.parameters;//计算规则还未搞明白
		    	}
	    	}
	    	profitABonus1 = profitBBonus1-bonus1;
	    	cashflow1 = parseFloat(receamt1)+payback1+parseFloat(servtax1)-currentcost1-taxincome1+ntaxincome1-bonus5;
	    	deviation1 = cashflow1-profitBBonus1;
	    	nui.get("contamt1").setValue(contamt1);
	    	nui.get("taxincome1").setValue(taxincome1);
	    	nui.get("pntaxincome1").setValue(pntaxincome1);
	    	nui.get("sntaxincome1").setValue(sntaxincome1);
	    	nui.get("mntaxincome1").setValue(mntaxincome1);
	    	
	    	nui.get("bustax1").setValue(bustax1);
	    	nui.get("cashflow1").setValue(cashflow1);
	    	nui.get("deviation1").setValue(deviation1);
	    	nui.get("currentcost1").setValue(currentcost1);
	    	nui.get("payback1").setValue(payback1);
	    	nui.get("bonus1").setValue(bonus1);
	    	nui.get("profitBBonus1").setValue(profitBBonus1);
	    	nui.get("profitABonus1").setValue(profitABonus1);
	    	nui.get("commshar1").setValue(commshar1);
	    	
	    	nui.get("startfee1").setValue(startfee1);
	    	nui.get("bsfee1").setValue(bsfee1);
	    	nui.get("rebate1").setValue(rebate1);
	    	nui.get("comashar1").setValue(comashar1);
	    	nui.get("servcost1").setValue(servcost1);
			nui.get("salecost1").setValue(salecost1);
	    	nui.get("wptotalfee1").setValue(wptotalfee1);
	    	nui.get("accounts1").setValue(accounts1);
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
			var selfservcost2=nui.get("selfservcost2").getValue(); //自有服务成本
			var pmsubfee2=nui.get("pmsubfee2").getValue(); //人月外包
			var prosubfee2=nui.get("prosubfee2").getValue(); //其他采购
			var inoutfee2=nui.get("inoutfee2").getValue(); //净买入
			var selfsalecost2=nui.get("selfsalecost2").getValue(); //自有销售费用
			var nquosalecost2=nui.get("nquosalecost2").getValue(); //非额度销售费用
			var baddebts2=nui.get("baddebts2").getValue(); //坏账核销
			var assetlose2=nui.get("assetlose2").getValue();//资产减值损失
			var instock2=nui.get("instock2").getValue(); //转入存货成本
			var outstock2=nui.get("outstock2").getValue(); //转出存货成本
			var servtax2=nui.get("servtax2").getValue(); //服务税抵扣
			//其他季度产品毛收入ma毛收入用于计算汇总毛收入，用于计算起步费和超额返利
			var pntaxincome1=nui.get("pntaxincome1").getValue(); //产品毛收入
			var mntaxincome1=nui.get("mntaxincome1").getValue(); //MA毛收入
			var pntaxincome3=nui.get("pntaxincome3").getValue(); //产品毛收入
			var mntaxincome3=nui.get("mntaxincome3").getValue(); //MA毛收入
			var pntaxincome4=nui.get("pntaxincome4").getValue(); //产品毛收入
			var mntaxincome4=nui.get("mntaxincome4").getValue(); //MA毛收入
			//其他几个季度的收款额，用于计算应收账款
			var receamt1=nui.get("receamt1").getValue(); //收款额
			var receamt3=nui.get("receamt3").getValue(); //收款额
			var receamt4=nui.get("receamt4").getValue(); //收款额
			var taxincome1=nui.get("taxincome1").getValue(); //营业收入
			var taxincome3=nui.get("taxincome3").getValue(); //营业收入
			var taxincome4=nui.get("taxincome4").getValue(); //营业收入
			var bonus2=nui.get("bonus2").getValue(); //奖金
			var contamt2=0; //合同额
			var taxincome2=0; //营业收入(含税)
			var ntaxincome2=0; //营业毛收入(不含税)
			var pntaxincome2=0; //产品毛收入
			var sntaxincome2=0; //MA毛收入
			var mntaxincome2=0; //服务毛收入
			var currentcost2=0; // 当期发生成本
			var payback2=0; //退税
			var profitBBonus2=0; //奖金前利润
			var profitABonus2=0; //奖金后利润
			var commshar2=nui.get("commshar2").getValue(); //公司管理分摊
			var comashar2=nui.get("comashar2").getValue(); //公司市场分摊
			var comdshar2=nui.get("comdshar2").getValue(); //公司研发分摊
			var startfee2=nui.get("startfee2").getValue(); //起步费
			var bsfee2=nui.get("bsfee2").getValue(); //基础比例分成费
			var rebate2=nui.get("rebate2").getValue(); //超额返利
			var servcost2 = 0;//服务成本
			var salecost2=0; //销售费用
			var wptotalfee2=0; //包含退税后的总收入
			var cashflow2=0; //经营净现金流
			var deviation2=0; //经营净现金流与奖前利润正偏离
			var accounts2 = 0;//应收账款 
			if(comashar2==null||comashar2==""){
	    		comashar2 = 0;
	    	}
	    	if(comdshar2==null||comdshar2==""){
	    		comdshar2 = 0;
	    	}
	    	if(commshar2==null||commshar2==""){
	    		commshar2 = 0;
	    	}
	    	if(startfee2==null||startfee2==""){
	    		startfee2 = 0;
	    	}
	    	if(bsfee2==null||bsfee2==""){
	    		bsfee2 = 0;
	    	}
	    	if(rebate2==null||rebate2==""){
	    		rebate2 = 0;
	    	}
			if(selfservcost2==null||selfservcost2==""){
	    		selfservcost2 = 0;
	    	}
	    	if(pmsubfee2==null||pmsubfee2==""){
	    		pmsubfee2 = 0;
	    	}
	    	if(prosubfee2==null||prosubfee2==""){
	    		prosubfee2 = 0;
	    	}
	    	if(inoutfee2==null||inoutfee2==""){
	    		inoutfee2 = 0;
	    	}
	    	if(selfsalecost2==null||selfsalecost2==""){
	    		selfsalecost2 = 0;
	    	}
	    	if(nquosalecost2==null||nquosalecost2==""){
	    		nquosalecost2 = 0;
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
	    	if(pntaxincome1==null||pntaxincome1==""){
	    		pntaxincome1 = 0;
	    	}
	    	if(mntaxincome1==null||mntaxincome1==""){
	    		mntaxincome1 = 0;
	    	}
	    	if(pntaxincome3==null||pntaxincome3==""){
	    		pntaxincome3 = 0;
	    	}
	    	if(mntaxincome3==null||mntaxincome3==""){
	    		mntaxincome3 = 0;
	    	}
	    	if(pntaxincome4==null||pntaxincome4==""){
	    		pntaxincome4 = 0;
	    	}
	    	if(mntaxincome4==null||mntaxincome4==""){
	    		mntaxincome4 = 0;
	    	}
	    	if(taxincome1==null||taxincome1==""){
	    		taxincome1 = 0;
	    	}
	    	if(taxincome3==null||taxincome3==""){
	    		taxincome3 = 0;
	    	}
	    	if(taxincome4==null||taxincome4==""){
	    		taxincome4 = 0;
	    	}
	    	if(receamt4==null||receamt4==""){
	    		receamt4 = 0;
	    	}
	    	if(receamt1==null||receamt1==""){
	    		receamt1 = 0;
	    	}
	    	if(receamt3==null||receamt3==""){
	    		receamt3 = 0;
	    	}
	    	pntaxincome2=Math.round(parseFloat(ptaxincome2)/(1+productrate));
	    	sntaxincome2=Math.round(parseFloat(staxincome2)/(1+servicerate));
	    	mntaxincome2=Math.round(parseFloat(mtaxincome2)/(1+marate));
	    	var startfee5 = delcommafy(document.getElementById("startfee5").innerHTML);
	    	var pntaxincome = parseFloat(pntaxincome1)+pntaxincome2+parseFloat(pntaxincome3)+parseFloat(pntaxincome4);
	    	var mntaxincome = parseFloat(mntaxincome1)+mntaxincome2+parseFloat(mntaxincome3)+parseFloat(mntaxincome4);
	    	ntaxincome2=pntaxincome2+sntaxincome2+mntaxincome2;
			contamt2=parseFloat(pcontamt2)+parseFloat(scontamt2)+parseFloat(mcontamt2);
	    	taxincome2=parseFloat(ptaxincome2)+parseFloat(staxincome2)+parseFloat(mtaxincome2);
	    	bustax2=Math.round(parseFloat(pntaxincome2)*productrate*0.06+parseFloat(sntaxincome2)*servicerate*0.06+parseFloat(mntaxincome2)*marate*0.06);
	    	servcost2 = parseFloat(selfservcost2)+parseFloat(pmsubfee2)+parseFloat(prosubfee2)+parseFloat(inoutfee2);
	    	salecost2 = parseFloat(selfsalecost2)+parseFloat(nquosalecost2);
	    	payback2=parseFloat(pntaxincome2)*paybackPara;
	    	wptotalfee2=ntaxincome2+payback2+servtax2;
	    	if(stSet.caltype){//起步费
		    	if(stSet.caltype == "1"){
		    	}else{
		    		if(pntaxincome+mntaxincome!=0){
						startfee2=(startfee5*(pntaxincome2+mntaxincome2)/(pntaxincome+mntaxincome)).toFixed(2); //起步费
					}
		    	}
	    	}
	    	if(baSet.caltype){//基础比例分成
		    	if(baSet.caltype == "1"){
		    	}else{
					bsfee2 = ((pntaxincome2+mntaxincome2)*parseFloat(baSet.parameters)).toFixed(2);
		    	}
	    	}
	    	if(reSet.caltype){//超额返利
		    	if(reSet.caltype == "1"){
		    	}else{
					rebate2=0; //超额返利1-3季度没有值，数据体现在第四季度
		    	}
	    	}
	    	nui.get("ntaxincome2").setValue(ntaxincome2);
	    	comdshar2 =parseFloat(bsfee2)+ parseFloat(startfee2)-parseFloat(rebate2);//研发分成
	    	nui.get("comdshar2").setValue(comdshar2);
	    	if(msharSet.caltype!="1"){//如果不是手动填写
	    		commshar2 = calCommShar(2)==0?commshar2:calCommShar(2);//计算管理分摊，规则单独处理
	    	}
	    	currentcost2=parseFloat(comdshar2)+parseFloat(comashar2)+parseFloat(commshar2)+parseFloat(salecost2)+parseFloat(servcost2)
	    	-parseFloat(outstock2)+parseFloat(instock2)+baddebts2+bustax2;
	    	profitBBonus2=ntaxincome2-currentcost2+payback2+parseFloat(servtax2);
	    	if(bonusSet.caltype){//奖金占比
		    	if(bonusSet.caltype == "1"){
		    	}else{
					bonus2=profitBBonus2*bonusSet.parameters;//计算规则还未搞明白
		    	}
	    	}
	    	profitABonus2 = profitBBonus2-bonus2;
	    	cashflow2 = parseFloat(receamt2)+payback2+parseFloat(servtax2)-currentcost2-taxincome2+ntaxincome2;
	    	deviation2 = cashflow2-profitBBonus2;
	    	nui.get("contamt2").setValue(contamt2);
	    	nui.get("taxincome2").setValue(taxincome2);
	    	nui.get("pntaxincome2").setValue(pntaxincome2);
	    	nui.get("sntaxincome2").setValue(sntaxincome2);
	    	nui.get("mntaxincome2").setValue(mntaxincome2);
	    	
	    	nui.get("bustax2").setValue(bustax2);
	    	nui.get("cashflow2").setValue(cashflow2);
	    	nui.get("deviation2").setValue(deviation2);
	    	nui.get("currentcost2").setValue(currentcost2);
	    	nui.get("payback2").setValue(payback2);
	    	nui.get("profitBBonus2").setValue(profitBBonus2);
	    	nui.get("bonus2").setValue(bonus2);
	    	nui.get("profitABonus2").setValue(profitABonus2);
	    	nui.get("commshar2").setValue(commshar2);
	    	
	    	nui.get("startfee2").setValue(startfee2);
	    	nui.get("bsfee2").setValue(bsfee2);
	    	nui.get("rebate2").setValue(rebate2);
	    	nui.get("comashar2").setValue(comashar2);
	    	nui.get("servcost2").setValue(servcost2);
			nui.get("salecost2").setValue(salecost2);
	    	nui.get("wptotalfee2").setValue(wptotalfee2);
	    	nui.get("accounts2").setValue(accounts2);
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
			var selfservcost3=nui.get("selfservcost3").getValue(); //自有服务成本
			var pmsubfee3=nui.get("pmsubfee3").getValue(); //人月外包
			var prosubfee3=nui.get("prosubfee3").getValue(); //其他采购
			var inoutfee3=nui.get("inoutfee3").getValue(); //净买入
			var selfsalecost3=nui.get("selfsalecost3").getValue(); //自有销售费用
			var nquosalecost3=nui.get("nquosalecost3").getValue(); //非额度销售费用
			var baddebts3=nui.get("baddebts3").getValue(); //坏账核销
			var assetlose3=nui.get("assetlose3").getValue();//资产减值损失
			var instock3=nui.get("instock3").getValue(); //转入存货成本
			var outstock3=nui.get("outstock3").getValue(); //转出存货成本
			var servtax3=nui.get("servtax3").getValue(); //服务税抵扣
			//其他季度产品毛收入ma毛收入用于计算汇总毛收入，用于计算起步费和超额返利
			var pntaxincome1=nui.get("pntaxincome1").getValue(); //产品毛收入
			var mntaxincome1=nui.get("mntaxincome1").getValue(); //MA毛收入
			var pntaxincome2=nui.get("pntaxincome2").getValue(); //产品毛收入
			var mntaxincome2=nui.get("mntaxincome2").getValue(); //MA毛收入
			var pntaxincome4=nui.get("pntaxincome4").getValue(); //产品毛收入
			var mntaxincome4=nui.get("mntaxincome4").getValue(); //MA毛收入
			//其他几个季度的收款额和营业收入，用于计算应收账款
			var receamt1=nui.get("receamt1").getValue(); //收款额
			var receamt2=nui.get("receamt2").getValue(); //收款额
			var receamt4=nui.get("receamt4").getValue(); //收款额
			var taxincome1=nui.get("taxincome1").getValue(); //营业收入
			var taxincome2=nui.get("taxincome2").getValue(); //营业收入
			var taxincome4=nui.get("taxincome4").getValue(); //营业收入
			var bonus3=nui.get("bonus3").getValue(); //奖金
			var contamt3=0; //合同额
			var taxincome3=0; //营业收入(含税)
			var ntaxincome3=0; //营业毛收入(不含税)
			var pntaxincome3=0; //产品毛收入
			var sntaxincome3=0; //MA毛收入
			var mntaxincome3=0; //服务毛收入
			var bustax3=0; //营业税金及附加
			var currentcost3=0; // 当期发生成本
			var payback3=0; //退税
			var profitBBonus3=0; //奖金前利润
			var profitABonus3=0; //奖金后利润
			var commshar3=nui.get("commshar3").getValue(); //公司管理分摊
			var comashar3=nui.get("comashar3").getValue(); //公司市场分摊
			var comdshar3=nui.get("comdshar3").getValue(); //公司研发分摊
			var startfee3=nui.get("startfee3").getValue(); //起步费
			var bsfee3=nui.get("bsfee3").getValue(); //基础比例分成费
			var rebate3=nui.get("rebate3").getValue(); //超额返利
			var servcost3 = 0;//服务成本
			var salecost3=0; //销售费用
			var wptotalfee3=0; //包含退税后的总收入
			var cashflow3=0; //经营净现金流
			var deviation3=0; //经营净现金流与奖前利润正偏离
			var accounts3 = 0;//应收账款 
			if(comashar3==null||comashar3==""){
	    		comashar3 = 0;
	    	}
	    	if(comdshar3==null||comdshar3==""){
	    		comdshar3 = 0;
	    	}
	    	if(commshar3==null||commshar3==""){
	    		commshar3 = 0;
	    	}
	    	if(startfee3==null||startfee3==""){
	    		startfee3 = 0;
	    	}
	    	if(bsfee3==null||bsfee3==""){
	    		bsfee3 = 0;
	    	}
	    	if(rebate3==null||rebate3==""){
	    		rebate3 = 0;
	    	}
			if(selfservcost3==null||selfservcost3==""){
	    		selfservcost3 = 0;
	    	}
	    	if(pmsubfee3==null||pmsubfee3==""){
	    		pmsubfee3 = 0;
	    	}
	    	if(prosubfee3==null||prosubfee3==""){
	    		prosubfee3 = 0;
	    	}
	    	if(inoutfee3==null||inoutfee3==""){
	    		inoutfee3 = 0;
	    	}
	    	if(selfsalecost3==null||selfsalecost3==""){
	    		selfsalecost3 = 0;
	    	}
	    	if(nquosalecost3==null||nquosalecost3==""){
	    		nquosalecost3 = 0;
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
	    	if(pntaxincome1==null||pntaxincome1==""){
	    		pntaxincome1 = 0;
	    	}
	    	if(mntaxincome1==null||mntaxincome1==""){
	    		mntaxincome1 = 0;
	    	}
	    	if(pntaxincome2==null||pntaxincome2==""){
	    		pntaxincome2 = 0;
	    	}
	    	if(mntaxincome2==null||mntaxincome2==""){
	    		mntaxincome2 = 0;
	    	}
	    	if(pntaxincome4==null||pntaxincome4==""){
	    		pntaxincome4 = 0;
	    	}
	    	if(mntaxincome4==null||mntaxincome4==""){
	    		mntaxincome4 = 0;
	    	}
	    	if(taxincome1==null||taxincome1==""){
	    		taxincome1 = 0;
	    	}
	    	if(taxincome2==null||taxincome2==""){
	    		taxincome2 = 0;
	    	}
	    	if(taxincome4==null||taxincome4==""){
	    		taxincome4 = 0;
	    	}
	    	if(receamt4==null||receamt4==""){
	    		receamt4 = 0;
	    	}
	    	if(receamt1==null||receamt1==""){
	    		receamt1 = 0;
	    	}
	    	if(receamt2==null||receamt2==""){
	    		receamt2 = 0;
	    	}
	    	pntaxincome3=Math.round(parseFloat(ptaxincome3)/(1+productrate));
	    	sntaxincome3=Math.round(parseFloat(staxincome3)/(1+servicerate));
	    	mntaxincome3=Math.round(parseFloat(mtaxincome3)/(1+marate));
	    	ntaxincome3=pntaxincome3+sntaxincome3+mntaxincome3;
	    	var startfee5 = delcommafy(document.getElementById("startfee5").innerHTML);
	    	var pntaxincome = parseFloat(pntaxincome1)+parseFloat(pntaxincome2)+pntaxincome3+parseFloat(pntaxincome4);
	    	var mntaxincome = parseFloat(mntaxincome1)+parseFloat(mntaxincome2)+mntaxincome3+parseFloat(mntaxincome4);
	    	contamt3=parseFloat(pcontamt3)+parseFloat(scontamt3)+parseFloat(mcontamt3);
	    	taxincome3=parseFloat(ptaxincome3)+parseFloat(staxincome3)+parseFloat(mtaxincome3);
	    	bustax3=Math.round(parseFloat(pntaxincome3)*productrate*0.06+parseFloat(sntaxincome3)*servicerate*0.06+parseFloat(mntaxincome3)*marate*0.06);
	    	servcost3 = parseFloat(selfservcost3)+parseFloat(pmsubfee3)+parseFloat(prosubfee3)+parseFloat(inoutfee3);
	    	salecost3 = parseFloat(selfsalecost3)+parseFloat(nquosalecost3);
	    	payback3=parseFloat(pntaxincome3)*paybackPara;
	    	wptotalfee3=ntaxincome3+payback3+servtax3;
	    	if(stSet.caltype){//起步费
		    	if(stSet.caltype == "1"){
		    	}else{
		    		if(pntaxincome+mntaxincome!=0){
						startfee3=(startfee5*(pntaxincome3+mntaxincome3)/(pntaxincome+mntaxincome)).toFixed(2); //起步费
					}
		    	}
	    	}
	    	if(baSet.caltype){//基础比例分成
		    	if(baSet.caltype == "1"){
		    	}else{
					bsfee3 = ((pntaxincome3+mntaxincome3)*parseFloat(baSet.parameters)).toFixed(2);
		    	}
	    	}
	    	if(reSet.caltype){//超额返利
		    	if(reSet.caltype == "1"){
		    	}else{
					rebate3=0; //超额返利1-3季度没有值，数据体现在第四季度
		    	}
	    	}
	    	nui.get("ntaxincome3").setValue(ntaxincome3);
	    	comdshar3 =parseFloat(bsfee3)+ parseFloat(startfee3)-parseFloat(rebate3);//研发分成
	    	nui.get("comdshar3").setValue(comdshar3);
	    	if(msharSet.caltype!="1"){//如果不是手动填写
	    		commshar3 = calCommShar(3)==0?commshar3:calCommShar(3);//计算管理分摊，规则单独处理 
	    	}
	    	currentcost3=parseFloat(comdshar3)+parseFloat(comashar3)+parseFloat(commshar3)+parseFloat(salecost3)+parseFloat(servcost3)
	    	-parseFloat(outstock3)+parseFloat(instock3)+baddebts3+bustax3;
	    	profitBBonus3=ntaxincome3-currentcost3+payback3+parseFloat(servtax3);
	    	if(bonusSet.caltype){//奖金占比
		    	if(bonusSet.caltype == "1"){
		    	}else{
					bonus3=profitBBonus3*bonusSet.parameters;
		    	}
	    	}
	    	profitABonus3 = profitBBonus3-bonus3;
	    	cashflow3 = parseFloat(receamt3)+payback3+parseFloat(servtax3)-currentcost3-taxincome3+ntaxincome3;
	    	deviation3 = cashflow3-profitBBonus3;
	    	nui.get("contamt3").setValue(contamt3);
	    	nui.get("taxincome3").setValue(taxincome3);
	    	nui.get("pntaxincome3").setValue(pntaxincome3);
	    	nui.get("sntaxincome3").setValue(sntaxincome3);
	    	nui.get("mntaxincome3").setValue(mntaxincome3);
	    	
	    	nui.get("bustax3").setValue(bustax3);
	    	nui.get("cashflow3").setValue(cashflow3);
	    	nui.get("deviation3").setValue(deviation3);
	    	nui.get("currentcost3").setValue(currentcost3);
	    	nui.get("payback3").setValue(payback3);
	    	nui.get("profitBBonus3").setValue(profitBBonus3);
	    	nui.get("bonus3").setValue(bonus3);
	    	nui.get("profitABonus3").setValue(profitABonus3);
	    	nui.get("commshar3").setValue(commshar3);
	    	
	    	nui.get("startfee3").setValue(startfee3);
	    	nui.get("bsfee3").setValue(bsfee3);
	    	nui.get("rebate3").setValue(rebate3);
	    	nui.get("comashar3").setValue(comashar3);
	    	nui.get("servcost3").setValue(servcost3);
	    	nui.get("salecost3").setValue(salecost3);
	    	nui.get("wptotalfee3").setValue(wptotalfee3);
	    	nui.get("accounts3").setValue(accounts3);
	    	calSum();
		}
		//Q4季度计算
		function doCal4(e){
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
			var selfservcost4=nui.get("selfservcost4").getValue(); //自有服务成本
			var pmsubfee4=nui.get("pmsubfee4").getValue(); //人月外包
			var prosubfee4=nui.get("prosubfee4").getValue(); //其他采购
			var inoutfee4=nui.get("inoutfee4").getValue(); //净买入
			var selfsalecost4=nui.get("selfsalecost4").getValue(); //自有销售费用
			var nquosalecost4=nui.get("nquosalecost4").getValue(); //非额度销售费用
			var baddebts4=nui.get("baddebts4").getValue(); //坏账核销
			var assetlose4=nui.get("assetlose4").getValue();//资产减值损失
			var instock4=nui.get("instock4").getValue(); //转入存货成本
			var outstock4=nui.get("outstock4").getValue(); //转出存货成本
			var servtax4=nui.get("servtax4").getValue(); //服务税抵扣
			//其他季度产品毛收入ma毛收入用于计算汇总毛收入，用于计算起步费和超额返利
			var pntaxincome1=nui.get("pntaxincome1").getValue(); //产品毛收入
			var mntaxincome1=nui.get("mntaxincome1").getValue(); //MA毛收入
			var pntaxincome2=nui.get("pntaxincome2").getValue(); //产品毛收入
			var mntaxincome2=nui.get("mntaxincome2").getValue(); //MA毛收入
			var pntaxincome3=nui.get("pntaxincome3").getValue(); //产品毛收入
			var mntaxincome3=nui.get("mntaxincome3").getValue(); //MA毛收入
			//其他几个季度的收款额和营业收入，用于计算应收账款
			var receamt1=nui.get("receamt1").getValue(); //收款额
			var receamt2=nui.get("receamt2").getValue(); //收款额
			var receamt3=nui.get("receamt3").getValue(); //收款额
			var taxincome1=nui.get("taxincome1").getValue(); //营业收入
			var taxincome2=nui.get("taxincome2").getValue(); //营业收入
			var taxincome3=nui.get("taxincome3").getValue(); //营业收入
			var bonus4=nui.get("bonus4").getValue(); //奖金
			var contamt4=0; //合同额
			var taxincome4=0; //营业收入(含税)
			var ntaxincome4=0; //营业毛收入(不含税)
			var pntaxincome4=0; //产品毛收入
			var sntaxincome4=0; //MA毛收入
			var mntaxincome4=0; //服务毛收入
			var bustax4=0; //营业税金及附加
			var currentcost4=0; // 当期发生成本
			var payback4=0; //退税
			var profitBBonus4=0; //奖金前利润
			var profitABonus4=0; //奖金后利润
			var commshar4=nui.get("commshar4").getValue(); //公司管理分摊
			var comashar4=nui.get("comashar4").getValue(); //公司市场分摊
			var comdshar4=nui.get("comdshar4").getValue(); //公司研发分摊
			var startfee4=nui.get("startfee4").getValue(); //起步费
			var bsfee4=nui.get("bsfee4").getValue(); //基础比例分成费
			var rebate4=nui.get("rebate4").getValue(); //超额返利
			var servcost4 = 0;//服务成本
			var salecost4=0; //销售费用
			var wptotalfee4=0; //包含退税后的总收入
			var cashflow4=0; //经营净现金流
			var deviation4=0; //经营净现金流与奖前利润正偏离
			var accounts4 = 0;//应收账款 
			if(comashar4==null||comashar4==""){
	    		comashar4 = 0;
	    	}
	    	if(comdshar4==null||comdshar4==""){
	    		comdshar4 = 0;
	    	}
	    	if(commshar4==null||commshar4==""){
	    		commshar4 = 0;
	    	}
	    	if(startfee4==null||startfee4==""){
	    		startfee4 = 0;
	    	}
	    	if(bsfee4==null||bsfee4==""){
	    		bsfee4 = 0;
	    	}
	    	if(rebate4==null||rebate4==""){
	    		rebate4 = 0;
	    	}
			if(selfservcost4==null||selfservcost4==""){
	    		selfservcost4 = 0;
	    	}
	    	if(pmsubfee4==null||pmsubfee4==""){
	    		pmsubfee4 = 0;
	    	}
	    	if(prosubfee4==null||prosubfee4==""){
	    		prosubfee4 = 0;
	    	}
	    	if(inoutfee4==null||inoutfee4==""){
	    		inoutfee4 = 0;
	    	}
	    	if(selfsalecost4==null||selfsalecost4==""){
	    		selfsalecost4 = 0;
	    	}
	    	if(nquosalecost4==null||nquosalecost4==""){
	    		nquosalecost4 = 0;
	    	}
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
	    	if(pntaxincome1==null||pntaxincome1==""){
	    		pntaxincome1 = 0;
	    	}
	    	if(mntaxincome1==null||mntaxincome1==""){
	    		mntaxincome1 = 0;
	    	}
	    	if(pntaxincome2==null||pntaxincome2==""){
	    		pntaxincome2 = 0;
	    	}
	    	if(mntaxincome2==null||mntaxincome2==""){
	    		mntaxincome2 = 0;
	    	}
	    	if(pntaxincome3==null||pntaxincome3==""){
	    		pntaxincome3 = 0;
	    	}
	    	if(mntaxincome3==null||mntaxincome3==""){
	    		mntaxincome3 = 0;
	    	}
	    	if(taxincome1==null||taxincome1==""){
	    		taxincome1 = 0;
	    	}
	    	if(taxincome2==null||taxincome2==""){
	    		taxincome2 = 0;
	    	}
	    	if(taxincome3==null||taxincome3==""){
	    		taxincome3 = 0;
	    	}
	    	if(receamt3==null||receamt3==""){
	    		receamt3 = 0;
	    	}
	    	if(receamt1==null||receamt1==""){
	    		receamt1 = 0;
	    	}
	    	if(receamt2==null||receamt2==""){
	    		receamt2 = 0;
	    	}
	    	pntaxincome4=Math.round(parseFloat(ptaxincome4)/(1+productrate));
	    	sntaxincome4=Math.round(parseFloat(staxincome4)/(1+servicerate));
	    	mntaxincome4=Math.round(parseFloat(mtaxincome4)/(1+marate));
	    	ntaxincome4=pntaxincome4+sntaxincome4+mntaxincome4;
	    	var startfee5 = delcommafy(document.getElementById("startfee5").innerHTML);
	    	var pntaxincome5 = delcommafy(document.getElementById("pntaxincome5").innerHTML);
	    	var pntaxincome = parseFloat(pntaxincome1)+parseFloat(pntaxincome2)+parseFloat(pntaxincome3)+pntaxincome4;
	    	var mntaxincome = parseFloat(mntaxincome1)+parseFloat(mntaxincome2)+parseFloat(mntaxincome3)+mntaxincome4;
			contamt4=parseFloat(pcontamt4)+parseFloat(scontamt4)+parseFloat(mcontamt4);
	    	taxincome4=parseFloat(ptaxincome4)+parseFloat(staxincome4)+parseFloat(mtaxincome4);
	    	var accounts5 = delcommafy(document.getElementById("accounts5").innerHTML);
	    	accounts4 = accounts5+parseFloat(taxincome1)+parseFloat(taxincome2)+parseFloat(taxincome3)+parseFloat(taxincome4)-parseFloat(receamt1)-parseFloat(receamt2)-parseFloat(receamt3)-parseFloat(receamt4);
	    	bustax4=Math.round(parseFloat(pntaxincome4)*productrate*0.06+parseFloat(sntaxincome4)*servicerate*0.06+parseFloat(mntaxincome4)*marate*0.06);
	    	servcost4 = parseFloat(selfservcost4)+parseFloat(pmsubfee4)+parseFloat(prosubfee4)+parseFloat(inoutfee4);
	    	salecost4 = parseFloat(selfsalecost4)+parseFloat(nquosalecost4);
	    	payback4=parseFloat(pntaxincome4)*paybackPara;
    		wptotalfee4=ntaxincome4+payback4+servtax4;
	    	if(stSet.caltype){//起步费
		    	if(stSet.caltype == "1"){
		    	}else{
		    		if(pntaxincome+mntaxincome!=0){
						startfee4=(startfee5*(pntaxincome4+mntaxincome4)/(pntaxincome+mntaxincome)).toFixed(2); //起步费
					}
		    	}
	    	}
	    	if(baSet.caltype){//基础比例分成
		    	if(baSet.caltype == "1"){
		    	}else{
					bsfee4 = ((pntaxincome4+mntaxincome4)*parseFloat(baSet.parameters)).toFixed(2);
		    	}
	    	}
	    	if(reSet.caltype){//超额返利
		    	if(reSet.caltype == "1"){
		    	}else{
					if(pntaxincome/parseFloat(pntaxincome5)-1<=0||pntaxincome5==0){
						rebate4=0; 
					}else{
						if(pntaxincome/parseFloat(pntaxincome5)-1<=0.1){
							rebate4 = parseFloat(pntaxincome5)*(pntaxincome/parseFloat(pntaxincome5)-1)*0.2*parseFloat(reSet.parameters);
						}else{
							rebate4 = parseFloat(pntaxincome5)*0.1*0.2*parseFloat(reSet.parameters)+parseFloat(pntaxincome5)*(pntaxincome/parseFloat(pntaxincome5)-1-0.1)*0.5*parseFloat(reSet.parameters);
						}
					} //超额返利1-3季度没有值，数据体现在第四季度
		    	}
	    	}
	    	comdshar4 =parseFloat(bsfee4)+ parseFloat(startfee4)-parseFloat(rebate4);//研发分成
	    	nui.get("comdshar4").setValue(comdshar4);
	    	nui.get("ntaxincome4").setValue(ntaxincome4);
	    	if(msharSet.caltype!="1"){//如果不是手动填写
	    		commshar4 = calCommShar(4)==0?commshar4:calCommShar(4);//计算管理分摊，规则单独处理 
	    	}
	    	currentcost4=parseFloat(comdshar4)+parseFloat(comashar4)+parseFloat(commshar4)+parseFloat(salecost4)+parseFloat(servcost4)
	    	-parseFloat(outstock4)+parseFloat(instock4)+baddebts4+bustax4;
	    	profitBBonus4=ntaxincome4-currentcost4+payback4+parseFloat(servtax4);
	    	if(bonusSet.caltype){//奖金占比
		    	if(bonusSet.caltype == "1"){
		    	}else{
					bonus4=profitBBonus4*bonusSet.parameters;
		    	}
	    	}
	    	profitABonus4 = profitBBonus4-bonus4;
	    	cashflow4 = parseFloat(receamt4)+payback4+parseFloat(servtax4)-currentcost4-taxincome4+ntaxincome4;
	    	deviation4 = cashflow4-profitBBonus4;
	    	nui.get("contamt4").setValue(contamt4);
	    	nui.get("taxincome4").setValue(taxincome4);
	    	nui.get("pntaxincome4").setValue(pntaxincome4);
	    	nui.get("sntaxincome4").setValue(sntaxincome4);
	    	nui.get("mntaxincome4").setValue(mntaxincome4);
	    	
	    	nui.get("bustax4").setValue(bustax4);
	    	nui.get("currentcost4").setValue(currentcost4);
	    	nui.get("payback4").setValue(payback4);
	    	nui.get("profitBBonus4").setValue(profitBBonus4);
	    	nui.get("bonus4").setValue(bonus4);
	    	nui.get("profitABonus4").setValue(profitABonus4);
	    	nui.get("commshar4").setValue(commshar4);
	    	nui.get("comashar4").setValue(comashar4);
	    	nui.get("startfee4").setValue(startfee4);
	    	nui.get("bsfee4").setValue(bsfee4);
	    	nui.get("rebate4").setValue(rebate4);
	    	nui.get("wptotalfee4").setValue(wptotalfee4);
	    	nui.get("cashflow4").setValue(cashflow4);
	    	nui.get("servcost4").setValue(servcost4);
			nui.get("salecost4").setValue(salecost4);
	    	nui.get("deviation4").setValue(deviation4);
	    	nui.get("accounts4").setValue(accounts4);
	    	calSum();
			if(e){
				callBack();
			}
		}
		function callBack(){
			doCal1();
        	doCal2();
        	doCal3();
        	doCal4();
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
	    	var bustax1=nui.get("bustax1").getValue();
	    	var bustax3=nui.get("bustax3").getValue();
	    	var bustax2=nui.get("bustax2").getValue();
	    	var bustax4=nui.get("bustax4").getValue();
	    	var currentcost1=nui.get("currentcost1").getValue();
	    	var currentcost3=nui.get("currentcost3").getValue();
	    	var currentcost2=nui.get("currentcost2").getValue();
	    	var currentcost4=nui.get("currentcost4").getValue();
	    	var servcost1=nui.get("servcost1").getValue();
	    	var servcost3=nui.get("servcost3").getValue();
	    	var servcost2=nui.get("servcost2").getValue();
	    	var servcost4=nui.get("servcost4").getValue();
	    	var selfservcost1=nui.get("selfservcost1").getValue();
	    	var selfservcost3=nui.get("selfservcost3").getValue();
	    	var selfservcost2=nui.get("selfservcost2").getValue();
	    	var selfservcost4=nui.get("selfservcost4").getValue();
	    	var pmsubfee1=nui.get("pmsubfee1").getValue();
	    	var pmsubfee3=nui.get("pmsubfee3").getValue();
	    	var pmsubfee2=nui.get("pmsubfee2").getValue();
	    	var pmsubfee4=nui.get("pmsubfee4").getValue();
	    	var prosubfee1=nui.get("prosubfee1").getValue();
	    	var prosubfee3=nui.get("prosubfee3").getValue();
	    	var prosubfee2=nui.get("prosubfee2").getValue();
	    	var prosubfee4=nui.get("prosubfee4").getValue();
	    	var inoutfee1=nui.get("inoutfee1").getValue();
	    	var inoutfee3=nui.get("inoutfee3").getValue();
	    	var inoutfee2=nui.get("inoutfee2").getValue();
	    	var inoutfee4=nui.get("inoutfee4").getValue();
	    	var salecost1=nui.get("salecost1").getValue();
	    	var salecost3=nui.get("salecost3").getValue();
	    	var salecost2=nui.get("salecost2").getValue();
	    	var salecost4=nui.get("salecost4").getValue();
	    	var selfsalecost1=nui.get("selfsalecost1").getValue();
	    	var selfsalecost3=nui.get("selfsalecost3").getValue();
	    	var selfsalecost2=nui.get("selfsalecost2").getValue();
	    	var selfsalecost4=nui.get("selfsalecost4").getValue();
	    	var nquosalecost1=nui.get("nquosalecost1").getValue();
	    	var nquosalecost3=nui.get("nquosalecost3").getValue();
	    	var nquosalecost2=nui.get("nquosalecost2").getValue();
	    	var nquosalecost4=nui.get("nquosalecost4").getValue();
	    	var wptotalfee1=nui.get("wptotalfee1").getValue();
	    	var wptotalfee3=nui.get("wptotalfee3").getValue();
	    	var wptotalfee2=nui.get("wptotalfee2").getValue();
	    	var wptotalfee4=nui.get("wptotalfee4").getValue();
	    	var cashflow1=nui.get("cashflow1").getValue();
	    	var cashflow3=nui.get("cashflow3").getValue();
	    	var cashflow2=nui.get("cashflow2").getValue();
	    	var cashflow4=nui.get("cashflow4").getValue();
	    	var deviation1=nui.get("deviation1").getValue();
	    	var deviation3=nui.get("deviation3").getValue();
	    	var deviation2=nui.get("deviation2").getValue();
	    	var deviation4=nui.get("deviation4").getValue();
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
	    	var startfee1=nui.get("startfee1").getValue();
	    	var startfee3=nui.get("startfee3").getValue();
	    	var startfee2=nui.get("startfee2").getValue();
	    	var startfee4=nui.get("startfee4").getValue();
	    	var bsfee1=nui.get("bsfee1").getValue();
	    	var bsfee3=nui.get("bsfee3").getValue();
	    	var bsfee2=nui.get("bsfee2").getValue();
	    	var bsfee4=nui.get("bsfee4").getValue();
	    	var rebate1=nui.get("rebate1").getValue();
	    	var rebate3=nui.get("rebate3").getValue();
	    	var rebate2=nui.get("rebate2").getValue();
	    	var rebate4=nui.get("rebate4").getValue();
	    	var accounts1=nui.get("accounts1").getValue();
	    	var accounts3=nui.get("accounts3").getValue();
	    	var accounts2=nui.get("accounts2").getValue();
	    	var accounts4=nui.get("accounts4").getValue();
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
	    	var bustax=bustax1+bustax2+bustax3+bustax4;
	    	var currentcost=currentcost1+currentcost2+currentcost3+currentcost4;
	    	var servcost=servcost1+servcost2+servcost3+servcost4;
	    	var selfservcost=selfservcost1+selfservcost2+selfservcost3+selfservcost4;
	    	var pmsubfee=pmsubfee1+pmsubfee2+pmsubfee3+pmsubfee4;
	    	var prosubfee=prosubfee1+prosubfee2+prosubfee3+prosubfee4;
	    	var inoutfee=inoutfee1+inoutfee2+inoutfee3+inoutfee4;
	    	var salecost=salecost1+salecost2+salecost3+salecost4;
	    	var selfsalecost=selfsalecost1+selfsalecost2+selfsalecost3+selfsalecost4;
	    	var nquosalecost=nquosalecost1+nquosalecost2+nquosalecost3+nquosalecost4;
	    	var wptotalfee=wptotalfee1+wptotalfee2+wptotalfee3+wptotalfee4;
	    	var cashflow=cashflow1+cashflow2+cashflow3+cashflow4;
	    	var deviation=deviation1+deviation2+deviation3+deviation4;
	    	var commshar=commshar1+commshar2+commshar3+commshar4;
	    	var comashar=comashar1+comashar2+comashar3+comashar4;
	    	var comdshar=comdshar1+comdshar2+comdshar3+comdshar4;
	    	var startfee=startfee1+startfee2+startfee3+startfee4;
	    	var rebate=rebate1+rebate2+rebate3+rebate4;
	    	var bsfee=bsfee1+bsfee2+bsfee3+bsfee4;
	    	var accounts=accounts1+accounts2+accounts3+accounts4;
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
	    	document.getElementById("bustax").innerHTML = bustax == null ? "":formatNumber(bustax);
	    	document.getElementById("currentcost").innerHTML = currentcost == null ? "":formatNumber(currentcost);
	    	document.getElementById("servcost").innerHTML = servcost == null ? "":formatNumber(servcost);
	    	document.getElementById("salecost").innerHTML = salecost == null ? "":formatNumber(salecost);
	    	document.getElementById("commshar").innerHTML = commshar == null ? "":formatNumber(commshar);
	    	document.getElementById("comashar").innerHTML = comashar == null ? "":formatNumber(comashar);
	    	document.getElementById("comdshar").innerHTML = comdshar == null ? "":formatNumber(comdshar);
	    	document.getElementById("startfee").innerHTML = startfee == null ? "":formatNumber(startfee);
	    	document.getElementById("bsfee").innerHTML = bsfee == null ? "":formatNumber(bsfee);
	    	document.getElementById("rebate").innerHTML = rebate == null ? "":formatNumber(rebate);
	    	document.getElementById("accounts").innerHTML = accounts == null ? "":formatNumber(accounts);
	    	document.getElementById("baddebts").innerHTML = baddebts == null ? "":formatNumber(baddebts);
	    	document.getElementById("assetlose").innerHTML = assetlose == null ? "":formatNumber(assetlose);
	    	document.getElementById("instock").innerHTML = instock == null ? "":formatNumber(instock);
	    	document.getElementById("outstock").innerHTML = outstock == null ? "":formatNumber(outstock);
	    	document.getElementById("payback").innerHTML = payback == null ? "":formatNumber(payback);
	    	document.getElementById("bonus").innerHTML = bonus == null ? "":formatNumber(bonus);
	    	document.getElementById("servtax").innerHTML = servtax == null ? "":formatNumber(servtax);
	    	document.getElementById("profitBBonus").innerHTML = profitBBonus == null ? "":formatNumber(profitBBonus);
	    	document.getElementById("selfservcost").innerHTML = selfservcost == null ? "":formatNumber(selfservcost);
	    	document.getElementById("pmsubfee").innerHTML = pmsubfee == null ? "":formatNumber(pmsubfee);
	    	document.getElementById("prosubfee").innerHTML = prosubfee == null ? "":formatNumber(prosubfee);
	    	document.getElementById("inoutfee").innerHTML = inoutfee == null ? "":formatNumber(inoutfee);
	    	document.getElementById("selfsalecost").innerHTML = selfsalecost == null ? "":formatNumber(selfsalecost);
	    	document.getElementById("nquosalecost").innerHTML = nquosalecost == null ? "":formatNumber(nquosalecost);
	    	document.getElementById("wptotalfee").innerHTML = wptotalfee == null ? "":formatNumber(wptotalfee);
	    	document.getElementById("cashflow").innerHTML = cashflow == null ? "":formatNumber(cashflow);
	    	document.getElementById("deviation").innerHTML = deviation == null ? "":formatNumber(deviation);
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
	    	var bustax=delcommafy(document.getElementById("bustax").innerHTML);
	    	var bustax5=delcommafy(document.getElementById("bustax5").innerHTML);
	    	var currentcost=delcommafy(document.getElementById("currentcost").innerHTML);
	    	var currentcost5=delcommafy(document.getElementById("currentcost5").innerHTML);
	    	var selfservcost5=delcommafy(document.getElementById("selfservcost5").innerHTML);
	    	var selfservcost=delcommafy(document.getElementById("selfservcost").innerHTML);
	    	var pmsubfee5=delcommafy(document.getElementById("pmsubfee5").innerHTML);
	    	var pmsubfee=delcommafy(document.getElementById("pmsubfee").innerHTML);
	    	var prosubfee5=delcommafy(document.getElementById("prosubfee5").innerHTML);
	    	var prosubfee=delcommafy(document.getElementById("prosubfee").innerHTML);
	    	var inoutfee5=delcommafy(document.getElementById("inoutfee5").innerHTML);
	    	var inoutfee=delcommafy(document.getElementById("inoutfee").innerHTML);
	    	var selfsalecost5=delcommafy(document.getElementById("selfsalecost5").innerHTML);
	    	var selfsalecost=delcommafy(document.getElementById("selfsalecost").innerHTML);
	    	var nquosalecost5=delcommafy(document.getElementById("nquosalecost5").innerHTML);
	    	var nquosalecost=delcommafy(document.getElementById("nquosalecost").innerHTML);
	    	var wptotalfee5=delcommafy(document.getElementById("wptotalfee5").innerHTML);
	    	var wptotalfee=delcommafy(document.getElementById("wptotalfee").innerHTML);
	    	var cashflow5=delcommafy(document.getElementById("cashflow5").innerHTML);
	    	var cashflow=delcommafy(document.getElementById("cashflow").innerHTML);
	    	var deviation5=delcommafy(document.getElementById("deviation5").innerHTML);
	    	var deviation=delcommafy(document.getElementById("deviation").innerHTML);
	    	var servcost5=delcommafy(document.getElementById("servcost5").innerHTML);
	    	var servcost=delcommafy(document.getElementById("servcost").innerHTML);
	    	var salecost=delcommafy(document.getElementById("salecost").innerHTML);
	    	var salecost5=delcommafy(document.getElementById("salecost5").innerHTML);
	    	var commshar=delcommafy(document.getElementById("commshar").innerHTML);
	    	var commshar5=delcommafy(document.getElementById("commshar5").innerHTML);
	    	var comashar=delcommafy(document.getElementById("comashar").innerHTML);
	    	var comashar5=delcommafy(document.getElementById("comashar5").innerHTML);
	    	var comdshar=delcommafy(document.getElementById("comdshar").innerHTML);
	    	var comdshar5=delcommafy(document.getElementById("comdshar5").innerHTML);
	    	var startfee=delcommafy(document.getElementById("startfee").innerHTML);
	    	var startfee5=delcommafy(document.getElementById("startfee5").innerHTML);
	    	var bsfee=delcommafy(document.getElementById("bsfee").innerHTML);
	    	var bsfee5=delcommafy(document.getElementById("bsfee5").innerHTML);
	    	var rebate=delcommafy(document.getElementById("rebate").innerHTML);
	    	var rebate5=delcommafy(document.getElementById("rebate5").innerHTML);
	    	var accounts=delcommafy(document.getElementById("accounts").innerHTML);
	    	var accounts5=delcommafy(document.getElementById("accounts5").innerHTML);
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
	    	var bustax6=0;
	    	var currentcost6=0;
	    	var servcost6=0;
	    	var salecost6=0;
	    	var commshar6=0;
	    	var comashar6=0;
	    	var comdshar6=0;
	    	var startfee6=0;
	    	var bsfee6=0;
	    	var rebate6=0;
	    	var accounts6=0;
	    	var baddebts6=0;
	    	var assetlose6=0;
	    	var instock6=0;
	    	var outstock6=0;
	    	var payback6=0;
	    	var servtax6=0;
	    	var bonus6=0;
	    	var deviation6=0;
	    	var cashflow6=0;
	    	var wptotalfee6=0;
	    	var nquosalecost6=0;
	    	var selfsalecost6=0;
	    	var inoutfee6=0;
	    	var prosubfee6=0;
	    	var pmsubfee6=0;
	    	var selfservcost6=0;
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
			if(bustax5 !=0 && bustax5 != "" && bustax5!=null){
				bustax6=(bustax/bustax5-1).toFixed(3);
			}
			if(currentcost5 !=0 && currentcost5 != "" && currentcost5!=null){
				currentcost6=(currentcost/currentcost5-1).toFixed(3);
			}
			if(servcost5 !=0 && servcost5 != "" && servcost5!=null){
				servcost6=(servcost/servcost5-1).toFixed(3);
			}
			if(selfservcost5 !=0 && selfservcost5 != "" && selfservcost5!=null){
				selfservcost6=(selfservcost/selfservcost5-1).toFixed(3);
			}
			if(pmsubfee5 !=0 && pmsubfee5 != "" && pmsubfee5!=null){
				pmsubfee6=(pmsubfee/pmsubfee5-1).toFixed(3);
			}
			if(prosubfee5 !=0 && prosubfee5 != "" && prosubfee5!=null){
				prosubfee6=(prosubfee/prosubfee5-1).toFixed(3);
			}
			if(inoutfee5 !=0 && inoutfee5 != "" && inoutfee5!=null){
				inoutfee6=(inoutfee/inoutfee5-1).toFixed(3);
			}
			if(selfsalecost5 !=0 && selfsalecost5 != "" && selfsalecost5!=null){
				selfsalecost6=(selfsalecost/selfsalecost5-1).toFixed(3);
			}
			if(nquosalecost5 !=0 && nquosalecost5 != "" && nquosalecost5!=null){
				nquosalecost6=(nquosalecost/nquosalecost5-1).toFixed(3);
			}
			if(wptotalfee5 !=0 && wptotalfee5 != "" && wptotalfee5!=null){
				wptotalfee6=(wptotalfee/wptotalfee5-1).toFixed(3);
			}
			if(cashflow5 !=0 && cashflow5 != "" && cashflow5!=null){
				cashflow6=(cashflow/cashflow5-1).toFixed(3);
			}
			if(deviation5 !=0 && deviation5 != "" && deviation5!=null){
				deviation6=(deviation/deviation5-1).toFixed(3);
			}
			if(salecost5 !=0 && salecost5 != "" && salecost5!=null){
				salecost6=(salecost/salecost5-1).toFixed(3);
			}
			if(commshar5 !=0 && commshar5 != "" && commshar5!=null){
				commshar6=(commshar/commshar5-1).toFixed(3);
			}
			if(comashar5 !=0 && comashar5 != "" && comashar5!=null){
				comashar6=(comashar/comashar5-1).toFixed(3);
			}
			if(comdshar5 !=0 && comdshar5 != "" && comdshar5!=null){
				comdshar6=(comdshar/comdshar5-1).toFixed(3);
			}
			if(startfee5 !=0 && startfee5 != "" && startfee5!=null){
				startfee6=(startfee/startfee5-1).toFixed(3);
			}
			if(bsfee5 !=0 && bsfee5 != "" && bsfee5!=null){
				bsfee6=(bsfee/bsfee5-1).toFixed(3);
			}
			if(rebate5 !=0 && rebate5 != "" && rebate5!=null){
				rebate6=(rebate/rebate5-1).toFixed(3);
			}
			if(accounts5 !=0 && accounts5 != "" && accounts5!=null){
				accounts6=(accounts/accounts5-1).toFixed(3);
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
	    	document.getElementById("bustax6").innerHTML = (bustax6*100).toFixed(1)+"%";
	    	document.getElementById("currentcost6").innerHTML = (currentcost6*100).toFixed(1)+"%";
	    	document.getElementById("servcost6").innerHTML = (servcost6*100).toFixed(1)+"%";
	    	document.getElementById("deviation6").innerHTML = (deviation6*100).toFixed(1)+"%";
	    	document.getElementById("cashflow6").innerHTML = (cashflow6*100).toFixed(1)+"%";
	    	document.getElementById("wptotalfee6").innerHTML = (wptotalfee6*100).toFixed(1)+"%";
	    	document.getElementById("nquosalecost6").innerHTML = (nquosalecost6*100).toFixed(1)+"%";
	    	document.getElementById("selfsalecost6").innerHTML = (selfsalecost6*100).toFixed(1)+"%";
	    	document.getElementById("inoutfee6").innerHTML = (inoutfee6*100).toFixed(1)+"%";
	    	document.getElementById("prosubfee6").innerHTML = (prosubfee6*100).toFixed(1)+"%";
	    	document.getElementById("pmsubfee6").innerHTML = (pmsubfee6*100).toFixed(1)+"%";
	    	document.getElementById("selfservcost6").innerHTML = (selfservcost6*100).toFixed(1)+"%";
	    	document.getElementById("salecost6").innerHTML = (salecost6*100).toFixed(1)+"%";
	    	document.getElementById("commshar6").innerHTML = (commshar6*100).toFixed(1)+"%";
	    	document.getElementById("comashar6").innerHTML = (comashar6*100).toFixed(1)+"%";
	    	document.getElementById("comdshar6").innerHTML = (comdshar6*100).toFixed(1)+"%";
	    	document.getElementById("startfee6").innerHTML = (startfee6*100).toFixed(1)+"%";
	    	document.getElementById("bsfee6").innerHTML = (bsfee6*100).toFixed(1)+"%";
	    	document.getElementById("rebate6").innerHTML = (rebate6*100).toFixed(1)+"%";
	    	document.getElementById("accounts6").innerHTML = (accounts6*100).toFixed(1)+"%";
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
		  if(num==null||num==""){
		  	return 0;
		  }else{
			  num=num.replace(/,/gi,'');
			  return parseFloat(num);
		  }
		}
		<%-- //导出excel
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
		 --%>
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
			var	bustax5=document.getElementById("bustax5").innerHTML;                 
			var	currentcost5=document.getElementById("currentcost5").innerHTML;           
			var	servcost5=document.getElementById("servcost5").innerHTML;
			var	selfservcost5=document.getElementById("selfservcost5").innerHTML;
			var	pmsubfee5=document.getElementById("pmsubfee5").innerHTML;
			var	prosubfee5=document.getElementById("prosubfee5").innerHTML;
			var	inoutfee5=document.getElementById("inoutfee5").innerHTML;
			var	selfsalecost5=document.getElementById("selfsalecost5").innerHTML;
			var	nquosalecost5=document.getElementById("nquosalecost5").innerHTML;
			var	wptotalfee5=document.getElementById("wptotalfee5").innerHTML;
			var	cashflow5=document.getElementById("cashflow5").innerHTML;
			var	deviation5=document.getElementById("deviation5").innerHTML;               
			var	salecost5=document.getElementById("salecost5").innerHTML;               
			var	commshar5=document.getElementById("commshar5").innerHTML;               
			var	comashar5=document.getElementById("comashar5").innerHTML;               
			var	comdshar5=document.getElementById("comdshar5").innerHTML;
			var	startfee5=document.getElementById("startfee5").innerHTML;
			var	bsfee5=document.getElementById("bsfee5").innerHTML;
			var	rebate5=document.getElementById("rebate5").innerHTML;
			var	accounts5=document.getElementById("accounts5").innerHTML; 
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
	           eval("var selfservcost"+ (i+1) + "=" + data.budget[i].selfservcost);
	           eval("var pmsubfee"+ (i+1) + "=" + data.budget[i].pmsubfee);
	           eval("var prosubfee"+ (i+1) + "=" + data.budget[i].prosubfee);
	           eval("var inoutfee"+ (i+1) + "=" + data.budget[i].inoutfee);
	           eval("var selfsalecost"+ (i+1) + "=" + data.budget[i].selfsalecost);
	           eval("var nquosalecost"+ (i+1) + "=" + data.budget[i].nquosalecost);
	           eval("var commshar"+ (i+1) + "=" + data.budget[i].commshar);
	           eval("var comdshar"+ (i+1) + "=" + data.budget[i].comdshar);
	           eval("var comashar"+ (i+1) + "=" + data.budget[i].comashar);
	           eval("var baddebts"+ (i+1) + "=" + data.budget[i].baddebts);
	           eval("var assetlose"+ (i+1) + "=" + data.budget[i].assetlose);
	           eval("var instock"+ (i+1) + "=" + data.budget[i].instock);
	           eval("var outstock"+ (i+1) + "=" + data.budget[i].outstock);
	           eval("var bonus"+ (i+1) + "=" + data.budget[i].bonus);
	           eval("var servtax"+ (i+1) + "=" + data.budget[i].servtax);
	           eval("var startfee"+ (i+1) + "=" + data.budget[i].startfee);
	           eval("var bsfee"+ (i+1) + "=" + data.budget[i].bsfee);
	           eval("var rebate"+ (i+1) + "=" + data.budget[i].rebate);
	        }
	        budget = {budgetname:budgetname,orgid:orgid,
	        pcontamt1:pcontamt1,pcontamt2:pcontamt2,pcontamt3:pcontamt3,pcontamt4:pcontamt4,pcontamt5:pcontamt5,
	        scontamt1:scontamt1,scontamt2:scontamt2,scontamt3:scontamt3,scontamt4:scontamt4,scontamt5:scontamt5,
	        mcontamt1:mcontamt1,mcontamt2:mcontamt2,mcontamt3:mcontamt3,mcontamt4:mcontamt4,mcontamt5:mcontamt5,
	        receamt1:receamt1,receamt2:receamt2,receamt3:receamt3,receamt4:receamt4,receamt5:receamt5,
	        ptaxincome1:ptaxincome1,ptaxincome2:ptaxincome2,ptaxincome3:ptaxincome3,ptaxincome4:ptaxincome4,ptaxincome5:ptaxincome5,
	        mtaxincome1:mtaxincome1,mtaxincome2:mtaxincome2,mtaxincome3:mtaxincome3,mtaxincome4:mtaxincome4,mtaxincome5:mtaxincome5,
			staxincome1:staxincome1,staxincome2:staxincome2,staxincome3:staxincome3,staxincome4:staxincome4,staxincome5:staxincome5,
			selfservcost1:selfservcost1,selfservcost2:selfservcost2,selfservcost3:selfservcost3,selfservcost4:selfservcost4,selfservcost5:selfservcost5,
			pmsubfee1:pmsubfee1,pmsubfee2:pmsubfee2,pmsubfee3:pmsubfee3,pmsubfee4:pmsubfee4,pmsubfee5:pmsubfee5,
			prosubfee1:prosubfee1,prosubfee2:prosubfee2,prosubfee3:prosubfee3,prosubfee4:prosubfee4,prosubfee5:prosubfee5,
			inoutfee1:inoutfee1,inoutfee2:inoutfee2,inoutfee3:inoutfee3,inoutfee4:inoutfee4,inoutfee5:inoutfee5,
			selfsalecost1:selfsalecost1,selfsalecost2:selfsalecost2,selfsalecost3:selfsalecost3,selfsalecost4:selfsalecost4,selfsalecost5:selfsalecost5,
			nquosalecost1:nquosalecost1,nquosalecost2:nquosalecost2,nquosalecost3:nquosalecost3,nquosalecost4:nquosalecost4,nquosalecost5:nquosalecost5,
			commshar1:commshar1,commshar2:commshar2,commshar3:commshar3,commshar4:commshar4,commshar5:commshar5,
			comashar1:comashar1,comashar2:comashar2,comashar3:comashar3,comashar4:comashar4,comashar5:comashar5,
			comdshar1:comdshar1,comdshar2:comdshar2,comdshar3:comdshar3,comdshar4:comdshar4,comdshar5:comdshar5,
			assetlose1:assetlose1,assetlose2:assetlose2,assetlose3:assetlose3,assetlose4:assetlose4,assetlose5:assetlose5,
			baddebts1:baddebts1,baddebts2:baddebts2,baddebts3:baddebts3,baddebts4:baddebts4,baddebts5:baddebts5,
			instock1:instock1,instock2:instock2,instock3:instock3,instock4:instock4,instock5:instock5,
			outstock1:outstock1,outstock2:outstock2,outstock3:outstock3,outstock4:outstock4,outstock5:outstock5,
			bonus1:bonus1,bonus2:bonus2,bonus3:bonus3,bonus4:bonus4,bonus5:bonus5,
			servtax1:servtax1,servtax2:servtax2,servtax3:servtax3,servtax4:servtax4,servtax5:servtax5,
			startfee1:startfee1,startfee2:startfee2,startfee3:startfee3,startfee4:startfee4,startfee5:startfee5,
			bsfee1:bsfee1,bsfee2:bsfee2,bsfee3:bsfee3,bsfee4:bsfee4,bsfee5:bsfee5,
			rebate1:rebate1,rebate2:rebate2,rebate3:rebate3,rebate4:rebate4,rebate5:rebate5,
			accounts5:accounts5,
			contamt5:contamt5,taxincome5:taxincome5,ntaxincome5:ntaxincome5,pntaxincome5:pntaxincome5,sntaxincome5:sntaxincome5,mntaxincome5:mntaxincome5,servcost5:servcost5,salecost5:salecost5,
			bustax5:bustax5,currentcost5:currentcost5,wptotalfee5:wptotalfee5,deviation5:deviation5,cashflow:cashflow5,payback5:payback5,profitBBonus5:profitBBonus5,profitABonus5:profitABonus5
	        };
	        exportCurrent(budget);
		}
		//导出当前页面预算数据
		 function exportCurrent(budget){
			        hideWindow();
			        form.loading();
			         var json = {"budget": budget,year:inputyear};
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
							    form.unmask();
							    }
			                },
			                error: function () {
			                	alert("error");
			                }
			            });	
			    } 
			    
			    
			    //导出本部门及下级部门预算数据
		 function exportBudgets(e){
			        hideWindow();
			        form.loading();
			         var json = {"year": inputyear,"orgid":orgid,"orgFlag":orgFlag,"flag":e};
						nui.ajax({
			                url: "com.primeton.eos.ame_budget.deptbudget.exportDeptBudgetNew.biz.ext",
			                type: "post",
			                data: json,
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			             		if(o.result==1){
				        			nui.alert("导出数据成功！","系统提示")
				                	var filePath = o.downloadFile;
				                	var fileName = "Deptbudget";
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
				        		}else{
					        		nui.alert("导出数据失败！");
				        			form.unmask();
				        			return;
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
		            	/* if(orgFlag == 1){
			            	
		            	}else if(orgFlag == 2){
		            		if(orgtype!='4'){
			            		aa[0].commshar =  nui.get("commshar1").getValue();
			            		aa[1].commshar =  nui.get("commshar2").getValue();
			            		aa[2].commshar =  nui.get("commshar3").getValue();
			            		aa[3].commshar =  nui.get("commshar4").getValue();
			            		aa[0].comdshar =  nui.get("comdshar1").getValue();
			            		aa[1].comdshar =  nui.get("comdshar2").getValue();
			            		aa[2].comdshar =  nui.get("comdshar3").getValue();
			            		aa[3].comdshar =  nui.get("comdshar4").getValue();
		            		}
		            	}else if(orgFlag == 3){
		            		aa[0].selfservcost =  nui.get("selfservcost1").getValue();
			            	aa[1].selfservcost =  nui.get("selfservcost2").getValue();
			            	aa[2].selfservcost =  nui.get("selfservcost3").getValue();
			            	aa[3].selfservcost =  nui.get("selfservcost4").getValue();
			            	aa[0].pmsubfee =  nui.get("pmsubfee1").getValue();
			            	aa[1].pmsubfee =  nui.get("pmsubfee2").getValue();
			            	aa[2].pmsubfee =  nui.get("pmsubfee3").getValue();
			            	aa[3].pmsubfee =  nui.get("pmsubfee4").getValue();
			            	aa[0].prosubfee =  nui.get("prosubfee1").getValue();
			            	aa[1].prosubfee =  nui.get("prosubfee2").getValue();
			            	aa[2].prosubfee =  nui.get("prosubfee3").getValue();
			            	aa[3].prosubfee =  nui.get("prosubfee4").getValue();
			            	aa[0].inoutfee =  nui.get("inoutfee1").getValue();
			            	aa[1].inoutfee =  nui.get("inoutfee2").getValue();
			            	aa[2].inoutfee =  nui.get("inoutfee3").getValue();
			            	aa[3].inoutfee =  nui.get("inoutfee4").getValue();
			            	aa[0].selfsalecost =  nui.get("selfsalecost1").getValue();
			            	aa[1].selfsalecost =  nui.get("selfsalecost2").getValue();
			            	aa[2].selfsalecost =  nui.get("selfsalecost3").getValue();
			            	aa[3].selfsalecost =  nui.get("selfsalecost4").getValue();
			            	aa[0].nquosalecost =  nui.get("nquosalecost1").getValue();
			            	aa[1].nquosalecost =  nui.get("nquosalecost2").getValue();
			            	aa[2].nquosalecost =  nui.get("nquosalecost3").getValue();
			            	aa[3].nquosalecost =  nui.get("nquosalecost4").getValue();
		            		if(orgtype!='4'){
			            		aa[0].commshar =  nui.get("commshar1").getValue();
			            		aa[1].commshar =  nui.get("commshar2").getValue();
			            		aa[2].commshar =  nui.get("commshar3").getValue();
			            		aa[3].commshar =  nui.get("commshar4").getValue();
			            		aa[0].comdshar =  nui.get("comdshar1").getValue();
			            		aa[1].comdshar =  nui.get("comdshar2").getValue();
			            		aa[2].comdshar =  nui.get("comdshar3").getValue();
			            		aa[3].comdshar =  nui.get("comdshar4").getValue();
		            		}
		            	} */
		            	console.log(aa)
		            	var text ={budget:aa};
		            	form.setData(text);
		            	doCal1();
		            	doCal2();
		            	doCal3();
		            	doCal4(1);
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
	    
	    //管理分摊计算
	    function calCommShar(e){
	    	var commshar=0;
	    	if(msharSet){//管理分摊
		    	if(msharSet.caltype!="1"){//如果不是手动填写
		    		if(msharSet.shartarget=="1"){//按毛收入的比例计算
			    		var ntaxincome = nui.get("ntaxincome"+e).getValue();
			    		var comdshar = nui.get("comdshar"+e).getValue();
			    		if(ntaxincome==null||ntaxincome==""){
			    			ntaxincome=0;
			    		}
			    		if(comdshar==null||comdshar==""){
			    			comdshar=0;
			    		}
			    		commshar = (ntaxincome-comdshar)*parseFloat(msharSet.parameters);
		    		}else if(msharSet.shartarget=="4"){//按自有成本比例计算
		    			var selfservcost = nui.get("selfservcost"+e).getValue(); //自有服务成本
		    			var selfsalecost = nui.get("selfsalecost"+e).getValue(); //自有服务成本
		    			commshar = (selfservcost+selfsalecost)*parseFloat(msharSet.parameters);
		    			
		    		}
		    	}
	    	}
	    	return commshar;
	    }
	</script>
</body>
</html>