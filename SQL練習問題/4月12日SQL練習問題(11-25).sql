-- 11/ 各グループごとの総得点数を表示して下さい。
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

-- 12/ 日本VSコロンビア戦（pairings.id = 103）でのコロンビアの得点のゴール時間を表示してください。
select
  goal_time 
from
  goals g 
  left join pairings p 
    on g.pairing_id = p.id 
where
  p.id = 103; 

-- 13/ 日本VSコロンビア戦の勝敗を表示して下さい。
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

-- 14/ グループCの各対戦毎にゴール数を表示してください。
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

-- 15/ グループCの各対戦毎にゴール数を表示してください。
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

-- 16/ グループCの各対戦毎にゴール数を表示してください。
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

-- 17/ 問題16の結果に得失点差を追加してください。
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

-- 18/ ブラジル（my_country_id = 1）対クロアチア（enemy_country_id = 4）戦のキックオフ時間（現地時間）を表示してください。
select
  p.kickoff
  , p.kickoff - interval '12 hours' as kickoff_jp 
from
  pairings p 
where
  p.my_country_id = 1 
  and p.enemy_country_id = 4; 

-- 19/ 年齢ごとの選手数を表示してください。（年齢はワールドカップ開催当時である2014-06-13を使って算出してください。）
select
  extract(year from age('2014-06-13', birth)) as age
  , count(id) as player_count 
from
  players 
group by
  age 
order by
  age; 

-- 20/ 年齢ごとの選手数を表示してください。ただし、10歳毎に合算して表示してください。
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

-- 21/ 年齢ごとの選手数を表示してください。ただし、5歳毎に合算して表示してください。
select
  floor(extract(year from age('2014-06-13', birth)) / 5) * 5 as age
  , count(id) as player_count 
from
  players 
group by
  age 
order by
  age; 

-- 22/ 以下の条件でSQLを作成し、抽出された結果をもとにどのような傾向があるか考えてみてください。
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

-- 23/ 身長の高い選手ベスト5を抽出し、以下の項目を表示してください。
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

-- 24/ 身長の高い選手6位～20位を抽出し、以下の項目を表示してください。
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

-- 25/ 全選手の以下のデータを抽出してください。
select
  uniform_num, name
  , club 
from
  players;

