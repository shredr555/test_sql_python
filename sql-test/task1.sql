SELECT full_name 
FROM clients
WHERE city='Новосибирск' AND registered_at BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY registered_at;