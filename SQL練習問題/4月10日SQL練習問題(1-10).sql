-- 1/ �e�O���[�v�̒���FIFA�����N���ł��������ƒႢ���̃����L���O�ԍ���\�����Ă��������B
select
  group_name as �O���[�u
  , max(ranking) as �����L���O�ŏ��
  , min(ranking) as �����L���O�ŉ��� 
from
  countries 
group by
  group_name 
order by
  group_name; 

-- 2/ �S�S�[���L�[�p�[�̕��ϐg���A���ϑ̏d��\�����Ă��������B
select
  round(avg(height), 4) as ���ϐg��
  , round(avg(weight), 4) as ���ϑ̏d 
from
  players; 

-- 3/ �e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���countries�e�[�u���Ƃ��Ă��������B
select
  countries.name
  , round(avg(players.height), 4) as ���ϐg�� 
from
  countries 
  inner join players 
    on countries.id = players.country_id 
group by
  countries.name 
order by
  ���ϐg�� desc; 

-- 4/ �e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���players�e�[�u���Ƃ��āA�e�[�u���������g�킸���⍇����p���Ă��������B
select
  countries.name
  , round(avg(players.height), 4) as ���ϐg�� 
from
  players 
  inner join countries 
    on players.country_id = countries.id 
group by
  countries.name 
order by
  ���ϐg�� desc; 

-- 5/ �L�b�N�I�t�����Ƒΐ퍑�̍������L�b�N�I�t�����̑������̂��珇�ɕ\�����Ă��������B
select
  p1.kickoff as �L�b�N�I�t����
  , c1.name as ����1
  , c2.name as ����2 
from
  pairings p1 
  left join countries c1 
    on p1.my_country_id = c1.id 
  left join countries c2 
    on p1.enemy_country_id = c2.id 
order by
  �L�b�N�I�t����; 

-- 6/ ���ׂĂ̑I���ΏۂƂ��đI�育�Ƃ̓��_�����L���O��\�����Ă��������B�iSELECT��ŕ��⍇�����g�����Ɓj�B
select
  p1.name
  , p1.position
  , p1.club
  , ( 
    select
      count(goal_time) 
    from
      goals 
    where
      player_id = p1.id
  ) as �S�[���� 
from
  players p1 
order by
  �S�[���� desc; 

-- 7/ ���ׂĂ̑I���ΏۂƂ��đI�育�Ƃ̓��_�����L���O��\�����Ă��������B�i�e�[�u���������g�����Ɓj�B
select
  p1.name
  , p1.position
  , p1.club
  , count(g1.goal_time) as �S�[���� 
from
  players p1 
  left join goals g1 
    on p1.id = g1.player_id 
group by
  p1.name
  , p1.position
  , p1.club 
order by
  �S�[���� desc; 

-- 8/ �e�|�W�V�������Ƃ̑����_��\�����Ă��������B
select
  p1.position
  , count(g1.goal_time) as �S�[���� 
from
  players p1 
  left join goals g1 
    on p1.id = g1.player_id 
group by
  p1.position 
order by
  �S�[���� desc; 

-- 9/ ���[���h�J�b�v�J�Ó����i2014-06-13�j�̔N����v���C���[���ɕ\������B
select
  birth
  , extract(year from age('2014-06-13', birth)) as age
  , name
  , position 
from
  players 
order by
  age desc; 

-- 10/ �I�E���S�[���̉񐔂�\������
select
  count(goal_time) as "COUNT(g.goal_time)" 
from
  goals 
where
  player_id is null;

