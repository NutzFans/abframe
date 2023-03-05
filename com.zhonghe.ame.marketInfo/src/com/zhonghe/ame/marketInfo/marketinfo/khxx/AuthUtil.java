package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.util.List;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

@Bizlet("权限运算工具类")
public class AuthUtil {

	@Bizlet("判断部门是否在指定部门级联中存在")
	public boolean includeBidOrg(String bidOrg, String orgSeq) {
		return ArrayUtil.contains(ArrayUtil.toArray(StrUtil.split(orgSeq, "."), String.class), bidOrg);
	}

}
