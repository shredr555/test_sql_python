SELECT full_name, SUM(amount)
FROM clients 
INNER JOIN accounts ON clients.client_id = accounts.client_id
INNER JOIN transactions ON accounts.account_id = transactions.account_id
WHERE tx_type = 'in'
GROUP BY clients.client_id;