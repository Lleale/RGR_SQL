-- Создание таблиц и связей
CREATE TABLE `Students` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) DEFAULT 'NULL',
	`date_of_birth` DATE NOT NULL,
	`address` varchar(200) DEFAULT 'NULL',
	`email` varchar(100) DEFAULT 'NULL',
	`group_id` INT NOT NULL,
	`budget` bool NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Groups` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(50) DEFAULT 'NULL',
	`direction_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Phone_numbers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_id` INT NOT NULL,
	`number` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Directions` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(200) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Teachers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Subjects` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Marks` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`student_id` INT NOT NULL,
	`std_id` INT NOT NULL,
	`mark` tinyint,
	PRIMARY KEY (`id`)
);

CREATE TABLE `subs_teachs_dirs` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`subject_id` INT NOT NULL,
	`teacher_id` INT NOT NULL,
	`direction_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `timetable` (
	`id` INT AUTO_INCREMENT,
	`start_time` TIME NOT NULL,
	`end_time` TIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `lessons_schedule` (
	`id` INT AUTO_INCREMENT,
	`subject_id` INT NOT NULL,
	`time_id` INT NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `attendance` (
	`id` INT AUTO_INCREMENT,
	`scedule_id` INT NOT NULL,
	`student_id` INT NOT NULL,
	`presense` bool NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk0` FOREIGN KEY (`group_id`) REFERENCES `Groups`(`id`);

ALTER TABLE `Groups` ADD CONSTRAINT `Groups_fk0` FOREIGN KEY (`direction_id`) REFERENCES `Directions`(`id`);

ALTER TABLE `Phone_numbers` ADD CONSTRAINT `Phone_numbers_fk0` FOREIGN KEY (`student_id`) REFERENCES `Students`(`id`);

ALTER TABLE `Marks` ADD CONSTRAINT `Marks_fk0` FOREIGN KEY (`student_id`) REFERENCES `Students`(`id`);

ALTER TABLE `Marks` ADD CONSTRAINT `Marks_fk1` FOREIGN KEY (`std_id`) REFERENCES `subs_teachs_dirs`(`id`);

ALTER TABLE `subs_teachs_dirs` ADD CONSTRAINT `subs_teachs_dirs_fk0` FOREIGN KEY (`subject_id`) REFERENCES `Subjects`(`id`);

ALTER TABLE `subs_teachs_dirs` ADD CONSTRAINT `subs_teachs_dirs_fk1` FOREIGN KEY (`teacher_id`) REFERENCES `Teachers`(`id`);

ALTER TABLE `subs_teachs_dirs` ADD CONSTRAINT `subs_teachs_dirs_fk2` FOREIGN KEY (`direction_id`) REFERENCES `Directions`(`id`);

ALTER TABLE `lessons_schedule` ADD CONSTRAINT `lessons_schedule_fk0` FOREIGN KEY (`subject_id`) REFERENCES `subs_teachs_dirs`(`id`);

ALTER TABLE `lessons_schedule` ADD CONSTRAINT `lessons_schedule_fk1` FOREIGN KEY (`time_id`) REFERENCES `timetable`(`id`);

ALTER TABLE `attendance` ADD CONSTRAINT `attendance_fk0` FOREIGN KEY (`scedule_id`) REFERENCES `lessons_schedule`(`id`);

ALTER TABLE `attendance` ADD CONSTRAINT `attendance_fk1` FOREIGN KEY (`student_id`) REFERENCES `Students`(`id`);


-- Ввод данных в таблицы
insert INTO Directions (name)
VALUES ('09.03.03 Прикладная информатика'), ('38.03.01 Экономика'), ('40.03.01 Юриспруденция');

insert INTO Groups (name, direction_id)
VALUES ('ФИ101', 1), ('ПИ101', 1), ('ИС101', 1), ('Э203', 2), ('Э102', 2), ('Э111', 2), ('Ю102', 3), ('ЮЗ402', 3), ('Ю203Ж', 3);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Иванов Иван Алексеевич', 20021123, 'г.Новосибирск ул.Добролюбова д.34', 'qwe@yandex.ru', 1, False),
('Очаков Николай Александрович', 20020630, 'г.Новосибирск ул.Красный проспект д.6', 'fgvbgf@mail.ru', 1, False),
('Суворов Дмитрий Иванович', 20020512, 'г.Новкузнецк ул.Зеленая д.342', 'qgbfgbfwe@mail.ru', 1, True),
('Конфеткин Иван Александрович', 20020318, 'г.Колывань ул.Кирова д.76', 'qwbfgbe@yandex.ru', 1, False),
('Павлова Анна Ивановна', 20030501, 'г.Новосибирск ул.Пушкина д.23', 'qwbfgbe@mail.ru', 1, True),
('Камчаткин Дмитрий Александрович', 20010318, 'г.Новосибирск ул.Добролюбова д.145', 'gbf@gmail.com', 1, True),
('Куприн Юлия Сергеевна', 20020227, 'г.Томск ул.Бориса Богаткова д.34', 'qwbfgbfe@mail.ru', 1, True);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Коалов Иван Иванович', 20021101, 'г.Новосибирск ул.Чурчхелы д.35', 'qbwe@mail.ru', 2, True),
('Какич Дмитрий Иванович', 20021102, 'г.Томск ул.Церковная д.42', 'lhg@yandex.ru', 2, False),
('Зубрин Иван Алексеевич', 20021103, 'г.Новкузнецк ул.Золотая д.64', 'jghjg@mail.ru', 2, True),
('Козлов Николай Иванович', 20021104, 'г.Томск ул.Добролюбова д.54', 'vsdv@yandex.ru', 2, True),
('Урлик Иван Иванович', 20021107, 'г.Новосибирск ул.Каменная д.45', 'vdfdfb@mail.ru', 2, False),
('Мещанова Юлия Иванович', 20021203, 'г.Томск ул.Кремлевская д.45', 'fbdfbdf@yandex.ru', 2, False),
('Боярский Тарас Александрович', 20021009, 'г.Томск ул.Купленная д.54', 'bdfbd@mail.ru', 2, False),
('Туркин Иван Алексеевич', 20020617, 'г.Томск ул.Довлатова д.68', 'bfdbn@mail.ru', 2, False);


insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Кравченко Евгений Иоанович', 20021231, 'г.Новосибирск ул.Дровникова д.286', 'bfdb@mail.ru', 3, True),
('Наров Иван Александрович', 20020902, 'г.Новосибирск ул.Пролетариата д.13', 'qwngfnge@yandex.ru', 3, False),
('Прохоров Дмитрий Алексеевич', 20021111, 'г.Томск ул.Дремова д.251', 'ngfn@mail.ru', 3, True),
('Паничкин Николай Иванович', 20021113, 'г.Томск ул.Травникова д.321', 'nfgnf@gmail.com', 3, True),
('Дорогина Анна Иванович', 20020901, 'г.Колывань ул.Добролюбова д.51', 'fnngn@mail.ru', 3, False),
('Дратутин Николай Александрович', 20020419, 'г.Новосибирск ул.Труда д.28', 'ddddddddd@yandex.ru', 3, True),
('Досвиданя Дмитрий Иванович', 20020527, 'г.Томск ул.Мира д.48', 'fdbfbdf@mail.ru', 3, False),
('Кукиш Иван Александрович', 20020204, 'г.Томск ул.Земляничная д.64', 'lkji@yandex.ru', 3, False),
('Карпова Юлия Иванович', 20020103, 'г.Новкузнецк ул.Кубышкина д.564', 'sdfs@yandex.ru', 3, False);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Крылова Ульяна Ильинична', 20021108, 'г. Новосибирск, ул.Якуба Коласа, д.6', 'efim.mosh@outlook.com', 4, True),
('Харитонова Милана Демьяновна', 20011120, 'г.Бердск, ул.Мирная, д.2 кв.84', 'yurin06121967@gmail.com', 4, False),
('Головин Александр Дмитриевич', 20020103, 'г.Новосибирск, ул.Речная, д.11 кв.126', 'in.sarna@outlook.com', 4, False),
('Гордеева Ксения Артёмовна', 20000218, 'г.Новосибирск, ул.Минская, д.21 кв.111', 'pelageya1405@hotmail.com', 4, True),
('Лебедев Арсений Алексеевич', 20030725, 'г.Новосибирск, ул.Победы, д.12 кв.214', 'sem82@ya.ru', 4, False),
('Смирнов Кирилл Михайлович', 20021225, 'г.Куйбышев, уд.Победы, д.14 кв.130', 'poln25121978@rambler.ru', 4, True),
('Александров Игорь Олегович', 20020206, 'г.Новосибирск, ул.Космонавтов, д.19 кв.103', 'aton2899@rambler.ru', 4, True);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Николаев Илья Егорович', 20020602, 'г.Новосибирск, Луговая ул., д. 8 кв.148', 'konstantin08111969@outlook.com', 5, True),
('Воробьева Анна Данииловна', 20030524, 'г.Новосибирск, Космонавтов ул., д. 19 кв.103', 'arkadiy27071985@ya.ru', 5, False),
('Медведев Даниил Андреевич', 20030427, 'г.Томск, Калинина ул., д. 23 кв.150', 'nika5557@mail.ru', 5, True),
('Лосева Нина Владимировна', 20010910, 'г.Новосибирск, Хуторская ул., д. 11 кв.90', 'valeriya79@outlook.com', 5, True),
('Лебедев Артём Романович', 20030821, 'г.Новосибирск, 3 Марта ул., д. 17 кв.50', 'kuzma91@rambler.ru', 5, False),
('Елисеева Александра Ярославовна', 20030214, 'г.Новосибирск, Лесной пер., д. 8 кв.213', 'rada99@gmail.com', 5, False),
('Яшин Дмитрий Дмитриевич', 20011001, 'г.Мочище, Луговая ул., д. 3 кв.39', 'tamara7482@mail.ru', 5, True);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Иванов Лев Владиславович', 20021118, 'г.Новосибирск, Светлая ул., д. 6 кв.96', 'german26021968@outlook.com', 6, False),
('Мешкова Анастасия Никитична', 20000304, 'г.Новосибирск, Речная ул., д. 17 кв.142', 'pavel36@outlook.com', 6, True),
('Ларионов Вадим Богданович', 20010724, 'г.Бердск, Западная ул., д. 22 кв.19', 'emelyan38@yandex.ru', 6, False),
('Савельева Кира Ильинична', 20010128, 'г.Новосибирск, Березовая ул., д. 21 кв.15', 'viktoriya.kutepova@gmail.com', 6, True),
('Бурова Малика Максимовна', 20020723, 'г.Новосибирск, Строителей ул., д. 6 кв.156', 'lyubov73@gmail.com', 6, True),
('Трофимова Елизавета Дмитриевна', 20000506, 'г.Мочище, Лесной пер., д. 20 кв.102', 'lev7311@mail.ru', 6, True),
('Басова Вера Романовна', 20040116, 'г.Новосибирск, Песчаная ул., д. 21 кв.88', 'georgiy.nekrestyanov@gmail.com', 6, False),
('Воронцов Владимир Кириллович', 20011222, 'г.Новосибирск, Школьная ул., д. 23 кв.182', 'maryamna7165@hotmail.com', 6, True),
('Власова Сафия Артёмовна', 20020618, 'г.Новосибирск, Приозерная ул., д. 25 кв.32', 'yuriy.jgulev@rambler.ru', 6, False),
('Кузьмина Анастасия Львовна', 20000824, 'г.Томск, Интернациональная ул., д. 25 кв.15', 'valentin1995@mail.ru', 6, True);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Горохова Лидия Матвеевна', 20010420, 'г.Новосибирск, Комсомольская ул., д. 10 кв.13', 'tatyana9938@yandex.ru', 7, False),
('Иванов Эмир Владиславович', 20020909, 'г.Бердск, Южная ул., д. 22 кв.99', 'egor33@yandex.ru', 7, True),
('Суворова Софья Тимофеевна', 20040921, 'г.Новосибирск, Новая ул., д. 23 кв.8', 'yakov3206@outlook.com', 7, False),
('Куликова Дарья Дмитриевна', 20010718, 'г.Новосибирск, Рабочая ул., д. 8 кв.167', 'danila.korjev@outlook.com', 7, True),
('Сазонова Кира Леонидовна', 20021207, 'г.Бердск, Приозерная ул., д. 20 кв.163', 'margarita2079@gmail.com', 7, True),
('Карпова Мария Павловна', 20040806, 'г.Новосибирск, Ленина ул., д. 11 кв.211', 'nastasya5069@yandex.ru', 7, True),
('Тихомиров Герман Макарович', 20040220, 'г.Новосибирск, Чапаева ул., д. 17 кв.154', 'maryamna14@rambler.ru', 7, False);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Ширяева Аделина Ивановна', 20021227, 'г.Новосибирск, Первомайская ул., д. 18 кв.100', 'veronika1990@yandex.ru', 8, False),
('Егоров Дмитрий Романович', 20000316, 'г.Новосибирск, Лесной пер., д. 3 кв.176', 'yuliya07121994@ya.ru', 8, False),
('Шапошников Георгий Сергеевич', 20030731, 'г.Новосибирск, Колхозная ул., д. 15 кв.110', 'egor6327@outlook.com', 8, False),
('Гуляева Марта Демидовна', 20021010, 'г.Новосибирск, Победы ул., д. 17 кв.152', 'egor6327@outlook.com', 8, True),
('Данилов Никита Артёмович', 20030327, 'г.Мочище, Озерная ул., д. 12 кв.214', 'aleksandra1981@ya.ru', 8, True),
('Громов Антон Александрович', 20040124, 'г.Новосибирск, Якуба Коласа ул., д. 21 кв.148', 'egor80@mail.ru', 8, True),
('Моисеева София Платоновна', 20040822, 'г.Мочище, Светлая ул., д. 21 кв.105', 'lana1960@mail.ru', 8, True),
('Филатова Дарья Сергеевна', 20031216, 'г.Новосибирск, Лесной пер., д. 4 кв.94', 'filipp04021987@mail.ru', 8, True),
('Завьялов Артём Михайлович', 20010314, 'г.Новосибирск, Луговая ул., д. 25 кв.128', 'afanasiya1968@mail.ru', 8, False),
('Морозов Даниил Ильич', 20020125, 'г.Новосибирск, Молодежный пер., д. 1 кв.32', 'valentin64@mail.ru', 8, False);

