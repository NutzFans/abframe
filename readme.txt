V1.3 change history
  工作流组织机构接口重构为 org.gocom.abframe.bps.om.WFOMServiceImpl
  组织机构接口在studio只能够的兼容性修改
  增加功能列表缓存，可对未在数据库登记的功能配置是否有权限访问
  菜单url的生成规则加上了参数，菜单url格式为xxx.flow 或者xxx.biz 
  WFOMServiceImpl 实现 业务权限接口
  增加BPS业务权限角色
  皮肤模型修改为layout和style两类
  支持换肤功能
  支持 与one App portal集成换肤
  业务字典导入导出使用统一excel模板
  at_loghis表迁移到tools构件包
  功能校验优化
  删除未使用代码：SSO部分代码
  权限标签判断支持上下文xpath变量
  支持与Portal的CAS集成






--------------------------

7、支持EOS6.0 6.1. 6.2 6.3 