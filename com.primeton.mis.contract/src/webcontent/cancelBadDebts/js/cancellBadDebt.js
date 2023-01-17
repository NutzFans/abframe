 
	//关闭页面
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

	// 取消
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
	

	function onselectHx(){
   	var selectRow = grid_hxjk.getSelected();
   	if(selectRow.name == "New Row"){
   		grid_hxjk.setAllowCellEdit(true);
   	}else{
   		grid_hxjk.setAllowCellEdit(true)
   	}
   }
    
	
	
	
	
	function drawGather(e){
		console.log(result)
	 	for (i=0;i<result.length;i++){
	 	var rr=result[i];
	 	
	 	if( e.record.gatherno==rr && (e.field=="gatherno"||e.field=="status"||e.field=="billstatus"||e.field=="gathertype"||e.field=="newyearmonth"
	 	||e.field=="fcsum"||e.field=="productsum"||e.field=="servicesum"||e.field=="fcreverate"||e.field=="actsum"||e.field=="confirmday")){
	 	e.cellStyle = "background: yellow";
	 	}
	 }
	 }	
	 // 增加坏账核销明细
	function addHx() {    
	    var row=grid_hxjk.getRow(0);
    	  if(row){
  	    	cancelldateFirst= row.cancelldate;
  	    }
  	    var newRow = { name: "New Row",cancelldate:cancelldateFirst };
	    grid_hxjk.addRow(newRow,0);
	 }
	 // 删除坏账核销明细
	function removeHx() {
	    var rows = grid_hxjk.getSelecteds();
	    if (rows.length>0) {
	      grid_hxjk.removeRows(rows, true);
	    }else{
	      alert("请至少选中一条记录！");
	    }
	 }
 
	/*function addRow(gridid){
		var newRow = { name: "New Row",cancelltype:"baddebt" };
		var grid = nui.get(gridid);
		
	    grid.addRow(newRow, 0);
	}*/
	function addRow(newRow){
	    var newRow = { name: "New Row",cancelldate:cancelldateFirst };
		var grid = nui.get(newRow);
		grid.addRow(newRow, 0);
	}
	
	
	// 发票金额总和
    function ticketTaxSum(e){

	if (e.field == "tax") {
			
        e.cellHtml = "<div align='right '><b>税金总计:  " + e.cellHtml + "</b></div>";
    }
    
	if (e.field == "money") {
			
        e.cellHtml = "<div align='right '><b>含税金额总计:  " + e.cellHtml + "</b></div>";
    }
    
	if (e.field == "notax") {
			
        e.cellHtml = "<div align='right '><b>不含税金额总计:  " + e.cellHtml + "</b></div>";
    }
   }
    

	// 核销明细核销金额总和
    function doCsGatherFcSum(e){
	if (e.field == "cancellmoney") {
			
        e.cellHtml = "<div align='right '><b>核销金额总计:  " + e.cellHtml + "</b></div>";
     
    }
   }
    
    
  // 本次核销总金额

	/*function totalsum(e){
         var row1 = datagrid3.getData();
    if(row1){ 
       			var total1 = 0;
         for (var i = 0, l = row1.length; i < l; i++) {
         				var tax;
                    	var row = row1[i];
                    	var t = row.tax;
                   		var a = parseFloat(t);
                    if (isNaN(t)) continue 
                      total1+=a;
                }
   			var cellHtml1=e.cellHtml;
            var data = grid_hxjk.getData();
         	var total = 0;
         for (var i = 0, l = data.length; i < l; i++) {
         				var cancellmoney;
                    	var data1 = data[i];
                    	var t = data1.cancellmoney;
                   		var a = parseFloat(t);
                    if (isNaN(t)) continue 
                      total+=a;
                }
         	var sum1=total+total1;
    document.getElementById("cancellsum").innerHTML = sum1 == null ? "0.00" : nui.formatNumber(sum1,'#,##.##');
	   }  else {			            
	  					var data = grid_hxjk.getData();
	      				var total = 0;
         for (var i = 0, l = data.length; i < l; i++) {
                    	var data1 = data[i];
                        var cancellmoney;
                    	var t = data1.cancellmoney;
                   		var a = parseFloat(t);
                    if (isNaN(t)) continue 
                      total+=a;
                }
	     	var sum1=total;
    document.getElementById("cancellsum").innerHTML = sum1 == null ? "0.00" : nui.formatNumber(sum1,'#,##.##');
	  } 
	  
	}*/
    
	// 鼠标点击之前，判断是否允许编辑
    function onmousedownPay(e){
    	var grid = e.sender;
        grid.setAllowCellEdit(true);
    }
    
	
	  
    // 是否有未确认收入且无法退回的发票:
	function showTicket2(){
	    var rows = csGatherFcGrid1.getSelecteds();
		var haveTicket = nui.get("haveTicket").getValue();
		if(haveTicket=='1'){
		if(rows.length!=0){
				
	
		datagrid3.load({"rows":rows,"contnum":contnum});
	    document.getElementById("datagrid3").style.display = "";
		
		}else{
		nui.alert("请选择收款记录！")	;	
		}
		}else if(haveTicket=='0'){
		document.getElementById("datagrid3").style.display = "none";
		}
		
		/*
		 * if(rows.length!=0){
		 * 
		 * if(haveTicket=='1'){ datagrid3.load({"rows":rows,"contnum":contnum});
		 * document.getElementById("datagrid3").style.display = ""; }else{
		 * nui.alert("请确认有未确认收入且无法退回的发票") } }else if(rows.length==0){
		 * document.getElementById("datagrid3").style.display = "none"; }
		 */
		
		}
	
	
	//设置业务字典-收款状态
	function dictstatus(e){
		return nui.getDictText("AME_GATHERSTATUS",e.value);
	}


	
	//设置业务字典-收款记录开票状态
	function dictstatusbill(e){
		return nui.getDictText("MIS_GATHERBILL",e.value);
	}

	//收款类型
	function dictGatherFcType(e) {
	    return nui.getDictText('AME_GATHERTYPE',e.value);
	}
		
	//服务名称
	function onServRenderer(e){
		return nui.getDictText('CS_SERVNAME',e.value);
	}


	//设置业务字典-核销类型
	function dictcancelltype(e){
		return nui.getDictText("AME_CANCELLTYPE",e.value);
	}

	
	//产品单位
	function onUnitRenderer(e){
		return nui.getDictText('UNIT',e.value);
	}

	//服务单位
	function onUnitSALERenderer(e){
		return nui.getDictText('UNIT_SALE',e.value);
	}

	//服务单位
	function onServNumTypeRenderer(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);
	}

	//发票状态
	function onStatusRenderer(e){
		return nui.getDictText('CS_BILLSTATUS',e.value);
	}

	//开票来源
	function onBillTypeRenderer(e){
		return nui.getDictText('CS_BILLTYPE',e.value);
	}
	//预计收入确认证据
	function dictproof(e){
		return nui.getDictText('MIS_INCOMECONV',e.value);
	}
	
	
	//开票与发票类型
	function onTypeRenderer(e){
		return nui.getDictText('CS_BILLTICKET_TYPE',e.value);
	}

	function onBillStatusRenderer(e){
		return nui.getDictText('MIS_BILLSTATUS',e.value);
	}

	//收入预估状态
	function dictrevestatus(e){
		return nui.getDictText('AME_REVESTATUS',e.value);
	}

	//收入确认类型
	function dictReveType(e){
		return nui.getDictText('AME_REVETYPE',e.value);
	}

	//关闭页面
	function CloseWindow(action) {
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}
	//是否有发票
	function isRecover1(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	
	
	//设置业务字典-收入状态
	function dictstatus1(e){
		return nui.getDictText("AME_REVESTATUS",e.value);
}
				
		/* function drawGather(e){
			 	if(e.record.status!='0' && e.field == "aaa"){
				 	 e.cellHtml="";
			 	}
			 	
			  document.getElementById("mini-36checkall").style.display="none";
			 }*/	
  
		 
	/*	 
		//时间规则判断
			function calDays(e){
			console.log(e);
			var column=e.column;
			var record=e.record;
			var field = e.field;
			var row = grid_hxjk.getRowByUID(record._uid);
			if(e.field=="incomecontime" || e.field=="cancelldate" ){
				if(record.incomecontime && record.cancelldate ){
					cancellDays(record.incomecontime,record.cancelldate,record._uid);
				}
			}
				//开始日期不能大于结束日期
			if(e.field=="incomecontime"){
				if(record.cancelldate){
					if(record.incomecontime>record.cancelldate){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={incomecontime:null};
						grid_hxjk.updateRow(row,rowData);
					}
				}
			}
			if(e.field=="cancelldate"){
				if(record.incomecontime){
					if(record.incomecontime>record.cancelldate){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={cancelldate:null};
						grid_hxjk.updateRow(row,rowData);
					}
				}
			}
			
			if(e.field=="cancellmoney"){
			if(column.summaryValue){
			    totalsum(e);
			}
			}
			}


	   //计算账龄天数
		function cancellDays(incomecontime,cancelldate,uid){
			var json = {incomecontime:incomecontime,cancelldate:cancelldate};
	  		nui.ajax({	
		    	url: "com.primeton.eos.ame_income.cancelBadDebts.getCancellDate.biz.ext",
	            type: 'POST',
	            data: json,
	            success: function (text) {
	            	var row = grid_hxjk.getRowByUID(uid);
	            	
	            	var mounth=parseInt(text.days/30);
	            	console.log(mounth)
	            	var day1=days-mounth*30;
	            	console.log(day1)
	            	
	            	var rowData={accountage:mounth+"月"+day1+"天"};
					grid_hxjk.updateRow(row,rowData);
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
		}
		 */

		function onDealDate1(e){
			  if(e.value){
			   if(typeof(e.value)=="object"){
			    var d = new Date(e.value); 
			    var month =d.getMonth() + 1; 
			    if(month.toString().length<2){
			     month = "0"+month;
			    }
			    var day =d.getDate();
			    if(day.toString().length<2){
			     day = "0"+day;
			    }
			    return d.getFullYear() + '-' + month + '-' + day ; 
			   }else{
			    return e.value.substring(0,10);
			   }
			  }
			 }
		 function drawGather1(e){
					var field = e.field;
					var record=e.record;
				 	if("isrecover" == field){
				 	e.cellStyle = "background: yellow";
				 	}
					if("suresaleid"==field){
				 	e.cellHtml = "";
				 	}
				 } 
		 