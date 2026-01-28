package com.zhonghe.ame.kaohe;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import cn.hutool.core.date.DateUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("虚拟产值申报，同步修改考核修正数据")
public class InsertAndUpateCorrection {

	@Bizlet("更新虚拟产值申报状态、完成时间及修改考核修正数据")
	public void finishFlowAndUpdate(String processId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String updateSql = "UPDATE zh_kaohe_virtual_production SET finish_time = ?, app_status = ? WHERE process_id = ?";
		dbSession.execute(updateSql, DateUtil.now(), 2, processId);
		String querySql = "SELECT * FROM zh_kaohe_virtual_production WHERE process_id = ?";
		Entity entity = dbSession.queryOne(querySql, processId);
		this.insertOrUpdateByCorrection(entity, dbSession);
	}

	@Bizlet("作废操作，同时修改考核修正数据")
	public void zfAndUpdate(DataObject dataObject) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_kaohe_virtual_production WHERE id = ?";
		Entity entity = dbSession.queryOne(querySql, dataObject.getString("id"));
		this.insertOrUpdateByCorrection(entity, dbSession);
	}
	
	@Bizlet("录入操作，同时修改考核修正数据")
	public void lrAndUpdate(DataObject dataObject) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_kaohe_virtual_production WHERE id = ?";
		Entity entity = dbSession.queryOne(querySql, dataObject.getString("id"));
		this.insertOrUpdateByCorrection(entity, dbSession);
	}
	
	@Bizlet("维护操作，同时修改考核修正数据")
	public void whAndUpdate(DataObject dataObject) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_kaohe_virtual_production WHERE id = ?";
		Entity entity = dbSession.queryOne(querySql, dataObject.getString("id"));
		this.insertOrUpdateByCorrection(entity, dbSession);
	}	

	private void insertOrUpdateByCorrection(Entity entity, Session dbSession) throws Exception {
		String queryVPListSql = "SELECT confirm_amount FROM zh_kaohe_virtual_production WHERE secondary_org = ? AND create_year = ? AND app_status = ? AND headquarter_group = ?";
		String queryCorrectionSql = "SELECT id FROM zh_kaohe_correction WHERE secondary_org = ? AND years = ? AND correction_type = ? AND headquarter_group = ?";
		String updateCorrectionSql = "UPDATE zh_kaohe_correction SET amount = ? WHERE id = ?";
		String delCorrectionSql = "DELETE FROM zh_kaohe_correction WHERE secondary_org = ? AND years = ? AND correction_type = ? AND headquarter_group = ?";
		if (entity != null) {
			String secOrgCode = entity.getStr("secondary_org");
			String createYear = entity.getStr("create_year");
			List<Entity> jtnList = dbSession.query(queryVPListSql, secOrgCode, createYear, "2", "0");
			List<Entity> jtwList = dbSession.query(queryVPListSql, secOrgCode, createYear, "2", "1");
			if (jtnList != null && jtnList.size() > 0) {
				BigDecimal jtnTotalAmount = jtnList.stream().map(jtn -> jtn.get("confirm_amount", BigDecimal.ZERO)).reduce(BigDecimal.ZERO, BigDecimal::add);
				Entity jtnEntity = dbSession.queryOne(queryCorrectionSql, secOrgCode, createYear, "虚拟产值", "0");
				if (jtnEntity != null) {
					dbSession.execute(updateCorrectionSql, jtnTotalAmount, jtnEntity.getStr("id"));
				} else {
					DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.kaohe.incomeCorrection.ZhKaoheCorrection");
					DatabaseExt.getPrimaryKey(dataObject);
					Entity insertEntity = Entity.create("zh_kaohe_correction");
					insertEntity.set("id", dataObject.getInt("id"));
					insertEntity.set("secondary_org", secOrgCode);
					insertEntity.set("years", createYear);
					insertEntity.set("amount", jtnTotalAmount);
					insertEntity.set("remark", "根据虚拟产值申报汇总生成");
					insertEntity.set("create_time", new Date());
					insertEntity.set("update_time", new Date());
					insertEntity.set("headquarter_group", "0");
					insertEntity.set("correction_type", "虚拟产值");
					dbSession.insert(insertEntity);
				}
			} else {
				dbSession.execute(delCorrectionSql, secOrgCode, createYear, "虚拟产值", "0");
			}
			if (jtwList != null && jtwList.size() > 0) {
				BigDecimal jtwTotalAmount = jtwList.stream().map(jtw -> jtw.get("confirm_amount", BigDecimal.ZERO)).reduce(BigDecimal.ZERO, BigDecimal::add);
				Entity jtwEntity = dbSession.queryOne(queryCorrectionSql, secOrgCode, createYear, "虚拟产值", "1");
				if (jtwEntity != null) {
					dbSession.execute(updateCorrectionSql, jtwTotalAmount, jtwEntity.getStr("id"));
				} else {
					DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.kaohe.incomeCorrection.ZhKaoheCorrection");
					DatabaseExt.getPrimaryKey(dataObject);
					Entity insertEntity = Entity.create("zh_kaohe_correction");
					insertEntity.set("id", dataObject.getInt("id"));
					insertEntity.set("secondary_org", secOrgCode);
					insertEntity.set("years", createYear);
					insertEntity.set("amount", jtwTotalAmount);
					insertEntity.set("remark", "根据虚拟产值申报汇总生成");
					insertEntity.set("create_time", new Date());
					insertEntity.set("update_time", new Date());
					insertEntity.set("headquarter_group", "1");
					insertEntity.set("correction_type", "虚拟产值");
					dbSession.insert(insertEntity);
				}
			} else {
				dbSession.execute(delCorrectionSql, secOrgCode, createYear, "虚拟产值", "1");
			}
		}
	}

}
