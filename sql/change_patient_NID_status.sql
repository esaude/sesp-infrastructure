-- FIX NID
-- select patient_id from patient_identifier where identifier = '0110010901/01/2020/00116';

update patient_identifier set identifier = '0110011701/01/2016/00188' 
where patient_id = (select patient_id from patient_identifier where identifier = '0110010901/01/2020/00116') and identifier_type = 3;

-- FIX STATUS_STATE
-- select * from patient_status_state;

update patient_status_state set patient_state = 'ACTIVE' 
where patient_id = (select patient_id from patient_identifier where identifier = '0110011701/01/2016/00188');


-- FIX STATUS ATTRIBUTE TYPE
/*select person_attribute_type_id from person_attribute_type where name = 'TYPE_OF_REGISTRATION';
select * from concept_name where concept_id = '7980'; 
select * from concept_answer where concept_id = '7982';

select * from person_attribute 
where person_attribute_type_id = (select person_attribute_type_id from person_attribute_type where name = 'TYPE_OF_REGISTRATION')
and person_id = (select patient_id from patient_identifier where identifier = '0110011701/01/2016/00188');
*/ 

update person_attribute set value = '7981' 
where person_attribute_type_id = (select person_attribute_type_id from person_attribute_type where name = 'TYPE_OF_REGISTRATION')
and person_id = (select patient_id from patient_identifier where identifier = '0110011701/01/2016/00188');







