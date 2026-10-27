SELECT
    months, client_id, client_name, amount_sum
FROM (
    SELECT
        date_trunc('month', transactions.tx_date) as months,
        clients.client_id as client_id,
        clients.full_name as client_name,
        SUM(transactions.amount) as amount_sum,
        ROW_NUMBER() OVER (PARTITION BY date_trunc('month', transactions.tx_date) ORDER BY SUM(transactions.amount) DESC) as rn
    FROM clients
    INNER JOIN accounts ON clients.client_id = accounts.client_id
    INNER JOIN transactions ON accounts.account_id = transactions.account_id
    WHERE tx_type = 'out'
    GROUP BY clients.client_id, months
)
WHERE rn <= 3;