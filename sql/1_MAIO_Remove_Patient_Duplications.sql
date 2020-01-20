/* NOTE THA THIS SCRIPT SHOULD ONLY BE EXECUTED AT 1o DE MAIO HEALTH FACILITY

-- Remove duplicate identifier for patient id 209499*/
delete from patient_identifier where identifier = '12/1450';

-- Remove multiple person address that are causing patient duplication!
delete from person_address where person_address_id in (2161,2162,2163,2164);