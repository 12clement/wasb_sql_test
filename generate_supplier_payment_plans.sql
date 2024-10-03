

-- Report on suppliers with their payment details
CREATE TABLE InvoiceDetails
AS
    SELECT
        s.supplier_id,
        s.name AS supplier_name,
        i.invoice_amount,
        i.due_date,
        -- Calculate the total balance outstanding for the supplier
        SUM(i.invoice_amount) OVER (PARTITION BY s.supplier_id) AS total_balance_outstanding,
        -- Calculate the number of months until the due date
        date_diff('month', last_day_of_month(CURRENT_DATE), i.due_date) + 1 AS months_until_due -- +1 to include current month
    FROM
        SUPPLIER s
    JOIN
        INVOICE i ON s.supplier_id = i.supplier_id;
		
		
		
CREATE TABLE PaymentSchedule 
AS
    SELECT
        supplier_id,
        supplier_name,
        due_date,
        invoice_amount,
        total_balance_outstanding,
        months_until_due,
        -- Calculate the uniform monthly payment for each invoice
        CASE
            WHEN months_until_due > 0 THEN round(invoice_amount / months_until_due, 2)
            ELSE invoice_amount -- If due immediately, pay the full amount
        END AS monthly_payment,
        -- Payment date is always the last day of the current month
        last_day_of_month(CURRENT_DATE) AS payment_date
    FROM
        InvoiceDetails;
		
CREATE TABLE  supplier_payment_plans
AS
SELECT
    supplier_id,
    supplier_name,
    -- Sum of all appropriate monthly payments to fully pay the supplier before the due dates
    SUM(monthly_payment) AS payment_amount,
    MAX(total_balance_outstanding) AS balance_outstanding,  -- Total outstanding across all invoices
    payment_date
FROM
    PaymentSchedule
GROUP BY
    supplier_id, supplier_name, payment_date
ORDER BY
    supplier_id;






