--Вывести к каждому самолету класс обслуживания и количество мест этого класса
SELECT model -> 'ru', aircrafts_data.aircraft_code, fare_conditions, COUNT(seat_no)
FROM aircrafts_data,
     seats
WHERE seats.aircraft_code = aircrafts_data.aircraft_code
GROUP BY aircrafts_data.aircraft_code, model, fare_conditions
ORDER BY model;

--Найти 3 самых вместительных самолета (модель + кол-во мест)
SELECT model -> 'ru', COUNT(seat_no)
FROM aircrafts_data,
     seats
WHERE aircrafts_data.aircraft_code = seats.aircraft_code
GROUP BY model
ORDER BY COUNT(seat_no) desc
LIMIT 3;

--Вывести код,модель самолета и места не эконом класса для самолета 'Аэробус A321-200' с сортировкой по местам
SELECT aircrafts_data.aircraft_code, model -> 'ru', seat_no
FROM aircrafts_data,
     seats
WHERE seats.fare_conditions NOT IN ('Economy')
  AND model -> 'ru' = '"Аэробус A321-200"'
GROUP BY aircrafts_data.aircraft_code, model, seat_no
ORDER BY seat_no;

--Вывести города в которых больше 1 аэропорта ( код аэропорта, аэропорт, город)
SELECT airports_data.airport_code, airports_data.airport_name -> 'en', airports_data.city -> 'ru'
FROM airports_data
WHERE
GROUP BY airports_data.city, airports_data.airport_name, airports_data.airport_code
HAVING COUNT(airports_data.city) > 1;


--Найти ближайший вылетающий рейс из Екатеринбурга в Москву, на который еще не завершилась регистрация
SELECT scheduled_departure, flight_no, flight_id
FROM flights
WHERE departure_airport IN (SELECT airport_code
                            FROM airports_data
                            WHERE city -> 'en' = '"Yekaterinburg"')
  AND arrival_airport IN (SELECT airport_code
                          FROM airports_data
                          WHERE city -> 'en' = '"Moscow"')
  AND status IN ('Scheduled', 'On Time', 'Delayed')
group by scheduled_departure, flight_no, flight_id
ORDER BY scheduled_departure
LIMIT 1;

--Вывести самый дешевый и дорогой билет и стоимость ( в одном результирующем ответе)

SELECT * FROM (SELECT *
               FROM ticket_flights
               WHERE amount IN (SELECT min(amount)
                                FROM ticket_flights)
               LIMIT 1) AS foo
UNION
SELECT * FROM (SELECT *
               FROM ticket_flights
               WHERE amount IN (SELECT max(amount)
                                FROM ticket_flights)
               LIMIT 1) AS foo1

-- Написать DDL таблицы Customers , должны быть поля id , firstName, LastName, email , phone. Добавить ограничения на поля ( constraints) .








