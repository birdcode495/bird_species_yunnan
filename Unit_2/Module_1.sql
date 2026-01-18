-- 项目启动
CREATE EXTENSION postgis;

-- 创建包含多种语言常用名称的列（汉语、英语、西班牙语、法语、德语、俄语、日语、葡萄牙语、白语、彝语）
ALTER TABLE aves_yunnan ADD COLUMN 汉语 varchar(70), ADD COLUMN 英语 varchar(70),
ADD COLUMN 西班牙语 varchar(70), ADD COLUMN 法语 varchar(70), ADD COLUMN 德语 varchar(70), 
ADD COLUMN 俄语 varchar(70), ADD COLUMN 日语 varchar(70), ADD COLUMN 葡萄牙语 varchar(70),
ADD COLUMN 白语 varchar(70), ADD COLUMN 彝语 varchar(70);

-- 为各种语言中的物种分配通用名称
---- 汉语
UPDATE aves_yunnan SET 汉语 = multilingual_ioc.chinese FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 英语
UPDATE aves_yunnan SET 英语 = multilingual_ioc.english FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 西班牙语
UPDATE aves_yunnan SET 西班牙语 = multilingual_ioc.spanish FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 法语
UPDATE aves_yunnan SET 法语 = multilingual_ioc.french FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 德语
UPDATE aves_yunnan SET 德语 = multilingual_ioc.german FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 俄语
UPDATE aves_yunnan SET 俄语 = multilingual_ioc.russian FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 日语
UPDATE aves_yunnan SET 日语 = multilingual_ioc.japanese FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

---- 葡萄牙语
UPDATE aves_yunnan SET 葡萄牙语 = multilingual_ioc.portuguese FROM multilingual_ioc
WHERE aves_yunnan.species = multilingual_ioc.ioc_13;

-- 创建指向GBIF和百度物种记录的URL链接

---- 专栏创建
ALTER TABLE aves_yunnan ADD COLUMN gbif varchar(100), ADD COLUMN 百度 varchar(100);

---- 创建指向网页的链接
UPDATE aves_yunnan SET gbif = 'https://www.gbif.org/zh/species/' || specieskey;
UPDATE aves_yunnan SET 百度 = 'https://baike.baidu.com/item/' || 汉语;
