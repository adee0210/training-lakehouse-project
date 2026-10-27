CREATE SCHEMA IF NOT EXISTS business;

CREATE TABLE IF NOT EXISTS business.customer (
    customer_id BIGINT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_type VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.loan_arrangement (
    arrangement_id BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES business.customer(customer_id),
    product_code VARCHAR(50),
    currency_code VARCHAR(10),
    principal_amount NUMERIC(18, 2),
    start_date DATE,
    maturity_date DATE,
    status VARCHAR(30),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.arrangement_balance (
    arrangement_id BIGINT NOT NULL REFERENCES business.loan_arrangement(arrangement_id),
    balance_date DATE NOT NULL,
    outstanding_principal NUMERIC(18, 2),
    outstanding_interest NUMERIC(18, 2),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (arrangement_id, balance_date)
);
