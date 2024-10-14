use ap;

START TRANSACTION; 

SAVEPOINT before_invoice; 


INSERT INTO invoices
VALUES (1000, 34, 'ZXA-080', '2018-01-18', 14092.59, 0, 0, 3, '2018-04-18', NULL);
SAVEPOINT before_line_item1; 
INSERT INTO invoice_line_items
VALUES (1000, 1, 160, 4447.23, 'HW upgrade');
SAVEPOINT before_line_item2; INSERT INTO invoice_line_items
VALUES (1000, 2, 167, 9645.36,'OS upgrade'); 

ROLLBACK TO SAVEPOINT before_line_item2; 
ROLLBACK TO SAVEPOINT before_line_item1;
ROLLBACK TO SAVEPOINT before_invoice; 
COMMIT;

SELECT *
FROM invoices
WHERE invoice_id = 1000;

SELECT *
FROM invoice_line_items 
WHERE invoice_id = 1000;