insert INTO Students (name, date_of_birth, address, email, group_id, budget)
VALUES
('Моисеев Всеволод Ярославович', 20000216, 'г.Новосибирск, Чкалова ул., д. 12 кв.178', 'valentin64@mail.ru', 9, False),
('Кузнецов Сергей Фёдорович', 20000209, 'г.Бердск, Чкалова ул., д. 12 кв.178', 'anton1981@hotmail.com', 9, False),
('Виноградова Сабина Тимофеевна', 20020415, 'г.Новосибирск, Октябрьский пер., д. 14 кв.72', 'yurin95@mail.ru', 9, True),
('Филимонова София Данииловна', 20000501, 'г.Новосибирск, Полевая ул., д. 1 кв.11', 'rimma05021965@ya.ru', 9, False),
('Лазарев Максим Ильич', 20030403, 'г.Бердск, Дружбы ул., д. 13 кв.129', 'german21011973@ya.ru', 9, False),
('Пономарев Давид Никитич', 20030112, 'г.Мочище, Солнечный пер., д. 10 кв.98', 'alina14011965@rambler.ru', 9, False),
('Львова Ирина Руслановна', 20000729, 'г.Новосибирск, Заречная ул., д. 10 кв.207', 'alina14011965@rambler.ru', 9, False),
('Щербакова Есения Дамировна', 20000706, 'г.Новосибирск, 3 Марта ул., д. 14 кв.159', 'ulyana88@rambler.ru', 9, False);


INSERT INTO Subjects (name)
VALUES ('Математика'), ('Иностранный язык'), ('Программирование'), ('Философия'), ('Экономика'), ('История'), ('Юриспруденция'), ('Физкультура'), ('Теория вероятности'), ('Предпринимательство');

INSERT INTO Teachers (name)
VALUES ('Дроздов Антон Николаевич'), ('Губов Владимир Алексеевич'), ('Купринова Ольга Сергеевна'), ('Коротько Галина Андреевна'), ('Казанков Александр Алексеевич');

INSERT INTO subs_teachs_dirs (subject_id, teacher_id, direction_id)
VALUES (1, 2, 1), (1, 1, 2), (2, 3, 2), (3, 5, 2), (4, 5, 3), (3, 1, 1), (1, 2, 3), (2, 4, 3), (6, 3, 2), (4, 5, 2), (10, 2, 1), (8, 4, 1);

INSERT INTO Marks (student_id, std_id, mark)
VALUES
(1, 1, 3), (1, 6, 4), (1, 11, 4), (1, 12, 3),
(2, 1, 5), (2, 6, 2), (2, 11, 2), (2, 12, 4),
(3, 1, 3), (3, 6, 3), (3, 11, 3), (3, 12, 2),
(4, 1, 2), (4, 6, 3), (4, 11, 5), (4, 12, 2),
(5, 1, 3), (5, 6, 5), (5, 11, 5), (5, 12, 5),
(6, 1, 5), (6, 6, 3), (6, 11, 2), (6, 12, 5),
(7, 1, 2), (7, 6, 4), (7, 11, 4), (7, 12, 5),
(8, 1, 5), (8, 6, 2), (8, 11, 2), (8, 12, 5),
(9, 1, 5), (9, 6, 2), (9, 11, 5), (9, 12, 5),
(10, 1, 2), (10, 6, 3), (10, 11, 2), (10, 12, 3),
(11, 1, 5), (11, 6, 5), (11, 11, 2), (11, 12, 5),
(12, 1, 3), (12, 6, 2), (12, 11, 5), (12, 12, 2),
(13, 1, 2), (13, 6, 3), (13, 11, 5), (13, 12, 3),
(14, 1, 4), (14, 6, 2), (14, 11, 2), (14, 12, 3),
(15, 1, 5), (15, 6, 4), (15, 11, 2), (15, 12, 5),
(16, 1, 2), (16, 6, 5), (16, 11, 3), (16, 12, 2),
(17, 1, 2), (17, 6, 2), (17, 11, 3), (17, 12, 2),
(18, 1, 2), (18, 6, 5), (18, 11, 2), (18, 12, 3),
(19, 1, 3), (19, 6, 2), (19, 11, 3), (19, 12, 2),
(20, 1, 4), (20, 6, 5), (20, 11, 2), (20, 12, 3),
(21, 1, 4), (21, 6, 2), (21, 11, 4), (21, 12, 4),
(22, 1, 2), (22, 6, 4), (22, 11, 5), (22, 12, 3),
(23, 1, 2), (23, 6, 3), (23, 11, 5), (23, 12, 2),
(24, 1, 4), (24, 6, 3), (24, 11, 2), (24, 12, 3);

INSERT INTO Marks (student_id, std_id, mark)
VALUES
(25, 2, 2), (25, 3, 2), (25, 4, 4), (25, 9, 2),
(25, 10, 4), (26, 2, 4), (26, 3, 3), (26, 4, 2),
(26, 9, 5), (26, 10, 5), (27, 2, 5), (27, 3, 5),
(27, 4, 3), (27, 9, 2), (27, 10, 4), (28, 2, 2),
(28, 3, 5), (28, 4, 3), (28, 9, 3), (28, 10, 3),
(29, 2, 5), (29, 3, 4), (29, 4, 5), (29, 9, 2),
(29, 10, 5), (30, 2, 3), (30, 3, 2), (30, 4, 3),
(30, 9, 4), (30, 10, 3), (31, 2, 3), (31, 3, 5),
(31, 4, 4), (31, 9, 5), (31, 10, 4), (32, 2, 3),
(32, 3, 3), (32, 4, 5), (32, 9, 4), (32, 10, 5),
(33, 2, 2), (33, 3, 5), (33, 4, 4), (33, 9, 3),
(33, 10, 5), (34, 2, 5), (34, 3, 4), (34, 4, 5),
(34, 9, 3), (34, 10, 2), (35, 2, 4), (35, 3, 5),
(35, 4, 2), (35, 9, 4), (35, 10, 5), (36, 2, 4),
(36, 3, 2), (36, 4, 3), (36, 9, 5), (36, 10, 2),
(37, 2, 4), (37, 3, 4), (37, 4, 3), (37, 9, 5),
(37, 10, 2), (38, 2, 2), (38, 3, 4), (38, 4, 2),
(38, 9, 3), (38, 10, 3), (39, 2, 5), (39, 3, 3),
(39, 4, 5), (39, 9, 4), (39, 10, 3), (40, 2, 4),
(40, 3, 3), (40, 4, 4), (40, 9, 5), (40, 10, 2),
(41, 2, 3), (41, 3, 2), (41, 4, 5), (41, 9, 5),
(41, 10, 2), (42, 2, 5), (42, 3, 3), (42, 4, 5),
(42, 9, 4), (42, 10, 5), (43, 2, 5), (43, 3, 3),
(43, 4, 5), (43, 9, 5), (43, 10, 2), (44, 2, 5),
(44, 3, 2), (44, 4, 5), (44, 9, 4), (44, 10, 4),
(45, 2, 2), (45, 3, 3), (45, 4, 5), (45, 9, 3),
(45, 10, 3), (46, 2, 3), (46, 3, 5), (46, 4, 4),
(46, 9, 2), (46, 10, 4), (47, 2, 3), (47, 3, 4),
(47, 4, 4), (47, 9, 2), (47, 10, 4), (48, 2, 3),
(48, 3, 5), (48, 4, 4), (48, 9, 5), (48, 10, 5);

INSERT INTO Marks (student_id, std_id, mark)
VALUES
(49, 5, 4), (49, 7, 3), (49, 8, 4), (50, 5, 3),
(50, 7, 4), (50, 8, 4), (51, 5, 2), (51, 7, 2),
(51, 8, 3), (52, 5, 5), (52, 7, 4), (52, 8, 2),
(53, 5, 5), (53, 7, 4), (53, 8, 5), (54, 5, 5),
(54, 7, 4), (54, 8, 4), (55, 5, 4), (55, 7, 5),
(55, 8, 3), (56, 5, 2), (56, 7, 4), (56, 8, 5),
(57, 5, 3), (57, 7, 2), (57, 8, 5), (58, 5, 5),
(58, 7, 2), (58, 8, 4), (59, 5, 5), (59, 7, 4),
(59, 8, 5), (60, 5, 3), (60, 7, 4), (60, 8, 4),
(61, 5, 2), (61, 7, 3), (61, 8, 2), (62, 5, 2),
(62, 7, 2), (62, 8, 5), (63, 5, 3), (63, 7, 2),
(63, 8, 3), (64, 5, 4), (64, 7, 2), (64, 8, 3),
(65, 5, 5), (65, 7, 2), (65, 8, 3), (66, 5, 5),
(66, 7, 4), (66, 8, 3), (67, 5, 4), (67, 7, 4),
(67, 8, 2), (68, 5, 5), (68, 7, 4), (68, 8, 2),
(69, 5, 3), (69, 7, 2), (69, 8, 4), (70, 5, 5),
(70, 7, 3), (70, 8, 2), (71, 5, 3), (71, 7, 4),
(71, 8, 3), (72, 5, 4), (72, 7, 3), (72, 8, 3),
(73, 5, 5), (73, 7, 3), (73, 8, 3);


