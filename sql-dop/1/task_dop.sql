CREATE TABLE nodes (
    city1 VARCHAR NOT NULL,
    city2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL,
    PRIMARY KEY (city1, city2)
);

INSERT INTO nodes (city1, city2, cost)
VALUES
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('c', 'd', 30),
    ('d', 'c', 30);

CREATE VIEW v_tsp AS
WITH RECURSIVE tsp AS (
    SELECT 
        city1 AS start_point, 
        city2 AS last_point, 
        ARRAY[city1, city2] AS tour,
        cost AS total_cost, 
        2 AS level
    FROM nodes
    WHERE city1 = 'a'

    UNION ALL

    SELECT 
        tsp.start_point, 
        nodes.city2,
        tsp.tour || nodes.city2,
        tsp.total_cost + nodes.cost, 
        tsp.level + 1
    FROM tsp
    JOIN nodes ON nodes.city1 = tsp.last_point
    WHERE NOT nodes.city2 = ANY(tsp.tour)
        AND tsp.level < 4
)
SELECT * FROM tsp;

CREATE VIEW v_tours AS
SELECT
    v_tsp.total_cost + nodes.cost AS total_cost, 
    v_tsp.tour || '{a}' AS tour
FROM v_tsp
JOIN nodes ON v_tsp.last_point = nodes.city1 AND nodes.city2 = 'a'
WHERE v_tsp.level = 4;


CREATE VIEW v_min_cost AS
SELECT MIN(total_cost) AS min_total_cost
FROM v_tours;

SELECT total_cost, tour
FROM v_tours
JOIN v_min_cost ON v_tours.total_cost = v_min_cost.min_total_cost
ORDER BY total_cost, tour;