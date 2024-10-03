
-- Create the INVOICE table with the specified columns
CREATE TABLE memory.default.INVOICE (
    supplier_id TINYINT,
    invoice_amount DECIMAL(8, 2),
    due_date DATE
);


-- Create the SUPPLIER table with the specified columns
CREATE TABLE memory.default.SUPPLIER (
    supplier_id TINYINT,
    name VARCHAR
);



-- from the finance/invoices_due
INSERT INTO INVOICE (supplier_id, invoice_amount, due_date) VALUES
(1, 6000.00, last_day_of_month(date_add('month', 3, CURRENT_DATE))),
(2, 2000.00, last_day_of_month(date_add('month', 2, CURRENT_DATE))),
(2, 1500.00, last_day_of_month(date_add('month', 3, CURRENT_DATE))),
(3, 500.00, last_day_of_month(date_add('month', 1, CURRENT_DATE))),
(4, 6000.00, last_day_of_month(date_add('month', 3, CURRENT_DATE))),
(5, 4000.00, last_day_of_month(date_add('month', 6, CURRENT_DATE)));


INSERT INTO SUPPLIER (supplier_id, name) VALUES
(1,  'Party Animals'),
(2,  'Catering Plus'),
(3,  'Dave''s Discos'), 
(4,  'Entertainment tonight'),
(5,  'Ice Ice Baby');