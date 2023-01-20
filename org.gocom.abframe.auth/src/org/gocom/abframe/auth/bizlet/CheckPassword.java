package org.gocom.abframe.auth.bizlet;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.eos.system.annotation.Bizlet;


@Bizlet("密码校验逻辑")
public class CheckPassword {
	
	@Bizlet("密码运算逻辑")
	public  String check(String password){
		//默认是成功
		String status = "0";
		boolean flag = lengthFlag(password);
		if(!flag){
			status = "2";
			return status;
		}
		flag = upperFlag(password);
		if(!flag){
			status = "3";
			return status;
		}
		
		flag = lowerFlag(password);
		if(!flag){
			status = "4";
			return status;
		}
		
		flag = numFlag(password);
		if(!flag){
			status = "5";
			return status;
		}
		return status;
	}
	/**
	 * 校验密码长度
	 * @param password
	 * @return
	 */
	public boolean lengthFlag(String password){
		boolean flag = false;
		int length = password.length();
		if(length>7){
			flag = true;
		}
		return flag;
	}
	
	public boolean upperFlag(String password){
		Pattern pattern = Pattern.compile(".*[A-Z]+.*");
		Matcher isNum  = pattern.matcher(password);
		boolean flag = isNum.matches();
		return flag;
	}
	
	public boolean lowerFlag(String password){
		Pattern pattern = Pattern.compile(".*[a-z]+.*");
		Matcher isNum  = pattern.matcher(password);
		boolean flag = isNum.matches();
		return flag;
	}
	
	public boolean numFlag(String password){
		Pattern pattern = Pattern.compile(".*[0-9]+.*");
		Matcher isNum  = pattern.matcher(password);
		boolean flag = isNum.matches();
		return flag;
	}

}
