﻿# WSBALANCE

									微商结算系统
一：管理员后台系统需求
1：管理员登录，密码修改
2：微商组织结构树型图
3：代理增删改查
4：业绩奖金比例设定
5：总代业绩增加功能，通过选择总代，显示出总代当前的业绩和奖金比例饿，添加新增业绩，可以根据原业绩加新业绩，结合业绩奖金比例，得出该总代的业绩比例
6：总代业绩显示列表
7：计算总代个人奖励
个人奖励=总代业绩奖励---其发展的总代业绩奖励
8：一键导出当前业绩到excel
9:重置业绩
二：微信前台
1：普通用户可以通过微信号查询是否有授权
2：总代通过登录可以查询当前其业绩，奖金，其下属总代业绩
3：总代可以查看其团队的组织树形图
4：总代可以修改密码

用到的一个视图

with act as(
select ag.agid,ag.agpid,ag.agname,ag.agwxnum,ac.money,ac.money*ac.proportion as team 
  from t_wsbalance_achievement ac,t_wsbalance_agent ag
  where ac.agent=ag.agid
)
select 
  a.agname,
  a.agwxnum,
  a.money,
  a.team,
  a.team-b.sumteam as personmoney
from act a left join (
 select act.agpid,sum(act.team) as sumteam from  act group by act.agpid ) b 
 on b.agpid=a.agid
  
