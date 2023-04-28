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

treatment                                         -- 20/ examinationsテーブルから、患者IDが1であるデータのうち、最も古い日付であるexamination_dateで並び替えた上で、2番目のレコードから4つのレコードを取得してください。
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

-- 21/ "骨"で始まるdiagnosisを持つ患者を選択するSQL文を書いてください。
select
  * 
from
  examinations e 
where
  e.diagnosis like '骨%'; 

-- 22/ "慢性中耳炎"という単語を含むdiagnosisを持つ患者を選択するSQL文を書いてください。
select
  * 
from
  examinations e 
where
  e.diagnosis like '%慢性中耳炎%'; 

-- 23/ "安静にして湿布を貼るように指示"で終わるpatient_idを持つ患者を選択するSQL文を書いてください。
select
  * 
from
  examinations e 
where
  e.treatment like '%安静にして湿布を貼るように指示%'; 

-- 24/ patient_idが3、5、8、10の患者の全診断情報を取得するSQLクエリを作成してください。
select
  * 
from
  examinations e 
where
  e.patient_id in (3, 5, 8); 

-- 25/ 患者IDが2, 4, 6, 8のいずれかである診察レコードを検索してください。ただし、診察科が '小児科' であるものに限定します。
select
  * 
from
  examinations e 
  inner join departments dpm 
    on e.department_id = dpm.department_id 
where
  e.patient_id in (2, 4, 6, 8) 
  and dpm.department_name = '小児科'; 

-- 26/ 診察日が2022年3月15日または5月20日であり、診察科が '外科' または '歯科' のいずれかである診察レコードを検索してください。ただし、患者IDが4であるものは除外します。
select
  * 
from
  examinations e 
where
  not e.patient_id = 4 
  and ( 
    e.examination_date = '2022/03/15' 
    or e.examination_date = '2022/05/20'
  ) 
  and department_id in ( 
    select
      dpm.department_id 
    from
      departments dpm 
    where
      dpm.department_name in ('外科', '歯科')
  ); 

-- 27/ 検査日が2022年3月から2022年5月の間にある患者のうち、病院の外来で診察された患者の検査IDと診断結果を取得する。
select
  e.examination_id, e.diagnosis 
from
  examinations e 
where
  e.examination_date >= '2022/03/01' 
  and e.examination_date < '2022/05/01'; 

-- 28/ 検査日が2022年3月から5月の間にある患者で、診断結果に「胃潰瘍」という文字列が含まれている患者の検査ID、患者ID、医師ID、診断結果を取得する。
select
  e.examination_id
  , e.patient_id
  , e.doctor_id
  , e.diagnosis 
from
  examinations e 
where
  e.diagnosis like '%胃潰瘍%' 
  and e.examination_date >= '2022/03/01' 
  and e.examination_date < '2022/05/01'; 

-- 29/ 患者名、性別、診断、治療、および医師名を含む、すべての患者の詳細とその医師の情報を取得するSQL文を作成してください。
select
  p.patient_name
  , p.gender
  , e.diagnosis
  , e.treatment
  , d.doctor_name 
from
  examinations e 
  left join patients p 
    on e.patient_id = p.patient_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id; 

-- 30/ 各診療科の診断の数を含む、診療科名と診断数を表示するSQL文を作成してください。
select
  dpm.department_name
  , count(e.diagnosis) as diagnosis_count 
from
  examinations e 
  inner join departments dpm 
    on e.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 31/ 医師の情報と診断名を結合し、診断名が "慢性中耳炎" である患者の氏名と診断日を表示するクエリ。
select
  ( 
    select
      d.doctor_name 
    from
      doctors d 
    where
      d.doctor_id = e.doctor_id
  ) 
  , p.patient_name
  , e.examination_date 
from
  patients p 
  left join examinations e 
    on p.patient_id = e.patient_id 
where
  e.diagnosis = '慢性中耳炎'; 

-- 32/ 特定の科('外科')に所属する医師と、その医師が診断した患者の氏名と診断名を表示するクエリ。
select
  d.doctor_name
  , p.patient_name
  , e.diagnosis
  , dpm.department_name
  , e.examination_date 