INSERT INTO timetable(start_time, end_time)
VALUES
("08:00:00", "09:30:00"),
("09:40:00", "11:10:00"),
("11:25:00", "12:55:00"),
("13:20:00", "14:50:00"),
("15:05:00", "16:35:00"),
("16:50:00", "18:20:00"),
("18:30:00", "20:00:00"),
("20:05:00", "21:35:00");


INSERT INTO lessons_schedule(subject_id, time_id, `date`) VALUES
(1, 1, 20231110), (1, 2, 20231110), (1, 5, 20231110),
(1, 6, 20231110), (1, 7, 20231110), (2, 1, 20231110),
(2, 2, 20231110), (2, 6, 20231110), (2, 7, 20231110),
(3, 3, 20231110), (3, 4, 20231110), (3, 5, 20231110),
(3, 6, 20231110), (3, 7, 20231110), (4, 1, 20231110),
(4, 4, 20231110), (4, 5, 20231110), (4, 6, 20231110),
(4, 7, 20231110), (5, 1, 20231110), (5, 2, 20231110),
(5, 6, 20231110), (5, 7, 20231110), (6, 1, 20231110),
(6, 7, 20231110), (7, 1, 20231110), (7, 2, 20231110),
(7, 7, 20231110), (8, 1, 20231110), (8, 2, 20231110),
(8, 3, 20231110), (9, 1, 20231110), (9, 6, 20231110),
(9, 7, 20231110), (10, 6, 20231110), (10, 7, 20231110),
(11, 7, 20231110), (12, 1, 20231110), (12, 2, 20231110);

UPDATE `lessons_schedule` SET `date` = FROM_UNIXTIME( 
  RAND( ) * ( UNIX_TIMESTAMP( '2023-12-31' ) - UNIX_TIMESTAMP( '2023-09-01' ) ) + UNIX_TIMESTAMP( '2023-09-01' )
)

