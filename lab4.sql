-- создание индексов 
CREATE INDEX idx_code ON Н_ОЦЕНКИ using btree(КОД);
CREATE INDEX idx_vedomosti_human_id ON Н_ВЕДОМОСТИ using hash(ЧЛВК_ИД);

-- Запрос 
EXPLAIN ANALYZE
SELECT Н_ОЦЕНКИ.КОД, Н_ВЕДОМОСТИ.ИД
FROM Н_ОЦЕНКИ
INNER JOIN Н_ВЕДОМОСТИ ON Н_ОЦЕНКИ.КОД = Н_ВЕДОМОСТИ.ОЦЕНКА
WHERE Н_ОЦЕНКИ.КОД < 'неявка'
AND Н_ВЕДОМОСТИ.ЧЛВК_ИД = 117219;


-- Создание индексов
CREATE INDEX idx_human_id ON Н_ЛЮДИ using btree(ИД);
CREATE INDEX idx_vedomosti_id ON Н_ВЕДОМОСТИ using btree(ИД);

-- Запрос 
EXPLAIN ANALYZE
SELECT Н_ЛЮДИ.ФАМИЛИЯ, Н_ВЕДОМОСТИ.ЧЛВК_ИД, Н_СЕССИЯ.ИД
FROM Н_ЛЮДИ
INNER JOIN Н_ВЕДОМОСТИ ON Н_ВЕДОМОСТИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
INNER JOIN Н_СЕССИЯ ON Н_СЕССИЯ.ЧЛВК_ИД = Н_ВЕДОМОСТИ.ЧЛВК_ИД
WHERE Н_ЛЮДИ.ИД > 100865
  AND Н_ВЕДОМОСТИ.ИД > 1457443
  AND Н_СЕССИЯ.ДАТА = '2002-01-04';