from
  examinations e 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
  left join patients p 
    on e.patient_id = p.patient_id 
  left join departments dpm 
    on e.department_id = dpm.department_id 
where
  dpm.department_name = '内科'; 

-- 33/ 患者ごとに、彼らが最後に受けた検査の情報と、その検査を行った医師の情報を表示する。
select
  p.patient_name
  , d.doctor_name
  , max(e.examination_date) as 最後に受けた検査 
from
  examinations e 
  left join patients p 
    on e.patient_id = p.patient_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
group by
  p.patient_name
  , d.doctor_name
  , p.patient_id; 

-- 34/ 各部門ごとに、その部門で働く医師の平均給与と、その部門で行われた検査の数を表示する。
--※  部門に医師がいない場合は、平均給与がNULL値として表示してください。また、部門に検査が行われていない場合は、検査数が0として表示してください。
select
  dpm.department_name
  , avg(d.salary) as "平均給与"
  , count(e.examination_id) as "検査の数" 
from
  departments dpm 
  left join examinations e 
    on dpm.department_id = e.department_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
group by
  dpm.department_id; 

-- 35/ departmentsテーブルとdoctorsテーブルをdepartment_idで結合し、各部署の平均給与を取得するSQL文を作成してください。
select
  dpm.department_name
  , round(avg(d.salary), 4) as 平均給与 
from
  departments dpm 
  left join doctors d 
    on dpm.department_id = d.department_id 
group by
  dpm.department_name; 

-- 36/ patientsテーブルとexaminationsテーブルをpatient_idで結合し、診察を受けた患者の総数と最新の診察日を取得するSQL文を作成してください。
select
  p.patient_name
  , count(e.examination_id) as 診察を受けた総数
  , max(e.examination_date) as 最新の診察日 
from
  patients p 
  left join examinations e 
    on e.patient_id = p.patient_id 
group by
  p.patient_id; 

-- 37/ 医師の情報を、所属する部署の情報がある場合はそれも含めて表示するSQL文を作成してください。
select
  * 
from
  doctors d 
  left join departments dpm 
    on d.department_id = dpm.department_id; 

-- 38/ 検査の情報を、患者の情報がある場合はそれも含めて表示するSQL文を作成してください。
select
  * 
from
  examinations e 
  left join patients p 
    on e.patient_id = p.patient_id; 

-- 39/ patientsテーブルとexaminationsテーブルをLEFT JOINし、各患者が最も最近行った検査の情報を取得するクエリを作成してください。
select
  p.patient_name
  , e.examination_id
  , e.examination_date
  , e.diagnosis
  , e.treatment 
from
  patients p 
  left join ( 
    select
      examination_id
      , patient_id
      , examination_date
      , diagnosis
      , treatment
      , row_number() over ( 
        partition by
          patient_id 
        order by
          examination_date desc
      ) as rn 
    from
      examinations
  ) e 
    on p.patient_id = e.patient_id 
    and e.rn = 1; 

-- 40/ doctorsテーブルとdepartmentsテーブルをLEFT JOINし、各科の平均給与と最低給与を取得するクエリを作成してください。
select
  dpm.department_name
  , avg(d.salary) as avg_salary
  , min(d.salary) 
from
  departments dpm 
  left join doctors d 
    on dpm.department_id = d.department_id 
group by
  dpm.department_name; 

-- 41/ 医者の名前、患者の名前、診断、治療内容、および診察日を含むレポートを作成してください。ただし、医者と患者がともに存在し、診断と治療内容が空でない場合にのみ、レポートに含めてください。レポートは、診察日が新しいものから古いものの順に並べ替える必要があります。
select
  d.doctor_name
  , p.patient_name
  , e.diagnosis
  , e.treatment
  , e.examination_date 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
  inner join doctors d 
    on e.doctor_id = d.doctor_id 
order by
  e.examination_date desc; 

-- 42/ 患者（patients）と医師（doctors）の情報を結合して、部署（departments）ごとの平均給与（salary）を表示するクエリを作成してください。
--ただし、部署名（department_name）が '内科' の部署は除外してください。
select
  dpm.department_id
  , dpm.department_name
  , avg(d.salary) 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
  inner join departments dpm 
    on e.department_id = dpm.department_id 
  inner join doctors d 
    on d.department_id = dpm.department_id 
