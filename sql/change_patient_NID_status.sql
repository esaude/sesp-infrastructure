-- FIX NID

-- find patient id
select patient_id from patient_identifier where identifier = '0110010901/01/2020/00116';

-- use patient id to update nid
update patient_identifier set identifier = '0110011701/01/2016/00188' 
where patient_id = <valor de patient id aqui> and identifier_type = 3;


-- FIX STATUS_STATE
-- find status state
select * from patient_status_state where patient_id = <valor de patient id aqui>;

-- update status state
update patient_status_state set patient_state = 'ACTIVE' 
where patient_id = <valor de patient id aqui>;


-- FIX STATUS ATTRIBUTE TYPE
/*select person_attribute_type_id from person_attribute_type where name = 'TYPE_OF_REGISTRATION';
select concept_id from concept_name where name = 'TRANSFERRED_PATIENT'*/

-- find attribute type concept
select * from person_attribute 
where person_attribute_type_id = (select person_attribute_type_id from person_attribute_type where name = 'TYPE_OF_REGISTRATION')
and person_id = (select patient_id from patient_identifier where identifier = '0110011701/01/2016/00188');

-- update status
update person_attribute set value = (select concept_id from concept_name where name = 'TRANSFERRED_PATIENT')
where person_attribute_type_id = (select person_attribute_type_id from person_attribute_type where name = 'TYPE_OF_REGISTRATION')
and person_id = <valor de patient id aqui>;