INSERT INTO attendance(scedule_id, student_id, presense) VALUES
(1, 1, false), (1, 2, true), (1, 3, false), (1, 4, false), 
(1, 5, false), (1, 6, true), (1, 7, false), (1, 8, true), 
(1, 9, false), (1, 10, false), (1, 11, true), (1, 12, true), 
(1, 13, false), (1, 14, true), (1, 15, false), (1, 16, false), 
(1, 17, false), (1, 18, false), (1, 19, true), (1, 20, false), 
(1, 21, true), (1, 22, true), (1, 23, false), (1, 24, true), 
(1, 25, false), (1, 26, false), (1, 27, false), (1, 28, true), 
(1, 29, false), (1, 30, true), (1, 31, false), (1, 32, false), 
(1, 33, false), (1, 34, true), (1, 35, false), (1, 36, false), 
(1, 37, false), (1, 38, false), (1, 39, false), (1, 40, false), 
(1, 41, false), (1, 42, true), (1, 43, true), (1, 44, false), 
(1, 45, false), (1, 46, false), (1, 47, false), (1, 48, false), 
(1, 49, false), (1, 50, false), (1, 51, true), (1, 52, true), 
(1, 53, false), (1, 54, false), (1, 55, false), (1, 56, true), 
(1, 57, true), (1, 58, false), (1, 59, false), (1, 60, false), 
(1, 61, false), (1, 62, true), (1, 63, true), (1, 64, false), 
(1, 65, false), (1, 66, true), (1, 67, false), (1, 68, true), 
(1, 69, true), (1, 70, true), (1, 71, false), (1, 72, true), 
(1, 73, true), (2, 1, false), (2, 2, false), (2, 3, false), (2, 4, true), 
(2, 5, false), (2, 6, false), (2, 7, true), (2, 8, true), 
(2, 9, true), (2, 10, true), (2, 11, false), (2, 12, true), 
(2, 13, true), (2, 14, true), (2, 15, false), (2, 16, false), 
(2, 17, false), (2, 18, false), (2, 19, true), (2, 20, false), 
(2, 21, true), (2, 22, false), (2, 23, true), (2, 24, true), 
(2, 25, true), (2, 26, false), (2, 27, true), (2, 28, true), 
(2, 29, false), (2, 30, false), (2, 31, false), (2, 32, true), 
(2, 33, false), (2, 34, false), (2, 35, true), (2, 36, true), 
(2, 37, false), (2, 38, true), (2, 39, true), (2, 40, true), 
(2, 41, false), (2, 42, false), (2, 43, true), (2, 44, true), 
(2, 45, true), (2, 46, true), (2, 47, true), (2, 48, true), 
(2, 49, false), (2, 50, true), (2, 51, false), (2, 52, false), 
(2, 53, false), (2, 54, true), (2, 55, false), (2, 56, false), 
(2, 57, false), (2, 58, false), (2, 59, false), (2, 60, true), 
(2, 61, true), (2, 62, false), (2, 63, false), (2, 64, false), 
(2, 65, true), (2, 66, false), (2, 67, true), (2, 68, true), 
(2, 69, true), (2, 70, true), (2, 71, true), (2, 72, false), 
(2, 73, false), (3, 1, true), (3, 2, false), (3, 3, false), (3, 4, false), 
(3, 5, false), (3, 6, true), (3, 7, true), (3, 8, true), 
(3, 9, true), (3, 10, true), (3, 11, false), (3, 12, true), 
(3, 13, true), (3, 14, false), (3, 15, true), (3, 16, false), 
(3, 17, false), (3, 18, true), (3, 19, false), (3, 20, false), 
(3, 21, false), (3, 22, true), (3, 23, true), (3, 24, true), 
(3, 25, false), (3, 26, true), (3, 27, true), (3, 28, false), 
(3, 29, false), (3, 30, false), (3, 31, true), (3, 32, true), 
(3, 33, false), (3, 34, true), (3, 35, false), (3, 36, true), 
(3, 37, true), (3, 38, true), (3, 39, true), (3, 40, false), 
(3, 41, false), (3, 42, true), (3, 43, false), (3, 44, true), 
(3, 45, true), (3, 46, true), (3, 47, true), (3, 48, true), 
(3, 49, true), (3, 50, true), (3, 51, false), (3, 52, true), 
(3, 53, true), (3, 54, true), (3, 55, false), (3, 56, true), 
(3, 57, false), (3, 58, true), (3, 59, false), (3, 60, true), 
(3, 61, true), (3, 62, true), (3, 63, true), (3, 64, true), 
(3, 65, true), (3, 66, false), (3, 67, false), (3, 68, true), 
(3, 69, true), (3, 70, true), (3, 71, true), (3, 72, false), 
(3, 73, false), (4, 1, false), (4, 2, false), (4, 3, false), (4, 4, false), 
(4, 5, false), (4, 6, true), (4, 7, false), (4, 8, false), 
(4, 9, false), (4, 10, true), (4, 11, true), (4, 12, true), 
(4, 13, false), (4, 14, true), (4, 15, false), (4, 16, true), 
(4, 17, false), (4, 18, true), (4, 19, false), (4, 20, false), 
(4, 21, false), (4, 22, true), (4, 23, false), (4, 24, true), 
(4, 25, true), (4, 26, true), (4, 27, true), (4, 28, false), 
(4, 29, true), (4, 30, true), (4, 31, false), (4, 32, false), 
(4, 33, false), (4, 34, true), (4, 35, true), (4, 36, false), 
(4, 37, true), (4, 38, true), (4, 39, true), (4, 40, true), 
(4, 41, true), (4, 42, false), (4, 43, false), (4, 44, false), 
(4, 45, true), (4, 46, true), (4, 47, true), (4, 48, true), 
(4, 49, true), (4, 50, false), (4, 51, true), (4, 52, false), 
(4, 53, false), (4, 54, true), (4, 55, true), (4, 56, true), 
(4, 57, true), (4, 58, true), (4, 59, true), (4, 60, true), 
(4, 61, true), (4, 62, true), (4, 63, true), (4, 64, false), 
(4, 65, true), (4, 66, true), (4, 67, false), (4, 68, true), 
(4, 69, true), (4, 70, false), (4, 71, false), (4, 72, true), 
(4, 73, true), (5, 1, true), (5, 2, false), (5, 3, true), (5, 4, false), 
(5, 5, false), (5, 6, false), (5, 7, false), (5, 8, true), 
(5, 9, true), (5, 10, true), (5, 11, true), (5, 12, false), 
(5, 13, true), (5, 14, true), (5, 15, false), (5, 16, false), 
(5, 17, false), (5, 18, true), (5, 19, false), (5, 20, true), 
(5, 21, true), (5, 22, true), (5, 23, false), (5, 24, false), 
(5, 25, true), (5, 26, true), (5, 27, true), (5, 28, true), 
(5, 29, false), (5, 30, true), (5, 31, false), (5, 32, false), 
(5, 33, false), (5, 34, false), (5, 35, true), (5, 36, true), 
(5, 37, true), (5, 38, false), (5, 39, false), (5, 40, true), 
(5, 41, true), (5, 42, true), (5, 43, false), (5, 44, false), 
(5, 45, true), (5, 46, false), (5, 47, true), (5, 48, true), 
(5, 49, false), (5, 50, false), (5, 51, true), (5, 52, true), 
(5, 53, true), (5, 54, true), (5, 55, true), (5, 56, true), 
(5, 57, false), (5, 58, true), (5, 59, false), (5, 60, false), 
(5, 61, true), (5, 62, false), (5, 63, false), (5, 64, true), 
(5, 65, false), (5, 66, true), (5, 67, true), (5, 68, true), 
(5, 69, false), (5, 70, false), (5, 71, true), (5, 72, false), 
(5, 73, false), (6, 1, true), (6, 2, true), (6, 3, true), (6, 4, false), 
(6, 5, true), (6, 6, false), (6, 7, true), (6, 8, true), 
(6, 9, true), (6, 10, false), (6, 11, true), (6, 12, true), 
(6, 13, false), (6, 14, false), (6, 15, false), (6, 16, true), 
(6, 17, true), (6, 18, false), (6, 19, false), (6, 20, false), 
(6, 21, true), (6, 22, false), (6, 23, false), (6, 24, true), 
(6, 25, false), (6, 26, false), (6, 27, false), (6, 28, true), 
(6, 29, true), (6, 30, false), (6, 31, false), (6, 32, true), 
(6, 33, true), (6, 34, false), (6, 35, false), (6, 36, false), 
(6, 37, false), (6, 38, true), (6, 39, true), (6, 40, false), 
(6, 41, false), (6, 42, true), (6, 43, true), (6, 44, false), 
(6, 45, false), (6, 46, true), (6, 47, false), (6, 48, true), 
(6, 49, true), (6, 50, false), (6, 51, true), (6, 52, false), 
(6, 53, true), (6, 54, false), (6, 55, false), (6, 56, false), 
(6, 57, true), (6, 58, true), (6, 59, false), (6, 60, false), 
(6, 61, false), (6, 62, false), (6, 63, false), (6, 64, false), 
(6, 65, true), (6, 66, true), (6, 67, false), (6, 68, false), 
(6, 69, false), (6, 70, true), (6, 71, false), (6, 72, false), 
(6, 73, true), (7, 1, true), (7, 2, true), (7, 3, true), (7, 4, true), 
(7, 5, true), (7, 6, false), (7, 7, false), (7, 8, false), 
(7, 9, true), (7, 10, false), (7, 11, false), (7, 12, true), 
(7, 13, true), (7, 14, true), (7, 15, false), (7, 16, true), 
(7, 17, true), (7, 18, false), (7, 19, false), (7, 20, true), 
(7, 21, true), (7, 22, true), (7, 23, false), (7, 24, false), 
(7, 25, true), (7, 26, true), (7, 27, false), (7, 28, false), 
(7, 29, false), (7, 30, false), (7, 31, false), (7, 32, false), 
(7, 33, false), (7, 34, true), (7, 35, true), (7, 36, true), 
(7, 37, true), (7, 38, false), (7, 39, true), (7, 40, false), 
(7, 41, false), (7, 42, true), (7, 43, false), (7, 44, false), 
(7, 45, true), (7, 46, true), (7, 47, true), (7, 48, false), 
(7, 49, true), (7, 50, false), (7, 51, false), (7, 52, true), 
(7, 53, false), (7, 54, true), (7, 55, false), (7, 56, true), 
(7, 57, false), (7, 58, true), (7, 59, false), (7, 60, true), 
(7, 61, true), (7, 62, false), (7, 63, false), (7, 64, false), 
(7, 65, true), (7, 66, false), (7, 67, true), (7, 68, true), 
(7, 69, false), (7, 70, false), (7, 71, false), (7, 72, true), 
(7, 73, false), (8, 1, true), (8, 2, false), (8, 3, true), (8, 4, true), 
(8, 5, true), (8, 6, false), (8, 7, false), (8, 8, false), 
(8, 9, false), (8, 10, false), (8, 11, false), (8, 12, false), 
(8, 13, false), (8, 14, true), (8, 15, true), (8, 16, true), 
(8, 17, true), (8, 18, false), (8, 19, false), (8, 20, false), 
(8, 21, true), (8, 22, true), (8, 23, true), (8, 24, false), 
(8, 25, true), (8, 26, true), (8, 27, false), (8, 28, true), 
(8, 29, true), (8, 30, true), (8, 31, true), (8, 32, false), 
(8, 33, false), (8, 34, false), (8, 35, false), (8, 36, false), 
(8, 37, false), (8, 38, false), (8, 39, false), (8, 40, false), 
(8, 41, true), (8, 42, false), (8, 43, true), (8, 44, false), 
(8, 45, false), (8, 46, true), (8, 47, false), (8, 48, false), 
(8, 49, true), (8, 50, false), (8, 51, false), (8, 52, false), 
(8, 53, false), (8, 54, false), (8, 55, true), (8, 56, true), 
(8, 57, false), (8, 58, false), (8, 59, false), (8, 60, true), 
(8, 61, true), (8, 62, false), (8, 63, false), (8, 64, true), 
(8, 65, false), (8, 66, true), (8, 67, false), (8, 68, true), 
(8, 69, true), (8, 70, true), (8, 71, false), (8, 72, true), 
(8, 73, false), (9, 1, false), (9, 2, false), (9, 3, false), (9, 4, false), 
(9, 5, false), (9, 6, true), (9, 7, false), (9, 8, true), 
(9, 9, true), (9, 10, false), (9, 11, true), (9, 12, false), 
(9, 13, true), (9, 14, true), (9, 15, false), (9, 16, true), 
(9, 17, true), (9, 18, false), (9, 19, false), (9, 20, true), 
(9, 21, true), (9, 22, false), (9, 23, false), (9, 24, true), 
(9, 25, true), (9, 26, true), (9, 27, true), (9, 28, true), 
(9, 29, false), (9, 30, false), (9, 31, true), (9, 32, true), 
(9, 33, true), (9, 34, false), (9, 35, false), (9, 36, true), 
(9, 37, true), (9, 38, true), (9, 39, true), (9, 40, false), 
(9, 41, false), (9, 42, false), (9, 43, true), (9, 44, true), 
(9, 45, false), (9, 46, false), (9, 47, true), (9, 48, false), 
(9, 49, true), (9, 50, false), (9, 51, true), (9, 52, true), 
(9, 53, false), (9, 54, true), (9, 55, false), (9, 56, false), 
(9, 57, true), (9, 58, false), (9, 59, true), (9, 60, true), 
(9, 61, true), (9, 62, true), (9, 63, false), (9, 64, true), 
(9, 65, false), (9, 66, true), (9, 67, true), (9, 68, false), 
(9, 69, true), (9, 70, true), (9, 71, false), (9, 72, false), 
(9, 73, false), (10, 1, false), (10, 2, false), (10, 3, false), (10, 4, false), 
(10, 5, true), (10, 6, false), (10, 7, false), (10, 8, true), 
(10, 9, true), (10, 10, true), (10, 11, true), (10, 12, false), 
(10, 13, true), (10, 14, false), (10, 15, false), (10, 16, false), 
(10, 17, false), (10, 18, false), (10, 19, true), (10, 20, false), 
(10, 21, true), (10, 22, false), (10, 23, false), (10, 24, false), 
(10, 25, true), (10, 26, false), (10, 27, false), (10, 28, false), 
(10, 29, true), (10, 30, true), (10, 31, false), (10, 32, false), 
(10, 33, false), (10, 34, true), (10, 35, false), (10, 36, false), 
(10, 37, false), (10, 38, true), (10, 39, false), (10, 40, true), 
(10, 41, false), (10, 42, true), (10, 43, true), (10, 44, true), 
(10, 45, false), (10, 46, true), (10, 47, false), (10, 48, true), 
(10, 49, true), (10, 50, false), (10, 51, true), (10, 52, false), 
(10, 53, false), (10, 54, false), (10, 55, true), (10, 56, true), 
(10, 57, true), (10, 58, false), (10, 59, true), (10, 60, true), 
(10, 61, false), (10, 62, true), (10, 63, false), (10, 64, false), 
(10, 65, false), (10, 66, true), (10, 67, false), (10, 68, true), 
(10, 69, true), (10, 70, true), (10, 71, true), (10, 72, true), 
(10, 73, true), (11, 1, false), (11, 2, true), (11, 3, false), (11, 4, true), 
(11, 5, false), (11, 6, false), (11, 7, true), (11, 8, true), 
(11, 9, true), (11, 10, false), (11, 11, false), (11, 12, true), 
(11, 13, false), (11, 14, true), (11, 15, false), (11, 16, false), 
(11, 17, false), (11, 18, false), (11, 19, false), (11, 20, false), 
(11, 21, true), (11, 22, true), (11, 23, true), (11, 24, true), 
(11, 25, false), (11, 26, false), (11, 27, false), (11, 28, false), 
(11, 29, true), (11, 30, true), (11, 31, false), (11, 32, true), 
(11, 33, false), (11, 34, true), (11, 35, true), (11, 36, true), 
(11, 37, false), (11, 38, true), (11, 39, false), (11, 40, false), 
(11, 41, false), (11, 42, false), (11, 43, true), (11, 44, true), 
(11, 45, true), (11, 46, false), (11, 47, false), (11, 48, true), 
(11, 49, true), (11, 50, true), (11, 51, true), (11, 52, true), 
(11, 53, true), (11, 54, true), (11, 55, true), (11, 56, true), 
(11, 57, true), (11, 58, false), (11, 59, false), (11, 60, true), 
(11, 61, true), (11, 62, false), (11, 63, true), (11, 64, false), 
(11, 65, false), (11, 66, true), (11, 67, false), (11, 68, true), 
(11, 69, false), (11, 70, false), (11, 71, false), (11, 72, true), 
(11, 73, false), (12, 1, true), (12, 2, true), (12, 3, false), (12, 4, false), 
(12, 5, true), (12, 6, false), (12, 7, false), (12, 8, false), 
(12, 9, true), (12, 10, false), (12, 11, false), (12, 12, true), 
(12, 13, false), (12, 14, true), (12, 15, false), (12, 16, true), 
(12, 17, false), (12, 18, true), (12, 19, false), (12, 20, false), 
(12, 21, true), (12, 22, true), (12, 23, true), (12, 24, false), 
(12, 25, true), (12, 26, true), (12, 27, false), (12, 28, false), 
(12, 29, false), (12, 30, false), (12, 31, true), (12, 32, true), 
(12, 33, true), (12, 34, false), (12, 35, false), (12, 36, true), 
(12, 37, true), (12, 38, true), (12, 39, false), (12, 40, false), 
(12, 41, true), (12, 42, false), (12, 43, false), (12, 44, true), 
(12, 45, false), (12, 46, true), (12, 47, true), (12, 48, true), 
(12, 49, true), (12, 50, false), (12, 51, true), (12, 52, true), 
(12, 53, true), (12, 54, false), (12, 55, false), (12, 56, true), 
(12, 57, true), (12, 58, false), (12, 59, false), (12, 60, false), 
(12, 61, true), (12, 62, true), (12, 63, false), (12, 64, true), 
(12, 65, false), (12, 66, true), (12, 67, false), (12, 68, true), 
(12, 69, true), (12, 70, false), (12, 71, true), (12, 72, true), 
(12, 73, true), (13, 1, true), (13, 2, false), (13, 3, true), (13, 4, false), 
(13, 5, true), (13, 6, false), (13, 7, false), (13, 8, true), 
(13, 9, true), (13, 10, false), (13, 11, true), (13, 12, false), 
(13, 13, false), (13, 14, true), (13, 15, true), (13, 16, true), 
(13, 17, true), (13, 18, false), (13, 19, true), (13, 20, true), 
(13, 21, true), (13, 22, false), (13, 23, true), (13, 24, true), 
(13, 25, false), (13, 26, true), (13, 27, false), (13, 28, false), 
(13, 29, true), (13, 30, false), (13, 31, true), (13, 32, false), 
(13, 33, false), (13, 34, false), (13, 35, false), (13, 36, false), 
(13, 37, true), (13, 38, false), (13, 39, false), (13, 40, false), 
(13, 41, false), (13, 42, false), (13, 43, false), (13, 44, false), 
(13, 45, false), (13, 46, false), (13, 47, true), (13, 48, false), 
(13, 49, false), (13, 50, false), (13, 51, true), (13, 52, false), 
(13, 53, true), (13, 54, false), (13, 55, true), (13, 56, false), 
(13, 57, true), (13, 58, false), (13, 59, true), (13, 60, true), 
(13, 61, false), (13, 62, true), (13, 63, true), (13, 64, false), 
(13, 65, true), (13, 66, false), (13, 67, true), (13, 68, false), 
(13, 69, false), (13, 70, true), (13, 71, true), (13, 72, false), 
(13, 73, true), (14, 1, true), (14, 2, false), (14, 3, false), (14, 4, false), 
(14, 5, true), (14, 6, true), (14, 7, false), (14, 8, false), 
(14, 9, true), (14, 10, true), (14, 11, true), (14, 12, true), 
(14, 13, false), (14, 14, false), (14, 15, true), (14, 16, true), 
(14, 17, false), (14, 18, false), (14, 19, false), (14, 20, false), 
(14, 21, true), (14, 22, true), (14, 23, true), (14, 24, false), 
(14, 25, true), (14, 26, false), (14, 27, true), (14, 28, false), 
(14, 29, false), (14, 30, true), (14, 31, false), (14, 32, true), 
(14, 33, true), (14, 34, false), (14, 35, false), (14, 36, false), 
(14, 37, true), (14, 38, true), (14, 39, false), (14, 40, false), 
(14, 41, false), (14, 42, false), (14, 43, false), (14, 44, true), 
(14, 45, true), (14, 46, false), (14, 47, true), (14, 48, true), 
(14, 49, true), (14, 50, true), (14, 51, true), (14, 52, false), 
(14, 53, false), (14, 54, true), (14, 55, true), (14, 56, false), 
(14, 57, true), (14, 58, false), (14, 59, false), (14, 60, true), 
(14, 61, false), (14, 62, false), (14, 63, false), (14, 64, true), 
(14, 65, true), (14, 66, true), (14, 67, true), (14, 68, true), 
(14, 69, true), (14, 70, true), (14, 71, true), (14, 72, true), 
(14, 73, true), (15, 1, true), (15, 2, false), (15, 3, false), (15, 4, true), 
(15, 5, false), (15, 6, true), (15, 7, true), (15, 8, true), 
(15, 9, false), (15, 10, true), (15, 11, false), (15, 12, true), 
(15, 13, false), (15, 14, false), (15, 15, true), (15, 16, true), 
(15, 17, false), (15, 18, true), (15, 19, true), (15, 20, true), 
(15, 21, false), (15, 22, true), (15, 23, false), (15, 24, true), 
(15, 25, true), (15, 26, true), (15, 27, true), (15, 28, false), 
(15, 29, false), (15, 30, false), (15, 31, true), (15, 32, true), 
(15, 33, false), (15, 34, true), (15, 35, true), (15, 36, false), 
(15, 37, true), (15, 38, false), (15, 39, false), (15, 40, true), 
(15, 41, false), (15, 42, false), (15, 43, false), (15, 44, true), 
(15, 45, false), (15, 46, true), (15, 47, true), (15, 48, false), 
(15, 49, false), (15, 50, true), (15, 51, true), (15, 52, false), 
(15, 53, false), (15, 54, false), (15, 55, false), (15, 56, false), 
(15, 57, false), (15, 58, true), (15, 59, true), (15, 60, true), 
(15, 61, true), (15, 62, true), (15, 63, false), (15, 64, false), 
(15, 65, false), (15, 66, true), (15, 67, true), (15, 68, false), 
(15, 69, false), (15, 70, true), (15, 71, true), (15, 72, true), 
(15, 73, false), (16, 1, false), (16, 2, false), (16, 3, false), (16, 4, false), 
(16, 5, true), (16, 6, true), (16, 7, true), (16, 8, true), 
(16, 9, false), (16, 10, true), (16, 11, true), (16, 12, false), 
(16, 13, false), (16, 14, false), (16, 15, true), (16, 16, false), 
(16, 17, false), (16, 18, false), (16, 19, false), (16, 20, false), 
(16, 21, true), (16, 22, true), (16, 23, false), (16, 24, false), 
(16, 25, true), (16, 26, true), (16, 27, false), (16, 28, false), 
(16, 29, true), (16, 30, false), (16, 31, false), (16, 32, true), 
(16, 33, true), (16, 34, true), (16, 35, false), (16, 36, true), 
(16, 37, true), (16, 38, true), (16, 39, true), (16, 40, false), 
(16, 41, false), (16, 42, false), (16, 43, true), (16, 44, true), 
(16, 45, true), (16, 46, false), (16, 47, false), (16, 48, true), 
(16, 49, true), (16, 50, false), (16, 51, false), (16, 52, false), 
(16, 53, false), (16, 54, true), (16, 55, false), (16, 56, false), 
(16, 57, true), (16, 58, false), (16, 59, false), (16, 60, true), 
(16, 61, true), (16, 62, false), (16, 63, false), (16, 64, false), 
(16, 65, true), (16, 66, true), (16, 67, false), (16, 68, true), 
(16, 69, true), (16, 70, false), (16, 71, false), (16, 72, true), 
(16, 73, false), (17, 1, true), (17, 2, true), (17, 3, true), (17, 4, true), 
(17, 5, true), (17, 6, false), (17, 7, false), (17, 8, false), 
(17, 9, false), (17, 10, true), (17, 11, false), (17, 12, true), 
(17, 13, false), (17, 14, true), (17, 15, false), (17, 16, true), 
(17, 17, false), (17, 18, true), (17, 19, true), (17, 20, true), 
(17, 21, true), (17, 22, true), (17, 23, false), (17, 24, false), 
(17, 25, true), (17, 26, false), (17, 27, false), (17, 28, false), 
(17, 29, false), (17, 30, true), (17, 31, true), (17, 32, false), 
(17, 33, true), (17, 34, false), (17, 35, false), (17, 36, false), 
(17, 37, true), (17, 38, true), (17, 39, false), (17, 40, false), 
(17, 41, true), (17, 42, false), (17, 43, true), (17, 44, true), 
(17, 45, false), (17, 46, true), (17, 47, false), (17, 48, false), 
(17, 49, true), (17, 50, false), (17, 51, false), (17, 52, true), 
(17, 53, true), (17, 54, true), (17, 55, true), (17, 56, false), 
(17, 57, false), (17, 58, false), (17, 59, false), (17, 60, false), 
(17, 61, true), (17, 62, true), (17, 63, false), (17, 64, true), 
(17, 65, true), (17, 66, true), (17, 67, false), (17, 68, false), 
(17, 69, true), (17, 70, true), (17, 71, true), (17, 72, true), 
(17, 73, true), (18, 1, false), (18, 2, false), (18, 3, true), (18, 4, false), 
(18, 5, false), (18, 6, true), (18, 7, true), (18, 8, true), 
(18, 9, true), (18, 10, true), (18, 11, true), (18, 12, true), 
(18, 13, false), (18, 14, true), (18, 15, false), (18, 16, true), 
(18, 17, true), (18, 18, false), (18, 19, false), (18, 20, false), 
(18, 21, false), (18, 22, true), (18, 23, true), (18, 24, false), 
(18, 25, true), (18, 26, false), (18, 27, false), (18, 28, true), 
(18, 29, false), (18, 30, true), (18, 31, true), (18, 32, false), 
(18, 33, false), (18, 34, true), (18, 35, true), (18, 36, false), 
(18, 37, false), (18, 38, false), (18, 39, true), (18, 40, true), 
(18, 41, true), (18, 42, false), (18, 43, false), (18, 44, false), 
(18, 45, true), (18, 46, false), (18, 47, false), (18, 48, true), 
(18, 49, false), (18, 50, true), (18, 51, true), (18, 52, true), 
(18, 53, false), (18, 54, true), (18, 55, false), (18, 56, true), 
(18, 57, false), (18, 58, true), (18, 59, true), (18, 60, true), 
(18, 61, false), (18, 62, true), (18, 63, false), (18, 64, true), 
(18, 65, false), (18, 66, true), (18, 67, false), (18, 68, false), 
(18, 69, true), (18, 70, true), (18, 71, true), (18, 72, false), 
(18, 73, false), (19, 1, false), (19, 2, false), (19, 3, true), (19, 4, false), 
(19, 5, false), (19, 6, false), (19, 7, false), (19, 8, true), 
(19, 9, false), (19, 10, false), (19, 11, true), (19, 12, true), 
(19, 13, true), (19, 14, false), (19, 15, true), (19, 16, false), 
(19, 17, false), (19, 18, true), (19, 19, true), (19, 20, false), 
(19, 21, true), (19, 22, false), (19, 23, true), (19, 24, false), 
(19, 25, false), (19, 26, true), (19, 27, true), (19, 28, false), 
(19, 29, true), (19, 30, true), (19, 31, false), (19, 32, true), 
(19, 33, false), (19, 34, false), (19, 35, false), (19, 36, true), 
(19, 37, true), (19, 38, true), (19, 39, true), (19, 40, false), 
(19, 41, true), (19, 42, true), (19, 43, true), (19, 44, false), 
(19, 45, false), (19, 46, true), (19, 47, true), (19, 48, true), 
(19, 49, false), (19, 50, true), (19, 51, false), (19, 52, true), 
(19, 53, true), (19, 54, true), (19, 55, true), (19, 56, false), 
(19, 57, true), (19, 58, true), (19, 59, true), (19, 60, true), 
(19, 61, false), (19, 62, false), (19, 63, true), (19, 64, true), 
(19, 65, true), (19, 66, true), (19, 67, true), (19, 68, true), 
(19, 69, true), (19, 70, false), (19, 71, false), (19, 72, true), 
(19, 73, false), (20, 1, false), (20, 2, true), (20, 3, false), (20, 4, false), 
(20, 5, false), (20, 6, false), (20, 7, false), (20, 8, true), 
(20, 9, false), (20, 10, false), (20, 11, true), (20, 12, false), 
(20, 13, true), (20, 14, true), (20, 15, true), (20, 16, false), 
(20, 17, false), (20, 18, false), (20, 19, false), (20, 20, false), 
(20, 21, true), (20, 22, true), (20, 23, true), (20, 24, false), 
(20, 25, true), (20, 26, false), (20, 27, true), (20, 28, false), 
(20, 29, false), (20, 30, false), (20, 31, false), (20, 32, true), 
(20, 33, false), (20, 34, true), (20, 35, true), (20, 36, true), 
(20, 37, false), (20, 38, false), (20, 39, false), (20, 40, false), 
(20, 41, true), (20, 42, false), (20, 43, false), (20, 44, false), 
(20, 45, false), (20, 46, true), (20, 47, false), (20, 48, true), 
(20, 49, true), (20, 50, false), (20, 51, false), (20, 52, true), 
(20, 53, true), (20, 54, false), (20, 55, true), (20, 56, false), 
(20, 57, false), (20, 58, false), (20, 59, true), (20, 60, true), 
(20, 61, false), (20, 62, true), (20, 63, false), (20, 64, false), 
(20, 65, true), (20, 66, true), (20, 67, true), (20, 68, true), 
(20, 69, true), (20, 70, false), (20, 71, false), (20, 72, true), 
(20, 73, true), (21, 1, false), (21, 2, false), (21, 3, false), (21, 4, true), 
(21, 5, false), (21, 6, true), (21, 7, false), (21, 8, false), 
(21, 9, false), (21, 10, false), (21, 11, true), (21, 12, false), 
(21, 13, true), (21, 14, false), (21, 15, false), (21, 16, false), 
(21, 17, false), (21, 18, false), (21, 19, true), (21, 20, true), 
(21, 21, false), (21, 22, true), (21, 23, true), (21, 24, true), 
(21, 25, true), (21, 26, false), (21, 27, true), (21, 28, false), 
(21, 29, false), (21, 30, true), (21, 31, false), (21, 32, true), 
(21, 33, true), (21, 34, false), (21, 35, false), (21, 36, false), 
(21, 37, false), (21, 38, true), (21, 39, false), (21, 40, true), 
(21, 41, true), (21, 42, false), (21, 43, false), (21, 44, false), 
(21, 45, true), (21, 46, false), (21, 47, false), (21, 48, false), 
(21, 49, true), (21, 50, true), (21, 51, true), (21, 52, true), 
(21, 53, true), (21, 54, true), (21, 55, true), (21, 56, true), 
(21, 57, false), (21, 58, true), (21, 59, false), (21, 60, true), 
(21, 61, false), (21, 62, true), (21, 63, true), (21, 64, false), 
(21, 65, false), (21, 66, true), (21, 67, true), (21, 68, false), 
(21, 69, true), (21, 70, true), (21, 71, true), (21, 72, true), 
(21, 73, false), (22, 1, true), (22, 2, false), (22, 3, true), (22, 4, true), 
(22, 5, false), (22, 6, true), (22, 7, false), (22, 8, false), 
(22, 9, true), (22, 10, false), (22, 11, false), (22, 12, true), 
(22, 13, false), (22, 14, true), (22, 15, false), (22, 16, true), 
(22, 17, true), (22, 18, true), (22, 19, false), (22, 20, false), 
(22, 21, false), (22, 22, true), (22, 23, false), (22, 24, false), 
(22, 25, false), (22, 26, false), (22, 27, true), (22, 28, false), 
(22, 29, false), (22, 30, true), (22, 31, false), (22, 32, false), 
(22, 33, true), (22, 34, true), (22, 35, true), (22, 36, false), 
(22, 37, true), (22, 38, false), (22, 39, false), (22, 40, true), 
(22, 41, true), (22, 42, true), (22, 43, false), (22, 44, false), 
(22, 45, true), (22, 46, false), (22, 47, true), (22, 48, false), 
(22, 49, false), (22, 50, false), (22, 51, false), (22, 52, false), 
(22, 53, true), (22, 54, true), (22, 55, true), (22, 56, true), 
(22, 57, false), (22, 58, true), (22, 59, false), (22, 60, false), 
(22, 61, false), (22, 62, true), (22, 63, true), (22, 64, true), 
(22, 65, true), (22, 66, true), (22, 67, true), (22, 68, false), 
(22, 69, true), (22, 70, true), (22, 71, false), (22, 72, true), 
(22, 73, true), (23, 1, true), (23, 2, false), (23, 3, false), (23, 4, false), 
(23, 5, true), (23, 6, false), (23, 7, false), (23, 8, false), 
(23, 9, false), (23, 10, false), (23, 11, false), (23, 12, false), 
(23, 13, false), (23, 14, false), (23, 15, false), (23, 16, true), 
(23, 17, false), (23, 18, true), (23, 19, false), (23, 20, true), 
(23, 21, false), (23, 22, false), (23, 23, true), (23, 24, false), 
(23, 25, true), (23, 26, true), (23, 27, false), (23, 28, true), 
(23, 29, false), (23, 30, true), (23, 31, false), (23, 32, true), 
(23, 33, true), (23, 34, false), (23, 35, false), (23, 36, false), 
(23, 37, true), (23, 38, true), (23, 39, false), (23, 40, false), 
(23, 41, true), (23, 42, true), (23, 43, true), (23, 44, true), 
(23, 45, false), (23, 46, true), (23, 47, true), (23, 48, true), 
(23, 49, true), (23, 50, true), (23, 51, false), (23, 52, false), 
(23, 53, true), (23, 54, true), (23, 55, true), (23, 56, true), 
(23, 57, true), (23, 58, true), (23, 59, false), (23, 60, false), 
(23, 61, true), (23, 62, true), (23, 63, true), (23, 64, true), 
(23, 65, true), (23, 66, false), (23, 67, false), (23, 68, false), 
(23, 69, false), (23, 70, false), (23, 71, false), (23, 72, true), 
(23, 73, true), (24, 1, false), (24, 2, true), (24, 3, true), (24, 4, true), 
(24, 5, true), (24, 6, false), (24, 7, true), (24, 8, false), 
(24, 9, true), (24, 10, false), (24, 11, false), (24, 12, false), 
(24, 13, true), (24, 14, true), (24, 15, true), (24, 16, true), 
(24, 17, false), (24, 18, true), (24, 19, true), (24, 20, true), 
(24, 21, false), (24, 22, false), (24, 23, false), (24, 24, false), 
(24, 25, false), (24, 26, false), (24, 27, true), (24, 28, true), 
(24, 29, true), (24, 30, true), (24, 31, false), (24, 32, true), 
(24, 33, false), (24, 34, true), (24, 35, true), (24, 36, false), 
(24, 37, false), (24, 38, false), (24, 39, true), (24, 40, true), 
(24, 41, false), (24, 42, true), (24, 43, true), (24, 44, false), 
(24, 45, false), (24, 46, false), (24, 47, false), (24, 48, false), 
(24, 49, false), (24, 50, true), (24, 51, true), (24, 52, false), 
(24, 53, true), (24, 54, true), (24, 55, false), (24, 56, true), 
(24, 57, false), (24, 58, false), (24, 59, true), (24, 60, false), 
(24, 61, false), (24, 62, false), (24, 63, true), (24, 64, false), 
(24, 65, true), (24, 66, false), (24, 67, true), (24, 68, true), 
(24, 69, true), (24, 70, true), (24, 71, true), (24, 72, true), 
(24, 73, true), (25, 1, true), (25, 2, false), (25, 3, true), (25, 4, false), 
(25, 5, true), (25, 6, true), (25, 7, true), (25, 8, false), 
(25, 9, false), (25, 10, true), (25, 11, false), (25, 12, true), 
(25, 13, true), (25, 14, false), (25, 15, false), (25, 16, false), 
(25, 17, true), (25, 18, false), (25, 19, true), (25, 20, true), 
(25, 21, false), (25, 22, false), (25, 23, false), (25, 24, false), 
(25, 25, false), (25, 26, false), (25, 27, false), (25, 28, false), 
(25, 29, true), (25, 30, true), (25, 31, false), (25, 32, false), 
(25, 33, true), (25, 34, true), (25, 35, true), (25, 36, false), 
(25, 37, true), (25, 38, true), (25, 39, false), (25, 40, true), 
(25, 41, true), (25, 42, false), (25, 43, false), (25, 44, true), 
(25, 45, true), (25, 46, true), (25, 47, true), (25, 48, true), 
(25, 49, true), (25, 50, false), (25, 51, true), (25, 52, false), 
(25, 53, true), (25, 54, true), (25, 55, false), (25, 56, true), 
(25, 57, true), (25, 58, true), (25, 59, true), (25, 60, false), 
(25, 61, true), (25, 62, true), (25, 63, false), (25, 64, true), 
(25, 65, false), (25, 66, true), (25, 67, false), (25, 68, true), 
(25, 69, false), (25, 70, true), (25, 71, false), (25, 72, false), 
(25, 73, false), (26, 1, true), (26, 2, true), (26, 3, false), (26, 4, true), 
(26, 5, false), (26, 6, false), (26, 7, false), (26, 8, true), 
(26, 9, false), (26, 10, false), (26, 11, false), (26, 12, true), 
(26, 13, true), (26, 14, true), (26, 15, false), (26, 16, false), 
(26, 17, false), (26, 18, false), (26, 19, false), (26, 20, false), 
(26, 21, true), (26, 22, false), (26, 23, false), (26, 24, true), 
(26, 25, true), (26, 26, false), (26, 27, false), (26, 28, false), 
(26, 29, false), (26, 30, false), (26, 31, true), (26, 32, true), 
(26, 33, false), (26, 34, true), (26, 35, false), (26, 36, false), 
(26, 37, true), (26, 38, true), (26, 39, true), (26, 40, true), 
(26, 41, true), (26, 42, false), (26, 43, true), (26, 44, true), 
(26, 45, false), (26, 46, false), (26, 47, true), (26, 48, false), 
(26, 49, true), (26, 50, true), (26, 51, false), (26, 52, false), 
(26, 53, false), (26, 54, false), (26, 55, true), (26, 56, true), 
(26, 57, true), (26, 58, false), (26, 59, true), (26, 60, false), 
(26, 61, false), (26, 62, false), (26, 63, true), (26, 64, true), 
(26, 65, true), (26, 66, false), (26, 67, true), (26, 68, false), 
(26, 69, false), (26, 70, false), (26, 71, false), (26, 72, false), 
(26, 73, false), (27, 1, true), (27, 2, false), (27, 3, false), (27, 4, false), 
(27, 5, false), (27, 6, true), (27, 7, false), (27, 8, true), 
(27, 9, true), (27, 10, true), (27, 11, false), (27, 12, false), 
(27, 13, true), (27, 14, true), (27, 15, false), (27, 16, false), 
(27, 17, false), (27, 18, true), (27, 19, true), (27, 20, false), 
(27, 21, true), (27, 22, false), (27, 23, true), (27, 24, true), 
(27, 25, false), (27, 26, false), (27, 27, false), (27, 28, true), 
(27, 29, false), (27, 30, true), (27, 31, true), (27, 32, true), 
(27, 33, false), (27, 34, false), (27, 35, false), (27, 36, true), 
(27, 37, false), (27, 38, false), (27, 39, false), (27, 40, true), 
(27, 41, false), (27, 42, true), (27, 43, true), (27, 44, true), 
(27, 45, false), (27, 46, true), (27, 47, true), (27, 48, true), 
(27, 49, true), (27, 50, false), (27, 51, false), (27, 52, true), 
(27, 53, true), (27, 54, false), (27, 55, true), (27, 56, false), 
(27, 57, false), (27, 58, true), (27, 59, true), (27, 60, false), 
(27, 61, true), (27, 62, false), (27, 63, false), (27, 64, false), 
(27, 65, false), (27, 66, true), (27, 67, false), (27, 68, false), 
(27, 69, false), (27, 70, false), (27, 71, false), (27, 72, true), 
(27, 73, false), (28, 1, false), (28, 2, true), (28, 3, true), (28, 4, true), 
(28, 5, false), (28, 6, false), (28, 7, true), (28, 8, true), 
(28, 9, true), (28, 10, true), (28, 11, true), (28, 12, false), 
(28, 13, false), (28, 14, false), (28, 15, true), (28, 16, false), 
(28, 17, true), (28, 18, false), (28, 19, true), (28, 20, false), 
(28, 21, true), (28, 22, true), (28, 23, true), (28, 24, true), 
(28, 25, true), (28, 26, true), (28, 27, true), (28, 28, false), 
(28, 29, false), (28, 30, true), (28, 31, false), (28, 32, false), 
(28, 33, false), (28, 34, true), (28, 35, true), (28, 36, true), 
(28, 37, false), (28, 38, false), (28, 39, true), (28, 40, true), 
(28, 41, true), (28, 42, false), (28, 43, false), (28, 44, true), 
(28, 45, true), (28, 46, true), (28, 47, true), (28, 48, true), 
(28, 49, false), (28, 50, true), (28, 51, true), (28, 52, false), 
(28, 53, true), (28, 54, true), (28, 55, true), (28, 56, false), 
(28, 57, true), (28, 58, true), (28, 59, true), (28, 60, false), 
(28, 61, false), (28, 62, false), (28, 63, false), (28, 64, false), 
(28, 65, true), (28, 66, true), (28, 67, true), (28, 68, true), 
(28, 69, false), (28, 70, true), (28, 71, true), (28, 72, true), 
(28, 73, true), (29, 1, true), (29, 2, true), (29, 3, false), (29, 4, true), 
(29, 5, false), (29, 6, true), (29, 7, false), (29, 8, false), 
(29, 9, true), (29, 10, true), (29, 11, true), (29, 12, true), 
(29, 13, true), (29, 14, true), (29, 15, false), (29, 16, false), 
(29, 17, true), (29, 18, false), (29, 19, false), (29, 20, false), 
(29, 21, true), (29, 22, false), (29, 23, false), (29, 24, true), 
(29, 25, true), (29, 26, true), (29, 27, false), (29, 28, false), 
(29, 29, true), (29, 30, true), (29, 31, true), (29, 32, true), 
(29, 33, true), (29, 34, false), (29, 35, true), (29, 36, true), 
(29, 37, false), (29, 38, true), (29, 39, true), (29, 40, false), 
(29, 41, false), (29, 42, false), (29, 43, false), (29, 44, true), 
(29, 45, true), (29, 46, true), (29, 47, false), (29, 48, true), 
(29, 49, true), (29, 50, false), (29, 51, false), (29, 52, false), 
(29, 53, true), (29, 54, true), (29, 55, true), (29, 56, true), 
(29, 57, false), (29, 58, false), (29, 59, false), (29, 60, false), 
(29, 61, false), (29, 62, false), (29, 63, true), (29, 64, false), 
(29, 65, false), (29, 66, true), (29, 67, false), (29, 68, false), 
(29, 69, false), (29, 70, true), (29, 71, true), (29, 72, false), 
(29, 73, true), (30, 1, false), (30, 2, false), (30, 3, false), (30, 4, true), 
(30, 5, false), (30, 6, false), (30, 7, true), (30, 8, false), 
(30, 9, false), (30, 10, true), (30, 11, false), (30, 12, true), 
(30, 13, false), (30, 14, true), (30, 15, true), (30, 16, true), 
(30, 17, true), (30, 18, true), (30, 19, false), (30, 20, true), 
(30, 21, false), (30, 22, false), (30, 23, false), (30, 24, false), 
(30, 25, true), (30, 26, true), (30, 27, true), (30, 28, false), 
(30, 29, false), (30, 30, true), (30, 31, true), (30, 32, false), 
(30, 33, false), (30, 34, false), (30, 35, false), (30, 36, true), 
(30, 37, false), (30, 38, true), (30, 39, false), (30, 40, true), 
(30, 41, true), (30, 42, false), (30, 43, true), (30, 44, true), 
(30, 45, false), (30, 46, true), (30, 47, false), (30, 48, false), 
(30, 49, true), (30, 50, false), (30, 51, true), (30, 52, false), 
(30, 53, true), (30, 54, false), (30, 55, false), (30, 56, true), 
(30, 57, true), (30, 58, false), (30, 59, true), (30, 60, true), 
(30, 61, false), (30, 62, true), (30, 63, true), (30, 64, true), 
(30, 65, true), (30, 66, false), (30, 67, false), (30, 68, true), 
(30, 69, true), (30, 70, false), (30, 71, false), (30, 72, false), 
(30, 73, true), (31, 1, false), (31, 2, true), (31, 3, false), (31, 4, false), 
(31, 5, false), (31, 6, false), (31, 7, false), (31, 8, true), 
(31, 9, false), (31, 10, true), (31, 11, true), (31, 12, false), 
(31, 13, false), (31, 14, false), (31, 15, false), (31, 16, false), 
(31, 17, false), (31, 18, false), (31, 19, false), (31, 20, false), 
(31, 21, false), (31, 22, false), (31, 23, false), (31, 24, false), 
(31, 25, false), (31, 26, true), (31, 27, false), (31, 28, true), 
(31, 29, false), (31, 30, false), (31, 31, true), (31, 32, false), 
(31, 33, true), (31, 34, false), (31, 35, false), (31, 36, true), 
(31, 37, false), (31, 38, false), (31, 39, false), (31, 40, false), 
(31, 41, true), (31, 42, false), (31, 43, true), (31, 44, false), 
(31, 45, false), (31, 46, true), (31, 47, false), (31, 48, true), 
(31, 49, false), (31, 50, false), (31, 51, false), (31, 52, false), 
(31, 53, false), (31, 54, true), (31, 55, false), (31, 56, false), 
(31, 57, false), (31, 58, true), (31, 59, false), (31, 60, false), 
(31, 61, true), (31, 62, true), (31, 63, true), (31, 64, false), 
(31, 65, true), (31, 66, false), (31, 67, false), (31, 68, true), 
(31, 69, false), (31, 70, false), (31, 71, false), (31, 72, true), 
(31, 73, true), (32, 1, true), (32, 2, true), (32, 3, true), (32, 4, false), 
(32, 5, false), (32, 6, false), (32, 7, true), (32, 8, true), 
(32, 9, false), (32, 10, true), (32, 11, true), (32, 12, false), 
(32, 13, true), (32, 14, true), (32, 15, false), (32, 16, false), 
(32, 17, true), (32, 18, false), (32, 19, false), (32, 20, true), 
(32, 21, false), (32, 22, true), (32, 23, true), (32, 24, false), 
(32, 25, true), (32, 26, false), (32, 27, false), (32, 28, true), 
(32, 29, true), (32, 30, true), (32, 31, false), (32, 32, true), 
(32, 33, true), (32, 34, false), (32, 35, false), (32, 36, true), 
(32, 37, false), (32, 38, true), (32, 39, false), (32, 40, true), 
(32, 41, false), (32, 42, true), (32, 43, false), (32, 44, true), 
(32, 45, true), (32, 46, true), (32, 47, true), (32, 48, true), 
(32, 49, false), (32, 50, true), (32, 51, true), (32, 52, false), 
(32, 53, false), (32, 54, false), (32, 55, true), (32, 56, true), 
(32, 57, true), (32, 58, true), (32, 59, true), (32, 60, true), 
(32, 61, true), (32, 62, true), (32, 63, true), (32, 64, true), 
(32, 65, true), (32, 66, false), (32, 67, false), (32, 68, true), 
(32, 69, false), (32, 70, true), (32, 71, true), (32, 72, false), 
(32, 73, false), (33, 1, true), (33, 2, false), (33, 3, false), (33, 4, false), 
(33, 5, true), (33, 6, true), (33, 7, true), (33, 8, true), 
(33, 9, false), (33, 10, false), (33, 11, false), (33, 12, false), 
(33, 13, false), (33, 14, false), (33, 15, true), (33, 16, true), 
(33, 17, true), (33, 18, true), (33, 19, true), (33, 20, false), 
(33, 21, false), (33, 22, false), (33, 23, true), (33, 24, false), 
(33, 25, true), (33, 26, false), (33, 27, false), (33, 28, false), 
(33, 29, true), (33, 30, true), (33, 31, false), (33, 32, false), 
(33, 33, false), (33, 34, true), (33, 35, false), (33, 36, false), 
(33, 37, true), (33, 38, false), (33, 39, false), (33, 40, true), 
(33, 41, true), (33, 42, false), (33, 43, false), (33, 44, false), 
(33, 45, true), (33, 46, true), (33, 47, false), (33, 48, true), 
(33, 49, false), (33, 50, false), (33, 51, false), (33, 52, true), 
(33, 53, false), (33, 54, false), (33, 55, false), (33, 56, true), 
(33, 57, true), (33, 58, true), (33, 59, false), (33, 60, false), 
(33, 61, false), (33, 62, false), (33, 63, false), (33, 64, false), 
(33, 65, false), (33, 66, false), (33, 67, false), (33, 68, false), 
(33, 69, true), (33, 70, true), (33, 71, false), (33, 72, false), 
(33, 73, false), (34, 1, false), (34, 2, true), (34, 3, true), (34, 4, true), 
(34, 5, true), (34, 6, true), (34, 7, true), (34, 8, true), 
(34, 9, true), (34, 10, false), (34, 11, false), (34, 12, false), 
(34, 13, true), (34, 14, true), (34, 15, false), (34, 16, false), 
(34, 17, true), (34, 18, false), (34, 19, true), (34, 20, true), 
(34, 21, true), (34, 22, false), (34, 23, true), (34, 24, true), 
(34, 25, false), (34, 26, true), (34, 27, true), (34, 28, false), 
(34, 29, true), (34, 30, false), (34, 31, true), (34, 32, false), 
(34, 33, false), (34, 34, true), (34, 35, true), (34, 36, true), 
(34, 37, false), (34, 38, false), (34, 39, false), (34, 40, true), 
(34, 41, true), (34, 42, false), (34, 43, true), (34, 44, true), 
(34, 45, true), (34, 46, false), (34, 47, true), (34, 48, true), 
(34, 49, false), (34, 50, true), (34, 51, false), (34, 52, false), 
(34, 53, true), (34, 54, false), (34, 55, false), (34, 56, true), 
(34, 57, true), (34, 58, false), (34, 59, true), (34, 60, true), 
(34, 61, true), (34, 62, true), (34, 63, true), (34, 64, true), 
(34, 65, false), (34, 66, false), (34, 67, true), (34, 68, false), 
(34, 69, false), (34, 70, false), (34, 71, true), (34, 72, true), 
(34, 73, true), (35, 1, false), (35, 2, true), (35, 3, true), (35, 4, true), 
(35, 5, true), (35, 6, false), (35, 7, true), (35, 8, true), 
(35, 9, false), (35, 10, false), (35, 11, false), (35, 12, false), 
(35, 13, false), (35, 14, false), (35, 15, false), (35, 16, false), 
(35, 17, false), (35, 18, true), (35, 19, false), (35, 20, false), 
(35, 21, false), (35, 22, true), (35, 23, false), (35, 24, true), 
(35, 25, false), (35, 26, false), (35, 27, false), (35, 28, true), 
(35, 29, true), (35, 30, true), (35, 31, true), (35, 32, false), 
(35, 33, true), (35, 34, false), (35, 35, true), (35, 36, false), 
(35, 37, true), (35, 38, false), (35, 39, true), (35, 40, false), 
(35, 41, false), (35, 42, true), (35, 43, true), (35, 44, false), 
(35, 45, true), (35, 46, false), (35, 47, false), (35, 48, true), 
(35, 49, false), (35, 50, false), (35, 51, true), (35, 52, false), 
(35, 53, false), (35, 54, false), (35, 55, false), (35, 56, false), 
(35, 57, true), (35, 58, true), (35, 59, false), (35, 60, false), 
(35, 61, true), (35, 62, false), (35, 63, false), (35, 64, false), 
(35, 65, true), (35, 66, true), (35, 67, false), (35, 68, false), 
(35, 69, false), (35, 70, true), (35, 71, false), (35, 72, false), 
(35, 73, true), (36, 1, true), (36, 2, true), (36, 3, false), (36, 4, false), 
(36, 5, true), (36, 6, true), (36, 7, false), (36, 8, true), 
(36, 9, true), (36, 10, false), (36, 11, true), (36, 12, true), 
(36, 13, true), (36, 14, true), (36, 15, false), (36, 16, false), 
(36, 17, false), (36, 18, true), (36, 19, true), (36, 20, false), 
(36, 21, false), (36, 22, false), (36, 23, true), (36, 24, true), 
(36, 25, true), (36, 26, false), (36, 27, true), (36, 28, false), 
(36, 29, true), (36, 30, false), (36, 31, true), (36, 32, true), 
(36, 33, false), (36, 34, false), (36, 35, false), (36, 36, false), 
(36, 37, false), (36, 38, true), (36, 39, true), (36, 40, false), 
(36, 41, true), (36, 42, false), (36, 43, false), (36, 44, false), 
(36, 45, true), (36, 46, false), (36, 47, false), (36, 48, false), 
(36, 49, false), (36, 50, false), (36, 51, false), (36, 52, true), 
(36, 53, true), (36, 54, false), (36, 55, false), (36, 56, false), 
(36, 57, true), (36, 58, true), (36, 59, false), (36, 60, true), 
(36, 61, false), (36, 62, true), (36, 63, false), (36, 64, true), 
(36, 65, false), (36, 66, false), (36, 67, false), (36, 68, true), 
(36, 69, true), (36, 70, false), (36, 71, false), (36, 72, true), 
(36, 73, false), (37, 1, false), (37, 2, false), (37, 3, true), (37, 4, true), 
(37, 5, false), (37, 6, true), (37, 7, true), (37, 8, false), 
(37, 9, true), (37, 10, true), (37, 11, false), (37, 12, true), 
(37, 13, true), (37, 14, false), (37, 15, true), (37, 16, false), 
(37, 17, false), (37, 18, false), (37, 19, false), (37, 20, false), 
(37, 21, false), (37, 22, true), (37, 23, true), (37, 24, false), 
(37, 25, true), (37, 26, false), (37, 27, true), (37, 28, false), 
(37, 29, false), (37, 30, true), (37, 31, false), (37, 32, true), 
(37, 33, false), (37, 34, false), (37, 35, true), (37, 36, true), 
(37, 37, true), (37, 38, true), (37, 39, true), (37, 40, false), 
(37, 41, false), (37, 42, false), (37, 43, true), (37, 44, true), 
(37, 45, false), (37, 46, false), (37, 47, true), (37, 48, true), 
(37, 49, false), (37, 50, false), (37, 51, true), (37, 52, false), 
(37, 53, false), (37, 54, true), (37, 55, false), (37, 56, false), 
(37, 57, false), (37, 58, true), (37, 59, true), (37, 60, true), 
(37, 61, false), (37, 62, false), (37, 63, false), (37, 64, false), 
(37, 65, true), (37, 66, true), (37, 67, false), (37, 68, true), 
(37, 69, false), (37, 70, true), (37, 71, true), (37, 72, true), 
(37, 73, true), (38, 1, true), (38, 2, false), (38, 3, false), (38, 4, true), 
(38, 5, false), (38, 6, true), (38, 7, false), (38, 8, true), 
(38, 9, false), (38, 10, false), (38, 11, false), (38, 12, false), 
(38, 13, false), (38, 14, true), (38, 15, false), (38, 16, true), 
(38, 17, false), (38, 18, false), (38, 19, false), (38, 20, true), 
(38, 21, true), (38, 22, true), (38, 23, false), (38, 24, false), 
(38, 25, true), (38, 26, false), (38, 27, true), (38, 28, false), 
(38, 29, false), (38, 30, false), (38, 31, true), (38, 32, true), 
(38, 33, false), (38, 34, false), (38, 35, true), (38, 36, true), 
(38, 37, true), (38, 38, false), (38, 39, true), (38, 40, false), 
(38, 41, false), (38, 42, true), (38, 43, true), (38, 44, false), 
(38, 45, true), (38, 46, false), (38, 47, false), (38, 48, false), 
(38, 49, false), (38, 50, true), (38, 51, true), (38, 52, false), 
(38, 53, true), (38, 54, false), (38, 55, false), (38, 56, false), 
(38, 57, true), (38, 58, true), (38, 59, true), (38, 60, true), 
(38, 61, true), (38, 62, false), (38, 63, true), (38, 64, false), 
(38, 65, true), (38, 66, true), (38, 67, false), (38, 68, false), 
(38, 69, true), (38, 70, false), (38, 71, false), (38, 72, false), 
(38, 73, true), (39, 1, true), (39, 2, false), (39, 3, false), (39, 4, true), 
(39, 5, true), (39, 6, false), (39, 7, true), (39, 8, false), 
(39, 9, true), (39, 10, false), (39, 11, false), (39, 12, false), 
(39, 13, false), (39, 14, true), (39, 15, true), (39, 16, true), 
(39, 17, false), (39, 18, true), (39, 19, false), (39, 20, true), 
(39, 21, true), (39, 22, true), (39, 23, true), (39, 24, true), 
(39, 25, false), (39, 26, false), (39, 27, false), (39, 28, true), 
(39, 29, false), (39, 30, false), (39, 31, false), (39, 32, false), 
(39, 33, true), (39, 34, true), (39, 35, false), (39, 36, true), 
(39, 37, false), (39, 38, false), (39, 39, false), (39, 40, true), 
(39, 41, true), (39, 42, true), (39, 43, true), (39, 44, false), 
(39, 45, false), (39, 46, true), (39, 47, true), (39, 48, false), 
(39, 49, false), (39, 50, true), (39, 51, true), (39, 52, false), 
(39, 53, false), (39, 54, true), (39, 55, false), (39, 56, false), 
(39, 57, false), (39, 58, true), (39, 59, true), (39, 60, true), 
(39, 61, true), (39, 62, false), (39, 63, true), (39, 64, true), 
(39, 65, true), (39, 66, true), (39, 67, false), (39, 68, true), 
(39, 69, true), (39, 70, false), (39, 71, false), (39, 72, false), 
(39, 73, true);


