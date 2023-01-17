
/**
 * ExceptionException0.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.3  Built on : Aug 10, 2007 (04:45:47 LKT)
 */

package com.primeton.ame.schindler;

public class ExceptionException0 extends java.lang.Exception{
    
    private com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.Exception7 faultMessage;
    
    public ExceptionException0() {
        super("ExceptionException0");
    }
           
    public ExceptionException0(java.lang.String s) {
       super(s);
    }
    
    public ExceptionException0(java.lang.String s, java.lang.Throwable ex) {
      super(s, ex);
    }
    
    public void setFaultMessage(com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.Exception7 msg){
       faultMessage = msg;
    }
    
    public com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.Exception7 getFaultMessage(){
       return faultMessage;
    }
}
    