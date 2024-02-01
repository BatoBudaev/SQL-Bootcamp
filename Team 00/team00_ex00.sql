   CREATE TABLE nodes (point1 VARCHAR(1), point2 VARCHAR(1), cost INT);

   INSERT INTO nodes (point1, point2, cost)
   VALUES ('A', 'B', 10),
          ('B', 'A', 10),
          ('A', 'C', 15),
          ('C', 'A', 15),
          ('A', 'D', 20),
          ('D', 'A', 20),
          ('B', 'C', 35),
          ('C', 'B', 35),
          ('B', 'D', 25),
          ('D', 'B', 25),
          ('C', 'D', 30),
          ('D', 'C', 30);

   SELECT *
     FROM nodes;

     WITH AllRoutes AS (
             SELECT n2.cost + n3.cost + n4.cost + n5.cost AS total_cost,
                    '{' || n1.point1 || ',' || n2.point2 || ',' || n3.point2 || ',' || n4.point2 || ',' || n1.point1 || '}' AS tour
               FROM nodes n1
               JOIN nodes n2 ON n2.point1 = n1.point1
               JOIN nodes n3 ON n3.point1 = n2.point2
                AND n3.point2 NOT IN (n1.point1)
               JOIN nodes n4 ON n4.point1 = n3.point2
                AND n4.point2 NOT IN (n1.point1, n2.point2)
               JOIN nodes n5 ON n5.point1 = n4.point2
                AND n5.point2 = 'A'
              WHERE n1.point1 = 'A'
          )
   SELECT DISTINCT total_cost,
          tour
     FROM AllRoutes
    WHERE total_cost = (
             SELECT MIN(total_cost)
               FROM AllRoutes
          )
 ORDER BY 1,
          2;