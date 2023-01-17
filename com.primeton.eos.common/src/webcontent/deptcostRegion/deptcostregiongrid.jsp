<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-27 16:43:23
  - Description:
-->
<head>
<title>区域级公共费用分摊</title>
</head>
<body>
	<div id="datagrid1" class="nui-datagrid" style="width:99%;height:340px;" allowResize="true" 
	 dataField="listDeptCostRegion" showPager="false" 
	 allowCellSelect="true" allowCellEdit="true" frozenStartColumn="0" frozenEndColumn="1"
	 url="com.primeton.eos.common.deptcostRegion.getdeptcostRegionlist.biz.ext"  multiSelect="true"
	 ondrawsummarycell="onDrawSummaryCell" showSummaryRow="true">
		<div property="columns">  
			<div header="一级分摊单位" headerAlign="center">  
				<div property="columns">                     
	    			<div field="grpName" width="150" align="center" headerAlign="center" allowSort="true" >单位名称（代号）</div> 
				</div>
			</div>
			<div header="分摊单位" headerAlign="center"> 
				<div property="columns">             				
	    			<div field="deptName" width="150" align="center" headerAlign="center" allowSort="true" >单位名称（代号）</div>
				</div>
			</div> 
			<div header="" headerAlign="center"> 
	    		<div property="columns">         
	    			<div field="empNum" width="75" align="right" headerAlign="center" allowSort="true" summaryType="sum">人数</div>
				</div>
			</div>
			<div header="费用类型" headerAlign="center">
				<div property="columns">
					<div field="qygdzcyz" width="120" align="right" headerAlign="left" text-align="left" allowSort="true" numberFormat="0.0" summaryType="sum">
						区域固定资产原值						
					</div>                            
	        		<div field="qyzjft" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	        			区域折旧分摊	                	
	        		</div>
	        		<div field="zxtx" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	        			装修摊销	                	
	        		</div>
	        		<div field="fzwy" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0"summaryType="sum">
	        			房租	                	
	        		</div>
	        		<div field="wy" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	        			物业	                	
	        		</div>
	        		<div field="sdf" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	        			水电费	                	
	        		</div>
	        		<div field="qtggfy" name = "qtggfy" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
            			其他公共费用                	
            		</div> 
				</div>
			</div>        	                 	
		</div>   
	</div>
</body>
</html>