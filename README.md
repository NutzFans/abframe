# zhAme

#### 介绍
{**以下是 Gitee 平台说明，您可以替换此简介**
Gitee 是 OSCHINA 推出的基于 Git 的代码托管平台（同时支持 SVN）。专为开发者提供稳定、高效、安全的云端软件开发协作平台
无论是个人、团队、或是企业，都能够用 Gitee 实现代码托管、项目管理、协作开发。企业项目请看 [https://gitee.com/enterprises](https://gitee.com/enterprises)}

#### 软件架构
软件架构说明


#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 变更记录：

1.菜单变更：
采购计划

/purchase/purchasePlan/purchasePlanList.jsp

为满足采购计划变更需求修改表内容

--zh_purchase_plan_item采购计划与物项关联表表 

```sql
ALTER TABLE [dbo].[zh_purchase_plan_item] DROP CONSTRAINT [PK__zh_purch__3213E83F5554AB49]
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] DROP COLUMN [PlansImplementTime], COLUMN [ContractName], COLUMN [ContractAmount]
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD [NEW_BUDGET_AMOUNT] decimal(18,5)  NULL
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD [NEW_NUMBER] int  NULL
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD [NEW_UNIT] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD [CHANGE_TYPE] varchar(255) NULL
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[id]', 'ID', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[plan_id]', 'PLAN_ID', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[purchase_first_code]', 'PURCHASE_FIRST_CODE', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[purchase_two_code]', 'PURCHASE_TWO_CODE', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[purchase_three_code]', 'PURCHASE_THREE_CODE', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[budget_amount]', 'BUDGET_AMOUNT', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[number]', 'NUMBER', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[unit]', 'UNIT', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[ischange]', 'ISCHANGE', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[purchase_first_name]', 'PURCHASE_FIRST_NAME', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[purchase_two_name]', 'PURCHASE_TWO_NAME', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[purchase_three_name]', 'PURCHASE_THREE_NAME', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[material_name]', 'MATERIAL_NAME', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[remark]', 'REMARK', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[technology_need]', 'TECHNOLOGY_NEED', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[package_contract]', 'PACKAGE_CONTRACT', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[key_issus]', 'KEY_ISSUS', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[is_project]', 'IS_PROJECT', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[model]', 'MODEL', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[code]', 'CODE', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[balance]', 'BALANCE', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[projectname]', 'PROJECTNAME', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[status]', 'STATUS', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[is_adopt]', 'IS_ADOPT', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[opinion]', 'OPINION', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[old_item_id]', 'OLD_ITEM_ID', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[new_item_id]', 'NEW_ITEM_ID', 'COLUMN'
GO
EXEC sp_rename '[dbo].[zh_purchase_plan_item].[one_price]', 'ONE_PRICE', 'COLUMN'
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD CONSTRAINT [PK__zh_purch__3213E83F5554AB49] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO
EXEC sp_addextendedproperty
'MS_Description', N'变更后预算金额',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'NEW_BUDGET_AMOUNT'
GO
EXEC sp_addextendedproperty
'MS_Description', N'变更后数量',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'NEW_NUMBER'
GO
EXEC sp_addextendedproperty
'MS_Description', N'变更后单位',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'NEW_UNIT'
GO
EXEC sp_addextendedproperty
'MS_Description', N'变更类型0新增1编辑2删除',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'CHANGE_TYPE'
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD [CHANGE_REASON] varchar(2000) NULL
GO
ALTER TABLE [dbo].[zh_purchase_plan_item] ALTER COLUMN [CHANGE_TYPE] varchar(1) COLLATE Chinese_PRC_CI_AS NULL
GO
EXEC sp_addextendedproperty
'MS_Description', N'变更原因',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'CHANGE_REASON'

--zh_purchase_plan 增加变更状态变更后金额
ALTER TABLE [dbo].[zh_purchase_plan] ADD [NEW_BUDGET_AMOUNT] decimal(18,5)  NULL
GO

EXEC sp_rename '[dbo].[zh_purchase_plan].[EXTEND3]', 'CHANGE_STATE', 'COLUMN'
GO

IF ((SELECT COUNT(*) FROM ::fn_listextendedproperty('MS_Description',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'CHANGE_STATE')) > 0)
  EXEC sp_updateextendedproperty
'MS_Description', N'变更状态，0未变更，1已变更',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'CHANGE_STATE'
ELSE
  EXEC sp_addextendedproperty
'MS_Description', N'变更状态，0未变更，1已变更',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'CHANGE_STATE'
GO

IF ((SELECT COUNT(*) FROM ::fn_listextendedproperty('MS_Description',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'EXTEND4')) > 0)
  EXEC sp_updateextendedproperty
'MS_Description', N'',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'EXTEND4'
ELSE
  EXEC sp_addextendedproperty
'MS_Description', N'',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'EXTEND4'
GO

IF ((SELECT COUNT(*) FROM ::fn_listextendedproperty('MS_Description',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'EXTEND5')) > 0)
  EXEC sp_updateextendedproperty
'MS_Description', N'',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'EXTEND5'
ELSE
  EXEC sp_addextendedproperty
'MS_Description', N'',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'EXTEND5'
GO

EXEC sp_addextendedproperty
'MS_Description', N'变更后预算金额',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'NEW_BUDGET_AMOUNT'
ALTER TABLE [dbo].[zh_purchase_plan] ADD DEFAULT 0 FOR [CHANGE_STATE]
ALTER TABLE [dbo].[zh_purchase_plan] ALTER COLUMN [CHANGE_STATE] varchar(2) COLLATE Chinese_PRC_CI_AS NULL

IF ((SELECT COUNT(*) FROM ::fn_listextendedproperty('MS_Description',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'CHANGE_TYPE')) > 0)
  EXEC sp_updateextendedproperty
'MS_Description', N'变更类型0未变动、1新增、2变更、3删除',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'CHANGE_TYPE'
ELSE
  EXEC sp_addextendedproperty
'MS_Description', N'变更类型0未变动、1新增、2变更、3删除',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'CHANGE_TYPE'
ALTER TABLE [dbo].[zh_purchase_plan_item] ADD [CENTRALIZED_DEPT] varchar(2) NULL
GO
EXEC sp_addextendedproperty
'MS_Description', N'物项归口部门',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan_item',
'COLUMN', N'CENTRALIZED_DEPT'
ALTER TABLE [dbo].[zh_purchase_plan] ADD [SUBJECT] varchar(255) NULL
GO

EXEC sp_addextendedproperty
'MS_Description', N'财务年度预算科目',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'SUBJECT'
ALTER TABLE [dbo].[zh_purchase_plan] ADD [CHANGE_REASON] varchar(2000) COLLATE Chinese_PRC_CI_AS  NULL
GO

EXEC sp_addextendedproperty
'MS_Description', N'变更原因',
'SCHEMA', N'dbo',
'TABLE', N'zh_purchase_plan',
'COLUMN', N'CHANGE_REASON'
```

