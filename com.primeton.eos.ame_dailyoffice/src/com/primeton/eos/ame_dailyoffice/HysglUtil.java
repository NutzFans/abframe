/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.Map;

import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

/**
 * @author zhengquan
 * @date 2019-05-08 17:15:52
 *
 */
@Bizlet("")
public class HysglUtil extends BusinessFormBaseUtil {

	/* （非 Javadoc）
	 * @see com.primeton.eos.ame_dailyoffice.BusinessFormBaseUtil#getBusinessDataMap()
	 */
	@Override
	protected Map<String, Object> getBusinessDataMap() {
		// TODO 自动生成的方法存根
		return null;
	}
	
	public DataObject handle(){
		
		return null;
	}
	
	public boolean delete(){
		return false;
	}
	
	/**
	 * @param formData
	 * @author zhengquan
	 * @time 2019-5-8 17点32分
	 * @description 根据数据实体查询会议室列表
	 * @return
	 * @throws Exception
	 */
	@Bizlet("查询会议室列表")
	public DataObject [] querySealUseList(DataObject page,DataObject criteria) throws Exception {
		String cbName = "com.primeton.eos.ame_dailyoffice.hygl.AmeHysxx";
		return super.queryListSimply(cbName,page,criteria);
	}

	/**
	 * @param formData
	 * @param extDataMap
	 * @return
	 * @throws Exception
	 */
	@Bizlet("查询会议室详情数据")
	public DataObject queryData(DataObject formData,String pkName) throws Exception {
		return super.queryBusinessData(formData,pkName);
	}
	
	/**
	 * @param formDatas
	 * @return
	 */
	@Bizlet("保存会议室数据")
	public Map<String, Object> saveDatas(DataObject formData){
			return super.handle(formData,"hysid");
	}
	
	/**
	 * @param formDatas
	 * @return
	 */
	@Bizlet("删除印章使用数据")
	public boolean deleteDatas(DataObject[] formDatas){
			return super.delete(formDatas,"hysid");
	}
}
