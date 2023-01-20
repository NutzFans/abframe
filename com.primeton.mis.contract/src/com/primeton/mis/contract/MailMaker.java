package com.primeton.mis.contract;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.mail.internet.MimeUtility;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import com.eos.common.mail.MailFactory;
import com.eos.foundation.MailInfo;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("mailMaker")
public class MailMaker {
	@Bizlet("mailMaker")
	public static MailInfo mailMaker(MailInfo email, DataObject funcN, DataObject funcY, String processInstName, String applyType, DataObject misCont) {
		try {
			String seqnoN = URLEncoder.encode(funcN.getString("seqno"), "utf-8");
			String seqnoY = URLEncoder.encode(funcY.getString("seqno"), "utf-8");
			String randstrN = URLEncoder.encode(funcN.getString("randstr"), "utf-8");
			String randstrY = URLEncoder.encode(funcY.getString("randstr"),	"utf-8");
			String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.mis.contract","NewBXSystem","addressAndPort","ipaddress");
			String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.mis.contract","NewBXSystem","addressAndPort","port");
			String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.mis.contract","NewBXSystem","addressAndPort","appName");
			String urlN = "";
			String urlY = "";
			if(newBXPort.equals("")){
				urlN = "http://"+newBXAdd+"/"+newBXAppName+"/com.primeton.mis.contract.UniqueFlow.execute.action?seqno=" + seqnoN + "&verifyCode=" + randstrN;
				urlY = "http://"+newBXAdd+"/"+newBXAppName+"/com.primeton.mis.contract.UniqueFlow.execute.action?seqno=" + seqnoY + "&verifyCode=" + randstrY;
			}else{
				urlN = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/com.primeton.mis.contract.UniqueFlow.execute.action?seqno=" + seqnoN + "&verifyCode=" + randstrN;
				urlY = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/com.primeton.mis.contract.UniqueFlow.execute.action?seqno=" + seqnoY + "&verifyCode=" + randstrY;
			}
			StringBuffer bf = new StringBuffer("流程“");
			String content = "";
			bf.append(processInstName).append("”已经到达，请您审核！\n");
			if(applyType.equals("1")){
				bf.append("<table border='1'><tr><td>签署单位：</td><td>").append(misCont.getString("misCustinfo/custname")).append("</td><td>合同总金额：</td><td>").append(misCont.getString("contsum")).append("</td><td>项目：</td><td>").append(misCont.getString("projectname")).append("</td></tr>");
				bf.append("<tr><td>支付方式：</td><td colspan='5'>").append(misCont.getString("paymode")).append("</td></tr>");
				bf.append("<tr><td>其他商务条款：</td><td colspan='5'>").append(misCont.getString("othertk")).append("</td></tr>");
				bf.append("<tr><td>产品/服务销售数量：</td><td colspan='5'>").append(misCont.getString("salenum")).append("</td></tr>");
				bf.append("<tr><td>项目背景：</td><td>").append(misCont.getString("background")).append("</td><td>合同所属销售：</td><td>").append(misCont.getString("username")).append("</td><td>销售所在部门：</td><td>").append(misCont.getString("orgname")).append("</td></tr>");
				String belongtoName = "";
				belongtoName = BusinessDictUtil.getDictName("CONT_ORG", misCont.getString("belongto"));
				bf.append("<tr><td>销售所属事业部：</td><td colspan='5'>").append(belongtoName).append("</td></tr>");
				bf.append("</table>");
			}
			content = bf.append("\n审核通过请点击：<a href='").append(urlY).append("'>通过</a>").append("\n审核不通过请点击:<a href='").append(urlN).append("'>退回</a>").toString();
			email.setMessage(content);
			HtmlEmail mail = MailFactory.getHtmlEmailInstance();
			mail.setHostName(email.getSmtpHost());
			mail.setAuthentication(email.getUserName(), email.getPassword());
			try {
				mail.addTo(email.getTo().get(0));
				mail.setFrom(email.getFrom());
				mail.setSubject(email.getSubject());
				mail.setMsg(email.getMessage());
				DataObject[] files = (DataObject[]) misCont.get("files");
				for(DataObject file:files){
					EmailAttachment attTxt = new EmailAttachment();
					attTxt.setPath(file.getString("filePath"));
					attTxt.setName(MimeUtility.encodeText(file.getString("fileName")));
					mail.attach(attTxt);
				}
				mail.setCharset("UTF-8");
				mail.send();
			} catch (EmailException e) {
				// TODO 自动生成 catch 块
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return email;
	}
	@Bizlet("mailMakerNew")
	public static DataObject mailMakerNew(DataObject email, DataObject funcN, DataObject funcY, String processInstName, String applyType, String applyNo, String processInstID) throws HttpException, IOException {
		try {
			String seqnoN = URLEncoder.encode(funcN.getString("seqno"), "utf-8");
			String seqnoY = URLEncoder.encode(funcY.getString("seqno"), "utf-8");
			String randstrN = URLEncoder.encode(funcN.getString("randstr"), "utf-8");
			String randstrY = URLEncoder.encode(funcY.getString("randstr"),	"utf-8");
			String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","ipaddress");
			String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","port");
			String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","appName");
			String urlN = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/org.gocom.abframe.unittest.pageflow.UniqueFlow.execute.action?seqno="	+ seqnoN + "&verifyCode=" + randstrN;
			String urlY = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/org.gocom.abframe.unittest.pageflow.UniqueFlow.execute.action?seqno="	+ seqnoY + "&verifyCode=" + randstrY;
			StringBuffer bf = new StringBuffer("流程“");
			String content = "";
			bf.append(processInstName).append("”已经到达，请您审核！\n");
			String url = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/com.primeton.eos.bx.dzqd.BXApplyQueryOldDataForMail.flow?applyno=" + applyNo + "&applytype=" + applyType + "&processinstid=" + processInstID;
			PostMethod post = new PostMethod(url);
			HttpClient client = new HttpClient();
			client.executeMethod(post);
			bf.append(post.getResponseBodyAsString().trim());
			content = bf.append("\n审核通过请点击：<a href='").append(urlY).append("'>通过</a>").append("\n审核不通过请点击:<a href='").append(urlN).append("'>退回</a>").toString();
			email.setString("message", content);
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return email;
	}
	@Bizlet("mailMakerSendApplicant")
	public static DataObject mailMakerSendApplicant(DataObject email, String processInstName, String applyType, String applyNo, String processInstID) throws HttpException, IOException {
		try {
			String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","ipaddress");
			String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","port");
			String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","appName");
			StringBuffer bf = new StringBuffer("您的一笔报销单“");
			String content = "";
			bf.append(processInstName).append("”已经打款！以下是您提交的报销单的具体信息：\n");
			String url = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/com.primeton.eos.bx.dzqd.BXApplyQueryOldDataForMail.flow?applyno=" + applyNo + "&applytype=" + applyType + "&processinstid=" + processInstID;
			PostMethod post = new PostMethod(url);
			HttpClient client = new HttpClient();
			client.executeMethod(post);
			bf.append(post.getResponseBodyAsString().trim());
			content = bf.toString();
			email.setString("message", content);
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return email;
	}
	@Bizlet("mailMaker4Checked")
	public static DataObject mailMaker4Checked(DataObject email, String processInstName, String applyType, String applyNo, String processInstID) throws HttpException, IOException {
		try {
			String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","ipaddress");
			String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","port");
			String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","appName");
			StringBuffer bf = new StringBuffer("您刚刚审核了流程“");
			String content = "";
			bf.append(processInstName).append("”！以下是您审核的报销单的具体信息：\n");
			String url = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/com.primeton.eos.bx.dzqd.BXApplyQueryOldDataForMail.flow?applyno=" + applyNo + "&applytype=" + applyType + "&processinstid=" + processInstID;
			PostMethod post = new PostMethod(url);
			HttpClient client = new HttpClient();
			client.executeMethod(post);
			bf.append(post.getResponseBodyAsString().trim());
			content = bf.toString();
			email.setString("message", content);
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return email;
	}
	@Bizlet("mailMaker4Back")
	public static DataObject mailMaker4Back(DataObject email, String processInstName, String applyType, String applyNo, String processInstID) throws HttpException, IOException {
		try {
			String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","ipaddress");
			String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","port");
			String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","appName");
			StringBuffer bf = new StringBuffer("报销单流程“");
			String content = "";
			bf.append(processInstName).append("”被退回了！以下是该笔报销单的具体信息：\n");
			String url = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/com.primeton.eos.bx.dzqd.BXApplyQueryOldDataForMail.flow?applyno=" + applyNo + "&applytype=" + applyType + "&processinstid=" + processInstID;
			PostMethod post = new PostMethod(url);
			HttpClient client = new HttpClient();
			client.executeMethod(post);
			bf.append(post.getResponseBodyAsString().trim());
			content = bf.toString();
			email.setString("message", content);
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return email;
	}
	@Bizlet("mailMaker4HT")
	public static DataObject mailMaker4HT(DataObject email, String processInstName, DataObject httotalinfo) {
		String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","ipaddress");
		String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","port");
		String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.bx.dzqd","NewBXSystem","addressAndPort","appName");
		String url = "http://"+newBXAdd+":"+newBXPort+"/"+newBXAppName+"/abframe/auth/login.jsp";
		StringBuffer bf = new StringBuffer("流程“");
		String content = "";
		bf.append(processInstName).append("”已经到达，请您审核！\n");
		//bf.append("<table border='1'><tr><td colspan='4'>合同信息</td></tr><tr><td>合同编号：</td><td>").append(httotalinfo.getString("htno")).append("</td><td>合同录入日期：</td><td>").append(httotalinfo.getString("applydate")).append("</td></tr>");
		//bf.append("<tr><td>合同标题：</td><td colspan='3'>").append(httotalinfo.getString("httitle")).append("</td></tr><tr><td>客户名称：</td><td colspan='3'>").append(httotalinfo.getString("custname")).append("</td></tr>");
		//bf.append("<tr><td>合同期限：</td><td>").append(httotalinfo.getString("htlimit")).append("</td><td>合同金额：</td><td>").append(httotalinfo.getString("htmoney")).append("</td></tr></table>");
		content = bf.append("\n审核请点击以下链接进入系统：<a href='").append(url).append("'>系统链接</a>").toString();
		email.setString("message", content);
		return email;
	}
}