-- Триггеры
-- students
DELIMITER //
CREATE TRIGGER After_delete_students
AFTER DELETE
ON `Students`
FOR EACH ROW
BEGIN
	DELETE FROM `Phone_numbers`
    WHERE `Phone_numbers`.`student_id` = OLD.id;
    DELETE FROM `Marks`
    WHERE `Marks`.`student_id` = OLD.id;
    DELETE FROM `attendance`
    WHERE `attendance`.`student_id` = OLD.id;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_update_students
BEFORE UPDATE
ON `Students`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Groups WHERE Groups.id = NEW.group_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Group with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_students
BEFORE INSERT
ON `Students`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Groups WHERE Groups.id = NEW.group_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Group with this id doesn't exist in database";
    END IF;
END //


-- phone_numbers
DELIMITER //
CREATE TRIGGER Before_update_phone_numbers
BEFORE UPDATE
ON `Phone_numbers`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Students WHERE Students.id = NEW.student_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Student with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_phone_numbers
BEFORE INSERT
ON `Phone_numbers`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Students WHERE Students.id = NEW.student_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Student with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;


-- marks
DELIMITER //
CREATE TRIGGER Before_update_phone_numbers
BEFORE UPDATE
ON `Phone_numbers`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Students WHERE Students.id = NEW.student_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Student with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_phone_numbers
BEFORE INSERT
ON `Phone_numbers`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Students WHERE Students.id = NEW.student_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Student with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;


