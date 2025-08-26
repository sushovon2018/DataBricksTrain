-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Join Customer and Address
-- MAGIC Join customer data with address data to create a customer_address table which contains the address of each customer on the same record

-- COMMAND ----------

SELECT * FROM gizmobox.silver.customers;

-- COMMAND ----------

 SELECT * FROM gizmobox.silver.addresses;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS gizmobox.gold.customer_address
AS
SELECT c.customer_id,
       c.customer_name,
       c.email,
       c.date_of_birth,
       c.member_since,
       c.telephone,
       a.shipping_address_line_1,
       a.shipping_city,
       a.shipping_state,
       a.shipping_postcode,
       a.billing_address_line_1,
       a.billing_city,
       a.billing_state,
       a.billing_postcode
  FROM gizmobox.silver.customers c
  INNER JOIN gizmobox.silver.addresses a 
          ON c.customer_id = a.customer_id;

-- COMMAND ----------

SELECT * FROM gizmobox.gold.customer_address;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
