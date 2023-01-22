package com.primeton.rdmgr.api;

import org.osoa.sca.annotations.Remotable;

import com.primeton.rdmgr.api.rd.RDUser;

@Remotable 
public interface IOMService {
	public RDUser[] getAllUsers();
}
