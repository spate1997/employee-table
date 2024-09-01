
-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    hire_date DATE NOT NULL
);

-- Create the attendance table
CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    attendance_date DATE NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Present', 'Absent', 'Leave')),
    check_in_time TIME,
    check_out_time TIME
);

-- Create the leaves table
CREATE TABLE leaves (
    leave_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    leave_start_date DATE NOT NULL,
    leave_end_date DATE NOT NULL,
    leave_reason VARCHAR(100)
);

-- Create the work_hours table
CREATE TABLE work_hours (
    hours_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    work_date DATE NOT NULL,
    hours_worked DECIMAL(4,2) CHECK (hours_worked >= 0),
    overtime_hours DECIMAL(4,2) DEFAULT 0
);

-- Insert employees data
INSERT INTO employees (first_name, last_name, department, hire_date)
VALUES
('John', 'Doe', 'Sales', '2022-03-15'),
('Jane', 'Smith', 'HR', '2021-08-22'),
('Alice', 'Johnson', 'IT', '2020-12-01');

-- Insert attendance data
INSERT INTO attendance (employee_id, attendance_date, status, check_in_time, check_out_time)
VALUES
(1, '2023-08-20', 'Present', '09:00', '17:00'),
(2, '2023-08-20', 'Present', '08:45', '17:15'),
(3, '2023-08-20', 'Leave', NULL, NULL);

-- Insert leave data
INSERT INTO leaves (employee_id, leave_start_date, leave_end_date, leave_reason)
VALUES
(3, '2023-08-18', '2023-08-21', 'Medical Leave');

-- Insert work hours data
INSERT INTO work_hours (employee_id, work_date, hours_worked, overtime_hours)
VALUES
(1, '2023-08-20', 8.00, 0.00),
(2, '2023-08-20', 8.50, 0.50);

