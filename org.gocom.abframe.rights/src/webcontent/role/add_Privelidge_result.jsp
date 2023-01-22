<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://eos.primeton.com/tags/bean" prefix="b"%>
<script>
  if('<b:write property="ret" />'=='1'){
     alert( '<b:message key="l_m_save_success"/>' );  <!--  保存成功 -->
  }else {
     alert( '<b:message key="l_m_save_fail"/>' );         <!-- 保存失败 -->
            
  }
  parent.$id('addBtn0').disabled=false;
  parent.$id('addBtn1').disabled=false;
  
</script>