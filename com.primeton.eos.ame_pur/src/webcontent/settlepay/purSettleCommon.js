		//选择行
		var allSum = 0;
		var doSumfeezongji = 0;
		
		function onSelect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumdays = parseFloat(sumdays).toFixed(2);
			summonths = parseFloat(summonths).toFixed(3);
            allSum = sumFee;
            allSum = parseFloat(allSum).toFixed(2);
            doSumfeezongji = parseFloat(doSumfeezongji).toFixed(2);
            if(doSumfeezongji != allSum){
	            nui.get("setamount").setValue(allSum);
            }
        	document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
            if(nui.get("workunit").getValue() == "1"){//人月数计算
	            //设置工作量数量
	        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
            }else{
	            //设置工作量数量
	        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);            
            }
            doSumfeezongji = allSum;
        }
        
		//取消选中行
        function onDeselect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumdays = parseFloat(sumdays).toFixed(2);
			summonths = parseFloat(summonths).toFixed(3);
			allSum = sumFee;
			allSum = parseFloat(allSum).toFixed(2);
			doSumfeezongji = parseFloat(doSumfeezongji).toFixed(2);
			if(doSumfeezongji != allSum){
				nui.get("setamount").setValue(allSum);
            }
        	document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
            if(nui.get("workunit").getValue() == "1"){//人月数计算
	            //设置工作量数量
	        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
            }else{
	            //设置工作量数量
	        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);            
            }
        	doSumfeezongji = allSum;
        }
        
      //选择行计提
        var allSumPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(isflag !='1'){
					//0-新增,1-确认计提,2-确认计提核销审核中,3-核销计提,4-新增核销审核中
					if(rows[i].accruedstatus == "2" || rows[i].accruedstatus == "4"){
						nui.alert("状态为核销审核中的计提不允许选择！",null,function(){
							grid2.deselect(rows[i],true);
						});
						return;
					}
				}
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
            allSumPre = sumFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
        }
		
		//选择合同弹窗
        function selectCont(){
        	var btnEdit = this;
        	nui.open({
                url: GURL+"/ame_common/contract_lookup.jsp",
                title: "选择合同",
                width: 1000,
                height: 520,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.text);
                            btnEdit.setText(data.text);
                        }
                    }
                }
            });
        }
        
      //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
			allSumPre = sumFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
        }
		
		//选择项目
        function selectProject(){
        	var btnEdit = this;
            nui.open({
                url: GURL+"/ame_common/SelectProject.jsp?preSettle=preSettle",
                title: "选择项目",
                width: 850,
                height: 420,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);
                        datagridOutperson.clearRows();
                        grid2.clearRows();
                        document.getElementById("daystotal").innerHTML = parseFloat(0);
            			document.getElementById("monthstotal").innerHTML = parseFloat(0);
            			nui.get("workamount").setValue(0);
                        if (data) {
                            btnEdit.setValue(data.projectno);
                            btnEdit.setText(data.projectName);
                            nui.get("contnum").setValue(data.contnum);
                            var isContnum = $(nui.get("contnum").el).hasClass("mini-hidden");
                            if(!isContnum){
                            	nui.get("contnum").setText(data.contnum);
                            }
                            if(data.managername){
	                            nui.get("confper").setValue(data.managername);
                            }
                            //如果不设置allowInput="false"会出现验证红圈  btnEdit.focus(); btnEdit.blur();
                            if(!data.custid){//客户为空
                            	nui.get("custno").setData();
			                	nui.get("custno").setValue();
                            	nui.get("custid").setData();
			                	nui.get("custid").setValue();
			                	nui.get("benefitid").setText();
			                	nui.get("benefitid").setValue();
			                	nui.get("suppliersname").setValue();
			                	nui.get("custjc").setValue();
			                	nui.get("setamount").setValue(0);
								document.getElementById("sumtotal").innerHTML = parseFloat(0).toFixed(2);
								document.getElementById("daystotal").innerHTML = parseFloat(0);
					            document.getElementById("monthstotal").innerHTML = parseFloat(0);
					            //设置工作量数量
					        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
                            }else{
                            	//赋值受益部门 
			                	nui.get("benefitid").setValue(data.finUnitId);
			                	nui.get("benefitid").setText(data.orgname);
			                	nui.get("custno").setValue(data.custid);
			                	nui.get("custno").setText(data.custname);
			                	nui.get("custjc").setValue(data.custjc);
			                	//筛选供应商
			                	var json2 = nui.encode({"criteria": 
	                            	{"_expr": 
	                            		{"_property": "projectNo","_value": data.projectno}}
	                            ,"iden": "cust"});
					        	nui.ajax({
					        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
					                data: json2,
					                type: 'POST',
					                cache: false,
					                showModal: false,
					                contentType: 'text/json',
					                success: function (o2) {
					                	nui.parse();
					                	o2 = nui.clone(o2);
					                	if(o2.misCusts.length == 0){//供应商为空
						                	nui.get("custid").setData();
						                	nui.get("custid").setValue();
						                	nui.get("suppliersname").setValue();
						                	nui.get("setamount").setValue(0);
											document.getElementById("sumtotal").innerHTML = parseFloat(0).toFixed(2);
											document.getElementById("daystotal").innerHTML = parseFloat(0);
								            document.getElementById("monthstotal").innerHTML = parseFloat(0);
								            //设置工作量数量
								        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
					                	}else{
						                	nui.get("custid").setData(o2.misCusts);
						                	nui.get("custid").setValue(o2.misCusts[0].custid);
						                	nui.get("suppliersname").setValue(o2.misCusts[0].suppliersname);
						                	//外包人员信息
						                	var json2 = nui.decode({custid: o2.misCusts[0].custid,projectno: data.projectno,setSettle: "1"});
						                	datagridOutperson.sortBy("outpername","asc");
						                	datagridOutperson.load(json2);
						                	//计提核销信息 根据项目(projectno)筛选计提信息
						                	var jsonPresettle = nui.decode({purPresettle: {custid: o2.misCusts[0].custid,projectno: data.projectno,iden: "1"}});
						                	grid2.load(jsonPresettle,function (action2){
						                		if(grid2.getData() == "" || grid2.getData() == null){
			                						nui.confirm("项目状态为结项关闭，且无需核销的计提信息，不能发起结算流程。","确定要继续吗?",function(action){
			                							var isSureButton = nui.get("sureButton");
			                							if (action == "ok") {
			                								if(isSureButton!=null){
			                									nui.get("sureButton").setEnabled(true);
			                								}
										                    nui.get("appButton").setEnabled(true);
			                								nui.get("saveButton").setEnabled(true);
										                } else {
										                	if(isSureButton!=null){
			                									nui.get("sureButton").setEnabled(false);
			                								}
										                    nui.get("appButton").setEnabled(false);
			                								nui.get("saveButton").setEnabled(false);
										                }
			                						}); 
						                			return;
						                		}else{
						                			var isSureButton = nui.get("sureButton");
						                			if(isSureButton!=null){
	                									nui.get("sureButton").setEnabled(true);
	                								}
						                			nui.get("appButton").setEnabled(true);
			                						nui.get("saveButton").setEnabled(true);
						                		}
						                	});
						                	nui.get("setamount").setValue(0);
						                	document.getElementById("sumtotal").innerHTML = 0;
                							document.getElementById("sumtotalpre").innerHTML = 0;
                							document.getElementById("sumtotalworkamount").innerHTML = 0;
                						}
					                	
				                	},
					                error: function (jqXHR, textStatus, errorThrown) {
					                    alert(jqXHR.responseText);
					                    CloseWindow();
				                	}
				                });
                            }
                        }
                    }

                }
            });
        }
    	
        //选择供应商
        function changeCust(){
        	//项目
        	var projectno = nui.get("projectno").getValue();
        	//客户
        	var custno = nui.get("custno").getValue();
        	//供应商
        	var custid = nui.get("custid").getValue();
        	var data = nui.get("custid").getData();
        	for(var i = 0;i < data.length;i ++){
        		if(data[i].custid == custid){
		        	//选择供应商赋值供应商简称
        			nui.get("suppliersname").setValue(data[i].suppliersname);
        		}
        	}
        	document.getElementById("daystotal").innerHTML = parseFloat(0);
        	document.getElementById("monthstotal").innerHTML = parseFloat(0);
        	nui.get("workamount").setValue(0);
        	var settlementid = nui.get("settlementid").getValue();
        	if(settlementid){
        		var json2 = nui.decode({custid: custid,projectno: projectno,settlementid: settlementid,setSettle: "1"});
            	datagridOutperson.load(json2);
            	datagridOutperson.sortBy("outpername","asc");
        	}else{
            	var json2 = nui.decode({custid: custid,projectno: projectno,setSettle: "1"});
            	datagridOutperson.load(json2);
            	datagridOutperson.sortBy("outpername","asc");
        	}
        	//计提核销信息 根据项目(projectno)筛选计提信息
        	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno}});
        	grid2.load(jsonPresettle);
        	nui.get("setamount").setValue(0);
        	document.getElementById("sumtotal").innerHTML = 0;
        	document.getElementById("sumtotalpre").innerHTML = 0;
        	document.getElementById("sumtotalworkamount").innerHTML = 0;
        	
        }
        
      //生成外包结算单
        function exportSettle(){
			var outperson = datagridOutperson.getSelecteds();
			if(outperson == null || outperson == ""){
				nui.alert("外包人员结算信息不能为空");
				return;
			}
        	nui.confirm("确认导出结算单？", "确定？",
            function (action) {            
                if (action == "ok") {
		        	var form = new nui.Form("#form1");
					var json = form.getData();
					var custid = nui.get("custid").getValue();
					var custname = nui.get("custid").getText();
					var projectname = nui.get("projectno").getText();
					var sumtotal = document.getElementById("sumtotal").innerHTML;
					var settlementid = nui.get("settlementid").getValue();
					sumtotal = parseFloat(sumtotal);
					var setamount = nui.get("setamount").getValue();
					setamount = parseFloat(setamount);
					json.purSettle.custid = custid;
					json.purSettle.custname = custname;
					json.purSettle.projectname = projectname;
					json.purSettle.sumtotal = sumtotal;
					json.purSettle.setamount = setamount;
					json.purSettle.first = "first";
					json.outperson = outperson;
					json.purSettle.settlementids = settlementid + "";
					form.loading("结算单导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_pur.settle.exportSettle.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		form.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "结算单";
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
				        },
				        error: function () {
				        	alert("error");
				        }
					});
				}else{
					return;
				}
            });
        }
        
      //验证表单开始和截止日期
        function startandend(action){
			var nowdate = new Date();
			var nowyear = nowdate.getFullYear();
			var nowmonth;
			if(nowdate.getMonth() < 9){
				nowmonth = "0" + (nowdate.getMonth() + 1);
			}else{
				nowmonth = nowdate.getMonth() + 1;
			}
			var nowday;
			if(nowdate.getDate() <= 9){
				nowday = "0" + nowdate.getDate();
			}else{
				nowday = nowdate.getDate();
			}
			var now = nowyear + "-" + nowmonth + "-" + nowday;
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
			if(startdate.substring(0,10) > now){
				nui.alert("开始日期不能大于当前日期");
				return;
			}
			if(enddate.substring(0,10) > now){
				nui.alert("截止日期不能大于当前日期");
				return;
			}
        	if(startdate){
        		if(enddate){
	        		if(startdate > enddate){
	        			if(action == "start"){
	        				nui.alert("开始日期:" + startdate.substring(0,10) + "不能大于截止日期:" + enddate.substring(0,10));
	        				return;
	        			}else if(action == "end"){
	        				nui.alert("截止日期:" + enddate.substring(0,10) + "不能小于开始日期:" + startdate.substring(0,10));
	        				return;
	        			}
	        		}
        		}
        	}
        }
        
		//设置日期格式
		function onDealDate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
		
		function onCancel(e) {
		    var data = form.getData();
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
		    if (action == "close" && form.isChanged()) {
		        if (confirm("数据被修改了，是否先保存？")) {
		            return false;
		        }
		    }
		    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		    else window.close();            
		}
		
		function deleteFile(e){
            var record = e.record;
            var uid = record._uid;
        	return "<a href='javascript:void(0)' onclick='deleteFile1(" + uid + ")'>删除 </a>";
        }
        
        function deleteFile1(uid){
        	var grid = nui.get("grid_0");
        	var row = grid.getRowByUID(uid);  //获取所有选中的行对象
	        var data = {files:row};
		    var json = nui.encode(data); 
			nui.confirm("确定删除此附件信息？","操作提示",function(action){
				if(action == "ok"){
					grid.loading("操作中，请稍后......");
	                nui.ajax({
		                url: "com.primeton.eos.ame_common.file.deletefiles.biz.ext",
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
			});
        }
        
        //附件下载
        function getdetail1(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        
        //悬挂审核意见--zhuhx
	    function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}