
-- manually insert the date of the migration
update visit set date_stopped = now() where patient_id in (select person_id from person_attribute where person_attribute_type_id = 999)
and date(date_created) = '';

-- close all first visits for migrated patients
update visit v set v.date_stopped = now() where v.patient_id in (select person_id from person_attribute where person_attribute_type_id = 999)
and v.visit_id 
in (select min(visit_id) from encounter where patient_id = v.patient_id);
