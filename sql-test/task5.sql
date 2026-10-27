SELECT full_name, COUNT(account_id)
FROM clients
INNER JOIN accounts ON clients.client_id = accounts.client_id
GROUP BY clients.client_id
HAVING COUNT(account_id) > 2;