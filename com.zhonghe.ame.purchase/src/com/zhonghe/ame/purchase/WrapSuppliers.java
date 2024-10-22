package com.zhonghe.ame.purchase;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import cn.hutool.core.lang.Console;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.symmetric.AES;

import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("包装供应商信息")
public class WrapSuppliers {

	@Bizlet("包装市场经营信息数据 - 加密手机号、邮箱")
	public DataObject[] wrap(DataObject[] dataObjects) {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		AES aes = SecureUtil.aes("zhongheprimetons".getBytes());
		for (int i = 0; i < dataObjects.length; i++) {
			String mobile = dataObjects[i].getString("linktel");
			String mail = dataObjects[i].getString("linkmail");
			if(StrUtil.isNotBlank(mobile)){
				String encMobile = aes.encryptBase64(mobile);
				dataObjects[i].setString("linktel", encMobile);
			}
			if(StrUtil.isNotBlank(mail)){
				String encMail = aes.encryptBase64(mail);
				dataObjects[i].setString("linkmail", encMail);
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

}