where
  not dpm.department_name = '内科' 
group by
  dpm.department_id
  , dpm.department_name; 

-- 43/ 患者（patients）と検査（examinations）の情報を結合して、患者名（patient_name）と検査日（examination_date）ごとの医師数を表示するクエリを作成してください。
--ただし、患者名と検査日の組み合わせが存在しない場合は、0を表示してください。
select
  p.patient_name
  , e.examination_date
  , count(e.doctor_id) 
from
  patients p 
  left join examinations e 
    on e.patient_id = p.patient_id 
group by
  e.doctor_id
  , p.patient_name
  , e.examination_date; 

-- 44/ 患者と医師の所属科とその科の説明の情報を結合するSQL文を作成してください。
select
  p.patient_name
  , d.doctor_name
  , dpm.department_name
  , dpm.description 
from
  patients p 
  inner join examinations e 
    on p.patient_id = e.patient_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
  left join departments dpm 
    on e.department_id = dpm.department_id; 

-- 45/ 患者の性別と年齢情報、医師の性別を結合するSQL文を作成してください。
select
  p.patient_name
  , p.gender
  , p.date_of_birth
  , extract(year from age(current_date, p.date_of_birth)) as age
  , d.doctor_name
  , d.gender 
from
  patients p 
  inner join examinations e 
    on p.patient_id = e.patient_id 
  inner join doctors d 
    on e.doctor_id = d.doctor_id; 

-- 46/ 全患者の中で、診断された病気の数が最も多いトップ5の患者を取得するためのクエリを作成してください。
--ただし、診断がない患者は結果に含めないでください。
select
  p.patient_name
  , count(e.patient_id) 
from
  patients p 
  inner join examinations e 
    on p.patient_id = e.patient_id 
group by
  p.patient_name 
limit
  5; 

-- 47/ 医師ごとに、その医師が診察した患者の名前、性別、診察日、診断、および治療を取得するためのクエリを作成してください。
--ただし、全ての医師の情報を取得する必要があります。
select
  d.doctor_id, d.doctor_name
  , p.patient_name
  , p.gender
  , e.diagnosis
  , e.treatment 
from
  doctors d 
  left join examinations e 
    on e.doctor_id = d.doctor_id 
  left join patients p 
    on e.patient_id = p.patient_id; 

-- 48/ 医師の平均給与を求める
select
  avg(salary) as 平均給与 
from
  doctors; 

-- 49/ 部署ごとの医師の平均給与を求める
select
  dpm.department_name
  , avg(salary) as 平均給与 
from
  departments dpm 
  inner join doctors d 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 50/ 全患者の平均年齢を求める
select
  avg( 
    extract(year from age(current_date, p.date_of_birth))
  ) as 平均年齢 
from
  patients p; 

-- 51/ examinationsテーブルに登録された、各患者の診察回数を求めるSQL文を作成してください。
select
  p.patient_name
  , count(p.patient_id) 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
group by
  p.patient_id; 

-- 52/ 患者の数をカウントするSQL文を作成してください。
select
  count(patient_id) 
from
  patients; 

-- 53/ 各科の医師数をカウントするSQL文を作成してください。
select
  dpm.department_name
  , count(d.doctor_id) 
from
  departments dpm 
  inner join doctors d 
    on dpm.department_id = d.department_id 
group by
  dpm.department_name; 

-- 54/ 各患者の最も古い検査日を取得する。
select
  p.patient_name
  , min(e.examination_date) 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
group by
  p.patient_id; 

-- 55/ 最低給料を持つ医師を見つける。
select
  min(d.salary) 
from
  doctors d; 

-- 56/ 医師の最高給与を検索するSQL文を作成してください。
select
  max(d.salary) 
from
  doctors d; 

-- 57/ 各診療科の医師の最高給与を検索するSQL文を作成してください。
select
  dpm.department_name
  , max(d.salary) 
from
  doctors d 
  inner join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 58/ 各患者の最新の診断を検索するSQL文を作成してください。
select
  p.patient_name
  , e.diagnosis
  , max(e.examination_date) 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
group by
  p.patient_id
  , e.diagnosis; 

