<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2020-02-26 15:11:04
  - Description:
-->
<head>
<title>批量预估人力服务收入</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
 <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
	<div class="nui-fit">
		<div id="cscont">
	        <table style="width:60%;">
	        	<tr>
	                <td style="width: 120px">本次确认开始年月:</td><td style="width: 90px"><input class="nui-monthpicker" id="startdate" required="true" style="width: 80px;"/></td>
	                <td style="width: 120px">本次确认结束年月:</td><td style="width: 90px"><input class="nui-monthpicker" id="enddate" required="true" style="width: 80px;"/></td>
	           		<td></td>
	            </tr>
	         </table>           
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csconts" showSummaryRow="true" ondrawsummarycell="doCsReveSum1"
		    url="com.primeton.eos.ame_income.csReveForcastFin.queryBatchReveCont.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]"  multiSelect="true" showPager="false">
				<div property="columns">
					<div type="checkcolumn" width="25"></div>
					<div type="indexcolumn" width="25">序号</div>
					<div field="custname" width="150" align="left" allowSort="true" headerAlign="center">签署客户</div>			
					<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">受益销售</div>	
					<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
					<div field="projectname" width="180" headerAlign="center" allowSort="true" >合同项目名称</div>
					<div field="contsum" width="100" align="right"  headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >合同金额</div>
					<div field="contracttype" renderer="onRendererType" width="80" align="center" headerAlign="center">合同类型</div>
					<div field="status" renderer="onRenderer" width="80" align="center" headerAlign="center">合同状态</div>
				</div>
			</div>
		</div>
		
		<div  id="reve"  style="display: none">
		    <table>
		    	<tr>
		    		<td align="right" style="width: 120px">本次确认开始年月:</td><td style="width: 90px" id="setstart1"></td>
	                <td align="right" style="width: 120px">本次确认结束年月:</td><td style="width: 90px" id="setend1"></td>
	                <td align="right" style="width: 100px">确认日期:</td><td style="width: 90px"><input class="nui-datepicker" required="true" id="confirmdate" onvaluechanged="changedate" style="width: 100px"/></td>
	                <td align="right" style="width: 120px">财务应收开始日期:</td><td style="width: 90px"><input class="nui-datepicker" required="true" id="confirmdayStart" style="width: 100px"/></td>
		    	</tr>
		    	<tr>
		    		<td align="right" >收入确认相关说明：</td>
	                <td colspan="7"><input id="memo" required="true" class="nui-textbox" style="width: 780px;"/></td>
		    	</tr>
		    </table>
		    <div id="datagrid2" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="finreves" showSummaryRow="true" ondrawsummarycell="doCsReveSum" frozenStartColumn="0"
		    frozenEndColumn="2" url="com.primeton.eos.ame_income.csReveForcastFin.queryReveFin.biz.ext" ondrawcell="drawbackground" sortMode="client"
		    sizeList="[10,20,50,100,200,500]" allowCellSelect="true" multiSelect="true" showPager="false" 
		     allowCellEdit="true" oncellendedit="calnotax">
				<div property="columns">
					<!-- <div type="checkcolumn" width="25"></div> -->
					<div field="custjc" width="150" align="left" allowSort="true" headerAlign="center">客户</div>			
					<div field="contnum" width="90" align="center" headerAlign="center" allowSort="true">合同编号</div> 
					<div field="reveno" width="60" align="center" headerAlign="center" allowSort="true">确认次数</div> 
					<div header="上期" headerAlign="center">
		                <div property="columns">
							<div field="sqqrje" width="80" align="right" allowSort="true" dataType="currency" summaryType="sum"  headerAlign="center">确认金额</div>
							<div field="sqactgzl" width="70" align="center"allowSort="true" summaryType="sum" headerAlign="center">实际工作量</div>
							<div field="sqgzl" width="70" align="center"allowSort="true" summaryType="sum" headerAlign="center">确认工作量</div>
							<div field="revery" width="80" align="right" allowSort="true" dataType="currency" summaryType="sum"  headerAlign="center">平均人月收入</div>
						</div>
					</div>
					<div field="deviation" width="60" align="center" numberFormat="n6"  allowSort="true"  headerAlign="center">偏差系数</div>
					<div header="本期" headerAlign="center">
		                <div property="columns">
							<div field="labormonthact" width="70" align="center" renderer="getReveLabor" allowSort="true" numberFormat="n2"  summaryType="sum" headerAlign="center">实际工作量</div>
							<div field="labormonth" width="70" numberFormat="n2" align="center" allowSort="true" numberFormat="n2" summaryType="sum" headerAlign="center">确认工作量
								<input property="editor"  class = "nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/>
							</div>
							<div field="actservicesum3" width="90" align="right" allowSort="true" dataType="currency" summaryType="sum"  headerAlign="center">预估收入</div>
							<div field="actservicesum1" width="90" align="right" renderer="getReveConfirm" allowSort="true" dataType="currency" summaryType="sum"  headerAlign="center">已确认金额</div>
							<div field="actservicesum" width="90" align="right" allowSort="true" dataType="currency" summaryType="sum"  headerAlign="center">本次确认收入
								<input property="editor"  class = "nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/>
							</div>
							<div field="servicerate" width="50" align="center" allowSort="true" headerAlign="center">税率
								<input property="editor"  class = "nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="0" maxValue="1"/>
							</div>
							<div field="actservicesum2" width="90" align="right" allowSort="true" dataType="currency" summaryType="sum"  headerAlign="center">不含税金额</div>
						</div>
					</div>
					<div field="newtype" width="120" align="left" renderer="getnewtype" headerAlign="center">新收入类型
						<input property="editor" id="newtype" class = "nui-dictcombobox" dictTypeId="AME_NEWTYPE"/>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">  
		<a class="nui-button" iconCls="icon-downgrade" id="donext" onclick="donext()">下一步</a>             
	    <a class="nui-button" iconCls="icon-upgrade" id="dolast" onclick="dolast()" style="display: none">上一步</a>
	    <a class="nui-button" iconCls="icon-ok" id="dosure" onclick="onok()" style="display: none">确认处理</a>
	    <a class="nui-button" iconCls="icon-close" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
