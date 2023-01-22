/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import com.eos.system.annotation.Bizlet;

/**
 * @author 李鹏程
 * @date 2020-05-14 08:54:50
 *
 */
@Bizlet("")
public class User {
		String userid;

		public String getUserid() {
			return userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		@Override
		public String toString() {
			return "User [userid=" + userid + "]";
		}
		
}
