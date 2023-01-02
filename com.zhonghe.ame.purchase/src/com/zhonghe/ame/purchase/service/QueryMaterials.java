package com.zhonghe.ame.purchase.service;

import com.eos.engine.component.ILogicComponent;
import com.primeton.ext.engine.component.LogicComponentFactory;
import commonj.sdo.DataObject;

public class QueryMaterials {
	public Boolean queryMaterialsSortByCode(String code) throws Throwable {
		Boolean isResultBoolean;
		Object[] inParametersMa={code};
		ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
		Object[] result=logicComponent.invoke("queryMaterialsSort", inParametersMa);
		try {
			//能够转换说明库中有数据
			DataObject[] retsObjects=(DataObject[])result[0];
			retsObjects[0].get(0);
			isResultBoolean=true;
		} catch (Exception e) {

			isResultBoolean=false;
		}
		return isResultBoolean;
		
	}
	
	public Boolean queryMaterialsMaterDataByCode(String code) throws Throwable {
		Boolean isResultBoolean;
		Object[] inParametersMa={code};
		ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
		Object[] result=logicComponent.invoke("queryMaterialsMaterData", inParametersMa);
		try {
			//能够转换说明库中有数据
			DataObject[] retsObjects=(DataObject[])result[0];
			retsObjects[0].get(0);
			isResultBoolean=true;
		} catch (Exception e) {
			isResultBoolean=false;
		}
		return isResultBoolean;
		
	}
}
