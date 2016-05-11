# WSBALANCE


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
  
