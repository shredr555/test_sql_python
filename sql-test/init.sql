CREATE TABLE clients (
  client_id BIGINT PRIMARY KEY,
  full_name VARCHAR(100),
  city VARCHAR(100),
  registered_at DATE NOT NULL
);

CREATE TABLE accounts (
  account_id BIGINT PRIMARY KEY,
  client_id BIGINT REFERENCES clients(client_id) NOT NULL,
  currency VARCHAR(3) NOT NULL,
  opened_at DATE NOT NULL,
  closed_at DATE CONSTRAINT chk_closed_at CHECK (closed_at >= opened_at)
);

CREATE TABLE transactions (
  tx_id BIGINT PRIMARY KEY,
  account_id BIGINT REFERENCES accounts(account_id) NOT NULL,
  tx_date TIMESTAMP NOT NULL,
  amount NUMERIC NOT NULL CONSTRAINT chk_amount CHECK (amount > 0),
  tx_type VARCHAR(3) NOT NULL CONSTRAINT chk_tx_type CHECK (tx_type IN ('in', 'out'))
);
