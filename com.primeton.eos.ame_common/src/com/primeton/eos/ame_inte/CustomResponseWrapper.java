/**
 * 
 */
package com.primeton.eos.ame_inte;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.apache.commons.io.output.TeeOutputStream;
import org.apache.commons.lang.StringUtils;

import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;

/**
 * @author yann
 * @date 2020-08-07 14:39:33
 * 
 */
@Bizlet("")
public class CustomResponseWrapper extends HttpServletResponseWrapper {
	Logger logger = TraceLoggerFactory.getLogger(this.getClass());
	
	private ByteArrayOutputStream output = new ByteArrayOutputStream();
	private ServletOutputStream filterOutput;
	private PrintWriter pwrite;
	private String charset = "GBK";

	public CustomResponseWrapper(HttpServletResponse response, String charset) {
		super(response);
		if(StringUtils.isNotEmpty(charset)) {
			this.charset = charset;
		}
		
		try {
			filterOutput = new ServletOutputStream() {

				private TeeOutputStream teeOutputStream = new TeeOutputStream(CustomResponseWrapper.super.getOutputStream(), output);

				@Override
				public void write(int b) throws IOException {
					teeOutputStream.write(b);
				}
			};
		} catch (IOException e) {
			logger.error("[app_inte] error:", e);
		}
	}

	/**
	 * 利用TeeOutputStream复制流，解决多次读写问题 用super.getOutputStream来获取源outputstream
	 * 
	 * @return
	 * @throws IOException
	 */
	@Override
	public ServletOutputStream getOutputStream() throws IOException {
		return filterOutput;
	}
	
	@Override
	public PrintWriter getWriter() throws IOException {
		if (pwrite == null) {
			pwrite = new PrintWriter(new OutputStreamWriter(output, charset));
		}
		return pwrite;
	}

	public byte[] toByteArray() {
		try {
			output.flush();
		} catch (IOException e) {
			logger.error("[app_inte] error:", e);
		}
		return output.toByteArray();
	}
	
	public void close() {
		//output.close();
		pwrite.close();
	}

}
