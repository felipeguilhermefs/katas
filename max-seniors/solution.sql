WITH budget AS (
  -- Define the budget in a single place, it should be paramaterized
  SELECT 50000 AS budget
)

, ranking AS (
  SELECT
    position,
    SUM(salary) OVER salaries AS price,
    ROW_NUMBER() OVER salaries AS quantity
  FROM candidates
    WINDOW salaries AS (
      PARTITION BY position 
      ORDER BY salary
    )
)

, seniors AS (

  -- Ensures it is never empty AND we can compare with 0 records
  SELECT 0 AS quantity, 0 AS price

  UNION ALL 

  SELECT quantity, price
  FROM ranking, budget b
  WHERE position = 'senior' AND price <= b.budget
  ORDER BY price DESC
  LIMIT 1
)

, juniors AS (

  -- Ensures it is never empty AND we can compare with 0 records
  SELECT 0 AS quantity, 0 AS price
  
  UNION ALL

  SELECT quantity, price
  FROM ranking, budget b
  WHERE position = 'junior' AND price <= b.budget
  ORDER BY price DESC
)

SELECT
  j.quantity AS juniors,
  s.quantity AS seniors
FROM seniors s, juniors j, budget b
WHERE j.price + s.price <= b.budget
ORDER BY seniors DESC, juniors DESC
LIMIT 1;
