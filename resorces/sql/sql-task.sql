--Вывести к каждому самолету класс обслуживания и количество мест этого класса
SELECT model -> 'ru', aircrafts_data.aircraft_code, fare_conditions, COUNT(seat_no)
FROM aircrafts_data, seats
WHERE seats.aircraft_code = aircrafts_data.aircraft_code
GROUP BY aircrafts_data.aircraft_code, model -> 'ru', fare_conditions
ORDER BY model;

--Найти 3 самых вместительных самолета (модель + кол-во мест)
SELECT model -> 'ru', COUNT(seat_no)
FROM aircrafts_data, seats
WHERE aircrafts_data.aircraft_code = seats.aircraft_code
GROUP BY model
ORDER BY count(seat_no) desc
LIMIT 3;

--Вывести код,модель самолета и места не эконом класса для самолета 'Аэробус A321-200' с сортировкой по местам
SELECT aircrafts_data.aircraft_code, model -> 'ru', seat_no
FROM aircrafts_data, seats
WHERE seats.fare_conditions NOT IN ('Economy') AND model -> 'ru' = '"Аэробус A321-200"'
GROUP BY aircrafts_data.aircraft_code, model -> 'ru', seat_no
ORDER BY seat_no;



