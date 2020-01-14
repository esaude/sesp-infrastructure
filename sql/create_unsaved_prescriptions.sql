SET SQL_SAFE_UPDATES = 0;
INSERT INTO drug_order_relationship  (drug_order_id,category_id,treatment_line_id,date_created,creator)
SELECT dord.order_id,(select concept_id as cat_id from concept_name where locale = 'en' and  concept_name_type = 'FULLY_SPECIFIED' AND name = 'Antirretrovirals'),(select concept_id as cat_id from concept where uuid = 'f2355233-c552-4cd6-802f-0c7c75221f03'),ord.date_created,ord.creator
FROM drug_order dord JOIN orders ord ON dord.order_id = ord.order_id AND dord.order_id NOT IN (SELECT drug_order_id FROM drug_order_relationship WHERE date_created > date('2019-12-01')) AND date_created > date('2019-12-01') AND isnull(ord.date_stopped) AND  ISNULL(ord.previous_order_id);
