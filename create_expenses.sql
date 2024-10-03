-- Create the EXPENSE table with the specified columns
-- from finance/receipts_from_last_night
CREATE TABLE memory.default.EXPENSE (
    employee_id TINYINT,
    unit_price DECIMAL(8, 2),
    quantity TINYINT
);

Steps:
Map Employee Names to Employee IDs: We need to map Alex Jacobson to employee_id = 3 based on the EMPLOYEE table.
Extract Unit Price and Quantity: From the text, the unit price is 6.50 and the quantity is 14

-- Insert data from drinkies.txt into the EXPENSE table
INSERT INTO EXPENSE (employee_id, unit_price, quantity) VALUES
(3, 6.50, 14),
(3, 11.00, 20),
(3, 22.00, 18),
(3, 13.00, 75),
(9, 300.00, 1),
(4, 40.00, 9),
(2, 17.50, 4);

