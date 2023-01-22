/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import com.eos.system.annotation.Bizlet;

/**
 * @author 李鹏程
 * @date 2020-05-29 14:35:23
 *
 */
@Bizlet("")
public class UserMobileno {
	String mobileno;
	String name;
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "UserMobileno [mobileno=" + mobileno + ", name=" + name + "]";
	}
	
}
