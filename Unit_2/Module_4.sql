-- ****************************** 模块 4：临时调试 *****************************

---- 不同日期坐标不确定性统计指标的回顾
SELECT COUNT(DISTINCT id) AS records,
AVG(coordinateuncertaintyinmeters) AS media,
STDDEV(coordinateuncertaintyinmeters) AS desviacion,
MIN(coordinateuncertaintyinmeters) AS minimum,
MAX(coordinateuncertaintyinmeters) AS maximum
FROM aves_yunnan
WHERE year < 1900;

