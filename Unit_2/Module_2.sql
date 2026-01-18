-- 计算记录总数
SELECT COUNT(DISTINCT id) AS 记录总数
FROM aves_yunnan;

-- 按类型分类的记录数计算
SELECT basisofrecord AS 记录类型, COUNT(DISTINCT id) AS 记录数, 
ROUND((COUNT(DISTINCT id) / 408816.0) * 100, 2) AS 百分比
FROM aves_yunnan
GROUP BY 记录类型 ORDER BY 记录数 DESC, 百分比;

