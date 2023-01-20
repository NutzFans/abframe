package com.zhonghe.ame.contractPact;

import java.util.Date;

public class ChargeContractEntity {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String contractNo;//合同编号
	private String contractName;//合同名称	
	//合同密级
	//项目密级
	private String contractSum;//合同金额
	//合同余额
	private String executeStatus;//执行状态
	private String projectSize;//标的规模
	private String signatoryname;//签约方
	private String implementOrgname;//合同实施部门
	private String contractSubject;//合同签约主体
	private String payee;//收款方
	private String signingDate;//签订日期
	private String major;//专业类别
	private String projectType;//工程类别
	private String headquarterGroup;//集团内/集团外
	//招标人采购方式
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	public String getContractName() {
		return contractName;
	}
	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	public String getContractSum() {
		return contractSum;
	}
	public void setContractSum(String contractSum) {
		this.contractSum = contractSum;
	}
	public String getExecuteStatus() {
		return executeStatus;
	}
	public void setExecuteStatus(String executeStatus) {
		this.executeStatus = executeStatus;
	}
	public String getProjectSize() {
		return projectSize;
	}
	public void setProjectSize(String projectSize) {
		this.projectSize = projectSize;
	}
	public String getSignatoryname() {
		return signatoryname;
	}
	public void setSignatoryname(String signatoryname) {
		this.signatoryname = signatoryname;
	}
	public String getImplementOrgname() {
		return implementOrgname;
	}
	public void setImplementOrgname(String implementOrgname) {
		this.implementOrgname = implementOrgname;
	}
	public String getContractSubject() {
		return contractSubject;
	}
	public void setContractSubject(String contractSubject) {
		this.contractSubject = contractSubject;
	}
	public String getPayee() {
		return payee;
	}
	public void setPayee(String payee) {
		this.payee = payee;
	}
	public String getSigningDate() {
		return signingDate;
	}
	public void setSigningDate(String string) {
		this.signingDate = string;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getHeadquarterGroup() {
		return headquarterGroup;
	}
	public void setHeadquarterGroup(String headquarterGroup) {
		this.headquarterGroup = headquarterGroup;
	}
	
	
	
	
	
	
}
