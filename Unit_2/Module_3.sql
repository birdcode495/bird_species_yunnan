-- ************************** 模块 3：分类学细化 **********************************

-- 属和科分类范围内的记录数量
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan
WHERE taxonrank IN ('GENUS', 'FAMILY');

-- 计算地理坐标不确定性大于1000米且包含属和科分类范围的数据子集的统计指标
SELECT COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id)/4978.0) * 100, 2) AS 百分比,
AVG(coordinateuncertaintyinmeters) AS 平均不确定性, 
STDDEV(coordinateuncertaintyinmeters) AS 不确定度的标准差,
MIN(coordinateuncertaintyinmeters) as 最小值,
MAX(coordinateuncertaintyinmeters) AS 最大值
FROM aves_yunnan
WHERE taxonrank IN ('GENUS', 'FAMILY')
AND coordinateuncertaintyinmeters >1000;

-- 地理坐标不确定性统计模式计算（坐标值大于1000米）及属与科分类范围
SELECT coordinateuncertaintyinmeters, COUNT(*) AS frequency
FROM aves_yunnan
WHERE taxonrank IN ('GENUS', 'FAMILY') AND 
coordinateuncertaintyinmeters > 1000
GROUP BY coordinateuncertaintyinmeters ORDER BY frequency DESC
LIMIT 42;



