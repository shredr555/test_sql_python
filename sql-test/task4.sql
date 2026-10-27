SELECT clients.client_id, full_name
FROM clients
LEFT JOIN accounts ON clients.client_id = accounts.client_id
WHERE accounts.client_id IS NULL;