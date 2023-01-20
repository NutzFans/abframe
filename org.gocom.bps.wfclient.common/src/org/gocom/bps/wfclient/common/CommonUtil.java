package org.gocom.bps.wfclient.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.eos.workflow.omservice.IWFOMService;
import com.eos.workflow.omservice.WFParticipant;
import com.primeton.workflow.api.ParticipantType;
import com.primeton.workflow.api.WFServiceException;

/**
 * @author Aoxq
 * @date 2015-01-08 13:33:24
 * 通用工具类
 */
public class CommonUtil {
	
	
	//查询参与者Name
	public static String getPaticipantName(String typeCode,String id) throws WFServiceException{
		IWFOMService FOMService=ServiceFactory.getWFOMService();
		WFParticipant participant=null;
		if(typeCode==null){
			List<ParticipantType> partType=FOMService.getParticipantTypes();
			for(ParticipantType type:partType ){
				String code=type.getCode();
				try{
					participant=FOMService.findParticipantByID(code, id);
				}catch(Exception e){
					
				}finally{
					if(participant!=null){
						break;
					}
				}
			}
		}else if(typeCode.equals("person")){
			String [] type=new String[2];
			type[0]="person";
			type[1]="emp";
			for(String code:type){
				try{
					participant=FOMService.findParticipantByID(code, id);
				}catch(Exception e){
					
				}finally{
					if(participant!=null){
						break;
					}
				}
			}
		}else{
			participant=FOMService.findParticipantByID(typeCode, id);
		}
		String name=null;
		if(participant!=null){
			name=participant.getName();
		}else{
			name=id;
		}
		
		return name;
	}
	
	//@Review  修改格式化时间的方法
	//格式化时间
	public static String transTime(String time) {
		if(time!=null){
			SimpleDateFormat transTime = new SimpleDateFormat("yyyyMMddHHmmss"); //@Review 1.14
			Date date = null;
			try {
				date = transTime.parse(time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			transTime.applyPattern("yyyy-MM-dd HH:mm:ss");
			return transTime.format(date);
		}
		return null;
	}
}
