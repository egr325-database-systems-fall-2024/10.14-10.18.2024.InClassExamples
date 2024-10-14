use ap;

SELECT @@GLOBAL.transaction_isolation, @@GLOBAL.transaction_read_only;
SELECT @@SESSION.transaction_isolation, @@SESSION.transaction_read_only;

-- Transaction B we use a second connection to execute these statements!
-- Otherwise, they won't work as described.

START TRANSACTION;
SELECT invoice_id, credit_total FROM invoices WHERE invoice_id = 6; 
UPDATE invoices SET credit_total = credit_total + 200 WHERE invoice_id = 6;
COMMIT;

SELECT invoice_id, credit_total FROM invoices WHERE invoice_id = 6;