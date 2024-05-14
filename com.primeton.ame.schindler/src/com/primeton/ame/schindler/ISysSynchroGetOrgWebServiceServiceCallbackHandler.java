
/**
 * ISysSynchroGetOrgWebServiceServiceCallbackHandler.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.3  Built on : Aug 10, 2007 (04:45:47 LKT)
 */

    package com.primeton.ame.schindler;

    /**
     *  ISysSynchroGetOrgWebServiceServiceCallbackHandler Callback class, Users can extend this class and implement
     *  their own receiveResult and receiveError methods.
     */
    public abstract class ISysSynchroGetOrgWebServiceServiceCallbackHandler{



    protected Object clientData;

    /**
    * User can pass in any object that needs to be accessed once the NonBlocking
    * Web service call is finished and appropriate method of this CallBack is called.
    * @param clientData Object mechanism by which the user can pass in user data
    * that will be avilable at the time this callback is called.
    */
    public ISysSynchroGetOrgWebServiceServiceCallbackHandler(Object clientData){
        this.clientData = clientData;
    }

    /**
    * Please use this constructor if you don't want to set any clientData
    */
    public ISysSynchroGetOrgWebServiceServiceCallbackHandler(){
        this.clientData = null;
    }

    /**
     * Get the client data
     */

     public Object getClientData() {
        return clientData;
     }

        
           /**
            * auto generated Axis2 call back method for getOrgStaffingLevelInfo method
            * override this method for handling normal response from getOrgStaffingLevelInfo operation
            */
           public void receiveResultgetOrgStaffingLevelInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetOrgStaffingLevelInfoResponse139 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getOrgStaffingLevelInfo operation
           */
            public void receiveErrorgetOrgStaffingLevelInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getRoleLineInfo method
            * override this method for handling normal response from getRoleLineInfo operation
            */
           public void receiveResultgetRoleLineInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetRoleLineInfoResponse117 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getRoleLineInfo operation
           */
            public void receiveErrorgetRoleLineInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getRoleLineDefaultRoleInfo method
            * override this method for handling normal response from getRoleLineDefaultRoleInfo operation
            */
           public void receiveResultgetRoleLineDefaultRoleInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetRoleLineDefaultRoleInfoResponse135 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getRoleLineDefaultRoleInfo operation
           */
            public void receiveErrorgetRoleLineDefaultRoleInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getRoleInfo method
            * override this method for handling normal response from getRoleInfo operation
            */
           public void receiveResultgetRoleInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetRoleInfoResponse131 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getRoleInfo operation
           */
            public void receiveErrorgetRoleInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getUpdatedElementsV2 method
            * override this method for handling normal response from getUpdatedElementsV2 operation
            */
           public void receiveResultgetUpdatedElementsV2(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetUpdatedElementsV2Response132 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getUpdatedElementsV2 operation
           */
            public void receiveErrorgetUpdatedElementsV2(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getElementsBaseInfoForEco method
            * override this method for handling normal response from getElementsBaseInfoForEco operation
            */
           public void receiveResultgetElementsBaseInfoForEco(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetElementsBaseInfoForEcoResponse119 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getElementsBaseInfoForEco operation
           */
            public void receiveErrorgetElementsBaseInfoForEco(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for findByExtendPara method
            * override this method for handling normal response from findByExtendPara operation
            */
           public void receiveResultfindByExtendPara(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.FindByExtendParaResponse115 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from findByExtendPara operation
           */
            public void receiveErrorfindByExtendPara(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getUpdatedElements method
            * override this method for handling normal response from getUpdatedElements operation
            */
           public void receiveResultgetUpdatedElements(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetUpdatedElementsResponse141 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getUpdatedElements operation
           */
            public void receiveErrorgetUpdatedElements(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getUpdatedElementsByToken method
            * override this method for handling normal response from getUpdatedElementsByToken operation
            */
           public void receiveResultgetUpdatedElementsByToken(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetUpdatedElementsByTokenResponse140 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getUpdatedElementsByToken operation
           */
            public void receiveErrorgetUpdatedElementsByToken(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getRoleConfMemberInfo method
            * override this method for handling normal response from getRoleConfMemberInfo operation
            */
           public void receiveResultgetRoleConfMemberInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetRoleConfMemberInfoResponse127 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getRoleConfMemberInfo operation
           */
            public void receiveErrorgetRoleConfMemberInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getUpdatedElementsCount method
            * override this method for handling normal response from getUpdatedElementsCount operation
            */
           public void receiveResultgetUpdatedElementsCount(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetUpdatedElementsCountResponse118 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getUpdatedElementsCount operation
           */
            public void receiveErrorgetUpdatedElementsCount(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getOrgGroupCateInfo method
            * override this method for handling normal response from getOrgGroupCateInfo operation
            */
           public void receiveResultgetOrgGroupCateInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetOrgGroupCateInfoResponse120 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getOrgGroupCateInfo operation
           */
            public void receiveErrorgetOrgGroupCateInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getRoleConfInfo method
            * override this method for handling normal response from getRoleConfInfo operation
            */
           public void receiveResultgetRoleConfInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetRoleConfInfoResponse147 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getRoleConfInfo operation
           */
            public void receiveErrorgetRoleConfInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getUpdatedElementsForEco method
            * override this method for handling normal response from getUpdatedElementsForEco operation
            */
           public void receiveResultgetUpdatedElementsForEco(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetUpdatedElementsForEcoResponse137 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getUpdatedElementsForEco operation
           */
            public void receiveErrorgetUpdatedElementsForEco(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getElementsBaseInfo method
            * override this method for handling normal response from getElementsBaseInfo operation
            */
           public void receiveResultgetElementsBaseInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetElementsBaseInfoResponse125 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getElementsBaseInfo operation
           */
            public void receiveErrorgetElementsBaseInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getElementsBaseInfoV2 method
            * override this method for handling normal response from getElementsBaseInfoV2 operation
            */
           public void receiveResultgetElementsBaseInfoV2(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetElementsBaseInfoV2Response123 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getElementsBaseInfoV2 operation
           */
            public void receiveErrorgetElementsBaseInfoV2(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getRoleConfCateInfo method
            * override this method for handling normal response from getRoleConfCateInfo operation
            */
           public void receiveResultgetRoleConfCateInfo(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetRoleConfCateInfoResponse138 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getRoleConfCateInfo operation
           */
            public void receiveErrorgetRoleConfCateInfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for getDynamicExternalData method
            * override this method for handling normal response from getDynamicExternalData operation
            */
           public void receiveResultgetDynamicExternalData(
                    com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.GetDynamicExternalDataResponse111 result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from getDynamicExternalData operation
           */
            public void receiveErrorgetDynamicExternalData(java.lang.Exception e) {
            }
                


    }
    