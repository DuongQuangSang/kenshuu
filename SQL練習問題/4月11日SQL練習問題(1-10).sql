-- 1/ 各グループの中でFIFAランクが最も高い国と低い国のランキング番号を表示してください。
select
  group_name as グルーブ
  , max(ranking) as ランキング最上位
  , min(ranking) as ランキング最下位 
from
  countries 
group by
  group_name 
order by
  group_name; 

-- 2/ 全ゴールキーパーの平均身長、平均体重を表示してください。
select
  round(avg(height), 4) as 平均身長
  , round(avg(weight), 4) as 平均体重 
from
  players; 

-- 3/ 各国の平均身長を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
select
  countries.name
  , round(avg(players.height), 4) as 平均身長 
from
  countries 
  inner join players 
    on countries.id = players.country_id 
group by
  countries.name 
order by
  平均身長 desc; 

-- 4/ 各国の平均身長を高い方から順に表示してください。ただし、FROM句はplayersテーブルとして、テーブル結合を使わず副問合せを用いてください。
select
  countries.name
  , round(avg(players.height), 4) as 平均身長 
from
  players 
  inner join countries 
    on players.country_id = countries.id 
group by
  countries.name 
order by
  平均身長 desc; 

-- 5/ キックオフ日時と対戦国の国名をキックオフ日時の早いものから順に表示してください。
select
  p1.kickoff as キックオフ日時
  , c1.name as 国名1
  , c2.name as 国名2 
from
  pairings p1 
  left join countries c1 
    on p1.my_country_id = c1.id 
  left join countries c2 
    on p1.enemy_country_id = c2.id 
order by
  キックオフ日時; 

-- 6/ すべての選手を対象として選手ごとの得点ランキングを表示してください。（SELECT句で副問合せを使うこと）。
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
  ) as ゴール数 
from
  players p1 
order by
  ゴール数 desc; 

-- 7/ すべての選手を対象として選手ごとの得点ランキングを表示してください。（テーブル結合を使うこと）。
select
  p1.name
  , p1.position
  , p1.club
  , count(g1.goal_time) as ゴール数 
from
  players p1 
  left join goals g1 
    on p1.id = g1.player_id 
group by
  p1.name
  , p1.position
  , p1.club 
order by
  ゴール数 desc; 

-- 8/ 各ポジションごとの総得点を表示してください。
select
  p1.position
  , count(g1.goal_time) as ゴール数 
from
  players p1 
  left join goals g1 
    on p1.id = g1.player_id 
group by
  p1.position 
order by
  ゴール数 desc; 

-- 9/ ワールドカップ開催当時（2014-06-13）の年齢をプレイヤー毎に表示する。
select
  birth
  , extract(year from age('2014-06-13', birth)) as age
  , name
  , position 
from
  players 
order by
  age desc; 

-- 10/ オウンゴールの回数を表示する
select
  count(goal_time) as "COUNT(g.goal_time)" 
from
  goals 
where
  player_id is null;

