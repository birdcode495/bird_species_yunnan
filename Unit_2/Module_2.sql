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


---- ************************** 作业 ************************************************

------ 按属名分类的人类观察记录计数（分类范围为属）

SELECT genus AS 属, COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 4888.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE basisofrecord = 'HUMAN_OBSERVATION' AND taxonrank = 'GENUS'
GROUP BY 属 ORDER BY 记录数 DESC, 百分比;

---- ********************************************************************************

-- 人类观测数据存在超过1000米的坐标不确定性
SELECT COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 405086.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE coordinateuncertaintyinmeters > 1000 AND basisofrecord = 'HUMAN_OBSERVATION';


---- ************************** 作业 *************************************************

------ 坐标不确定度超过1000米的人类观测分类范围
SELECT taxonrank AS 分类学范围, COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 4333.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE coordinateuncertaintyinmeters > 1000 AND basisofrecord = 'HUMAN_OBSERVATION'
GROUP BY 分类学范围 ORDER BY 记录数 DESC, 百分比;

---- ********************************************************************************


---- ************************** 作业 *************************************************

------ 人类观测到的物种记录中，坐标不确定度大于1000米的物种。
SELECT species AS 学名, 汉语 AS 汉语名, 英语 AS 英名, 西班牙语 AS 西班牙名, 
COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 4203.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE coordinateuncertaintyinmeters > 1000 AND basisofrecord = 'HUMAN_OBSERVATION'
GROUP BY 学名, 汉语名, 英名, 西班牙名 ORDER BY 记录数 DESC, 百分比;

---- ********************************************************************************

---- ************************** 作业 *************************************************

---- 从上一个任务创建的表格中选择一个物种，计算该物种记录中坐标不确定性大于 1000 米的百分比。

------ 人类观察到的孔雀属（Pavo muticus）物种记录总数的统计
SELECT species AS 学名, COUNT(DISTINCT id) AS 记录数
FROM aves_yunnan
WHERE species = 'Pavo muticus' AND basisofrecord = 'HUMAN_OBSERVATION'
GROUP BY 学名 ORDER BY 记录数;

------ 人类观测到的孔雀属（Pavo muticus）物种中，坐标不确定性大于1000米的记录占该物种总记录的百分比
SELECT species AS 学名, COUNT(DISTINCT id) AS 记录数,
ROUND((COUNT(DISTINCT id) / 158.0) * 100, 2) AS 百分比
FROM aves_yunnan
WHERE coordinateuncertaintyinmeters > 1000 AND basisofrecord = 'HUMAN_OBSERVATION'
AND species = 'Pavo muticus'
GROUP BY 学名 ORDER BY 记录数, 百分比;

---- ********************************************************************************












