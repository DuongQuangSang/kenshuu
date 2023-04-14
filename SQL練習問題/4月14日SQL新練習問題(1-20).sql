-- 1/ 患者名が「鈴木花子」である患者の、最も新しい診察記録の診察ID、診察日、医師名、診療科名を表示するSQL文を作成してください。
select
  e.examination_id
  , e.examination_date
  , d.doctor_name
  , dpm.department_name 
from
  examinations e 
  left join patients p 
    on e.patient_id = p.patient_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
  left join departments dpm 
    on e.department_id = dpm.department_id 
where
  p.patient_name = '鈴木花子'; 

-- 2/ 各診療科ごとに診察回数を集計して、診療科名と診察回数を降順で表示するSQL文を作成してください。
select
  dpm.department_name
  , count(e.examination_id) as "回数" 
from
  examinations e 
  left join departments dpm 
    on e.department_id = dpm.department_id 
group by
  dpm.department_name 
order by
  回数 desc; 

-- 3/ 医師名が「山田一郎」である患者のIDと患者名を表示するSQL文を作成してください。
select
  p.patient_name
  , p.patient_id 
from
  patients 
  left join examinations e 
    on p.patient_id = e.examination_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
where
  d.doctor_name = '山田一郎'; 

-- 4/ 診療科が「内科」かつ診察日が2022年4月1日以降である患者の患者名と診察日を昇順で表示するSQL文を作成してください。
select
  p.patient_name
  , e.examination_date 
from
  patients p 
  left join examinations e 
    on p.patient_id = e.patient_id 
  left join departments dpm 
    on e.department_id = dpm.department_id 
where
  e.examination_date >= to_date(20220401 ::text, 'YYYYMMDD') 
  and dpm.department_name = '内科' 
order by
  e.examination_date; 

-- 5/ 医師名が「田中三郎」である診察記録の診察IDと診察日を表示するSQL文を作成してください。
select
  e.examination_id
  , e.examination_date 
from
  examinations e 
  inner join doctors d 
    on e.doctor_id = d.doctor_id 
where
  d.doctor_name = '田中三郎'; 

-- 6/ examinationsテーブルから重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
  count(distinct patient_id) as patient_num 
from
  examinations; 

-- 7/ department_idが2の科(department)における重複を除いた患者(patient_id)の数のSQL文を作成してください。
select
  count(distinct e.patient_id) as patient_num 
from
  examinations e 
where
  e.department_id = 2; 

-- 8/ patient_nameが"山田太郎"の患者の情報を取得するクエリを書いてください。
select
  * 
from
  patients p 
where
  p.patient_name = '山田太郎'; 

-- 9/ 2022年1月1日以降に診察された全ての情報を取得するクエリを書いてください。
select
  * 
from
  examinations e 
where
  e.examination_date >= to_date(20220101 ::text, 'YYYYMMDD'); 

-- 10/ patientsテーブルから、patient_idが偶数でかつがgenderは男性の患者の名前を取得するSQL文を作成してください。
select
  p.patient_name 
from
  patients p 
where
  p.gender = '男性' 
  and p.patient_id % 2 = 0; 

-- 11/ doctorsテーブルから、salaryが400000以上でかつgenderが'女性'の医師のIDと名前を取得するSQL文を作成してください。
select
  d.doctor_id
  , d.doctor_name 
from
  doctors d 
where
  d.salary >= 400000 
  and d.gender = '女性'; 

-- 12/ department_idが1または2の患者の治療データを取得するSQL文を作成してください。
select
  * 
from
  examinations e 
where
  e.department_id <= 2; 

-- 13/ 患者のIDが6以上で、診断結果が"糖尿病"または"高血圧"である診断データを取得するSQL文を作成してください。
select
  * 
from
  examinations e 
where
  e.patient_id >= 6 
  and (e.diagnosis = '糖尿病' or e.diagnosis = '高血圧'); 

-- 14/ patient_idが3または4の場合で、かつ、diagnosisに"急性中耳炎"または"風邪"が含まれるレコードを抽出するSQL文を作成してください。
select
  * 
from
  examinations e 
where
  (e.patient_id = 3 or e.patient_id = 4) 
  and (e.diagnosis = '急性中耳炎' or e.diagnosis = '風邪'); 

-- 15/ patient_idが5で、かつ、(doctor_idが8であるか、department_idが4である)、かつ、examination_dateが2022年11月05日より後のレコードを抽出するSQL文を作成してください。
select
  * 
from
  examinations e 
where
  e.patient_id = 5 
  and ( 
    (e.doctor_id = 8 or e.department_id = 4) 
    and e.examination_date > to_date(20221105 ::text, 'YYYYMMDD')
  ); 

-- 16/ examination_dateを昇順で並べ替えた結果を取得するSQL文を書いてください。
select
  * 
from
  examinations e 
order by
  e.examination_date; 

-- 17/ diagnosisが"風邪"のレコードをtreatmentの降順で並べ替えた結果を取得するSQL文を書いてください。
select
  * 
from
  examinations e 
where
  e.diagnosis = '風邪' 
order by
  e.treatment desc; 

-- 18/ 最初の5つの患者のIDと名前を取得するSQL文を書いてください。
select
  p.patient_id
  , p.patient_name 
from
  patients p 
limit
  5; 

-- 19/ 患者の診察データで、診断が「風邪」となっている最初の10件のデータを取得するSQL文を書いてください。
select
  * 
from
  examinations e 
where
  e.diagnosis = '風邪' 
limit
  10; 

treatment

-- 20/ examinationsテーブルから、患者IDが1であるデータのうち、最も古い日付であるexamination_dateで並び替えた上で、2番目のレコードから4つのレコードを取得してください。
select
  * 
from
  examinations e 
where
  e.patient_id = 11 
order by
  e.examination_date 
limit
  3 offset 1;

