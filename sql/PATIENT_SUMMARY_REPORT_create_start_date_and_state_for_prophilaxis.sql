SET SQL_SAFE_UPDATES = 0;

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,comments,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'INH_Details'),obs_group_id,obs.date_created,obs.date_created,'-1',0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE value_coded = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'HOF_TARV_PROPHILAXIS_INH_Details'));

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,value_datetime,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Start_Date_Prophylaxis_INH'),obs_id,obs.date_created,obs.date_created,obs.date_created,0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE concept_id = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'INH_Details') AND comments ='-1');

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,value_coded,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'State_Prophylaxis_INH'),obs_id,obs.date_created,obs.date_created,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Inicio_Prophylaxis'),0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE concept_id = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'INH_Details') AND comments ='-1');



INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,comments,voided, uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'CTZ_Details'),obs_group_id,obs.date_created,obs.date_created,'-2',0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE value_coded = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'HOF_TARV_PROPHILAXIS_CTZ_Details'));

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,value_datetime,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Start_Date_Prophylaxis_CTZ'),obs_id,obs.date_created,obs.date_created,obs.date_created,0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE concept_id = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'CTZ_Details') AND comments ='-2');

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,value_coded,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'State_Prophylaxis_CTZ'),obs_id,obs.date_created,obs.date_created,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Inicio_Prophylaxis'),0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE concept_id = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'CTZ_Details') AND comments ='-2');

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,comments,voided, uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Fluconazol_Details'),obs_group_id,obs.date_created,obs.date_created,'-3',0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE value_coded = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'HOF_TARV_PROPHILAXIS_Fluconazol_Details'));

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,value_datetime,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Start_Date_Prophylaxis_Fluconazol'),obs_id,obs.date_created,obs.date_created,obs.date_created,0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE concept_id = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Fluconazol_Details') AND comments ='-3');

INSERT INTO obs (person_id,encounter_id,location_id,creator,concept_id,obs_group_id,date_created,obs_datetime,value_coded,voided,uuid)
SELECT obs.person_id,obs.encounter_id,obs.location_id,obs.creator,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'State_Prophylaxis_Fluconazol'),obs_id,obs.date_created,obs.date_created,(select concept_id as inh_details_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Inicio_Prophylaxis'),0,uuid()
FROM obs WHERE obs_id IN (SELECT obs_id FROM obs WHERE concept_id = (SELECT concept_id AS old_inh_id FROM concept_name WHERE locale = 'en' AND  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Fluconazol_Details') AND comments ='-3');

UPDATE obs SET value_coded = (select concept_id as new_inh_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'INH') 
WHERE value_coded = (select concept_id as inh_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'HOF_TARV_PROPHILAXIS_INH_Details');

UPDATE obs SET value_coded = (select concept_id as new_inh_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'CTZ') 
WHERE value_coded = (select concept_id as inh_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'HOF_TARV_PROPHILAXIS_CTZ_Details');

UPDATE obs SET value_coded = (select concept_id as new_inh_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Fluconazol') 
WHERE value_coded = (select concept_id as inh_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'HOF_TARV_PROPHILAXIS_Fluconazol_Details');

UPDATE obs SET comments = NULL 
WHERE  comments IN ('-1','-2','-3');





