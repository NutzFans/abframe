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
		var tds="<td align='right' "+tooltip+">"+formdata.fiedisplayname+":</td><td style='width:"+formdata.fwidth+"px'>"+inputs+"</td>"
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