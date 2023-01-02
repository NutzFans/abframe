/**
 * 
 */
package org.gocom.abframe.auth.bizlet;


import com.eos.system.annotation.Bizlet;
import com.primeton.tp.common.crypto.EOSCipherTool;
import com.primeton.tp.common.crypto.EOSCryptoException;
import com.primeton.tp.common.crypto.EOSDigestTool;
/**
 * @author huangqj
 * @date 2013-03-04 16:42:37
 *
 */
@Bizlet("")
public class LogonUtil4EOS3 {

	/**
	 * @param oldpass
	 * @return
	 * @author huangqj
	 * @throws EOSCryptoException 
	 */
	@Bizlet("")
	public static String encrypt(String plain) throws EOSCryptoException {
		// TODO 自动生成方法存根
		EOSCipherTool cipher = new EOSCipherTool();
        return cipher.encrypt(plain);
	}
	/**
	 * @param cryptPasswd
	 * @param dbDasswd
	 * @return
	 * @author huangqj
	 * @throws EOSCryptoException 
	 */
	@Bizlet("")
	public static boolean authenticate(String cryptPasswd,String dbDasswd) throws EOSCryptoException{
		 EOSDigestTool digestTool = new EOSDigestTool();
         if(digestTool.isEqual(cryptPasswd, dbDasswd)){
             return true;
         } else{
             return false;
         }
	}
	/**
	 * @param cryptPasswd
	 * @return
	 * @author huangqj
	 * @throws EOSCryptoException 
	 */
	@Bizlet("")
	public static String digest(String cryptPasswd) throws EOSCryptoException{
		 EOSDigestTool digestTool = new EOSDigestTool();
		 return digestTool.digest(cryptPasswd);
	}
}
