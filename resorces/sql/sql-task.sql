/*--Вывести к каждому самолету класс обслуживания и количество мест этого класса
SELECT model -> 'ru', aircrafts_data.aircraft_code, fare_conditions, COUNT(seat_no)
FROM aircrafts_data, seats
WHERE seats.aircraft_code = aircrafts_data.aircraft_code
GROUP BY aircrafts_data.aircraft_code, model -> 'ru', fare_conditions
ORDER BY model*/

--Найти 3 самых вместительных самолета (модель + кол-во мест)
SELECT model -> 'ru', COUNT(seat_no)
FROM aircrafts_data, seats
WHERE aircrafts_data.aircraft_code = seats.aircraft_code
GROUP BY model
ORDER BY count(seat_no) desc
LIMIT 3



