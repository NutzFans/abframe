package com.primeton.rdmgr.api;

import java.util.ArrayList;
import java.util.List;

import commonj.sdo.*;

import com.eos.das.entity.ExpressionHelper;
import com.eos.das.entity.IDASCriteria;
import com.eos.spring.DASDaoSupport;

import com.primeton.rdmgr.api.rd.RDUser;

public class OMServiceImpl extends DASDaoSupport implements IOMService {

	public RDUser[] getAllUsers() {
		// TODO �Զ���ɷ������
		IDASCriteria dasCriteria = getDASTemplate().createCriteria("org.gocom.abframe.dataset.privilege.AcOperator");
		dasCriteria.add(ExpressionHelper.eq("status", "running"));
		dasCriteria.asc("operatorname");
		DataObject[] opers = getDASTemplate().queryEntitiesByCriteriaEntity(DataObject.class, dasCriteria);
		List<RDUser> users = new ArrayList<RDUser>();
		for (DataObject oper : opers) {
			RDUser user = RDUser.FACTORY.create();
			user.setUserId(oper.getString("userid"));
			user.setOperatorId(oper.getLong("operatorid"));
			user.setUserName(oper.getString("operatorname").concat("(").concat(oper.getString("userid")).concat(")"));
			user.setStatus(oper.getString("status"));
			users.add(user);
		}
		return users.toArray(new RDUser[users.size()]);
	}

}

