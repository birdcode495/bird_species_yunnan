-- 属和科分类范围内的记录数量
SELECT COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan
WHERE taxonrank IN ('GENUS', 'FAMILY');

