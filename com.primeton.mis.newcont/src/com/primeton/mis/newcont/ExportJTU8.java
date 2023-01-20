/**
 * 
 */
package com.primeton.mis.newcont;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author EPCNB324
 * @date 2017-04-21 14:35:53
 *
 */
@Bizlet("")
public class ExportJTU8 {

	/**
	 * @param exportDatas
	 * @return
	 * @author EPCNB324
	 * @throws IOException 
	 */
	@Bizlet("")
	public static String exportJTU8(DataObject[] exportDatas,int []num) throws IOException {
		// TODO 自动生成的方法存根
		String txtPath = "";
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat format1 = new SimpleDateFormat("yy-MM-dd");
		String nowDate = format.format(now);
		
		//取上个月月底
		Calendar   cale=Calendar.getInstance();//获取当前日期
		cale.set(Calendar.DAY_OF_MONTH,0);//设置为1号,当前日期既为本月第一天 ;
		String checkDate=format1.format(cale.getTime());
		txtPath = ExportJTU8.class.getResource("/").getPath()+"PUR_PRESETTLE_" + nowDate + ".txt";
		File txtFile = new File(txtPath);
		if (!txtFile.exists()) {
			txtFile.createNewFile();
		}
		String filein = "填制凭证,V800";
		int pzzbs = 1;
		int res = exportDatas.length % 3;
		int trade = exportDatas.length/3;
		for(int i=0;i<trade;i++){
			int ts = 0;
			for(int j=3;j>0;j--){
				//供应商id
				String supplierid_n = exportDatas[(i+1)*3-j].getString("supplierid");
				commonj.sdo.DataObject cust_n = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurSupplier");
				cust_n.setString("custid", supplierid_n);
				DatabaseUtil.expandEntityByTemplate("default", cust_n, cust_n);
				//U8供应商名字
				String cvencode_n=cust_n.getString("cvencode");
				String cvenabbname_n="";
				String costmemo_n = exportDatas[(i+1)*3-j].getString("costmemo");
				//合同编号
				String contnum_n=exportDatas[(i+1)*3-j].getString("contnum");
				if(cvencode_n!="" && cvencode_n!=null){
					commonj.sdo.DataObject Vendor_n = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Vendor");
					Vendor_n.setString("cvencode", cvencode_n);
					DatabaseUtil.expandEntityByTemplate("U8DB", Vendor_n, Vendor_n);
					cvenabbname_n = Vendor_n.getString("cvenabbname");
				}
				String projectid_n="";
				//项目编码
				if(contnum_n != "" && contnum_n != null){
					commonj.sdo.DataObject Fitemss02_n = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Fitemss02");
					Fitemss02_n.setString("citemcode", contnum_n);
					DatabaseUtil.expandEntityByTemplate("U8DB", Fitemss02_n, Fitemss02_n);
					projectid_n = Fitemss02_n.getString("i_id");
				}
				
				if(cvenabbname_n !="" && cvenabbname_n !=null){
					if((costmemo_n.equals("1") || costmemo_n.equals("0")) && projectid_n != "" && projectid_n != null ){
						ts++;
					}else if(costmemo_n.equals("3")){
						ts++;
					}else if(costmemo_n.equals("2")){
						ts++;
					}
				}
			}
			if(ts!=0){
				for(int x=3;x>0;x--){
					//计提技术服务费
					String notaxmon=exportDatas[(i+1)*3-x].getString("notaxmon");
					//供应商名
					String cvenabbname="";
					//供应商编码
					String cvencode="";
					//供应商简称
					String suppliersname=exportDatas[(i+1)*3-x].getString("suppliersname");
					//合同编号
					String contnum=exportDatas[(i+1)*3-x].getString("contnum");
					//项目编号
					String projectno=exportDatas[(i+1)*3-x].getString("projectno");
					//项目编码
					String projectid="";
					
					//成本说明
					String costmemo=exportDatas[(i+1)*3-x].getString("costmemo");
					
					//供应商id
					String supplierid=exportDatas[(i+1)*3-x].getString("supplierid");
					commonj.sdo.DataObject cust = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurSupplier");
					cust.setString("custid", supplierid);
					DatabaseUtil.expandEntityByTemplate("default", cust, cust);
					//U8供应商名字
					cvencode=cust.getString("cvencode");
					//cvencode="02001";
					if(cvencode!="" && cvencode!=null){
						commonj.sdo.DataObject Vendor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Vendor");
						Vendor.setString("cvencode", cvencode);
						DatabaseUtil.expandEntityByTemplate("U8DB", Vendor, Vendor);
						cvenabbname = Vendor.getString("cvenabbname");
					}
					//项目编码
					if(contnum != "" && contnum != null){
						commonj.sdo.DataObject Fitemss02 = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Fitemss02");
						Fitemss02.setString("citemcode", contnum);
						DatabaseUtil.expandEntityByTemplate("U8DB", Fitemss02, Fitemss02);
						projectid = Fitemss02.getString("i_id");
					}
					
					if(cvenabbname !="" && cvenabbname !=null && ts != 0){
						if((costmemo.equals("1") || costmemo.equals("0")) && projectid != "" && projectid != null ){
							//借方
							filein += "\r\n" + checkDate + ",记," + pzzbs + ","+ts+"," + "计提技术服务费" + suppliersname  + contnum  + "," + "140501" + "," + notaxmon + ",0,0,0,0,,,,,,,,,,"+contnum+",,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
							//贷方
							filein += "\r\n" + checkDate + ",记," + pzzbs + ","+ts+"," + "计提技术服务费" + suppliersname  + contnum  + "," + "220202" + ",0," + notaxmon + ",0,0,0,,,,,,,,"+cvencode+",,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
						}else if(costmemo.equals("3")){
							//借方
							filein += "\r\n" + checkDate + ",记," + pzzbs + ","+ts+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "660512" + "," + notaxmon + ",0,0,0,0,,,,,,,,,,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
							//贷方
							filein += "\r\n" + checkDate + ",记," + pzzbs + ","+ts+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "220202" + ",0," + notaxmon + ",0,0,0,,,,,,,,"+cvencode+",,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
						}else if(costmemo.equals("2")){
							//借方
							filein += "\r\n" + checkDate + ",记," + pzzbs + ","+ts+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "66013027" + "," + notaxmon + ",0,0,0,0,,,,,,,,,,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
							//贷方
							filein += "\r\n" + checkDate + ",记," + pzzbs + ","+ts+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "220202" + ",0," + notaxmon + ",0,0,0,,,,,,,,"+cvencode+",,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
						}else{
							continue;
						}
						
						commonj.sdo.DataObject pur_outcost = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurOutcost");
						pur_outcost.setString("outcostid", exportDatas[(i+1)*3-x].getString("outcostid"));
						pur_outcost.setString("mark", "1");
						DatabaseUtil.updateEntity("default", pur_outcost);
						
					}
				}
				pzzbs++;
			}
		}
		
		int res_n=0;
		for(int j=0;j<res;j++){
			//供应商id
			String supplierid_n = exportDatas[trade*3+j].getString("supplierid");
			commonj.sdo.DataObject cust_n = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurSupplier");
			cust_n.setString("custid", supplierid_n);
			DatabaseUtil.expandEntityByTemplate("default", cust_n, cust_n);
			//U8供应商名字
			String cvencode_n=cust_n.getString("cvencode");
			String cvenabbname_n="";
			String costmemo_n = exportDatas[trade*3+j].getString("costmemo");
			//合同编号
			String contnum_n=exportDatas[trade*3+j].getString("contnum");
			if(cvencode_n!="" && cvencode_n!=null){
				commonj.sdo.DataObject Vendor_n = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Vendor");
				Vendor_n.setString("cvencode", cvencode_n);
				DatabaseUtil.expandEntityByTemplate("U8DB", Vendor_n, Vendor_n);
				cvenabbname_n = Vendor_n.getString("cvenabbname");
			}
			String projectid_n="";
			//项目编码
			if(contnum_n != "" && contnum_n != null){
				commonj.sdo.DataObject Fitemss02_n = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Fitemss02");
				Fitemss02_n.setString("citemcode", contnum_n);
				DatabaseUtil.expandEntityByTemplate("U8DB", Fitemss02_n, Fitemss02_n);
				projectid_n = Fitemss02_n.getString("i_id");
			}
			
			if(cvenabbname_n !="" && cvenabbname_n !=null){
				if((costmemo_n.equals("1") || costmemo_n.equals("0")) && projectid_n != "" && projectid_n != null ){
					res_n++;
				}else if(costmemo_n.equals("3")){
					res_n++;
				}else if(costmemo_n.equals("2")){
					res_n++;
				}
			}
		}
		
		if(res_n!=0){
			for(int y=0;y<res;y++){
				//计提技术服务费
				String notaxmon=exportDatas[trade*3+y].getString("notaxmon");
				//供应商名
				String cvenabbname="";
				//供应商编码
				String cvencode="";
				//供应商简称
				String suppliersname=exportDatas[trade*3+y].getString("suppliersname");
				//合同编号
				String contnum=exportDatas[trade*3+y].getString("contnum");
				//项目编号
				String projectno=exportDatas[trade*3+y].getString("projectno");
				//项目编码
				String projectid="";
				
				//成本说明
				String costmemo=exportDatas[trade*3+y].getString("costmemo");
				
				//供应商id
				String supplierid=exportDatas[trade*3+y].getString("supplierid");
				commonj.sdo.DataObject cust = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurSupplier");
				cust.setString("custid", supplierid);
				DatabaseUtil.expandEntityByTemplate("default", cust, cust);
				//U8供应商名字
				cvencode=cust.getString("cvencode");
				//cvencode="02001";
				if(cvencode!="" && cvencode!=null){
					commonj.sdo.DataObject Vendor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Vendor");
					Vendor.setString("cvencode", cvencode);
					DatabaseUtil.expandEntityByTemplate("U8DB", Vendor, Vendor);
					cvenabbname = Vendor.getString("cvenabbname");
				}
				//项目编码
				if(contnum != "" && contnum != null){
					commonj.sdo.DataObject Fitemss02 = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.u8query.u8dataset","Fitemss02");
					Fitemss02.setString("citemcode", contnum);
					DatabaseUtil.expandEntityByTemplate("U8DB", Fitemss02, Fitemss02);
					projectid = Fitemss02.getString("i_id");
				}
				
				if(cvenabbname !="" && cvenabbname !=null && res != 0){
					if((costmemo.equals("1") || costmemo.equals("0")) && projectid != "" && projectid != null ){
						//借方
						filein += "\r\n" + checkDate + ",记," + pzzbs + ","+res_n+"," + "计提技术服务费" + suppliersname  + contnum  + "," + "140501" + "," + notaxmon + ",0,0,0,0,,,,,,,,,,"+contnum+",,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
						//贷方
						filein += "\r\n" + checkDate + ",记," + pzzbs + ","+res_n+"," + "计提技术服务费" + suppliersname  + contnum  + "," + "220202" + ",0," + notaxmon + ",0,0,0,,,,,,,,"+cvencode+",,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
					}else if(costmemo.equals("3")){
						//借方
						filein += "\r\n" + checkDate + ",记," + pzzbs + ","+res_n+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "660512" + "," + notaxmon + ",0,0,0,0,,,,,,,,,,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
						//贷方
						filein += "\r\n" + checkDate + ",记," + pzzbs + ","+res_n+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "220202" + ",0," + notaxmon + ",0,0,0,,,,,,,,"+cvencode+",,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
					}else if(costmemo.equals("2")){
						//借方
						filein += "\r\n" + checkDate + ",记," + pzzbs + ","+res_n+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "66013027" + "," + notaxmon + ",0,0,0,0,,,,,,,,,,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
						//贷方
						filein += "\r\n" + checkDate + ",记," + pzzbs + ","+res_n+"," + "计提技术服务费" + suppliersname  + projectno  + "," + "220202" + ",0," + notaxmon + ",0,0,0,,,,,,,,"+cvencode+",,,,,,,,,0,,0,,,,,,,,,0,0,0,0,0,,0,0,0,0";
					}else{
						continue;
					}
					
					commonj.sdo.DataObject pur_outcost = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurOutcost");
					pur_outcost.setString("outcostid", exportDatas[trade*3+y].getString("outcostid"));
					pur_outcost.setString("mark", "1");
					DatabaseUtil.updateEntity("default", pur_outcost);
					
				}
				
			}
			pzzbs++;
		}
		
		if(pzzbs != 1){
			OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(txtFile),"gbk");
			BufferedWriter writer=new BufferedWriter(write);          
			writer.write(filein);      
			writer.close();
			int a = pzzbs-1;
			num[0] = a;
			return txtPath;
		}else{
			int a = pzzbs-1;
			num[0] = a;
			return "";
		}
		
	}

}
