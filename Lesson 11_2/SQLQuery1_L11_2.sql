2. 

5 Вокзал
Маршруты_dim (id маршрута, пункт отправления,пункт прибытия, цена билета)
Водители_dim (id водителя, имя, фамилия)
Пассажиры_dim (id пассажира, имя, фамилия)
Вокзал_dim (id вокзала, адрес, телефон)
Автобусы_dim (id автобуса, марка, количество мест, год выпуска)
Кассиры_dim (id кассира,id вокзала, имя, фамилия)
Поездки_dim (id поездки, id маршрута, id автобуса, id водителя, дата отправления, дата прибытия)
Продажа билетов_fact (id чека, id поездки, id кассира, id пассажира, количество билетов, общая стоимость, дата покупки)

-- create
CREATE TABLE routes (
  route_id INTEGER PRIMARY KEY,
  departure_place TEXT NOT NULL,
  arrival_place TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE drivers (
  driver_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  surname TEXT NOT NULL
);

CREATE TABLE passengers (
  passenger_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  surname TEXT NOT NULL
);

CREATE TABLE stations (
  station_id INTEGER PRIMARY KEY,
  address TEXT NOT NULL,
  phone TEXT NOT NULL
);

CREATE TABLE buses (
  bus_id INTEGER PRIMARY KEY,
  numberplate TEXT NOT NULL,
  brand TEXT NOT NULL,
  seats_amount INTEGER NOT NULL,
  issue_date INTEGER NOT NULL
);

CREATE TABLE cashiers (
  cashier_id INTEGER PRIMARY KEY,
  station_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  surname TEXT NOT NULL,
  FOREIGN KEY (station_id)
    REFERENCES stations (station_id)
);

CREATE TABLE trips (
  trip_id INTEGER PRIMARY KEY,
  route_id INTEGER NOT NULL,
  FOREIGN KEY (route_id)
    REFERENCES routes (route_id),
  bus_id INTEGER NOT NULL,
  FOREIGN KEY (bus_id)
    REFERENCES buses (bus_id),
  driver_id INTEGER NOT NULL,
  FOREIGN KEY (driver_id)
    REFERENCES drivers (driver_id),
  departure_date DATETIME NOT NULL,
  arrival_date DATETIME NOT NULL
);

CREATE TABLE cheques (
  cheque_id INTEGER PRIMARY KEY,
  trip_id INTEGER NOT NULL,
  FOREIGN KEY (trip_id)
    REFERENCES trips (trip_id),
  cashier_id INTEGER NOT NULL,
  FOREIGN KEY (cashier_id)
    REFERENCES cashiers (cashier_id),
  passenger_id INTEGER NOT NULL,
  FOREIGN KEY (passenger_id)
    REFERENCES passengers (passenger_id),
  seats_amount INTEGER NOT NULL,
  cost DECIMAL(10,2) NOT NULL,
  purchase_date DATETIME NOT NULL
);

-- insert
INSERT INTO routes VALUES (1, 'Минск', 'Гродно', 25.00);
INSERT INTO routes VALUES (2, 'Минск', 'Витебск', 26.15);
INSERT INTO routes VALUES (3, 'Минск', 'Брест', 29.26);

INSERT INTO drivers VALUES (1, 'Иван', 'Иванов');
INSERT INTO drivers VALUES (2, 'Петр', 'Петров');
INSERT INTO drivers VALUES (3, 'Валерий', 'Сидоров');

INSERT INTO passengers VALUES (1, 'Поляков', 'Арсений');
INSERT INTO passengers VALUES (2, 'Попов', 'Степан');
INSERT INTO passengers VALUES (3, 'Маслова', 'Мария');
INSERT INTO passengers VALUES (4, 'Комарова', 'Виктория');
INSERT INTO passengers VALUES (5, 'Лебедев', 'Максим');

INSERT INTO stations VALUES (1, 'г. Минск', '80171234567');

INSERT INTO buses VALUES (1, '2368 AM-7', 'МАЗ', 30, 2015);
INSERT INTO buses VALUES (2, '1602 BO-7', 'МАЗ', 45, 2007);
INSERT INTO buses VALUES (3, '4710 KX-7', 'МАЗ', 52, 2019);

INSERT INTO cashiers VALUES (1, 1, 'Никулина', 'Екатерина');
INSERT INTO cashiers VALUES (2, 1, 'Семенов', 'Георгий');

INSERT INTO trips VALUES (1, 2, 3, 1, '2022-12-27 20:30:00', '2022-12-27 22:55:00');
INSERT INTO trips VALUES (2, 1, 2, 3, '2023-07-16 12:45:00', '2023-07-16 15:30:00');
INSERT INTO trips VALUES (3, 1, 1, 1, '2024-02-28 08:00:00', '2024-02-28 10:30:00');
INSERT INTO trips VALUES (4, 2, 2, 2, '2024-03-03 11:00:00', '2024-03-03 14:00:00');
INSERT INTO trips VALUES (5, 3, 3, 3, '2024-03-07 14:00:00', '2024-03-07 16:30:00');
INSERT INTO trips VALUES (6, 2, 2, 2, '2024-03-19 18:00:00', '2024-03-19 20:20:00');

INSERT INTO cheques VALUES (1, 1, 1, 1, 2, 35.00, '2022-12-25 14:31:15');
INSERT INTO cheques VALUES (2, 2, 2, 2, 1, 18.00, '2023-07-11 19:48:27');
INSERT INTO cheques VALUES (3, 2, 1, 3, 3, 50.28, '2023-07-12 08:55:02');
INSERT INTO cheques VALUES (4, 3, 2, 1, 2, 50.00, '2024-02-23 17:13:19');
INSERT INTO cheques VALUES (5, 4, 2, 4, 3, 78.45, '2024-02-27 18:07:29');
INSERT INTO cheques VALUES (6, 5, 2, 5, 4, 117.04, '2024-02-29 10:25:20');
INSERT INTO cheques VALUES (7, 5, 1, 4, 5, 146.30, '2024-03-05 09:15:57');
INSERT INTO cheques VALUES (8, 6, 2, 5, 3, 78.45, '2024-03-16 17:27:44');


--Необходимо узнать по каким маршрутам, отправляющимся в марте, остались свободные места и сколько этих мест.
SELECT rt.route_id, SUM(s2.free_seats) free_seats
FROM
  (SELECT s1.trip_id, s1.all_seats -ISNULL (SUM(ch.seats_amount), 0) free_seats
  FROM  
    (SELECT tr.trip_id, bs.seats_amount all_seats
    FROM trips tr
    LEFT JOIN buses bs ON tr.bus_id = bs.bus_id
    WHERE tr.departure_date >= '2024-03-01 00:00:00'
      AND tr.departure_date < '2024-04-01 00:00:00') s1
    LEFT JOIN cheques ch ON s1.trip_id = ch.trip_id
  GROUP BY s1.trip_id, s1.all_seats) s2
  LEFT JOIN trips tr ON s2.trip_id = tr.trip_id
  LEFT JOIN routes rt ON tr.route_id = rt.route_id
GROUP BY rt.route_id;




--Необходимо узнать выручку по каждому маршруту за каждый год суммарно. Результаты вывести в виде транспонированной таблицы.
SELECT route_id, [2022], [2023], [2024]
from
(SELECT tr.route_id, YEAR(tr.departure_date) year, SUM(ch.cost) total_cost
 FROM cheques ch
LEFT JOIN trips tr on ch.trip_id = tr.trip_id
GROUP BY tr.route_id, YEAR(tr.departure_date)
      HAVING SUM(ch.cost) > 0) p
PIVOT
(
SUM(total_cost)
FOR year IN
 ([2022], [2023], [2024])
) as pvt
ORDER BY pvt.route_id;



