-- 项目启动
CREATE EXTENSION postgis;

-- 创建包含多种语言常用名称的列（汉语、英语、西班牙语、法语、德语、俄语、日语、葡萄牙语、白语、彝语）
ALTER TABLE aves_yunnan ADD COLUMN 汉语 varchar(70), ADD COLUMN 英语 varchar(70),
ADD COLUMN 西班牙语 varchar(70), ADD COLUMN 法语 varchar(70), ADD COLUMN 德语 varchar(70), 
ADD COLUMN 俄语 varchar(70), ADD COLUMN 日语 varchar(70), ADD COLUMN 葡萄牙语 varchar(70),
ADD COLUMN 白语 varchar(70), ADD COLUMN 彝语 varchar(70);