-- 计算记录总数
SELECT COUNT(DISTINCT id) AS 记录总数
FROM aves_yunnan;

-- 按类型分类的记录数计算
SELECT basisofrecord AS 记录类型, COUNT(DISTINCT id) AS 记录数, 
ROUND((COUNT(DISTINCT id) / 408816.0) * 100, 2) AS 百分比
FROM aves_yunnan
GROUP BY 记录类型 ORDER BY 记录数 DESC, 百分比;

-- 人类观察到的分类单元范围。
SELECT taxonrank AS 分类学范围, COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 405086.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE basisofrecord = 'HUMAN_OBSERVATION'
GROUP BY 分类学范围 ORDER BY 记录数 DESC, 百分比;


---- ****************** 作业 *******************************************

------ 按属名分类的人类观察记录计数（分类范围为属）

SELECT genus AS 属, COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 4888.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE basisofrecord = 'HUMAN_OBSERVATION' AND taxonrank = 'GENUS'
GROUP BY 属 ORDER BY 记录数 DESC, 百分比;

---- ******************************************************************