-- attendance
DELIMITER //
CREATE TRIGGER Before_update_attendanse
BEFORE UPDATE
ON `attendance`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Students WHERE Students.id = NEW.student_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Student with this id doesn't exist in database";
    END IF;
    IF (NOT EXISTS(SELECT id FROM lessons_schedule WHERE lessons_schedule.id = NEW.scedule_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Subject with this id doesn't exist in shedule";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_attendanse
BEFORE INSERT
ON `attendance`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Students WHERE Students.id = NEW.student_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Student with this id doesn't exist in database";
    END IF;
    IF (NOT EXISTS(SELECT id FROM lessons_schedule WHERE lessons_schedule.id = NEW.scedule_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Subject with this id doesn't exist in shedule";
    END IF;
END //
DELIMITER ;


-- groups
DELIMITER //
CREATE TRIGGER Before_delete_groups
BEFORE DELETE
ON `Groups`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM Students WHERE Students.group_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have students in this group. Delete them before";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_update_groups
BEFORE UPDATE
ON `Groups`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Directions WHERE Directions.id = NEW.direction_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Direction with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_groups
BEFORE INSERT
ON `Groups`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Directions WHERE Directions.id = NEW.direction_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Direction with this id doesn't exist in database";
    END IF;
END //
DELIMITER ;


-- timetable, subjects, teachers, directions
DELIMITER //
CREATE TRIGGER Before_delete_timetable
BEFORE DELETE
ON `timetable`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM lessons_schedule WHERE lessons_schedule.time_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have lessons in this time. Delete them before";
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER Before_delete_subjects
BEFORE DELETE
ON `Subjects`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM subs_teachs_dirs WHERE subs_teachs_dirs.subject_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have lessons on this subject. Delete them before";
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER Before_delete_teachers
BEFORE DELETE
ON `Teachers`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM subs_teachs_dirs WHERE subs_teachs_dirs.teacher_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have lessons with this teacher. Delete them before";
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER Before_delete_directions
BEFORE DELETE
ON `Directions`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM subs_teachs_dirs WHERE subs_teachs_dirs.direction_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have lessons with this direction. Delete them before";
    END IF;
    IF (EXISTS(SELECT id FROM Groups WHERE Groups.direction_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have groups in this direction. Delete them before";
    END IF;
END //
DELIMITER ;


-- shedule
DELIMITER //
CREATE TRIGGER Before_delete_lessons_shedule
BEFORE DELETE
ON `lessons_schedule`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM attendance WHERE attendance.scedule_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have attendances of students on this lesson. Delete them before";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_update_lessons_shedule
BEFORE UPDATE
ON `lessons_schedule`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM timetable WHERE timetable.id = NEW.time_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have lesson in timetable with this id.";
    END IF;
    IF (NOT EXISTS(SELECT id FROM subs_teachs_dirs WHERE subs_teachs_dirs.id = NEW.subject_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have lesson with this id.";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_lessons_shedule
BEFORE INSERT
ON `lessons_schedule`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM timetable WHERE timetable.id = NEW.time_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have lesson in timetable with this id.";
    END IF;
    IF (NOT EXISTS(SELECT id FROM subs_teachs_dirs WHERE subs_teachs_dirs.id = NEW.subject_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have lesson with this id.";
    END IF;
END //
DELIMITER ;


-- subs_teachs_dirs
DELIMITER //
CREATE TRIGGER Before_delete_subs_teachs_dirs
BEFORE DELETE
ON `subs_teachs_dirs`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT id FROM Marks WHERE Marks.std_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have marks of students on this lesson. Delete them before";
    END IF;
    IF (EXISTS(SELECT id FROM lessons_schedule WHERE lessons_schedule.subject_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "You have this lessons in shedule. Delete them before";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_update_subs_teachs_dirs
BEFORE UPDATE
ON `subs_teachs_dirs`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Teachers WHERE Teachers.id = NEW.teacher_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have teacher with this id.";
    END IF;
    IF (NOT EXISTS(SELECT id FROM Directions WHERE Directions.id = NEW.direction_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have direction with this id.";
    END IF;
    IF (NOT EXISTS(SELECT id FROM Subjects WHERE Subjects.id = NEW.subject_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have subject with this id.";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_insert_subs_teachs_dirs
BEFORE INSERT
ON `subs_teachs_dirs`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT id FROM Teachers WHERE Teachers.id = NEW.teacher_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have teacher with this id.";
    END IF;
    IF (NOT EXISTS(SELECT id FROM Directions WHERE Directions.id = NEW.direction_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have direction with this id.";
    END IF;
    IF (NOT EXISTS(SELECT id FROM Subjects WHERE Subjects.id = NEW.subject_id))
    	THEN SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = "Doesnt have subject with this id.";
    END IF;
END //
DELIMITER ;