use ap;

SELECT @@GLOBAL.transaction_isolation, @@GLOBAL.transaction_read_only;
-- SELECT @@SESSION.transaction_isolation, @@SESSION.transaction_read_only;

-- Execute each statement one at a time. 
-- Alternate with Transaction B as described.

START TRANSACTION; 

UPDATE invoices SET credit_total = credit_total + 100 WHERE invoice_id = 6;

-- the SELECT statement in Transaction B won't show the updated data 
-- the UPDATE statement in Transaction B will wait for transaction A to finish COMMIT;
-- the SELECT statement in Transaction B will display the updated data
-- the UPDATE statement in Transaction B will execute immediately

COMMIT;

SELECT * FROM invoices WHERE invoice_id = 6;