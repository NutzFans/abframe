	function clickCsLic(e){
		if(!activityDefID){
			var csContlics = csContLicense_grid.getSelecteds();
			if(csContlics.length>0){
				document.getElementById("csLicProds").innerHTML = null;
				for(var i=0;i<csContlics.length;i++){
					var lictempcode = csContlics[i].lictempcode;
					setCsLicForm(i,lictempcode);
				}
				nui.parse();
				for(var i=0;i<csContlics.length;i++){
					initProd(i,csContlics[i]);
				}
			}else{
				document.getElementById("csLicProds").innerHTML = null;
			}
		}
	}
	function setCsLicForm(i,lictempcode){
		var html = "";
		html += '<div id="form_'+i+'" ><fieldset style="border:solid 1px #aaa;padding:3px;"><legend id="legend_'+i+'"></legend>';
		html += '<table style="table-layout:fixed;"><tr><td style="width:120px;" align="right">License发放类型：</td>';
		html += '<td style="width:140px;"><input class="nui-dictcombobox" name="sendreas" id="sendreas_'+i+'" dictTypeId="CS_SENDREAS"  onvaluechanged="changeSendreas"/></td>';
		html += '<td style="width: 115px;" align="right">本次申请个数：</td><td style="width:140px;"><input class="nui-hidden" name="licfilenumMax" id="licfilenumMax_'+i+'" />';
		html += '<input class="nui-spinner" name="licfilenum" id="licfilenum_'+i+'" format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" onvaluechanged="changelicfilenum"/></td>';
		html += '<td style="width: 115px;" align="right">许可绑定CPU数：</td><td style="width:140px;" colspan="1">';
		html += '<input class="nui-spinner" name="licfilebindcpu" id="licfilebindcpu_'+i+'" format="n0" showbutton="false" allowLimitValue="false" changeOnMousewheel="false" /></td></tr>';
		html += '<tr><td style="width:120px;" align="right">产品名称：</td><td style="width:135px;"colspan="3"> ';
		html += '<input name="prodname" id="prodname_'+i+'" url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" required="true" style="width:391px;" class="nui-treeselect" ';
		html += 'textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true"';
		html += 'showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true" readonly="readonly"/></td>';
		html += '<td style="width:120px;" align="right">旧产品名称：</td><td style="width:140px;"colspan="1"> ';
		html += '<input name="prodnameold" id="prodnameold_'+i+'" url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:391px;" class="nui-treeselect" ';
		html += 'textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true" ';
		html += 'showNullItem="true" multiSelect="false" expandOnLoad="true" showFolderCheckBox="true" onbeforenodeselect="beforenodeselect" allowInput="true"/></td></tr>';
		html += '<tr><td style="width:120px;" align="right">IP地址：</td><td style="width:140px;" colspan="3"> ';
		html += '<input name="bindip" id="bindip_'+i+'" required="true" class="nui-textarea" style="width:391px"/></td>';
		html += '<td style="width:120px;" align="right">旧IP地址：</td><td style="width:140px;" colspan="1"> ';
		html += '<input name="bindipold" id="bindipold_'+i+'" class="nui-textarea" style="width:391px"/></td></tr></table><div id ="dyProdForm_'+i+'"></div></fieldset></div>';
		document.getElementById("csLicProds").innerHTML= document.getElementById("csLicProds").innerHTML+html;
	}
	function initProd(i,csContlic){
		var prodname = csContlic.prodname;
		var prodtypename = csContlic.prodtypename;
		var lastnum = csContlic.lastnum;
		var lictempcode = csContlic.lictempcode;
		nui.get("prodname_"+i).setValue(prodname);
		nui.get("prodname_"+i).setText(prodtypename);
		nui.get("licfilenumMax_"+i).setValue(lastnum);
		document.getElementById("legend_"+i).innerHTML=prodtypename;
		if(lictempcode){
			setDynamicForm("LICEPORD",lictempcode,"dyProdForm_"+i);
		}
	}
	/*
	 * 根据业务表及业务类型动态生成表单信息
	 * busfom 业务表
	 * buscode 业务类型
	 * formid 主页面对应的表单id
	 * */	
	function setDynamicForm(busform,buscode,formid){
		var json={busform:busform,buscode:buscode};
		var result;//设置结果
		nui.ajax({
			url: "com.primeton.eos.ame_common.ameFormConfig.getFormConfig.biz.ext",
	        type: 'POST',
	        data:json,
	        cache: false,
	        async:false,
	        contentType: 'text/json',
	        success: function (text) {
	        	var formdata = text.formdata;
	        	result=getHtmls(formdata,formid);
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            nui.alert(jqXHR.responseText);
	            result= false;
	        }
		})
		return result;
	}
	
	function getHtmls(formdata,formid){
		var frow=1;//判断行是否有变化,默认第一行
    	var trs="<tr>";//行
    	var htmls="";//生成得html，默认为空
    	for(var i=0;i<formdata.length;i++){
    		if(frow==formdata[i].frow){
    			var tds= getTds(formdata[i]);
    			trs=trs+tds;
    		}else{
    			trs=trs+"</tr>"
    			htmls=htmls+trs;
    			trs="<tr>";
    			frow=formdata[i].frow;
    			var tds= getTds(formdata[i],i);
    			trs=trs+tds;
    		}
    	}
    	htmls="<table>"+htmls+trs+"</tr></table>";
    	document.getElementById(formid).innerHTML = htmls;
    	nui.parse();
    	return true;
	}
	
	function getTds(formdata,i){
		var inputs;
		var requireds;
		var maxlength;
		if(formdata.isrequired=="1"){
			requireds=true;
		}else{
			requireds=false;
		}
		var devalue=null;//默认值
		var isallowinput = null;//是否允许输入
		var isreadonly = null;//是否只读
		if(formdata.defaultvalue!=null&&formdata.defaultvalue!=""){
			devalue="value='"+formdata.defaultvalue+"'";
		}
		if(formdata.allowinput=="1"){
			isallowinput="allowInput=true";
		}else if(formdata.allowinput=="0"){
			isallowinput="allowInput=false";
		}
		if(formdata.isreadonly=="1"){
			isreadonly="readOnly=true";
		}
		if(formdata.maxlength!=null&&formdata.maxlength!=""){
			maxlength="maxlength='"+formdata.maxlength+"'";
		}
		
		var tooltip;
		if(formdata.explains!=null&&formdata.explains!=""){
			tooltip= "class='tooltips' data-tooltips='"+formdata.explains+"' id='tooltips"+i+"'";
		}
		
		if(formdata.fieldtype=="nui-dictcombobox"){
			inputs="<input class='"+formdata.fieldtype+"' required='"+requireds+"' dicttypeId='"+formdata.dicttype+"' "+devalue+" "+isallowinput+" "+isreadonly+" style='width:90%' name='"+formdata.fieldname+"' onvaluechanged='"+formdata.valuechangefun+"'>"
		}else if(formdata.fieldtype=="nui-spinner"){
			if(devalue){
				inputs="<input class='"+formdata.fieldtype+"' required='"+requireds+"' format='n"+formdata.accuracy+"' "+devalue+" "+isallowinput+" "+isreadonly+" style='width:90%' name='"+formdata.fieldname+"' onvaluechanged='"+formdata.valuechangefun+"' maxValue='99999999' allowNull='true' value='null'>"
			}else{
				inputs="<input class='"+formdata.fieldtype+"' required='"+requireds+"' format='n"+formdata.accuracy+"' "+isallowinput+" "+isreadonly+" style='width:90%' name='"+formdata.fieldname+"' onvaluechanged='"+formdata.valuechangefun+"' maxValue='99999999' allowNull='true' value='null'>"
			}
		}else{
			inputs="<input class='"+formdata.fieldtype+"' required='"+requireds+"' "+devalue+" "+isallowinput+" "+isreadonly+" "+maxlength+" style='width:90%' name='"+formdata.fieldname+"' onvaluechanged='"+formdata.valuechangefun+"'>"
		}
		var tds="<td align='right' "+tooltip+" style='width:117px'>"+formdata.fiedisplayname+"：</td><td style='width:"+formdata.fwidth+"px'>"+inputs+"</td>"
		return tds;
	}
	
	var tip = new mini.ToolTip();
	tip.set({
	    target: document,
	    selector: '.tooltips',
	    placement:"right",
	    onbeforeopen: function (e) {            
	        e.cancel = false;
	    },
	    onopen: function (e) { 
	           var el=e.element;
	           var id=el.id;
	           var content=$("#"+id).data("tooltips");
	           tip.setContent(content);
	           $(".mini-tooltip-inner").css("background","#E9F4FE");
	    }
	});
	//选择发放类型时判断
	function changeSendreas(e){
		var sender = e.sender;
		var value = e.value;
		var reasid = sender.id;
		var num = reasid.substring(reasid.indexOf("_")+1,reasid.length);
		if(value == "02"){
			nui.get("bindipold_"+num).setRequired(true);
			nui.get("prodnameold_"+num).setRequired(false);
		}else if(value == "03"){
			nui.get("prodnameold_"+num).setRequired(true);
			nui.get("bindipold_"+num).setRequired(false);
		}else if(value == "04"){
			nui.get("bindipold_"+num).setRequired(true);
			nui.get("prodnameold_"+num).setRequired(true);
		}else{
			nui.get("bindipold_"+num).setRequired(false);
			nui.get("prodnameold_"+num).setRequired(false);
		}
	}
	function changelicfilenum(e){
		var sender = e.sender;
		var value = parseInt(e.value);
		var reasid = sender.id;
		var num = reasid.substring(reasid.indexOf("_")+1,reasid.length);
		var licfilenumMax = parseInt(nui.get("licfilenumMax_"+num).getValue());
		var sendreas = nui.get("sendreas_"+num).getValue();
		if(sendreas == '01' && licfilenumMax < value){
			nui.alert("许可文件个数不能大于产品授权剩余数量","提示",function(){
				nui.get("licfilenum_"+num).setValue(licfilenumMax);
			});
		}
		
	}
	
	function changeContNum(e){
		var json = nui.encode({"contnum1":e.value});
		nui.ajax({
    		url: "com.primeton.mis.contract.contract.getContract.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				var data = text.cscontract;
				if(data.contractid){
					var contractid = data.contractid;
                	//合同基本信息
                    nui.get("projectname").setValue(data.projectname);
                    nui.get("projectname").setText(data.projectname);
                	nui.get("contractid").setValue(data.contractid);

                    nui.get("liccontnum").setValue(data.contnum);
                    nui.get("licprojectname").setValue(data.projectname);
                    nui.get("contnum").setValue(data.contnum);
                	//document.getElementById("contnum").innerHTML = data.contnum == null ?"":data.contnum;
                	document.getElementById("contsum").innerHTML = data.contsum == null ?"":formatNumber(data.contsum,'#,##.##');
                	
                	document.getElementById("salename").innerHTML = data.salename == null ?"":data.salename;
                	document.getElementById("custname").innerHTML = data.misCustinfo==null?"": data.misCustinfo.custname == null ?"":data.misCustinfo.custname;
                	document.getElementById("contreg").innerHTML = data.contreg == null ?"":data.contreg;
                	
                	//合同产品授权
					csContLicense_grid.sortBy("contlicid","asc");
					csContLicense_grid.load({contnum: data.contnum});
					getContProj(contractid);
				}else{
					nui.alert("您输入的合同编号不存在，请确认");
					nui.get("projectname").setValue(null);
                    nui.get("projectname").setText(null);
                	nui.get("contractid").setValue(null);

                    nui.get("liccontnum").setValue(null);
                    nui.get("licprojectname").setValue(null);
                    nui.get("contnum").setValue(null);
                	document.getElementById("contsum").innerHTML = "";
                	
                	document.getElementById("salename").innerHTML = "";
                	document.getElementById("custname").innerHTML = "";
                	document.getElementById("contreg").innerHTML = "";
                	nui.get("projectid").setData(null);
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
	}
	
	//选择销售合同弹窗(只能选择本事业部是合同)
    function selectCont(){
    	nui.open({
            url:paths+"/ame_income/csReveForecast/SelectCsContract.jsp",
            title: "选择销售合同",
            width: 800,
            height: 400,
            allowResize: false,
            onload:function (){
            	var iframe = this.getIFrameEl();
                iframe.contentWindow.search();
            },
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                    	var contractid = data.contractid;
                    	//合同基本信息
                        nui.get("projectname").setValue(data.projectname);
                        nui.get("projectname").setText(data.projectname);
                    	nui.get("contractid").setValue(data.contractid);

                        nui.get("liccontnum").setValue(data.contnum);
                        nui.get("licprojectname").setValue(data.projectname);
                        nui.get("contnum").setValue(data.contnum);
                    	//document.getElementById("contnum").innerHTML = data.contnum == null ?"":data.contnum;
                    	document.getElementById("contsum").innerHTML = data.contsum == null ?"":formatNumber(data.contsum,'#,##.##');
                    	
                    	document.getElementById("salename").innerHTML = data.salename == null ?"":data.salename;
                    	document.getElementById("custname").innerHTML = data.misCustinfo==null?"": data.misCustinfo.custname == null ?"":data.misCustinfo.custname;
                    	document.getElementById("contreg").innerHTML = data.contreg == null ?"":data.contreg;
                    	
    					//form_Reve.reset();
                    	//合同产品授权
						csContLicense_grid.sortBy("contlicid","asc");
						csContLicense_grid.load({contnum: data.contnum});
						getContProj(contractid);
					}
            	}
        	}
    	})
    }
    
    function getContProj(contractid){
    	var json = nui.encode({"myid":contractid});
		nui.ajax({
    		url: "com.primeton.mis.contract.csLicense.selectProj.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nui.get("projectid").setData(text.list);
				if(text.list.length>0){
					nui.get("projectid").setValue(text.list[0].projectid);
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
    }
    
    //选择接收人等
    function selectPerson(e){
        nui.open({
			url:paths+"/mis_cs2/tempLicense/selectApplicant.jsp",
			title: "接收人选择（单选）",
			width: 800,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						var linmail =data.email;
		                nui.get("inceptperson").setValue(data.linkman);
		                nui.get("inceptperson").setText(data.linkman);
		                nui.get("custname").setValue(data.custname);
		                nui.get("inceptcustid").setValue(data.custid);
		                nui.get("inceptpersonmail").setValue(data.email);
		                nui.get("inceptiscomp").setValue(data.iscomp);
					}
				}
			}
		});
    }
    //选择产品时不允许选择非产品项
	function beforenodeselect(e){
        if (e.isLeaf == false) {
        	e.cancel = true;
        }
	}
	//合同产品授权单位
    function getCsContLicType(e){
		return nui.getDictText('CS_CONT_LIC_UNIT',e.value);
	}
    //发放类型
    function getSendreas(e){
		return nui.getDictText('CS_SENDREAS',e.value);
	}
    
    function drawSum(e){
		if (e.field == "total"  || e.field == "grantnum"  || e.field == "lastnum" ||
			e.field == "licfilenum"  || e.field == "licfilebindcpu"  || e.field == "projectnum" ||
			e.field == "usernum"  || e.field == "domainmax"  || e.field == "instancemax" ||
			e.field == "tenantmax"  || e.field == "tenantsysmax"  || e.field == "tenantusermax" ) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
    /**
     *验证
     */
    function onOkCheck(){
    	var filePaths = document.getElementsByName("uploadfile1").length;
     	for(var j = 0;j < filePaths;j++){
     		var a = document.getElementsByName("remarkList1")[j].value;
     		if(a == null || a == ""){
     			nui.alert("新增附件不可以为空");
     			return false;
     		}
     	}
     	var filePaths = document.getElementsByName("uploadfile2").length;
     	if("manualActivity3" == activityDefID){
         	if(filePaths <= 0){
         		nui.alert("请添加邮件附件");
     			return false;
         	}
     	}
     	for(var j = 0;j < filePaths;j++){
     		var a = document.getElementsByName("remarkList2")[j].value;
     		if(a == null || a == ""){
     			nui.alert("新增附件不可以为空");
     			return false;
     		}
     	}
        return true;
    }
    //验证授权产品非空
    function checkLicProds(csLicProds){
    	for(var i=0;i<csLicProds.length;i++){
    		var licfilenum = parseInt(csLicProds[i].licfilenum);
    		var lastnum = parseInt(csLicProds[i].lastnum);
    		var prodname = csLicProds[i].prodtypename;
    		var sendreas = csLicProds[i].sendreas;
    		var prodnameold = csLicProds[i].prodnameold;
    		var bindipold = csLicProds[i].bindipold;
    		var lictempcode = csLicProds[i].lictempcode;
    		var projectnum = csLicProds[i].projectnum;//项目数
    		var usernum = csLicProds[i].usernum;//用户数
    		var domainmax = csLicProds[i].domainmax;//被管域最大数
    		var instancemax = csLicProds[i].instancemax;//被管实例最大数
    		var tenantmax = csLicProds[i].tenantmax;//租户最大数
    		var tenantsysmax = csLicProds[i].tenantsysmax;//租户内系统最大数
    		var tenantusermax = csLicProds[i].tenantusermax;//租户内用户最大数
    		if(sendreas == '01' && licfilenum > lastnum){
    			nui.alert("产品名称："+prodname+"--的许可文件个数不能大于产品授权剩余数量！");
    			return false;
    		}
    		if(sendreas == "02"){
    			if(bindipold == null || bindipold == ""){
    				nui.alert("产品名称："+prodname+"--的旧IP地址不能为空！");
    				return false;
    			}
    		}else if(sendreas == "03"){
    			if(prodnameold == null || prodnameold == ""){
    				nui.alert("产品名称："+prodname+"--的旧产品名称不能为空！");
    				return false;
    			}
    		}else if(sendreas == "04"){
    			if(bindipold == null || bindipold == ""){
    				nui.alert("产品名称："+prodname+"--的旧IP地址不能为空！");
    				return false;
    			}
    			if(prodnameold == null || prodnameold == ""){
    				nui.alert("产品名称："+prodname+"--的旧产品名称不能为空！");
    				return false;
    			}
    		}
    		if(lictempcode =="2"){
    			if(projectnum == null || projectnum == ""){
    				nui.alert("产品名称："+prodname+"--的项目数不能为空！");
    				return false;
    			}
    			if(usernum == null || usernum == ""){
    				nui.alert("产品名称："+prodname+"--的用户数不能为空！");
    				return false;
    			}
    		}else if(lictempcode =="3"){
    			if(domainmax == null || domainmax == ""){
    				nui.alert("产品名称："+prodname+"--的被管域最大数不能为空！");
    				return false;
    			}
    			if(instancemax == null || instancemax == ""){
    				nui.alert("产品名称："+prodname+"--的被管实例最大数不能为空！");
    				return false;
    			}
    			if(tenantmax == null || tenantmax == ""){
    				nui.alert("产品名称："+prodname+"--的租户最大数不能为空！");
    				return false;
    			}
    			if(tenantsysmax == null || tenantsysmax == ""){
    				nui.alert("产品名称："+prodname+"--的租户内系统最大数不能为空！");
    				return false;
    			}
    			if(tenantusermax == null || tenantusermax == ""){
    				nui.alert("产品名称："+prodname+"--的租户内用户最大数不能为空！");
    				return false;
    			}
    		}
    	}
    	return true;
    }
    
	 var editor2 = null;
	 KindEditor.ready(function(K) {
			editor2 = K.create('textarea[name="content2"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			cssData: '* {font: 12px;line-height:13px}',
			items : [  
			    'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',  
			    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',  
			    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',  
			    'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',  
			    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',  
			    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',  
			    'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',  
			    'anchor', 'link', 'unlink', '|', 'about'  
			] ,
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
			}
		});
		prettyPrint();
	}); 
    
	//关闭
	function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}