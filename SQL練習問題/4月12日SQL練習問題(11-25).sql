-- 11/ �e�O���[�v���Ƃ̑����_����\�����ĉ������B
select
  c.group_name
  , count(g.id) as "COUNT(g.id)" 
from
  goals g 
  left join pairings p 
    on g.pairing_id = p.id 
  left join countries c 
    on p.my_country_id = c.id 
where
  p.kickoff BETWEEN '2014-06-13 0:00:00' AND '2014-06-27 23:59:59' 
group by
  c.group_name 
order by
  c.group_name; 

-- 12/ ���{VS�R�����r�A��ipairings.id = 103�j�ł̃R�����r�A�̓��_�̃S�[�����Ԃ�\�����Ă��������B
select
  goal_time 
from
  goals g 
  left join pairings p 
    on g.pairing_id = p.id 
where
  p.id = 103; 

-- 13/ ���{VS�R�����r�A��̏��s��\�����ĉ������B
select
  c.name
  , count(g.goal_time) as "COUNT(g.goal_time)" 
from
  goals g 
  left join pairings p 
    on g.pairing_id = p.id 
  left join countries c 
    on p.my_country_id = c.id 
where
  p.id = 39 
  or p.id = 103 
group by
  c.name 
order by
  COUNT(g.goal_time); 

-- 14/ �O���[�vC�̊e�ΐ했�ɃS�[������\�����Ă��������B
select
  p.kickoff
  , c1.name as "my_country"
  , c2.name as "enemy_country"
  , c1.ranking as "my_ranking"
  , c2.ranking as "enemy_ranking"
  , count(g.goal_time) as "my_goals" 
from
  pairings p 
  left join countries c1 
    on p.my_country_id = c1.id 
  left join countries c2 
    on p.enemy_country_id = c2.id 
  left join goals g 
    on p.id = g.pairing_id 
where
  c1.group_name = 'C' 
  and c2.group_name = 'C' 
group by
  p.kickoff
  , c1.name
  , c2.name
  , c1.ranking
  , c2.ranking 
order by
  p.kickoff
  , c1.ranking; 

-- 15/ �O���[�vC�̊e�ΐ했�ɃS�[������\�����Ă��������B
select
  p.kickoff
  , c1.name as "my_country"
  , c2.name as "enemy_country"
  , c1.ranking as "my_ranking"
  , c2.ranking as "enemy_ranking"
  , ( 
    select
      count(goal_time) as "my_goals" 
    from
      goals g 
    where
      p.id = g.pairing_id
  ) 
from
  pairings p 
  left join countries c1 
    on p.my_country_id = c1.id 
  left join countries c2 
    on p.enemy_country_id = c2.id 
where
  c1.group_name = 'C' 
  and c2.group_name = 'C' 
order by
  p.kickoff
  , c1.ranking; 

-- 16/ �O���[�vC�̊e�ΐ했�ɃS�[������\�����Ă��������B
select
  p1.kickoff
  , c1.name as "my_country"
  , c2.name as "enemy_country"
  , c1.ranking as "my_ranking"
  , c2.ranking as "enemy_ranking"
  , ( 
    select
      count(goal_time) as "my_goals" 
    from
      goals g1 
    where
      p1.id = g1.pairing_id
  ) 
  , ( 
    select
      count(goal_time) as "enemy_goals" 
    from
      goals g2 
      left join pairings p2 
        on g2.pairing_id = p2.id 
    where
      p2.my_country_id = p1.enemy_country_id 
      and p2.enemy_country_id = p1.my_country_id
  ) 
from
  pairings p1 
  left join countries c1 
    on p1.my_country_id = c1.id 
  left join countries c2 
    on p1.enemy_country_id = c2.id 
where
  c1.group_name = 'C' 
  and c2.group_name = 'C' 
order by
  p1.kickoff
  , c1.ranking; 

-- 17/ ���16�̌��ʂɓ����_����ǉ����Ă��������B
select
  p1.kickoff
  , c1.name as "my_country"
  , c2.name as "enemy_country"
  , c1.ranking as "my_ranking"
  , c2.ranking as "enemy_ranking"
  , ( 
    select
      count(goal_time) as "my_goals" 
    from
      goals g1 
    where
      p1.id = g1.pairing_id
  ) 
  , ( 
    select
      count(goal_time) as "enemy_goals" 
    from
      goals g2 
      left join pairings p2 
        on g2.pairing_id = p2.id 
    where
      p2.my_country_id = p1.enemy_country_id 
      and p2.enemy_country_id = p1.my_country_id
  ) 
  , ( 
    select
      count(goal_time) as "my_goals" 
    from
      goals g1 
    where
      p1.id = g1.pairing_id
  ) - ( 
    select
      count(goal_time) as "enemy_goals" 
    from
      goals g2 
      left join pairings p2 
        on g2.pairing_id = p2.id 
    where
      p2.my_country_id = p1.enemy_country_id 
      and p2.enemy_country_id = p1.my_country_id
  ) as goal_diff 
from
  pairings p1 
  left join countries c1 
    on p1.my_country_id = c1.id 
  left join countries c2 
    on p1.enemy_country_id = c2.id 
where
  c1.group_name = 'C' 
  and c2.group_name = 'C' 
order by
  p1.kickoff
  , c1.ranking; 

-- 18/ �u���W���imy_country_id = 1�j�΃N���A�`�A�ienemy_country_id = 4�j��̃L�b�N�I�t���ԁi���n���ԁj��\�����Ă��������B
select
  p.kickoff
  , p.kickoff - interval '12 hours' as kickoff_jp 
from
  pairings p 
where
  p.my_country_id = 1 
  and p.enemy_country_id = 4; 

-- 19/ �N��Ƃ̑I�萔��\�����Ă��������B�i�N��̓��[���h�J�b�v�J�Ó����ł���2014-06-13���g���ĎZ�o���Ă��������B�j
select
  extract(year from age('2014-06-13', birth)) as age
  , count(id) as player_count 
from
  players 
group by
  age 
order by
  age; 

-- 20/ �N��Ƃ̑I�萔��\�����Ă��������B�������A10�Ζ��ɍ��Z���ĕ\�����Ă��������B
select
  floor( 
    extract(year from age('2014-06-13', birth)) / 10
  ) * 10 as age
  , count(id) as player_count 
from
  players 
group by
  age 
order by
  age; 

-- 21/ �N��Ƃ̑I�萔��\�����Ă��������B�������A5�Ζ��ɍ��Z���ĕ\�����Ă��������B
select
  floor(extract(year from age('2014-06-13', birth)) / 5) * 5 as age
  , count(id) as player_count 
from
  players 
group by
  age 
order by
  age; 

-- 22/ �ȉ��̏�����SQL���쐬���A���o���ꂽ���ʂ����Ƃɂǂ̂悤�ȌX�������邩�l���Ă݂Ă��������B
select
  floor(extract(year from age('2014-06-13', birth)) / 5) * 5 as age
  , position
  , count(id) as player_count
  , round(avg(height), 4) as "AVG(height)"
  , round(avg(weight), 4) as "AVG(weight)" 
from
  players 
group by
  age
  , position 
order by
  age; 

-- 23/ �g���̍����I��x�X�g5�𒊏o���A�ȉ��̍��ڂ�\�����Ă��������B
select
  name
  , height
  , weight 
from
  players 
order by
  height desc 
limit
  5; 

-- 24/ �g���̍����I��6�ʁ`20�ʂ𒊏o���A�ȉ��̍��ڂ�\�����Ă��������B
select
  name, height
  , weight 
from
  players 
order by
  height desc
  , name desc 
limit
  20 offset 5; 

-- 25/ �S�I��̈ȉ��̃f�[�^�𒊏o���Ă��������B
select
  uniform_num, name
  , club 
from
  players;

