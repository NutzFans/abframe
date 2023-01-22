package com.primeton.eos.ame_common;

import java.util.Random;  

import com.eos.system.annotation.Bizlet;

/**
 * @author zhuhx
 * @date 2017-02-13 14:43:49
 *
 */
@Bizlet("")
public class RandomPassword {
	
	@Bizlet("")
	public static String getPass(String mailname) {  
		  
        String password = getRandomPassword(10,mailname);  
        System.out.println(password);  
        return password;
    }  
	
	@Bizlet("")
	public static String getPass2(String mailname) {  
		  
        String password = getRandomPassword(8,mailname);  
        System.out.println(password);  
        return password;
    } 
      
    //获取验证过的随机密码  
    public static String getRandomPassword(int len,String mailname) {  
        String result = null;  
          
        /*if(len >= 6) { 
            for(result = makeRandomPassword(len);len >= 6;result = makeRandomPassword(len)){              
                if (result.matches(".*[a-z]{1,}.*") && result.matches(".*[A-Z]{1,}.*") && result.matches(".*\\d{1,}.*") && result.matches(".*[~!@#$%^&*\\.?]{1,}.*")) { 
                    return result; 
                }  
            } 
        }*/  
        while(len>=8){  
            result = makeRandomPassword(len);  
            if (check(result, mailname)) {  
                	return result;  
            }   
            result = makeRandomPassword(len);  
        }  
        return "长度不得少于8位!";  
    }
    
    //随机密码生成  
    public static String makeRandomPassword(int len){  
        char charr[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".toCharArray();  
        //System.out.println("字符数组长度:" + charr.length); //可以看到调用此方法多少次  
        StringBuilder sb = new StringBuilder();  
        Random r = new Random();  
          
        for (int x = 0; x < len; ++x) {  
            sb.append(charr[r.nextInt(charr.length)]);  
        }  
        return sb.toString();
    }
    public static boolean isOrderNumeric(String numOrStr){ 
    	boolean flag = true;
    		for (int i = 0; i < numOrStr.length(); i++) { 
    			if (i > 1) {
    				//判断如123456 
    				byte[] bytes = (numOrStr.charAt(i)+"").getBytes();
    				int num=Integer.valueOf(numOrStr.charAt(i));
    				int num1=Integer.valueOf(numOrStr.charAt(i-1))+1;
    				int num2=Integer.valueOf(numOrStr.charAt(i-2))+2;
    				int num3=Integer.valueOf(numOrStr.charAt(i-1))-1;
    				int num4=Integer.valueOf(numOrStr.charAt(i-2))-2; 
    				if (num== num1&&num==num2 ) { 
    					flag = false; 
    					break; 
    				}
    				if (num== num3&&num==num4 ) { 
    					flag = false; 
    					break; 
    				}
    				System.out.println(num+"-"+num1+"-"+num2);
    			} 
    	}
    	return flag; 
    } 
    public static boolean check(String result,String mailname){ 
    	boolean flag = false;
    	boolean a = result.matches(".*[a-z]{1,}.*");
    	boolean b = result.matches(".*[A-Z]{1,}.*");
    	boolean c = result.matches(".*\\d{1,}.*");
    	boolean d = result.matches(".*[~!@#$%^&*\\.?]{1,}.*");
    	boolean e = isOrderNumeric(result);
    	boolean f = !result.contains(mailname);
    	if((a&&b&&c&&e&&f)||(a&&b&&d&&e&&f)||(a&&c&&d&&e&&f)||(b&&c&&d&&e&&f)){
    		flag = true;
    	}
    	
    	return flag; 
    } 
}
