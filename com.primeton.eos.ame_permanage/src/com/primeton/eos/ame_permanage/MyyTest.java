/**
 * 
 */
package com.primeton.eos.ame_permanage;

import java.util.HashMap;
import java.util.Map;

import com.eos.system.annotation.Bizlet;

/**
 * @author mengyy
 * @date 2020-04-10 10:26:53
 *
 */
@Bizlet("")
public class MyyTest extends Thread {
	
	//古典问题：有一对兔子，从出生后第3个月起每个月都生一对兔子，小兔子长到第三个月后每个月又生一对兔子，假如兔子都不死，问每个月的兔子总数为多少？
	public static void test1(){
		int f1=1,f2=1,f;
        int M=30;
        System.out.println("a:"+f1);
        System.out.println("b:"+f2);
        for(int i=3;i<M;i++) {
            f=f2;
            f2=f1+f2;
            f1=f;
            System.out.println("c:"+f2);
        }
	}
	//九九乘法表
	public static void jiujiu(){
		int i=0;
		int j=0;
		for(i=1;i<=9;i++){
			for(j=1;j<=9;j++){
				System.out.print(i+"*"+j+"="+i*j+"\t");
			}
			System.out.println();
		}
	}
	
	
    public static void main(String[] args) {
    	Map map = new HashMap();
    	map.put("mm", "mm1");
    	jiujiu();
    }

}
