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

------ 1950 年以前的记录在临时清理之前的数量
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan;

------ 删除不适合分析的记录
DELETE FROM aves_yunnan
WHERE 
year < 1950 AND coordinateuncertaintyinmeters > 1000;

------ 1950 年前的记录数量（经过临时清理后)
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan;
---- ************************** 作业结束 **********************************

---- **************************** 作业 ***********************************

------ 计算缺失日期（数据收集年份或月份）记录的统计指标
SELECT COUNT(DISTINCT id) AS 记录数,
AVG(coordinateuncertaintyinmeters) AS 统计均值,
STDDEV(coordinateuncertaintyinmeters) AS 标准差,
MIN(coordinateuncertaintyinmeters) AS 最小值,
MAX(coordinateuncertaintyinmeters) AS 最大值
FROM aves_yunnan
WHERE (year IS NULL OR month IS NULL) AND coordinateuncertaintyinmeters > 1000;

------ 删除缺少日期信息的行之前的记录数
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan;

------ 删除不适合分析的记录
DELETE FROM aves_yunnan
WHERE 
(year IS NULL OR month IS NULL) AND coordinateuncertaintyinmeters > 1000;

------ 删除缺少日期信息的行后，记录数为多少？
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan;

---- ************************** 作业结束 **********************************







