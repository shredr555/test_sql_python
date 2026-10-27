SELECT account_id, tx_date, amount, COUNT(*)
FROM transactions
GROUP BY account_id, tx_date, amount
HAVING COUNT(*) > 1;