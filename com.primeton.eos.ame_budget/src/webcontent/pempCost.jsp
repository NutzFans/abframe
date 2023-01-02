<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-08-09 11:17:15
  - Description:
-->
<script src="../common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<head>
<title>人力成本预算明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-fit">
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<!-- <div style="width:100%;">
		    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		        	<tr>
		                <td style="width:20%;">
		                   	人力成本预算明细
		                </td>
		            </tr>
		         </table>           
		    </div>
		</div> -->
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
		    <input id="pbid" class="nui-hidden" />
		    <input id="sybm" class="nui-hidden" />
		    <input id="pout" class="nui-hidden" />
		    <div style="width:100%;">
		        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
	    	</div> 
			<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" dataField="pempcosts"  allowCellEdit="true" allowCellSelect="true" 
				    editNextOnEnterKey="true" allowCellValid="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" oncellendedit="calCost">
	        	<div property="columns"> 
		        	<div field="empname" width="80" displayField="empname" headerAlign="center">资源名称
		            	<input property="editor" id="empname" class="nui-buttonedit" onbuttonclick="selectOmEmployee" onblur="checkEmp" style="width:100%;"/>
		            </div>
		            <div field="ppratio" numberFormat="n1" width="80">项目使用比例
		            	<input property="editor" class="nui-textbox" id="ppratio" style="width:100%;" />
		            </div> 
		            <div field="percostid" displayField="percostname" width="170" align="center" headerAlign="center" >成本套别
						<input property="editor" class="nui-combobox" textField="percostname" valueField="percostid" dataField ="percosts" url="com.primeton.rdmgr.labor.mispricebiz.queryPercost.biz.ext"/>
					</div>
		            <div field="degree" width="90" displayField="degreename" headerAlign="center">工程师级别
		            	<input property="editor" id="degree" class="nui-combobox" data="degreeData" valueField="degree" textField="degreename" allowInput="true" onclick="valueChangeDegree"  onblur="getDayprice1" style="width:100%;"/>
		            </div>             
		            <div field="resource" name = "resource" width="50" align="center" renderer="getResource" headerAlign="center">内外部
		            	<input property="editor" id="resource" class="nui-dictcombobox" dictTypeId="MIS_PRICETYPE" onblur="getDayprice" style="width:100%;"/>
		            </div> 
		             <div field="istravel" width="50" renderer="getTravel" headerAlign="center" align="center">出差
		            	<input property="editor" id="istravel" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width:100%;"/>
		            </div>                          
		            <div field="dayprice" width="80" numberFormat="n0" align="right">单价(元/人天)
		            	<input property="editor" class="nui-textbox" style="width:100%;" />
		            </div>
		            <div field="expindate" width="80" renderer="onDealDate">进项目日期
		            	<input property="editor" class="nui-datepicker"style="width:100%;" onblur="checkdate(1)"/>
		            </div>
		            <div field="expoutdate" width="80" renderer="onDealDate">出项目日期
		            	<input property="editor" class="nui-datepicker" style="width:100%;" onblur="checkdate(2)"/>
		            </div>
		            <div field="naturaldays" width="70" summaryType="sum" align="right">自然日天数</div>
		            <div field="workdays" width="70" numberFormat="n1" summaryType="sum" align="right">工作日天数</div>
		            <div field="travdays" width="0">出差天数</div>
		            <div field="pempcost" width="auto" summaryType="sum" headerAlign="center" align="right" dataType="currency">人工成本</div>                
		        </div>
		    </div> 
	    </div>
    </fieldset>
    </div>
    <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
		    <a class="nui-button" id="budgetModify_rlbutton" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
		    <a class="nui-button" onclick="onCancel()" style="width:60px;">关闭</a>
		</div> 
	</body>
