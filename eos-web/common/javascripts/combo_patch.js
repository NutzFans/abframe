
ComboSelect.prototype.getEntityByValue=function(fValue , iCase){
	var rowNum= this.dataset?this.dataset.getLength():0;
	fValue= ''+(fValue || (this.hiddenObject?this.hiddenObject.value:'') || '');
	 (iCase===true) && (fValue=fValue.toLowerCase()); 
	for (var i=0;i<rowNum;i++ ){
		var entity=this.dataset.get(i);
		entity.__index=i;
		var eValue=entity?entity.getProperty(this.valueField):null;
		if (eValue!==undefined && eValue!==null){
			(iCase===true)  && ( eValue=(''+eValue).toLowerCase() );
			if (fValue === eValue){
				return entity;
			}
		}
	}
	return null;
}   



/**
 * 载入数据的方法.
 */
// this.afterLoadData();
ComboSelect.prototype.loadData = function(){
	if (this.beforeLoadData()===false){
		return;
	}

	if (!this.linkId && !this.queryAction && this.xpath){
		var xmlZone=document.getElementById(this.id+"_xml");
		this.dataXML= xmlZone?xmlZone.innerHTML:null;
	}else if (this.linkId && this.linkId.indexOf('xml:')==0){
		var xmlZone=document.getElementById(this.linkId.substring(4));
		this.dataXML= xmlZone?xmlZone.innerHTML:null;
	}else if (this.linkId && this.isFirstLoad ){
		this.isFirstLoad=false;
		var linkCombo = $id(this.linkId);
		if(linkCombo && linkCombo.xtype=="combo"){
			var parentValue = linkCombo.getSelectEntity();
			if(parentValue){
				this.freshFromEntity(parentValue);
			}
		}
		return;
	}

	var xmlDom;
	var _dataXML=this.dataXML;

	this.dataset = new Dataset();
	
	if (this.nullText !== null) {
		if (!this.isIeMode) {
			var emptyEntity = new Entity();
			emptyEntity.setProperty(this.valueField, "");
			emptyEntity.setProperty(this.textField, this.nullText);
			this.setValue("");
			this.dataset.addEntity(emptyEntity);
		} else {}
	}


	if(_dataXML){
		this.dataset.appendDataset(Dataset.create(_dataXML,this.xpath)) ;
		return;
	}
	if(this.onLoadData()!==false){
		if(!this.queryAction){
			return ;
		}
		var ajax = new HideSubmit(this.queryAction);
		
		var param='';//=this.getQueryForm();
		var paramFn='';
 		if (this.initParamFunc) {
 			try {
 				paramFn= eval(this.initParamFunc + "(ajax)");
 			} catch (e) {
 				try {
 					paramFn= eval(this.initParamFunc + "()");
 				} catch (e1) {
 					$handle(e1);
 				}
 			}
 		}
		if(this.dataType=='json'){
			param={};
			EOS.apply(param,this.queryParam);
			EOS.apply(param,this.pageParam);
			EOS.apply(param,paramFn);
		}else{
			param='';
			param+=this.queryParam||'';
			param+=this.pageParam||'';
			param+=paramFn||'';
		}
		if(this.filterID){
			var form = $id(this.filterID);
			if(form){
				for(var i=0;i<form.elements.length;i++){
					var elem = form.elements[i];
					if(elem.name){
						ajax.addParam(elem.name,elem.value);
					}
				}
			}
		}
		if(this.paramList){
			for(var i=0;i< this.paramList.length;i++){
				var elem = this.paramList[i];
				if(elem){
					ajax.addParam(elem.key,elem.value);
				}
			}
		}

		if(this.queryReturnValue){
			ajax.setOutParam(this.queryReturnValue );
		}

		if(this.queryParamsInfo){
			ajax.setParamsInfo(this.queryParamsInfo );
		}

		if(this.queryInoutParams){
			ajax.setInoutParam(this.queryInoutParams );
		}

		var _this=this;
		ajax.onSuccess=function(){
			var pagecond=0;
			if(_this.dataType=='json'&&ajax.retJson){
				var xp=_this.xpath;
				var arr=ajax.retJson;
				if(xp){
					xp=xp.split('/');
					for(var i=0,len=xp.length;i<len;i++){
						arr=arr[xp[i]];
					}
				}
				_this.dataset=Json2Dataset(arr);
				if(ajax.retJson.page){
					pagecond=ajax.retJson.page.length;
				}
			}else{
				xmlDom = ajax.retDom;
				_this.dataset = Dataset.create(xmlDom, _this.xpath, null);
				pagecond = xmlDom.selectSingleNode("/root/data/page");
			}
			
			if (!_this.isIeMode&&_this.nullText!==null) {
				var emptyEntity = new Entity();
				emptyEntity.setProperty(_this.valueField, "");
				emptyEntity.setProperty(_this.textField, _this.nullText);
				_this.setValue("");
				_this.dataset.insertEntity(emptyEntity,true,0);
			} else {}
			
			if(_this.afterLoadData){
				_this.afterLoadData();
			}
		}
		ajax.loadData(param);
	}
	
	/* if(this.afterLoadData()===false){
     return;
  	} */
}