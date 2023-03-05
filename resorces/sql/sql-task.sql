--Вывести к каждому самолету класс обслуживания и количество мест этого класса
SELECT model -> 'ru', aircrafts_data.aircraft_code, fare_conditions, COUNT(seat_no)
FROM aircrafts_data, seats
WHERE seats.aircraft_code = aircrafts_data.aircraft_code
GROUP BY aircrafts_data.aircraft_code, model -> 'ru', fare_conditions
ORDER BY model