</body>
	<script type="text/javascript">
		nui.parse();
		var grid1 = nui.get("datagrid1");//合同列表
		var grid2 = nui.get("datagrid2");//收入列表
		var contnum;//选中的合同编号
		var setstart;//结算开始年月
		var setend;//结算结束年月
		init();
		function init(){
			grid1.load();//默认加载合同数据
		}
		
		//点击下一步
		function donext(){
			contnum="";//先清空contnum
			var controws = grid1.getSelecteds();
			var startdate = nui.get("startdate").getValue();
			var enddate = nui.get("enddate").getValue();
			if(startdate==""||startdate==null){
				nui.alert("请先选择本次确认开始年月！");
				return;
			}
			if(enddate==""||enddate==null){
				nui.alert("请先选择本次确认结束年月！");
				return;
			}
			if(controws.length==0){
				nui.alert("请至少选中一个合同！");
				return;
			}else{
				for(var i=0;i<controws.length;i++){
					if(contnum){
						contnum = contnum+",'"+controws[i].contnum+"'";
					}else{
						contnum = "'"+controws[i].contnum+"'";
					}
				}
				$("#cscont").hide();
				$("#reve").show();
				$("#dolast").show();
				$("#donext").hide();
				$("#dosure").show();
				
				var startyear = startdate.getFullYear();
				var startmonth = startdate.getMonth()+1;
				if(startmonth<9){
					startmonth="0"+startmonth;
				}
				var enddate = nui.get("enddate").getValue();
				var endyear = enddate.getFullYear();
				var endmonth = enddate.getMonth()+1;
				if(endmonth<9){
					endmonth="0"+endmonth;
				}
				setstart = startyear.toString()+startmonth.toString();
				setend=endyear.toString()+endmonth.toString();
				document.getElementById("setstart1").innerHTML = setstart;
				document.getElementById("setend1").innerHTML = setend;
				grid2.load({"contnum":contnum,"startdate":setstart,"enddate":setend});
			}
		}
		function dolast(){
			nui.confirm("回退上一步将清除本次操作的数据，请确认是否回退？","操作提示",function(o){
				if("ok"==o){
					$("#cscont").show();
					$("#donext").show();
					$("#reve").hide();
					$("#dolast").hide();
					$("#dosure").hide();
				}
			})
		}
		
		function onRenderer(e) {//合同状态
	        return nui.getDictText('CS_CONTRACTTYPE',e.value);
	    }
	    function onRendererType(e) {//合同类型
	        return nui.getDictText('MIS_CONTRACTTYPE',e.value);
	    }
	    
	    
	    function onCancel(e) {
	        CloseWindow("cancel");
	    }
	    
	    function CloseWindow(action) {
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
   		}
   		
   		function onok(){
   			var findata = grid2.getData();
   			for(var i=0;i<findata.length;i++){
   				if(findata[i].actservicesum==0||findata[i].actservicesum==null||findata[i].actservicesum==""){
   					nui.alert("合同编号为："+findata[i].contnum+"的本期收入为0，请检查并修改！");
   					return;
   				}
   				if(findata[i].servicerate==0||findata[i].servicerate==null||findata[i].servicerate==""){
   					nui.alert("合同编号为："+findata[i].contnum+"的税率为0或空，请检查并修改！");
   					return;
   				}
   				if(findata[i].labormonth==0||findata[i].labormonth==null||findata[i].labormonth==""){
   					nui.alert("合同编号为："+findata[i].contnum+"的确认工作量为0或空，请检查并修改！");
   					return;
   				}
   				if(findata[i].newtype==null||findata[i].newtype==""){
   					nui.alert("合同编号为："+findata[i].contnum+"的新收入类型为空，请检查并修改！");
   					return;
   				}
   				
   			}
   			var confirmdate = nui.get("confirmdate").getValue();
   			var confirmdayStart = nui.get("confirmdayStart").getValue();
   			var memo = nui.get("memo").getValue();
   			if(confirmdate==null||confirmdate==""){
   				nui.alert("确认日期不能为空！");
   				return;
   			}
   			if(confirmdayStart==null||confirmdayStart==""){
   				nui.alert("财务应收日期不能为空！");
   				return;
   			}
   			
   			if(memo==null||memo==""){
   				nui.alert("收入确认相关说明不能为空！");
   				return;
   			}
   			nui.confirm("是否批量确认收入?","操作提示",function(o){
   				if("ok" == o){
		   			nui.get("dosure").setEnabled(false);
					var reve={};
					reve.confirmday = confirmdate;
					reve.confirmdayStart = confirmdayStart;
					reve.setstart=setstart;
					reve.setend = setend;
					reve.memo=memo;
					var json={"reve":reve,"finreves":findata};
					nui.ajax({
						url: "com.primeton.eos.ame_income.csReveForcastFin.saveReveFinBatch.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				        	if(o.result=="succ"){
				        		nui.alert("批量确认成功！","提示",function(){
					        		CloseWindow("ok");
				        		});
				        		
				        	}else{
				        		nui.alert("批量确认失败，请联系信息技术部！");
				        		nui.get("dosure").setEnabled(true);
				        	}
				        },
				        error: function () {
				        	alert("error");
				        }
					});
				}
			})
   		}
   		
   		//财务应收开始日期默认为确认日期
   		function changedate(e){
   			if(e.value){
   				nui.get("confirmdayStart").setValue(e.value);
   			}
   		}
   		
   		//计算不含税以及根据本期确认工作量计算本期实际
   		function calnotax(e){
   			var row = e.record;
   			if(e.field=="actservicesum"||e.field=="servicerate"){
   				var actservicesum = row.actservicesum;
   				var servicerate = row.servicerate;
   				if(servicerate==null||servicerate==""){
   					servicerate=0;
   				}
   				var actservicesum2 = parseFloat(actservicesum/(1+servicerate)).toFixed(2);
   				var rowData = {"actservicesum2":actservicesum2}
   				grid2.updateRow(row,rowData);
   			}
   			
   			if(e.field=="labormonth"){
   				var revery = e.record.revery;
   				var labormonth = e.record.labormonth;
   				if(labormonth==null||labormonth==""){
   					labormonth=0;
   				}
   				var actservicesum1= e.record.actservicesum1;
   				if(actservicesum1==null||actservicesum1==""){
   					actservicesum1=0;
   				}
   				var actservicesum = labormonth*revery-actservicesum1;
   				var servicerate = row.servicerate;
   				if(servicerate==null||servicerate==""){
   					servicerate=0;
   				}
   				var actservicesum2 = parseFloat(actservicesum/(1+servicerate)).toFixed(2);
   				var rowData = {"actservicesum2":actservicesum2,"actservicesum":actservicesum}
   				grid2.updateRow(row,rowData);
   				
   			}
   		}
   		
   		function doCsReveSum(e){        	
            if (e.field == "sqqrje" || e.field == "sqgzl"|| e.field == "sqactgzl" ||e.field == "revery"||e.field == "labormonth"||e.field == "labormonthact"||e.field == "actservicesum1"||e.field == "actservicesum"||e.field == "actservicesum2"||e.field == "actservicesum3") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        
        function doCsReveSum1(e){        	
            if (e.field == "contsum" ) {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        
        function getnewtype(e){
        	return nui.getDictText('AME_NEWTYPE',e.value);//设置业务字典值
        }
        
        //绘制单元格背景色
        function drawbackground(e){
        	if(e.field=="actservicesum"||e.field=="servicerate"||e.field=="newtype"||e.field=="labormonth"){
        		e.cellStyle = "background: #FFFD75";
        	}
        }
        
         //合同详细信息
        function getReveLabor(e){
        	if(e.value!=0&&e.value!=null&&e.value!=""){
	        	return "<a href='javascript:void(0)' onclick='detailReveLabor();' title='点击查看工作量明细'>" + e.value + "</a>";
        	}
        }
        function detailReveLabor(){
	 		var selectRow = grid2.getSelected();
	 		var startdate = nui.get("startdate").getValue();
	 		var startyear = startdate.getFullYear();
	 		var startmonth = startdate.getMonth() + 1;
	 		startmonth = startmonth < 10 ? '0'+ startmonth : startmonth;
	 		var starts = startyear+"-"+startmonth+"-01"
			var enddate = nui.get("enddate").getValue();
			var endyear = enddate.getFullYear();
	 		var endmonth = enddate.getMonth() + 1;
	 		endmonth = endmonth < 10 ? '0'+ endmonth : endmonth;
	 		ends = endyear+"-"+endmonth+"-"+new Date(endyear,endmonth,0).getDate()
			var executeUrl = "<%=request.getContextPath() %>/ame_income/reveConfirmProcess/detailReveLabor.jsp?contnum=" + selectRow.contnum+"&startdate="+starts+"&enddate="+ends;
			 //获得窗口的垂直位置 
			var iHeight = "400";
			var iWidth = "1000"
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(executeUrl, '工作量明细查看', 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
	    
	    }
	    
	    //合同详细信息
        function getReveConfirm(e){
        	if(e.value&&e.value!=0){
	        	return "<a href='javascript:void(0)' onclick='detailReveConfirm();' title='点击查看本期已确认明细'>" + e.value + "</a>";
        	}else{
        		return 0;
        	}
        }
        function detailReveConfirm(){
	 		var selectRow = grid2.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_income/reveConfirmProcess/detailReveFinConfirm.jsp?contnum=" + selectRow.contnum+"&startdate="+setstart+"&enddate="+setend;
			 //获得窗口的垂直位置 
			var iHeight = "400";
			var iWidth = "1000"
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(executeUrl, '本期已确认', 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
	    }
  	</script>
</html>