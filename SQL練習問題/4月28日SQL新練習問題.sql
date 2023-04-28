-- 1/ ���Җ����u��؉Ԏq�v�ł��銳�҂́A�ł��V�����f�@�L�^�̐f�@ID�A�f�@���A��t���A�f�ÉȖ���\������SQL�����쐬���Ă��������B
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
  p.patient_name = '��؉Ԏq'; 

-- 2/ �e�f�ÉȂ��Ƃɐf�@�񐔂��W�v���āA�f�ÉȖ��Ɛf�@�񐔂��~���ŕ\������SQL�����쐬���Ă��������B
select
  dpm.department_name
  , count(e.examination_id) as "��" 
from
  examinations e 
  left join departments dpm 
    on e.department_id = dpm.department_id 
group by
  dpm.department_name 
order by
  �� desc; 

-- 3/ ��t�����u�R�c��Y�v�ł��銳�҂�ID�Ɗ��Җ���\������SQL�����쐬���Ă��������B
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
  d.doctor_name = '�R�c��Y'; 

-- 4/ �f�ÉȂ��u���ȁv���f�@����2022�N4��1���ȍ~�ł��銳�҂̊��Җ��Ɛf�@���������ŕ\������SQL�����쐬���Ă��������B
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
  and dpm.department_name = '����' 
order by
  e.examination_date; 

-- 5/ ��t�����u�c���O�Y�v�ł���f�@�L�^�̐f�@ID�Ɛf�@����\������SQL�����쐬���Ă��������B
select
  e.examination_id
  , e.examination_date 
from
  examinations e 
  inner join doctors d 
    on e.doctor_id = d.doctor_id 
where
  d.doctor_name = '�c���O�Y'; 