-- 59/ 各部門の医師の平均給与と総支払額を計算するSQL文を作成してください。
select
  dpm.department_name
  , avg(d.salary)
  , sum(d.salary) 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 60/「歯科」所属する医師の給与総額を計算するSQL文を作成してください。
select
  dpm.department_name
  , sum(d.salary) 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
where
  dpm.department_name = '歯科' 
group by
  dpm.department_name; 

-- 61/ 各部門の平均給与を取得するSQL文を作成してください。
select
  dpm.department_name
  , avg(d.salary) 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 62/ 各患者が受けた診察の数を取得するSQL文を作成してください。
select
  e.patient_id
  , count(e.examination_id) 
from
  examinations e 
group by
  e.patient_id; 

-- 63/ 各部署の平均給与と最高給与を取得するクエリを作成してください。
select
  dpm.department_name
  , avg(d.salary) as 平均給与
  , max(d.salary) as 最高給与 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 64/ 患者ごとの最後の検査の診断を取得するSQL文を作成してください。
select
  p.patient_id
  , p.patient_name
  , e.diagnosis 
from
  patients p join examinations e 
    on p.patient_id = e.patient_id 
where
  e.examination_date = ( 
    select
      MAX(examination_date) 
    from
      examinations 
    where
      patient_id = p.patient_id);

-- 65/ 各診療科の医師の患者数と、その患者たちの平均年齢を求めよ。
--ただし、各診療科の医師は1名以上所属しているものとする。
--また、平均年齢は小数点以下2桁まで表示するものとする。

select dpm.department_name, d.doctor_name, (select count(e1.patient_id) from examinations e1 where e1.doctor_id = e.doctor_id) as 患者数 from examinations e join doctors d on e.doctor_id = d.doctor_id join departments dpm on e.department_id = dpm.department_id;


-- 66/ 患者ごとの最も新しい検査結果を取得するSQL文を作成してください。
select p.patient_name, e.examination_date, e.diagnosis, e.treatment
from patients p
inner join examinations e on p.patient_id = e.patient_id
where (e.examination_date, p.patient_id) IN (
  select MAX(examination_date), patient_id
  from examinations
  group by patient_id
)
order by e.examination_date desc;

-- 67/ 部門ごとに最も高い給与をもつ医師の情報を取得するSQL文を作成してください。
select
  departments.department_name
  , d.doctor_name
  , d.salary 
from
  ( 
    select
      department_id
      , max(salary) as max_salary 
    from
      doctors 
    group by
      department_id
  ) m 
  inner join doctors d 
    on m.department_id = d.department_id 
  inner join departments 
    on departments.department_id = d.department_id 
    and m.max_salary = d.salary;

-- 68/ 患者ごとに、診断された疾患の一覧を含む詳細な医療レポートを生成するクエリを作成してください。
select
  p.patient_name
  , p.gender
  , p.date_of_birth
  , p.address
  , p.phone_number
  , e.examination_date
  , d.department_name
  , doc.doctor_name
  , e.diagnosis
  , e.treatment 
from
  patients p join examinations e 
    on p.patient_id = e.patient_id join doctors doc 
    on e.doctor_id = doc.doctor_id join departments d 
    on e.department_id = d.department_id;

-- 69/ 患者ごとの、最も最近の診察結果を表示するクエリ。患者がまだ診察を受けていない場合は、診察日がnullとなるように表示する。
select 
    patients.patient_id, 
    patients.patient_name, 
    MAX(examinations.examination_date) as latest_examination_date, 
    case 
        when COUNT(examinations.examination_date) = 0 then null 
        else MAX(examinations.diagnosis) 
    end as latest_diagnosis, 
    case 
        when COUNT(examinations.examination_date) = 0 then null 
        else MAX(examinations.treatment) 
    end as latest_treatment 
from 
    patients 
left join 
    examinations 
on 
    patients.patient_id = examinations.patient_id
group by 
    patients.patient_id
order by
    patients.patient_id;

-- 70/ 各部門の平均給与と、平均給与が最も高い部門の名前と平均給与を表示する。
select
    departments.department_name
    , AVG(doctors.salary) as avg_salary 
from
    doctors join departments 
        on doctors.department_id = departments.department_id 
group by
    departments.department_name 
order by
    avg_salary desc 
limit 1;

