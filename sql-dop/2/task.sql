with last_currency_rates as (
    select distinct on (id)
        id,
        name,
        rate_to_usd
    from currency
    order by id, updated desc
)

select
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    b.type as type,
    sum(b.money) as volume,
    coalesce(c.name, 'not defined') as currency_name,
    coalesce(c.rate_to_usd, 1) as last_rate_to_usd,
    (sum(b.money) * coalesce(c.rate_to_usd, 1))::integer as total_volume_in_usd
from balance b
left join "user" u on b.user_id = u.id
left join last_currency_rates c on b.currency_id = c.id
group by u.name, u.lastname, b.type, c.name, c.rate_to_usd
order by name desc, lastname, type;