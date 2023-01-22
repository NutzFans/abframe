package com.zhonghe.ame.purchase.service;

import com.eos.engine.component.ILogicComponent;
import com.primeton.ext.engine.component.LogicComponentFactory;

import commonj.sdo.DataObject;


public class MaterialsOpLog {
	
	//保存物资日志
	public void setMaterialsSortOpLog(DataObject dataObject,String isSort) throws Throwable {
		Object[] inParametersMa={dataObject,isSort};
		ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
		logicComponent.invoke("addMaterialsSortLog", inParametersMa);
	}

}
