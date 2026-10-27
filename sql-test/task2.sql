SELECT currency, COUNT(account_id) AS account_count
FROM accounts
WHERE closed_at IS NULL
GROUP BY currency;