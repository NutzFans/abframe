	
	//编辑合同授权清单
    function doContLicsum(e){
    	var row = csContLicense_grid.getRow(e.rowIndex);
    	if(row){
    		if(row.total != null && isNaN(row.total)){
				nui.alert("请输入实数！");
				var rowData = {total: 0};
				csContLicense_grid.updateRow(row,rowData);
				return;
			}
    		if(row.grantnum != null && isNaN(row.grantnum)){
				nui.alert("请输入实数！");
				var rowData = {grantnum: 0};
				csContLicense_grid.updateRow(row,rowData);
				return;
			}
			var total = 0;
			var grantnum = 0;
			var lastnum = 0;
			if(row.total){
				total = row.total;
			}
			if(row.grantnum){
				grantnum = row.grantnum;
			}
			lastnum = parseFloat(total)-parseFloat(grantnum);
			var rowData = {lastnum: lastnum};
			csContLicense_grid.updateRow(row,rowData);
    	}
    }
    
    
	//根据合同业务分类数据计算税率
	function selectContractType(e){
		var row = csContType_grid.getSelected();
		var json = nui.encode({"dictid":e.value,"dicttypeid":"CS_CONTRACT_TYPE"});
    	nui.ajax({
            url: "org.gocom.abframe.tools.newDict.queryDictEntry.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
        		var returnJson = nui.decode(text);
        		if(returnJson){
            		var entry = returnJson.EosDictEntry;
            		var filter1 = entry.filter1;
        		}
        		var rowData = {"taxrate":filter1};
        		csContType_grid.updateRow(row,rowData);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
	}
	function selectProdtype(e){
		var grid = nui.get("product_reve_grid");
		var row = grid.getSelected();
		if(e.value=="1"){
			var rowData = {"productrate":productrate};
    		product_reve_grid.updateRow(row,rowData);
		}else if(e.value=="2"){
			var rowData = {"productrate":servicerate};
    		product_reve_grid.updateRow(row,rowData);
		}else if(e.value=="3"){
			var rowData = {"productrate":marate};
    		product_reve_grid.updateRow(row,rowData);
		}
	}
	//展开产品详情
	function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;            
        if(currentRow){//如果有当前行
        	var datas=product_grid.getData();
        	currentRow.saleProds=datas;
        }
		currentRow=row;		
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);            
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            product_grid.setData(saleProds);
        }else{
			product_grid.setData({});
			row.saleProds = {};
		}
		$('#detailGrid_Form').show();
	}
	function beforenodeselect(e){//只能选择产品
        if (e.isLeaf == false) {
        	e.cancel = true;
        }
	}

	//“签署单位”、“最终用户”、“接收人所在单位”清除时的方法
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }

    function CloseWindow(action) {
        if (action == "cancel" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function changedisforbid(e){//选择分包加备注
    	var sender = e.sender;
    	var text = editor1.html();
    	var mes=""
    	if(sender.id == "isforbid"){
    		if(e.value == 1){
	    		if(text){
	    			mes=text+"<br/>禁止分包外包条款提示："
	    		}else{
	    			mes="禁止分包外包条款提示：";
	    		}
	    		editor1.html(mes);
	    	}else{
	    		editor1.html(text);
	    	}
    	}else{
    		if(e.value == 1){
	    		if(text){
	    			mes=text+"<br/>高风险提示："
	    		}else{
	    			mes="高风险提示：";
	    		}
	    		editor1.html(mes);
	    	}else{
	    		editor1.html(text);
	    	}
    	}
    }
    //“签署单位”、“最终用户”、“接收人所在单位”点击选择时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
        if ( btnEdit.name=="cscontract.misCustinfo.custid" || btnEdit.name=="cscontract.userid" || btnEdit.name=="cscontract.receivercompid")
        lookupUrl = "/contract/contract/MisCustinfo_lookup.jsp";
        if(btnEdit.name == "cscontract.saleshapid"){
        	var salesData = sales_grid.getData();
        	var salesnames = "";
        	for(var i = 0;i < salesData.length;i ++){
        		if(salesnames){
        			salesnames = salesnames + "," + salesData[i].salename;
        		}else{
        			salesnames = salesData[i].salename;
        		}
        	}
        	if(salesnames){
		        lookupUrl = "/contract/contract/CsSaleShap_lookup.jsp?salesnames=" + salesnames;
        	}else{
        		nui.alert("销售人员不能为空！");
        		return;
        	}
        }
        if (lookupUrl=="") return;
        if(btnEdit.name == "cscontract.saleshapid"){
        	nui.open({
			url:paths+lookupUrl,
			title: "选择列表",
			width: 1050,
			height: 450,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                //销售线索
						btnEdit.setValue(data.id);
		                btnEdit.setText(data.telcontent);
					}
				}
			}
			});
        }else{
        	nui.open({
			url:paths+lookupUrl,
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
					}
				}
			}
			});
        }
        
	}
	function changesigntarget(e){
		var signtarget = nui.get("signtarget").getValue();
		if(signtarget.indexOf('2') >= 0){
			nui.get("userid").setValue(nui.get("custid").getValue());
			nui.get("userid").setText(nui.get("custid").getText());
		}else{
			nui.get("userid").setValue('');
			nui.get("userid").setText('');
		}
	}
	//选择销售时的方法
	function onButtonEdit1(e) {
		var btnEdit = this;
		nui.open({
            url:paths+"/contract/contract/SelectSale.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	var row = sales_grid.getSelected();
                    	btnEdit.setValue(data.userid);
                    	var rowData = {saleid: data.userid, salename: data.empname, orgid: data.orgid, orgname: data.orgname};
                    	sales_grid.updateRow(row,rowData);
                    	var json = nui.encode({"userID":data.userid});
                    	nui.ajax({
				            url: "com.primeton.mis.contract.contractApproval.getSaleSyb.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            contentType: 'text/json',
				            success: function (text) {
				        		var returnJson = nui.decode(text);
				        		var syb = returnJson.syb[0];
				        		var rowData = {org: syb.syb};
				        		sales_grid.updateRow(row,rowData);
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                nui.alert(jqXHR.responseText);
				                CloseWindow();
				            }
				        });
                    }
                }
			}
        });
	}
	//选择项目
	function selectProject(){
		var btnEdit = this;
		var custname = nui.get("custid").getText();
        nui.open({
            url:paths+"/ame_common/SelectProject.jsp?custname="+custname,
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
                        nui.get("projectId").setValue(data.projectId);
                    }
				}
			}
        });
	}

	//选择项目
	function selectProject1(){
		var btnEdit = this;
        nui.open({
            url:paths+"/ame_common/SelectProject.jsp?custname="+custname,
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
                        nui.get("projectId").setValue(data.projectId);
                        document.getElementById("rdproject.projectName").innerHTML = data.projectName == null ?"":data.projectName;
		                document.getElementById("omOrganization.orgname").innerHTML = data.orgname == null ?"":data.orgname;
		                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',data.projectType);
		                document.getElementById("rdproject.custname").innerHTML = data.custname == null ?"":data.custname;
		                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',data.projectStatus);
		                document.getElementById("rdproject.outstatus").innerHTML = nui.getDictText('MIS_PROJOUTSTATUS',data.outstatus);
		                document.getElementById("rdproject.startdate").innerHTML = data.startdate == null ?"":data.startdate;
		                document.getElementById("rdproject.expenddate").innerHTML = data.expenddate == null ?"":data.expenddate;
						document.getElementById("rdproject.isconproj").innerHTML = nui.getDictText('MIS_YN',data.isconproj);
						document.getElementById("rdproject.manager").innerHTML = data.managername == null ?"":data.managername;
                    }
				}
			}
        });
	}
	//编辑合同业务分类一些处理
    function doContsum(e){
    	var row = csContType_grid.getRow(e.rowIndex);
    	if(row){
    		if(row.summon != null && isNaN(row.summon)){
				nui.alert("请输入实数！");
				var rowData = {summon: 0};
				csContType_grid.updateRow(row,rowData);
				return;
			}
    		if(row.taxrate != null && isNaN(row.taxrate)){
				nui.alert("请输入实数！");
				var rowData = {taxrate: 0};
				csContType_grid.updateRow(row,rowData);
				return;
			}
			var summon = 0;
			var taxrate = 0;
			var summon2 = 0;
			if(row.summon){
				summon = row.summon;
			}
			if(row.taxrate){
				taxrate = row.taxrate;
			}
			summon2 = (parseFloat(summon)/(1+parseFloat(taxrate))).toFixed(2);
			var rowData = {summon2: summon2};
			csContType_grid.updateRow(row,rowData);
    	}
    }
    
    //已确认和流程中的收入预估不能修改
    function doUpdateForecast(e){
    	if(e.record.status == 2 || e.record.status == 3){	//2、收入确认流程中,3、已确认
    		if(e.record.name != "New Row"){
    			if(doaction == "edit"){
					cancelEditRow(e.record);
    			}
    		}
		}
    }
    
    //收入预估 计算比例金额(编辑前)
    function doCsReveForecastBegin(e){
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	if(row.fcreverate){
        	fcreverateBegin = row.fcreverate;
        }
        if(row.fcsum){
        	fcsumBegin = row.fcsum;
        }
    }
    //收入预估 计算比例金额(编辑后)
    function doCsReveForecastEnd(e){
    	var contsum = nui.get("contsum").getValue();
    	var row = csReveForecast_grid.getRow(e.rowIndex);
    	//确认比例
    	var fcreverate = 0;
    	//确认金额
    	var fcsum = 0;
    	//预计金额产品额
    	var productsum = 0;
    	//预计金额服务额
    	var servicesum = 0;
    	//预计金额MA额
    	var masum = 0;
    	if(row.fcreverate){
        	fcreverate = row.fcreverate;
        }
        if(row.fcsum){
        	fcsum = row.fcsum;
        }
        if(row.productsum){
        	productsum = row.productsum;
        }
        if(row.servicesum){
        	servicesum = row.servicesum;
        }
        if(row.masum){
        	masum = row.masum;
        }
        productsum = parseFloat(productsum);
        servicesum = parseFloat(servicesum);
        masum = parseFloat(masum);
        fcsum = productsum + servicesum + masum;
        if(contsum){
	        fcreverate = fcsum/contsum;
        }else{
        	fcreverate = 0;
        }
        fcsum = parseFloat(fcsum).toFixed(2);
        fcreverate = parseFloat(fcreverate).toFixed(3);
        var rowData = {productsum: productsum,servicesum: servicesum,masum: masum,fcreverate: fcreverate,fcsum: fcsum};
		csReveForecast_grid.updateRow(row,rowData);
    }
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
     
     //合同收款列表-单元格编辑前
     function doCsGatherFcBegin(e){
     	var row = csGatherFc_grid.getRow(e.rowIndex);
     	if(row){
     		if(row.newyearmonth){
				newyearmonth = row.newyearmonth;
			}
     	}
     }
     
     //合同收款列表-单元格编辑后
     function doCsGatherFcEnd(e){
     	var contsum = nui.get("contsum").getValue();
     	var row = csGatherFc_grid.getRow(e.rowIndex);
     	if(row){//productsum servicesum fcsum fcreverate
			if(row.productsum != null && isNaN(row.productsum)){
				nui.alert("请输入实数！");
				var rowData = {productsum: 0};
				csGatherFc_grid.updateRow(row,rowData);
				return;
			}
			if(row.servicesum != null && isNaN(row.servicesum)){
				nui.alert("请输入实数！");
				var rowData = {servsubmon: 0};
				csGatherFc_grid.updateRow(row,rowData);
				return;
			}
			//预计产品额
			var productsum = 0;
			//预计服务额
			var servicesum = 0;
			//预计确认金额
			var fcsum = 0;
			//预计确认比例
			var fcreverate = 0;
			if(row.productsum){
				productsum = row.productsum;
			}
			if(row.servicesum){
				servicesum = row.servicesum;
			}
			fcsum = parseFloat(productsum) + parseFloat(servicesum);
			if(contsum){
				if(contsum == 0){
					fcreverate = 0;
				}else{
			        fcreverate = parseFloat(fcsum)/parseFloat(contsum);
				}
	        }else{
	        	fcreverate = 0;
	        }
	        fcsum = parseFloat(fcsum).toFixed(2);
	        fcreverate = parseFloat(fcreverate).toFixed(3);
			var rowData = {productsum: productsum, servicesum: servicesum, fcsum: fcsum, fcreverate: fcreverate};
			csGatherFc_grid.updateRow(row,rowData);
		}
     }
	
	//MA合同收入记录拆分
	function maSplit(){
		//已存在的收入数据
		var oldReve = csReveForecast_grid.getData();
		//已存在的收入数据记录条数
		var oldReveLength = oldReve.length;
		//合同类型
		var contracttype = nui.get("contracttype").getValue();
		//合同金额
		var contsum = nui.get("contsum").getValue();
		//产品维保金额
		var masum = 0;
		var deptGridRows = sales_grid.data;
		for(var i = 0;i < deptGridRows.length;i ++){
			masum += parseFloat(deptGridRows[i].prodwbmon);
		}
		masum = parseFloat(masum);
        //合同签订日期
        var signdate = null;
        //MA服务开始日期
        var servstartdate = nui.get("servstartdate").getValue();
        //MA服务结束日期
        var servenddate = nui.get("servenddate").getValue();
        if(!contracttype){
        	nui.alert("合同类型不能为空！");
        	return;
        }
        if(!contsum){
        	nui.alert("合同总金额不能为空！");
        	return;
        }
		nui.open({
			url:paths+"/contract/contract/contractMASplit.jsp",
			title: "MA合同收入记录拆分",
			width: 450,
			height: 340,
			onload:function(){
				var iframe = this.getIFrameEl();
				iframe.contentWindow.SetData(masum,signdate,servstartdate,servenddate,contsum,oldReveLength);
			},
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var reveObject = iframe.contentWindow.GetData();
					reveObject = nui.clone(reveObject);
					if (reveObject) {
				    	//设置MA开始日期
				    	nui.get("servstartdate").setValue(reveObject.startDate);
				    	//设置MA结束日期
				    	nui.get("servenddate").setValue(reveObject.endDate);
						//设置合同收入确认记录
						if(contracttype == "04" || contracttype == "30"){
					        var grid = nui.get("csReveForecast_grid");
					        for(var i = 0;i < reveObject.data.length;i ++){
					        	//reveObject.data[i].contorderno = nui.get("contnum").getValue();
						        grid.addRow(reveObject.data[i], i);
					        }
				    	}else{
					        var grid = nui.get("csReveForecast_grid");
					        for(var i = 0;i < reveObject.data.length;i ++){
						        grid.addRow(reveObject.data[i], i);
					        }
				    	}
					}
				}
			}
		});
     }
  	
  	 /**
    *验证
    */
    function onOkCheck(){
    	var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
        var filePaths = document.getElementsByName("uploadfile1").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList1")[j].value;
    		if(a==null||a==""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	var filePaths1 = document.getElementsByName("uploadfile2").length;
    	for(var j=0;j<filePaths1;j++){
    		var a=document.getElementsByName("remarkList2")[j].value;
    		if(a==null||a==""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
       return true;
    }
    

    //验证合同总金额和业务分类金额
    function checkConttype(){
    	var msg=null;
    	var contsum = (nui.get("contsum").getValue() == null || nui.get("contsum").getValue() == "") ? 0:nui.get("contsum").getValue();
    	var types = csContType_grid.getData();
    	var typesummon=0;
    	if(types.length > 0){
			for(var i=0;i<types.length;i++){
    			typesummon +=parseFloat(types[i].summon);
    		}
    		if(parseFloat(contsum).toFixed(2) != parseFloat(typesummon).toFixed(2)){
    			msg = "合同执行总金额不等于合同相关业务分类数据之和，请确认！";
    		}
    	}else{
    		msg = "请填写合同业务分类信息！";
    	}
    	return msg;
    }
    
    var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			},
			 afterChange : function() {
		     $('.word_count1').html(this.count()); //字数统计包含HTML代码
		     var a = this.count();
		     var a1 = this.count('text');
		     var limitNum = 2000;  //设定限制字数
		     var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		     $('.word_surplus').html(pattern); //输入显示
		     if(a > limitNum) {
		      pattern = ('字数超过限制，请适当删除部分内容');
		      //超过字数限制自动截取
		      var strValue = editor1.text();
		      strValue = strValue.substring(0,limitNum);
		      editor1.text(strValue);      
		     } else {
		      //计算剩余字数
		      var result = limitNum - this.count(); 
		      pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		      }
		      $('.word_surplus').html(pattern); //输入显示
    		} 
		});
		prettyPrint();
	});
	
	//产品分成处理
	function changeProdReve(e){
		var row = product_reve_grid.getSelected();
		var pratio = row.pratio;
		if(row){
			if(row.contsum != null && isNaN(row.contsum)){
				nui.alert("请输入实数！");
				var rowData = {contsum: 0};
				product_reve_grid.updateRow(row,rowData);
				return;
			}
			if(row.tax != null && isNaN(row.tax)){
				nui.alert("请输入实数！");
				var rowData = {tax: 0};
				product_reve_grid.updateRow(row,rowData);
				return;
			}
			var contsum = 0;
			var tax = 0;
			var contsum2 = 0;
			var pratiomon = 0;
			var productrate1=0;
			if(row.contsum){
				contsum = row.contsum;
			}
			if(row.productrate){
				productrate1 = parseFloat(row.productrate);
			}
			if(row.tax){
				tax = row.tax;
			}
			if(row.contsum2){
				contsum2 = row.contsum2;
			}
			contsum2 = (parseFloat(contsum)/parseFloat(1+productrate1)).toFixed(2);
			tax = (parseFloat(contsum2)*parseFloat(productrate1)).toFixed(2);
			if(pratio){
				pratiomon = (parseFloat(contsum2)*parseFloat(pratio)).toFixed(2);
			}
			var rowData = {tax: tax, contsum2: contsum2,pratiomon:pratiomon};
			product_reve_grid.updateRow(row,rowData);
		}
	}
	//日期处理
	function onDealDate(e){
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
	
	csReveForecast_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //状态为已确认收入的，设置行样式
    	if(record.status == "3"){
        	e.cellStyle = "background-color: 33FFFF";
    	}
	});
	
	/**
	 * 合同销售样式
	 */
	sales_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("saleid" == field || "org" == field || "servjsmon" == field || "servsubmon" == field 
	    	|| "othmon" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
	/**
	 * 合同收款样式
	 */
	csGatherFc_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("gatherno" == field || "gathertype" == field || "gathertimedesc" == field || "yearmonth" == field || "newyearmonth" == field 
	    	|| "productsum" == field || "servicesum" == field || "status" == field || "billstatus" == field
	    	|| "memo" == field){
	    	e.cellStyle = "background: yellow";
	    }
	    //状态为已收款的，设置行样式
    	if(record.status == 2){
        	e.cellStyle = "background-color: #33FFFF";
    	}
	});
	/**
	 * 合同保函样式
	 */
	csContBack_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("backdepmon" == field || "perioddesc" == field || "isdeal" == field || "status" == field || "returnmon" == field 
	    	|| "paydate" == field || "predredate" == field || "remark" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
	/**
	 * 合同保证金样式
	 */
	csContDep_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("backdepmon" == field || "expno" == field || "perioddesc" == field || "isdeal" == field || "status" == field || "returnmon" == field 
	    	|| "paydate" == field || "predredate" == field || "remark" == field || "practredate"==field){
	    	e.cellStyle = "background: yellow";
	    }
	});
	/**
	 * 合同收入样式
	 */
	csReveForecast_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //设置行样式   
	    if("reveno" == field || "revetype" == field || "newtype" == field || "reveproof" == field || "revetimedesc" == field 
	    	|| "yearmonth" == field || "monthperiod" == field || "newyearmonth" == field || "newmonthperiod" == field
	    	|| "productsum" == field || "servicesum" == field || "masum" == field || "status" == field 
	    	|| "contorderno" == field || "saleseva" == field || "memo" == field){
	    	e.cellStyle = "background: yellow";
	    }
	});
	
	/**
	 * 合同产品样式
	 */
	product_grid.on("drawcell", function (e) {
	    var record = e.record,
	    field = e.field;
	    //设置行样式   
	    if("prodname" == field || "price" == field || "prodmon" == field || "prodsubmon" == field 
	    	|| "othmon" == field || "prodwbmon" == field || "prodwbsubmon" == field || "prodwbothmon" == field
	    	|| "buyprod" == field){
	    	e.cellStyle = "background: yellow";
	    }
	});
	
	/**
	 * 合同业务分类
	 */
	csContType_grid.on("drawcell", function (e) {
	    var record = e.record,
	    field = e.field;
	    //设置行样式   
	    if("type" == field || "summon" == field || "taxrate" == field || "summon2" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
	/**
	 * 产品分成
	 */
	product_reve_grid.on("drawcell", function (e) {
	    var record = e.record,
	    field = e.field;
	    //设置行样式   
	    if("prodname" == field || "prodrevetype" == field || "contsum" == field || "productrate" == field || "pratio" == field){
	    	e.cellStyle = "background: yellow";
	    }
	});
	
	/**
	 * 合同产品授权清单
	 */
	csContLicense_grid.on("drawcell", function (e) {
	    var record = e.record,
	    field = e.field;
	    //设置行样式   
	    if("prodname" == field || "grantunit" == field || "total" == field || "grantnum" == field ){
	    	e.cellStyle = "background: yellow";
	    }
	});
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function dictProdUnit(e) {
        return nui.getDictText('CS_PROD_UNIT',e.value);
    }
	//合同收款列表-收款类型业务字典
	function onGatherType(e){
		return nui.getDictText('AME_GATHERTYPE',e.value);
	}
	//合同收款列表-收款状态业务字典
	function onGatherStatus(e){
		return nui.getDictText('AME_GATHERSTATUS',e.value);
	}
	function onGatherBillStatus(e){
		return nui.getDictText('MIS_GATHERBILL',e.value);
	}
    function getReveProdtype(e){
		return nui.getDictText('REVE_PRODTYPE',e.value);
	}
    //合同保函保证金状态
    function onCsBackDepStatus(e){
    	return nui.getDictText('CS_BACK_DEP',e.value);
    }
    function onGenderInComeType(e) {
        return nui.getDictText('AME_REVETYPE',e.value);
    }
    function onGenderNewType(e) {
        return nui.getDictText('AME_NEWTYPE',e.value);
    }
    function onGenderMonthperiod(e){
    	return nui.getDictText('AME_MONTHPERIOD',e.value);
    }
    function onGenderInComeConv(e){
    	return nui.getDictText('MIS_INCOMECONV',e.value);
    }
    function onGenderStatus(e){
    	return nui.getDictText('AME_REVESTATUS',e.value);
    }
    function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}  
    //是否需要销售评估
    function onGenderSaleseva(e){
    	return nui.getDictText('MIS_YN',e.value);
    } 
	//合同业务分类
    function getCsContracttype(e){
		return nui.getDictText('CS_CONTRACT_TYPE',e.value);
	}

	//合同产品授权单位
    function getCsContLicType(e){
		return nui.getDictText('CS_CONT_LIC_UNIT',e.value);
	}