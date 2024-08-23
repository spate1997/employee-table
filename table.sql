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

