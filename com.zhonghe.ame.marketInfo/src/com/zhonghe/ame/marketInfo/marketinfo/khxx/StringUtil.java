package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import java.util.HashMap;

import cn.hutool.core.util.StrUtil;

import com.eos.system.annotation.Bizlet;

@Bizlet("字符串处理工具")
public class StringUtil {

	@Bizlet("判断是否相等")
	public boolean equals(String str1, String str2) {
		return StrUtil.equals(StrUtil.trim(str1), StrUtil.trim(str2));
	}

}
