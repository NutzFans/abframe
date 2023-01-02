<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-21 18:03:49
  - Description:
-->
<head>
	<title>新增合同订单</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%@include file="/common/common.jsp"%>
	<h:script src='<%="/common/scripts/eos-web.js"%>' />
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<!--合同基本信息展示  -->
	<jsp:include page="/contract/contract/csContDetail.jsp"/>
	<!--合同订单信息展示  -->
	<jsp:include page="/contract/contract/csContOrderGrid.jsp"/>
	<!--合同订单表单  -->
	<jsp:include page="/contract/contract/contOrderForm.jsp"/>
	
	<div style="text-align:center;padding:10px;">               
        <a class="nui-button" onclick="onOk"  id="okbutton" style="width:60px;margin-right:20px;">保存</a>       
        <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>       
    </div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var formCont = new nui.Form("#form_cont");//合同信息
  	
  	var formContOrder = new nui.Form("#form_csContOrder");//合同订单信息
  	
	var csContOrder_grid = nui.get("csContOrder_grid");//合同订单处理
	
	var csContType_grid = nui.get("csContType_grid");//合同业务分类
	
	/* var sales_grid = nui.get("sales_grid");//销售人员对应的grid的增加、删除方法
	var product_grid = nui.get("product_grid");//销售人员对应产品的grid的增加、删除方法 */
	
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));//产品税率
	var  servicerate  = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));//服务税率
	var  marate  = parseFloat(nui.getDictText('AME_SYSCONF','MARATE'))//MA税率
	
	var csContOrders;
	var cssales;
	var csgathers;
	var csreves;
  	function SetData(data){
  		 //跨页面传递的数据对象，克隆后才可以安全使用
        data = nui.clone(data);
        nui.ajax({
            url: "com.primeton.mis.contract.contract.getContract.biz.ext",
			type: 'POST',
			data: {contractid:data.contractid},	
			contentType: 'text/json',
            success: function (o) {
            	var cscontract = o.cscontract;
            	csContOrders = cscontract.csContOrder;
            	nui.get("contractid").setValue(cscontract.contractid);
            	nui.get("contnum1").setValue(cscontract.contnum);
				nui.get("orderprodmon").setReadOnly(true);
            	document.getElementById("projectname").innerHTML = cscontract.projectname == null ?"":cscontract.projectname;
				document.getElementById("contnum").innerHTML = cscontract.contnum == null ?"":cscontract.contnum;
            	document.getElementById("contsum").innerHTML = cscontract.contsum == null ?"":formatNumber(cscontract.contsum,'#,##.##');
            	
            	document.getElementById("salename").innerHTML = cscontract.salename == null ?"":cscontract.salename;
            	document.getElementById("custname").innerHTML = cscontract.misCustinfo==null?"": cscontract.misCustinfo.custname == null ?"":cscontract.misCustinfo.custname;
            	document.getElementById("contreg").innerHTML = cscontract.contreg == null ?"":cscontract.contreg;
				
            	nui.get("projectname1").setValue(cscontract.projectname);
            	nui.get("salename1").setValue(cscontract.salename);
            	nui.get("custname1").setValue(cscontract.misCustinfo.custname);
            	
				setproducts(cscontract.contractid,cscontract.contnum);
				//合同订单处理
				csContOrder_grid.sortBy("contorderno","asc");
				csContOrder_grid.load({"contractid": cscontract.contractid},function(){
					csContType_grid.sortBy("contorderno","asc");
					csContType_grid.load({contnum: o.cscontract.contnum},function(){})
				});
            }
        });
  	}
  	
	
	//修改订单相关金额
	function changeOrderMon(e){
		var orderprodmon = parseFloat(nui.get("orderprodmon").getValue());
		var servjsmon = parseFloat(nui.get("servjsmon").getValue());
		var prodwbmon = parseFloat(nui.get("prodwbmon").getValue());
		var servsubmon = parseFloat(nui.get("servsubmon").getValue());
		var othmon = parseFloat(nui.get("othmon").getValue());
		
		if(!orderprodmon){orderprodmon = 0;}
		if(!servjsmon){servjsmon = 0;}
		if(!prodwbmon){prodwbmon = 0;}
		if(!servsubmon){servsubmon = 0;}
		if(!othmon){othmon = 0;}
		
		var orderservmon = parseFloat(servjsmon)+parseFloat(prodwbmon);
		var ordermon = parseFloat(orderprodmon)+parseFloat(orderservmon);
		nui.get("ordermon").setValue(ordermon);
		nui.get("orderservmon").setValue(orderservmon);
		
	}
	
	function setProdData(){
		var data = formContOrder.getData();
		console.log(data.csContOrder);
		var orderprodmon = parseFloat(nui.get("orderprodmon").getValue());
		var servjsmon = parseFloat(nui.get("servjsmon").getValue());
		var prodwbmon = parseFloat(nui.get("prodwbmon").getValue());
		var servsubmon = parseFloat(nui.get("servsubmon").getValue());
		var othmon = parseFloat(nui.get("othmon").getValue());
		var orderservmon = parseFloat(nui.get("orderservmon").getValue());
		var ordermon = parseFloat(nui.get("ordermon").getValue());
		
		var prodmon = parseFloat(nui.get("prodmonold").getValue());//产品表产品金额
		var prodsubmon1 = parseFloat(nui.get("prodsubmonold").getValue());//产品表产品采购1
		var prodothmon = parseFloat(nui.get("prodothmonold").getValue());//产品表产品采购2
		var prodwbmon1 = parseFloat(nui.get("prodwbmon1old").getValue());//产品表产品维保
		var prodwbsubmon = parseFloat(nui.get("prodwbsubmonold").getValue());//产品表产品维保分包费
		var prodwbothmon = parseFloat(nui.get("prodwbothmonold").getValue());//产品表产品维保服务费
		
		var salecontsum = parseFloat(nui.get("salecontsumold").getValue());//销售表总金额
		var saleprodmon = parseFloat(nui.get("saleprodmonold").getValue());//销售表产品金额
		var saleservmon = parseFloat(nui.get("saleservmonold").getValue());//销售表服务总金额
		var saleprodwbmon = parseFloat(nui.get("saleprodwbmonold").getValue());//销售表产品维保金额
		var saleservjsmon = parseFloat(nui.get("saleservjsmonold").getValue());//销售表技术服务金额
		var saleservsubmon = parseFloat(nui.get("saleservsubmonold").getValue());//销售表服务采购1
		var saleothmon = parseFloat(nui.get("saleothmonold").getValue());//销售表服务采购2
		
		
		if(!orderprodmon){orderprodmon = 0;}
		if(!servjsmon){servjsmon = 0;}
		if(!prodwbmon){prodwbmon = 0;}
		if(!servsubmon){servsubmon = 0;}
		if(!othmon){othmon = 0;}
		
		if(!prodmon){prodmon = 0;}
		if(!prodsubmon1){prodsubmon1 = 0;}
		if(!prodothmon){prodothmon = 0;}
		if(!prodwbmon1){prodwbmon1 = 0;}
		if(!prodwbsubmon){prodwbsubmon = 0;}
		if(!prodwbothmon){prodwbothmon = 0;}
		
		if(!salecontsum){salecontsum = 0;}
		if(!saleprodmon){saleprodmon = 0;}
		if(!saleservmon){saleservmon = 0;}
		if(!saleprodwbmon){saleprodwbmon = 0;}
		if(!saleservjsmon){saleservjsmon = 0;}
		if(!saleservsubmon){saleservsubmon = 0;}
		if(!saleothmon){saleothmon = 0;}
		
		//产品表相关
		prodmon = parseFloat(prodmon)+parseFloat(orderprodmon);
		prodsubmon1 = prodsubmon1 + servsubmon;
		prodothmon = prodothmon+othmon;
		prodwbmon1 = prodwbmon1 + prodwbmon;
		
		netprodmon = (prodmon/(1+productrate)-prodmon/(1+productrate)*productrate*0.07-prodsubmon1-prodothmon).toFixed(2);
		prodwbnetmon = (prodwbmon1/(1+marate)-prodwbmon1/(1+marate)*marate*0.07-prodwbsubmon-prodwbothmon).toFixed(2);
		
		//产品表相关
		nui.get("prodmon").setValue(prodmon);//产品表产品金额
		nui.get("netprodmon").setValue(netprodmon);//产品表产品净额
		nui.get("prodsubmon").setValue(prodsubmon1);//产品表采购1
		nui.get("prodothmon").setValue(prodothmon);//产品表采购2
		nui.get("prodwbmon1").setValue(prodwbmon1);//产品表采购2
		nui.get("prodwbnetmon").setValue(prodwbnetmon);//产品表采购2
		
		//销售表相关
		saleprodmon = saleprodmon + orderprodmon;
		saleprodwbmon = saleprodwbmon + prodwbmon;//产品维保
		saleservjsmon = saleservjsmon + servjsmon;//技术
		saleservsubmon = saleservsubmon + servsubmon;//采购1
		saleothmon = saleothmon + othmon;//采购2
		
		saleservmon = saleprodwbmon + saleservjsmon;//服务总金额
		salecontsum = parseFloat(saleprodmon) + parseFloat(saleservmon) //合同总金额
		
		netservmon = (parseFloat(saleservmon)/(1+servicerate) - parseFloat(saleservmon)/(1+servicerate)*servicerate*0.07 - parseFloat(saleservsubmon) - parseFloat(saleothmon)).toFixed(2);
		contpolmon = (parseFloat(netprodmon) + parseFloat(netservmon)).toFixed(2);
		//销售表相关
		nui.get("saleprodmon").setValue(saleprodmon);
		nui.get("saleprodwbmon").setValue(saleprodwbmon);
		nui.get("saleservjsmon").setValue(saleservjsmon);
		nui.get("saleservsubmon").setValue(saleservsubmon);
		nui.get("saleothmon").setValue(saleothmon);
		nui.get("salecontsum").setValue(salecontsum);
		nui.get("saleservmon").setValue(saleservmon);
		nui.get("netservmon").setValue(netservmon);
		nui.get("contpolmon").setValue(contpolmon); 
		
		//收款相关
		var fcsum = 0;//预计确认金额
		var fcreverate = 0;//预计确认比例
		fcsum = orderprodmon + orderservmon;
		
		if(salecontsum){
			if(salecontsum == 0){
				fcreverate = 0;
			}else{
		        fcreverate = parseFloat(fcsum)/parseFloat(salecontsum);
			}
        }else{
        	fcreverate = 0;
        }
		fcsum = parseFloat(fcsum).toFixed(2);
	    fcreverate = parseFloat(fcreverate).toFixed(3);
		
		productsum2 = orderprodmon /(1+productrate);
		servicesum2 = orderservmon /(1+servicerate);
		fcsum2 = productsum2 + servicesum2;
		
		nui.get("productsum").setValue(orderprodmon);
		nui.get("servicesum").setValue(orderservmon);
		nui.get("fcsum").setValue(fcsum);
		nui.get("fcreverate").setValue(fcreverate);
		
		nui.get("productsum2").setValue(productsum2);
		nui.get("servicesum2").setValue(servicesum2);
		nui.get("fcsum2").setValue(fcsum2);
		nui.get("productrate").setValue(productrate);
		nui.get("servicerate").setValue(servicerate);
		
		
		nui.get("summon").setValue(ordermon);//合同业务分类金额
		changeSummon(ordermon);
		
		var data = formContOrder.getData();
		//console.log(data.csContOrder);
	}
  	
	function onOk(){
		if(formContOrder.validate()){
			var contorderno = nui.get("contorderno").getValue();
			var gatherno = nui.get("gatherno").getValue();
			var reveno = nui.get("reveno").getValue();
			
			var contsum = parseFloat(nui.get("salecontsum").getValue());
			if(!contsum){
				contsum = 0;
			}
			
			var ordermonsum = 0;
			var ordermon = parseFloat(nui.get("ordermon").getValue());
			var summon = parseFloat(nui.get("summon").getValue());
			ordermonsum = parseFloat(ordermonsum) + parseFloat(ordermon);
			
			for(var i=0;i<csContOrders.length;i++){
				var contorderno1 = csContOrders[i].contorderno;
				var ordermon1 = parseFloat(csContOrders[i].ordermon);
				ordermonsum=parseFloat(ordermonsum)+parseFloat(ordermon1);
				if(contorderno == contorderno1){
					nui.alert("合同订单编号重复，请确认！");
					return;
				}
			}
			if(gatherno && gatherno !="" && csreves !=null  && csreves.length>0){
				for(var i=0;i<csgathers.length;i++){
					var gatherno1 = csgathers[i].gatherno;
					if(gatherno == gatherno1){
						nui.alert("收款次数和现有得收款次数相同，请确认！");
						return;
					}
				}
			}
			
			if(reveno !=null && reveno !="" && csreves !=null  && csreves.length>0){
				for(var i=0;i<csreves.length;i++){
					var reveno1 = csreves[i].reveno;
					if(reveno == reveno1){
						nui.alert("收入次数和现有得收入次数相同，请确认！");
						return;
					}
				}
			}
			if(!confirm("是否保存？")){
				return;
			}else{
				nui.get("okbutton").disable();
				setProdData();
    			SaveData();
			}
		}else{
			nui.alert("请检查表单的完整性!");
			return;
		}
	}
	function SaveData(){
		
		var data = formContOrder.getData();
		var csContOrder = data.csContOrder;
		console.log(data.csContOrder);
		var json = nui.encode({"csContOrder":csContOrder});
		nui.ajax({
			url: "com.primeton.mis.contract.contract.addCsContOrder.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
		    	if(o.result == '1'||o.result == 1){
		    		nui.alert("保存成功！","系统提示",function(){
		    			CloseWindow("ok");
		    		});
		    	}else{
		    		nui.alert("保存失败！","系统提示",function(){
			    		nui.get("okbutton").enable();
		    		});
		    	}
	        }
		});
	}
  	
  	function changeyear(e,type){
  		var sender = e.sender;
  		var yearmonth = e.value;
  		yearmonth = new Date(yearmonth);
  		
  		var newyear = "";
		var newmonth = "";
		if(typeof(yearmonth) == "string" && yearmonth.length == 7){
    		newyear = yearmonth.substr(0,4);
    		newmonth = yearmonth.substr(5,2);
    	}else if(typeof(yearmonth) == "string" && yearmonth == 6){
    		newyear = yearmonth.substr(0,4);
    		newmonth = yearmonth.substr(4,2);
    	}else{
			newyear = yearmonth.getFullYear();
			newmonth = yearmonth.getMonth() + 1;
			if(newmonth < 10){
				newmonth = "0" + newmonth;
			}else{
				newmonth = "" + newmonth;
			}
		}
		var newyearmonth = newyear + "" +  newmonth;
		nui.get(type).setValue(newyearmonth);
  	}
  	
  	//已收款汇总行    保函保、证金汇总行    收入确认汇总行   产品分成汇总 //关联采购合计
	function drawSum(e){
		if ( e.field == "ordermon" || e.field == "orderprodmon" || e.field == "servjsmon" || e.field == "prodwbmon" || e.field == "orderservmon"
			|| e.field == "servsubmon" || e.field == "othmon"||e.field == "contsum"
			|| e.field == "summon"|| e.field == "summon2" ) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	
	//修改合同业务分类金额
	function changeSummon(e){
		var summon = nui.get("summon").getValue();
		var taxrate = nui.get("taxrate").getValue();
		if(!summon){
			summon = 0;
		}
		if(!taxrate){
			taxrate = 0;
		}
		var summon2 = (parseFloat(summon)/(1+parseFloat(taxrate))).toFixed(2);
		nui.get("summon2").setValue(summon2);
	}
	
	//根据合同业务分类数据计算税率
	function selectContractType(e){
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
            		if(!filter1){
            			filter1=0;
            		}
            		nui.get("taxrate").setValue(filter1);
            		changeSummon(filter1);
        		}
        		
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
	}
	function setproducts(contractid,contnum){
		var json = nui.encode({"contractid":contractid,"contnum":contnum});
		nui.ajax({
    		url: "com.primeton.mis.contract.contract.getProdsAndSales.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				var text = nui.clone(text);
				cssale = text.cssales[0];
				csgathers = text.csgathers;
				csreves = text.csreves;
				nui.get("prodname").setData(text.csproducts);
				nui.get("gatherno").setData(csgathers);
				nui.get("reveno").setData(csreves);
				nui.get("contsaleid").setValue(cssale.contsaleid);
				nui.get("salecontsum").setValue(cssale.salecontsum);
				nui.get("saleprodmon").setValue(cssale.saleprodmon);
				nui.get("saleservmon").setValue(cssale.saleservmon);
				nui.get("saleprodwbmon").setValue(cssale.saleprodwbmon);
				nui.get("saleservjsmon").setValue(cssale.saleservjsmon);
				nui.get("saleservsubmon").setValue(cssale.saleservsubmon);
				nui.get("saleothmon").setValue(cssale.saleothmon);
				
				nui.get("salecontsumold").setValue(cssale.salecontsum);
				nui.get("saleprodmonold").setValue(cssale.saleprodmon);
				nui.get("saleservmonold").setValue(cssale.saleservmon);
				nui.get("saleprodwbmonold").setValue(cssale.saleprodwbmon);
				nui.get("saleservjsmonold").setValue(cssale.saleservjsmon);
				nui.get("saleservsubmonold").setValue(cssale.saleservsubmon);
				nui.get("saleothmonold").setValue(cssale.saleothmon);
				
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
	}
	function changeProduct(e){
		var prodname= nui.get("prodname").getValue();
		var prod = e.selected;
		if(prodname){
			nui.get("orderprodmon").setReadOnly(false);
			nui.get("conproid").setValue(prod.conproid);
			nui.get("prodmon").setValue(prod.prodmon);
			nui.get("prodsubmon").setValue(prod.prodsubmon);
			nui.get("prodothmon").setValue(prod.othmon);
			nui.get("prodwbmon1").setValue(prod.prodwbmon);
			nui.get("prodwbsubmon").setValue(prod.prodwbsubmon);
			nui.get("prodwbothmon").setValue(prod.prodwbothmon);
			nui.get("prodwbnetmon").setValue(prod.prodwbnetmon);
			nui.get("prodnumtype").setValue(prod.prodnumtype);
			nui.get("prodnum").setValue(prod.prodwbnetmon);
			
			nui.get("prodmonold").setValue(prod.prodmon);
			nui.get("prodsubmonold").setValue(prod.prodsubmon);
			nui.get("prodothmonold").setValue(prod.othmon);
			nui.get("prodwbmon1old").setValue(prod.prodwbmon);
			nui.get("prodwbsubmonold").setValue(prod.prodwbsubmon);
			nui.get("prodwbothmonold").setValue(prod.prodwbothmon);
		}else{
			nui.get("orderprodmon").setReadOnly(true);
		}
	}	
	
	
	//合同业务分类
    function getCsContracttype(e){
		return nui.getDictText('CS_CONTRACT_TYPE',e.value);
	}
	
	function dictProdUnit(e) {
        return nui.getDictText('CS_PROD_UNIT',e.value);
    }
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
</script>
</html>