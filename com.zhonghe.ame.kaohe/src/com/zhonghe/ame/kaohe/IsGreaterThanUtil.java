package com.zhonghe.ame.kaohe;

import java.math.BigDecimal;

import cn.hutool.core.util.NumberUtil;

import com.eos.system.annotation.Bizlet;

@Bizlet("金额比较")
public class IsGreaterThanUtil {

	@Bizlet("金额大于等于10%")
	public String greaterThanTen(BigDecimal declareAmount, BigDecimal confirmAmount) {
		BigDecimal threshold = NumberUtil.mul(declareAmount, new BigDecimal("1.1"));
		if (confirmAmount.compareTo(threshold) >= 0) {
			return "1";
		} else {
			return "0";
		}
	}

}
