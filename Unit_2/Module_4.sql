-- ****************************** 模块 4：临时调试 *****************************

---- **************************** 作业 ***********************************

------ 不同日期坐标不确定性统计指标的回顾
SELECT COUNT(DISTINCT id) AS 记录数,
AVG(coordinateuncertaintyinmeters) AS 统计均值,
STDDEV(coordinateuncertaintyinmeters) AS 标准差,
MIN(coordinateuncertaintyinmeters) AS 最小值,
MAX(coordinateuncertaintyinmeters) AS 最大值
FROM aves_yunnan
WHERE year < 1900;

------ 1900 年以前的记录在临时清理之前的数量
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan;

------ 删除不适合分析的记录
DELETE FROM aves_yunnan
WHERE 
year < 1900;

------ 1900 年前的记录数量（经过临时清理后)
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan;

------ 不同日期坐标不确定性统计指标的回顾
SELECT COUNT(DISTINCT id) AS 记录数,
AVG(coordinateuncertaintyinmeters) AS 统计均值,
STDDEV(coordinateuncertaintyinmeters) AS 标准差,
MIN(coordinateuncertaintyinmeters) AS 最小值,
MAX(coordinateuncertaintyinmeters) AS 最大值
FROM aves_yunnan
WHERE year < 1950 AND coordinateuncertaintyinmeters > 1000;


---- ***************************** 作业结束 *******************************