-- 6/ examinations�e�[�u������d��������������(patient_id)�̐���SQL�����쐬���Ă��������B
select
  count(distinct patient_id) as patient_num 
from
  examinations; 

-- 7/ department_id��2�̉�(department)�ɂ�����d��������������(patient_id)�̐���SQL�����쐬���Ă��������B
select
  count(distinct e.patient_id) as patient_num 
from
  examinations e 
where
  e.department_id = 2; 

-- 8/ patient_name��"�R�c���Y"�̊��҂̏����擾����N�G���������Ă��������B
select
  * 
from
  patients p 
where
  p.patient_name = '�R�c���Y'; 

-- 9/ 2022�N1��1���ȍ~�ɐf�@���ꂽ�S�Ă̏����擾����N�G���������Ă��������B
select
  * 
from
  examinations e 
where
  e.examination_date >= to_date(20220101 ::text, 'YYYYMMDD'); 

-- 10/ patients�e�[�u������Apatient_id�������ł���gender�͒j���̊��҂̖��O���擾����SQL�����쐬���Ă��������B
select
  p.patient_name 
from
  patients p 
where
  p.gender = '�j��' 
  and p.patient_id % 2 = 0; 

-- 11/ doctors�e�[�u������Asalary��400000�ȏ�ł���gender��'����'�̈�t��ID�Ɩ��O���擾����SQL�����쐬���Ă��������B
select
  d.doctor_id
  , d.doctor_name 
from
  doctors d 
where
  d.salary >= 400000 
  and d.gender = '����'; 

-- 12/ department_id��1�܂���2�̊��҂̎��Ãf�[�^���擾����SQL�����쐬���Ă��������B
select
  * 
from
  examinations e 
where
  e.department_id <= 2; 

-- 13/ ���҂�ID��6�ȏ�ŁA�f�f���ʂ�"���A�a"�܂���"������"�ł���f�f�f�[�^���擾����SQL�����쐬���Ă��������B
select
  * 
from
  examinations e 
where
  e.patient_id >= 6 
  and (e.diagnosis = '���A�a' or e.diagnosis = '������'); 

-- 14/ patient_id��3�܂���4�̏ꍇ�ŁA���Adiagnosis��"�}��������"�܂���"����"���܂܂�郌�R�[�h�𒊏o����SQL�����쐬���Ă��������B
select
  * 
from
  examinations e 
where
  (e.patient_id = 3 or e.patient_id = 4) 
  and (e.diagnosis = '�}��������' or e.diagnosis = '����'); 

-- 15/ patient_id��5�ŁA���A(doctor_id��8�ł��邩�Adepartment_id��4�ł���)�A���Aexamination_date��2022�N11��05������̃��R�[�h�𒊏o����SQL�����쐬���Ă��������B
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

-- 16/ examination_date�������ŕ��בւ������ʂ��擾����SQL���������Ă��������B
select
  * 
from
  examinations e 
order by
  e.examination_date; 

-- 17/ diagnosis��"����"�̃��R�[�h��treatment�̍~���ŕ��בւ������ʂ��擾����SQL���������Ă��������B
select
  * 
from
  examinations e 
where
  e.diagnosis = '����' 
order by
  e.treatment desc; 

-- 18/ �ŏ���5�̊��҂�ID�Ɩ��O���擾����SQL���������Ă��������B
select
  p.patient_id
  , p.patient_name 
from
  patients p 
limit
  5; 

-- 19/ ���҂̐f�@�f�[�^�ŁA�f�f���u���ׁv�ƂȂ��Ă���ŏ���10���̃f�[�^���擾����SQL���������Ă��������B
select
  * 
from
  examinations e 
where
  e.diagnosis = '����' 
limit
  10; 

treatment                                         -- 20/ examinations�e�[�u������A����ID��1�ł���f�[�^�̂����A�ł��Â����t�ł���examination_date�ŕ��ёւ�����ŁA2�Ԗڂ̃��R�[�h����4�̃��R�[�h���擾���Ă��������B
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

-- 21/ "��"�Ŏn�܂�diagnosis�������҂�I������SQL���������Ă��������B
select
  * 
from
  examinations e 
where
  e.diagnosis like '��%'; 

-- 22/ "����������"�Ƃ����P����܂�diagnosis�������҂�I������SQL���������Ă��������B
select
  * 
from
  examinations e 
where
  e.diagnosis like '%����������%'; 

-- 23/ "���Âɂ��Ď��z��\��悤�Ɏw��"�ŏI���patient_id�������҂�I������SQL���������Ă��������B
select
  * 
from
  examinations e 
where
  e.treatment like '%���Âɂ��Ď��z��\��悤�Ɏw��%'; 

-- 24/ patient_id��3�A5�A8�A10�̊��҂̑S�f�f�����擾����SQL�N�G�����쐬���Ă��������B
select
  * 
from
  examinations e 
where
  e.patient_id in (3, 5, 8); 

-- 25/ ����ID��2, 4, 6, 8�̂����ꂩ�ł���f�@���R�[�h���������Ă��������B�������A�f�@�Ȃ� '������' �ł�����̂Ɍ��肵�܂��B
select
  * 
from
  examinations e 
  inner join departments dpm 
    on e.department_id = dpm.department_id 
where
  e.patient_id in (2, 4, 6, 8) 
  and dpm.department_name = '������'; 

-- 26/ �f�@����2022�N3��15���܂���5��20���ł���A�f�@�Ȃ� '�O��' �܂��� '����' �̂����ꂩ�ł���f�@���R�[�h���������Ă��������B�������A����ID��4�ł�����̂͏��O���܂��B
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
      dpm.department_name in ('�O��', '����')
  ); 

-- 27/ ��������2022�N3������2022�N5���̊Ԃɂ��銳�҂̂����A�a�@�̊O���Őf�@���ꂽ���҂̌���ID�Ɛf�f���ʂ��擾����B
select
  e.examination_id, e.diagnosis 
from
  examinations e 
where
  e.examination_date >= '2022/03/01' 
  and e.examination_date < '2022/05/01'; 

-- 28/ ��������2022�N3������5���̊Ԃɂ��銳�҂ŁA�f�f���ʂɁu�ݒ�ᇁv�Ƃ��������񂪊܂܂�Ă��銳�҂̌���ID�A����ID�A��tID�A�f�f���ʂ��擾����B
select
  e.examination_id
  , e.patient_id
  , e.doctor_id
  , e.diagnosis 
from
  examinations e 
where
  e.diagnosis like '%�ݒ��%' 
  and e.examination_date >= '2022/03/01' 
  and e.examination_date < '2022/05/01'; 

-- 29/ ���Җ��A���ʁA�f�f�A���ÁA����ш�t�����܂ށA���ׂĂ̊��҂̏ڍׂƂ��̈�t�̏����擾����SQL�����쐬���Ă��������B
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

-- 30/ �e�f�ÉȂ̐f�f�̐����܂ށA�f�ÉȖ��Ɛf�f����\������SQL�����쐬���Ă��������B
select
  dpm.department_name
  , count(e.diagnosis) as diagnosis_count 
from
  examinations e 
  inner join departments dpm 
    on e.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 31/ ��t�̏��Ɛf�f�����������A�f�f���� "����������" �ł��銳�҂̎����Ɛf�f����\������N�G���B
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
  e.diagnosis = '����������'; 

-- 32/ ����̉�('�O��')�ɏ��������t�ƁA���̈�t���f�f�������҂̎����Ɛf�f����\������N�G���B
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
  dpm.department_name = '����'; 

-- 33/ ���҂��ƂɁA�ނ炪�Ō�Ɏ󂯂������̏��ƁA���̌������s������t�̏���\������B
select
  p.patient_name
  , d.doctor_name
  , max(e.examination_date) as �Ō�Ɏ󂯂����� 
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

-- 34/ �e���傲�ƂɁA���̕���œ�����t�̕��ϋ��^�ƁA���̕���ōs��ꂽ�����̐���\������B
--��  ����Ɉ�t�����Ȃ��ꍇ�́A���ϋ��^��NULL�l�Ƃ��ĕ\�����Ă��������B�܂��A����Ɍ������s���Ă��Ȃ��ꍇ�́A��������0�Ƃ��ĕ\�����Ă��������B
select
  dpm.department_name
  , avg(d.salary) as "���ϋ��^"
  , count(e.examination_id) as "�����̐�" 
from
  departments dpm 
  left join examinations e 
    on dpm.department_id = e.department_id 
  left join doctors d 
    on e.doctor_id = d.doctor_id 
group by
  dpm.department_id; 

-- 35/ departments�e�[�u����doctors�e�[�u����department_id�Ō������A�e�����̕��ϋ��^���擾����SQL�����쐬���Ă��������B
select
  dpm.department_name
  , round(avg(d.salary), 4) as ���ϋ��^ 
from
  departments dpm 
  left join doctors d 
    on dpm.department_id = d.department_id 
group by
  dpm.department_name; 

-- 36/ patients�e�[�u����examinations�e�[�u����patient_id�Ō������A�f�@���󂯂����҂̑����ƍŐV�̐f�@�����擾����SQL�����쐬���Ă��������B
select
  p.patient_name
  , count(e.examination_id) as �f�@���󂯂�����
  , max(e.examination_date) as �ŐV�̐f�@�� 
from
  patients p 
  left join examinations e 
    on e.patient_id = p.patient_id 
group by
  p.patient_id; 

-- 37/ ��t�̏����A�������镔���̏�񂪂���ꍇ�͂�����܂߂ĕ\������SQL�����쐬���Ă��������B
select
  * 
from
  doctors d 
  left join departments dpm 
    on d.department_id = dpm.department_id; 

-- 38/ �����̏����A���҂̏�񂪂���ꍇ�͂�����܂߂ĕ\������SQL�����쐬���Ă��������B
select
  * 
from
  examinations e 
  left join patients p 
    on e.patient_id = p.patient_id; 

-- 39/ patients�e�[�u����examinations�e�[�u����LEFT JOIN���A�e���҂��ł��ŋߍs���������̏����擾����N�G�����쐬���Ă��������B
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

-- 40/ doctors�e�[�u����departments�e�[�u����LEFT JOIN���A�e�Ȃ̕��ϋ��^�ƍŒዋ�^���擾����N�G�����쐬���Ă��������B
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

-- 41/ ��҂̖��O�A���҂̖��O�A�f�f�A���Ó��e�A����ѐf�@�����܂ރ��|�[�g���쐬���Ă��������B�������A��҂Ɗ��҂��Ƃ��ɑ��݂��A�f�f�Ǝ��Ó��e����łȂ��ꍇ�ɂ̂݁A���|�[�g�Ɋ܂߂Ă��������B���|�[�g�́A�f�@�����V�������̂���Â����̂̏��ɕ��בւ���K�v������܂��B
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

-- 42/ ���ҁipatients�j�ƈ�t�idoctors�j�̏����������āA�����idepartments�j���Ƃ̕��ϋ��^�isalary�j��\������N�G�����쐬���Ă��������B
--�������A�������idepartment_name�j�� '����' �̕����͏��O���Ă��������B
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
  not dpm.department_name = '����' 
group by
  dpm.department_id
  , dpm.department_name; 

-- 43/ ���ҁipatients�j�ƌ����iexaminations�j�̏����������āA���Җ��ipatient_name�j�ƌ������iexamination_date�j���Ƃ̈�t����\������N�G�����쐬���Ă��������B
--�������A���Җ��ƌ������̑g�ݍ��킹�����݂��Ȃ��ꍇ�́A0��\�����Ă��������B
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

-- 44/ ���҂ƈ�t�̏����ȂƂ��̉Ȃ̐����̏�����������SQL�����쐬���Ă��������B
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

-- 45/ ���҂̐��ʂƔN����A��t�̐��ʂ���������SQL�����쐬���Ă��������B
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

-- 46/ �S���҂̒��ŁA�f�f���ꂽ�a�C�̐����ł������g�b�v5�̊��҂��擾���邽�߂̃N�G�����쐬���Ă��������B
--�������A�f�f���Ȃ����҂͌��ʂɊ܂߂Ȃ��ł��������B
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

-- 47/ ��t���ƂɁA���̈�t���f�@�������҂̖��O�A���ʁA�f�@���A�f�f�A����ю��Â��擾���邽�߂̃N�G�����쐬���Ă��������B
--�������A�S�Ă̈�t�̏����擾����K�v������܂��B
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

-- 48/ ��t�̕��ϋ��^�����߂�
select
  avg(salary) as ���ϋ��^ 
from
  doctors; 

-- 49/ �������Ƃ̈�t�̕��ϋ��^�����߂�
select
  dpm.department_name
  , avg(salary) as ���ϋ��^ 
from
  departments dpm 
  inner join doctors d 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 50/ �S���҂̕��ϔN������߂�
select
  avg( 
    extract(year from age(current_date, p.date_of_birth))
  ) as ���ϔN�� 
from
  patients p; 

-- 51/ examinations�e�[�u���ɓo�^���ꂽ�A�e���҂̐f�@�񐔂����߂�SQL�����쐬���Ă��������B
select
  p.patient_name
  , count(p.patient_id) 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
group by
  p.patient_id; 

-- 52/ ���҂̐����J�E���g����SQL�����쐬���Ă��������B
select
  count(patient_id) 
from
  patients; 

-- 53/ �e�Ȃ̈�t�����J�E���g����SQL�����쐬���Ă��������B
select
  dpm.department_name
  , count(d.doctor_id) 
from
  departments dpm 
  inner join doctors d 
    on dpm.department_id = d.department_id 
group by
  dpm.department_name; 

-- 54/ �e���҂̍ł��Â����������擾����B
select
  p.patient_name
  , min(e.examination_date) 
from
  examinations e 
  inner join patients p 
    on e.patient_id = p.patient_id 
group by
  p.patient_id; 

-- 55/ �Œዋ��������t��������B
select
  min(d.salary) 
from
  doctors d; 

-- 56/ ��t�̍ō����^����������SQL�����쐬���Ă��������B
select
  max(d.salary) 
from
  doctors d; 

-- 57/ �e�f�ÉȂ̈�t�̍ō����^����������SQL�����쐬���Ă��������B
select
  dpm.department_name
  , max(d.salary) 
from
  doctors d 
  inner join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 58/ �e���҂̍ŐV�̐f�f����������SQL�����쐬���Ă��������B
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

-- 59/ �e����̈�t�̕��ϋ��^�Ƒ��x���z���v�Z����SQL�����쐬���Ă��������B
select
  dpm.department_name
  , avg(d.salary)
  , sum(d.salary) 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 60/�u���ȁv���������t�̋��^���z���v�Z����SQL�����쐬���Ă��������B
select
  dpm.department_name
  , sum(d.salary) 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
where
  dpm.department_name = '����' 
group by
  dpm.department_name; 

-- 61/ �e����̕��ϋ��^���擾����SQL�����쐬���Ă��������B
select
  dpm.department_name
  , avg(d.salary) 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 62/ �e���҂��󂯂��f�@�̐����擾����SQL�����쐬���Ă��������B
select
  e.patient_id
  , count(e.examination_id) 
from
  examinations e 
group by
  e.patient_id; 

-- 63/ �e�����̕��ϋ��^�ƍō����^���擾����N�G�����쐬���Ă��������B
select
  dpm.department_name
  , avg(d.salary) as ���ϋ��^
  , max(d.salary) as �ō����^ 
from
  doctors d join departments dpm 
    on d.department_id = dpm.department_id 
group by
  dpm.department_name; 

-- 64/ ���҂��Ƃ̍Ō�̌����̐f�f���擾����SQL�����쐬���Ă��������B
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

-- 65/ �e�f�ÉȂ̈�t�̊��Ґ��ƁA���̊��҂����̕��ϔN������߂�B
--�������A�e�f�ÉȂ̈�t��1���ȏ㏊�����Ă�����̂Ƃ���B
--�܂��A���ϔN��͏����_�ȉ�2���܂ŕ\��������̂Ƃ���B

select dpm.department_name, d.doctor_name, (select count(e1.patient_id) from examinations e1 where e1.doctor_id = e.doctor_id) as ���Ґ� from examinations e join doctors d on e.doctor_id = d.doctor_id join departments dpm on e.department_id = dpm.department_id;


-- 66/ ���҂��Ƃ̍ł��V�����������ʂ��擾����SQL�����쐬���Ă��������B
select p.patient_name, e.examination_date, e.diagnosis, e.treatment
from patients p
inner join examinations e on p.patient_id = e.patient_id
where (e.examination_date, p.patient_id) IN (
  select MAX(examination_date), patient_id
  from examinations
  group by patient_id
)
order by e.examination_date desc;

-- 67/ ���傲�Ƃɍł��������^������t�̏����擾����SQL�����쐬���Ă��������B
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

-- 68/ ���҂��ƂɁA�f�f���ꂽ�����̈ꗗ���܂ޏڍׂȈ�Ã��|�[�g�𐶐�����N�G�����쐬���Ă��������B
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

-- 69/ ���҂��Ƃ́A�ł��ŋ߂̐f�@���ʂ�\������N�G���B���҂��܂��f�@���󂯂Ă��Ȃ��ꍇ�́A�f�@����null�ƂȂ�悤�ɕ\������B
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

-- 70/ �e����̕��ϋ��^�ƁA���ϋ��^���ł���������̖��O�ƕ��ϋ��^��\������B
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

