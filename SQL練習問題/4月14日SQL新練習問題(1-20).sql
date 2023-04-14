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

treatment

-- 20/ examinations�e�[�u������A����ID��1�ł���f�[�^�̂����A�ł��Â����t�ł���examination_date�ŕ��ёւ�����ŁA2�Ԗڂ̃��R�[�h����4�̃��R�[�h���擾���Ă��������B
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