</html>
	<script type="text/javascript">
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	var degreeData = [];
    	var labortransf;//工时转换系数
    	//页面进入时调用的方法
	    function SetData(data) {
	    //grid.hideColumn(4);隐藏列
	   		getOpeatorButtonAuth("budgetModify_rlbutton");//按钮权限
	        if(data.action=="edit"){ 
				data = nui.clone(data);
				labortransf=data.labortransf;
				var json = nui.encode(data);
	            nui.ajax({
	                url: "com.primeton.eos.ame_budget.ame_budget.getPempcost.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (o) {
	                	grid.loadData(o.pempcosts);
						nui.get("pbid").setValue(data.pbid);
						nui.get("sybm").setValue(data.sybm);
	                }
	            });
			}else if(data.action=="add"){
				data = nui.clone(data);
				labortransf=data.labortransf;
				nui.get("pbid").setValue(data.pbid);
				nui.get("sybm").setValue(data.sybm);
			}else if(data.action=="outedit"){ 
				grid.hideColumn("resource");
				data = nui.clone(data);
				var json = {pbid:data.pbid,pout:2};
	            nui.ajax({
	                url: "com.primeton.eos.ame_budget.ame_budget.getPempcost.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (o) {
	                	grid.loadData(o.pempcosts);
						nui.get("pbid").setValue(data.pbid);
						nui.get("pout").setValue(2);
	                }
	            });
			}else if(data.action=="outadd"){
				grid.hideColumn("resource");
				data = nui.clone(data);
				nui.get("pbid").setValue(data.pbid);
				nui.get("pout").setValue(2);
			}
		}
		
		function getResource(e){
			return nui.getDictText('MIS_PRICETYPE',e.value);//设置业务字典值
		}
		function getTravel(e){
			return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
		}
		//新增一行
	    function addRow() {          
	        var newRow = { name: "New Row" };
	        var rowData = {ppratio: 1.0};
	        
	        grid.addRow(newRow);
	        grid.updateRow(newRow,rowData);
	    }
	    //删除一行但并未删除数据库记录
	    function removeRow() {
	        var rows = grid.getSelecteds();
	        if (rows.length > 0) {
	            grid.removeRows(rows, true);
	        }
	    }
	    function saveData() {
	    	var pbid = nui.get("pbid").getValue();
	    	var pout = "";
	    	var a=nui.get("pout").getValue();
	    	if(a){
	    		pout=a;
	    	}
	        var data = {pempcosts:grid.getChanges(),pbid:pbid,pout:pout};
	        var datas = grid.getChanges();
	        for(var i=0;i<datas.length;i++){
	    		if(datas[i]._state=='modified'||datas[i]._state=='added'){
	    			var a=datas[i].empname;
	    			if(a==null||a==""){
	    				alert("资源名称不可为空,请检查!");
	    				return;
	    			}
	    			var a=datas[i].pempcost;
	    			if(a==null||a==""){
	    				alert("人工成本不可为空,请检查!");
	    				return;
	    			}
	    		}
	        }
	        var json = nui.encode(data);
	        //grid.loading("保存中，请稍后......");
	        nui.ajax({
	            url: "com.primeton.eos.ame_budget.ame_budget.savePempcosts.biz.ext",
	            type: 'POST',
	            data: json,
	            success: function (text) {
	               CloseWindow("ok");
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
	    }
	    //选择人员信息
	    function selectOmEmployee(){
        	var pout=nui.get("pout").getValue();
        	if(pout){
        		return;
        	}
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
	                    	 //btnEdit.setValue(data.empname); 若setValue的话在新增一行，点击该单元格仍会出现上一行的值
	                    	btnEdit.setText(data.empname); 
	                    	var row = grid.getSelected();
                    		var json = {"userid":data.userid}
                    		nui.ajax({	
					            url: "com.primeton.eos.ame_budget.ame_budget.getEmpDegree.biz.ext",
					            type: 'POST',
					            data: json,
					            success: function (text) {
				               	   var rowData = {empname:data.empname,degree: text.datas.degree,degreename: text.datas.degreename,percostid:text.datas.percostid,percostname:text.datas.percostname};//赋值级别，单价
	                			   grid.updateRow(row,rowData);
	                			   valueChangeDegree();//自动计算级别列表
					            },
					            error: function (jqXHR, textStatus, errorThrown) {
					                alert(jqXHR.responseText);
					            }
					        }); 
                        }
                    }

                }
            });
        }
        //日期格式化
        function onDealDate(e){
	  		if(e.value){
	  			return e.value.substring(0,10);
	  		}
	  	}
	  	/* //计算自然日天数，工作日天数,出差天数（进项目日期填完触发）
	  	function doCal(e){
	  		var row = grid.getSelected();
	  		if(row.expindate&&row.expoutdate){
	  			var json = {expindate:row.expindate,expoutdate:row.expoutdate,ppratio:row.ppratio}
	  			nui.ajax({	
		            url: "com.primeton.eos.ame_budget.ame_budget.calDate.biz.ext",
		            type: 'POST',
		            data: json,
		            success: function (text) {
	               	   var rowData = {naturaldays: text.naturaldays,workdays: text.workdays,travdays: text.travdays};//赋值
        			   grid.updateRow(row,rowData);
        			   calCost();
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		            }
		        });
	  		} 
	  	}
	  	//计算自然日天数，工作日天数,出差天数（出项目日期填完触发）
	    function doCal1(e){
	  		var row = grid.getSelected();
	  		if(row.expindate&&row.expoutdate){
	  			var json = {expindate:row.expindate,expoutdate:row.expoutdate,ppratio:row.ppratio}
	  			grid.loading("计算中...");
	  			nui.ajax({	
		            url: "com.primeton.eos.ame_budget.ame_budget.calDate.biz.ext",
		            type: 'POST',
		            data: json,
		            success: function (text) {
		            	grid.unmask();
	               	   var rowData = {naturaldays: text.naturaldays,workdays:text.workdays,travdays:text.travdays};//赋值
        			   grid.updateRow(row,rowData);
        			   calCost();
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		            }
		        });
	  		}
	  	} */
	  	//计算人工成本（每次计算完单价和工作日天数之后触发）
	  	function calCost(e){
	  		var row = grid.getSelected();
	  		if(e.field=="expindate"||e.field=="expoutdate"||e.field=="ppratio"){
		  		if(row.expindate&&row.expoutdate&&row.ppratio){
		  			if(row.expindate>row.expoutdate){
		  				return;
		  			}
		  			var json = {expindate:row.expindate,expoutdate:row.expoutdate,ppratio:row.ppratio}
		  			grid.loading("计算中...");
		  			nui.ajax({	
			            url: "com.primeton.eos.ame_budget.ame_budget.calDate.biz.ext",
			            type: 'POST',
			            data: json,
			            success: function (text) {
			            	grid.unmask();
			            	if(row.dayprice){
			            		if(row.resource){
			            			if(row.resource=="0"){//内部价需要乘以工时转换系数
					            		var pempcost=text.workdays*row.dayprice*labortransf;
			            			}else{
			            				var pempcost=text.workdays*row.dayprice;
			            			}
			            		}
			            	}
		               	   var rowData = {naturaldays: text.naturaldays,workdays:text.workdays,travdays:text.travdays,pempcost:pempcost};//赋值
	        			   grid.updateRow(row,rowData);
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			                alert(jqXHR.responseText);
			            }
			        });
		  		}
	  		}else {
	  			if(row.workdays&&row.dayprice){
		  			if(row.resource){
            			if(row.resource=="0"){//内部价需要乘以工时转换系数
		            		var pempcost=row.workdays*row.dayprice*labortransf;
				  			var rowData = {pempcost: pempcost};//赋值
						    grid.updateRow(row,rowData);
            			}else{
            				var pempcost=row.workdays*row.dayprice*labortransf;
				  			var rowData = {pempcost: pempcost};//赋值
						    grid.updateRow(row,rowData);
            			}
            		}
		  			
		  		}
	  		}
	  	}
	  	function onOk(){
	  		saveData();
	  	}
	  	function onCancel(e) {
            CloseWindow("cancel");
        }
        function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}	
	  	//获取人工成本的汇总值
	  	var pcost="";
	  	function onDrawSummaryCell(e) {
            if(e.field=='pempcost'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	pcost= parseInt(e.value);
            }
            if(e.field=='naturaldays'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if(e.field=='workdays'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        //预算页面调用方法，获取人工成本的汇总值
        function GetData(){
        	return pcost;
        }
        //资源名称为手动填写时获取单价
        function getDayprice(e){
        	var row = grid.getSelected();
	  		if(row.resource&&row.degree&&row.percostid){
	  			var json={"resource1": row.resource,"degree": row.degree,"percostid":row.percostid};
	           	nui.ajax({	
		            url: "com.primeton.eos.ame_budget.ame_budget.getPrice.biz.ext",
		            type: 'POST',
		            data: json,
		            success: function (text) {
	               	   var rowData = {dayprice:text.price};//赋值单价
	    			   grid.updateRow(row,rowData);
	    			   calCost("degree");
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		            }
		        });
	  		}
        	
        }
        //外包人员获取单价
        function getDayprice1(e){
        	var row = grid.getSelected();
        	var pout=nui.get("pout").getValue();
	  		if(row.degree&&row.percostid){
	  			var json={"resource1": row.resource,"degree": row.degree,"percostid": row.percostid};
	           	nui.ajax({	
		            url: "com.primeton.eos.ame_budget.ame_budget.getPrice.biz.ext",
		            type: 'POST',
		            data: json,
		            success: function (text) {
	               	   var rowData = {dayprice:text.price};//赋值单价
	    			   grid.updateRow(row,rowData);
	    			   calCost("degree");
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		            }
		        });
	  		}
        	
        } 
        //判断进出项目日期是否有误
        function checkdate(e){
        	var row = grid.getSelected();
        	if(e==1){
        		var expoutdate=row.expoutdate;
        		var expindate=row.expindate;
        		if(expoutdate){
        			if(expindate>expoutdate){
        				alert("进项目日期大于出项目日期，请重新填写!");
        				var rowData={expindate:null};
        				grid.updateRow(row,rowData);
        			}
        		}
        	}
        	if(e==2){
        		var expindate=row.expindate;
        		var expoutdate=row.expoutdate;
        		if(expindate){
        			if(expindate>expoutdate){
        				alert("进项目日期大于出项目日期，请重新填写!");
        				var rowData={expoutdate:null};
        				grid.updateRow(row,rowData);
        			}
        		}
        	}
        } 
        
        function valueChangeDegree(){
        	var datas = grid.getSelected();
        	var percostid = datas.percostid;
        	if(percostid == '' || percostid == null){
        		alert("选择人员级别前请选择成本套别！");
        		return;
        	}
        	degreedate(percostid)
        }
        
        //根据人员所属部门，有效开始日期，有效结束日期取得级别下拉框
        function degreedate(percostid){
        	var json = {"manage":{"percostid":percostid}};
            nui.ajax({
				url:"com.primeton.rdmgr.labor.mispricebiz.getdegrees.biz.ext",
				data:json,
				type:'POST',
                async:false,
				contentType:'text/json',
				success:function(text){
					if(text.degrees.length>0){
						degreeData = nui.encode(text.degrees);
						nui.get("degree").setData(degreeData);
					}
				}
			});
        }
	  </script>
