-- Lab4 项目数据库表结构和初始数据

-- 用户表
CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- 患者表
CREATE TABLE IF NOT EXISTS patient (
    ID VARCHAR(50) PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    ID_CARD VARCHAR(20),
    HIGHT REAL,
    WEIGHT REAL,
    MOBLEPHONE VARCHAR(20),
    DOB VARCHAR(20),
    SEX VARCHAR(10),
    CREATEDTIMETAMP VARCHAR(20)
);

-- 医生表
CREATE TABLE IF NOT EXISTS doctor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    position VARCHAR(50),
    phone VARCHAR(20)
);

-- 部门表
CREATE TABLE IF NOT EXISTS department (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200)
);

-- 初始数据
-- 添加管理员用户
INSERT OR IGNORE INTO user (username, password, role) VALUES ('admin', 'admin123', 'admin');

-- 添加一些部门数据
INSERT OR IGNORE INTO department (name, description) VALUES ('内科', '负责内科疾病的诊断和治疗');
INSERT OR IGNORE INTO department (name, description) VALUES ('外科', '负责外科疾病的诊断和治疗');
INSERT OR IGNORE INTO department (name, description) VALUES ('儿科', '负责儿童疾病的诊断和治疗');
INSERT OR IGNORE INTO department (name, description) VALUES ('妇产科', '负责妇产科疾病的诊断和治疗');

-- 添加一些医生数据
INSERT OR IGNORE INTO doctor (name, department, position, phone) VALUES ('张医生', '内科', '主任医师', '13800138001');
INSERT OR IGNORE INTO doctor (name, department, position, phone) VALUES ('李医生', '外科', '副主任医师', '13800138002');
INSERT OR IGNORE INTO doctor (name, department, position, phone) VALUES ('王医生', '儿科', '主治医师', '13800138003');
INSERT OR IGNORE INTO doctor (name, department, position, phone) VALUES ('赵医生', '妇产科', '主任医师', '13800138004');

-- 添加一些患者数据
INSERT OR IGNORE INTO patient (ID, NAME, ID_CARD, HIGHT, WEIGHT, MOBLEPHONE, DOB, SEX, CREATEDTIMETAMP) VALUES ('1001', '张三', '110101199001010001', 175.5, 70.5, '13900139001', '1990-01-01', '男', '2024-01-01');
INSERT OR IGNORE INTO patient (ID, NAME, ID_CARD, HIGHT, WEIGHT, MOBLEPHONE, DOB, SEX, CREATEDTIMETAMP) VALUES ('1002', '李四', '110101199102020002', 165.0, 55.0, '13900139002', '1991-02-02', '女', '2024-01-02');
INSERT OR IGNORE INTO patient (ID, NAME, ID_CARD, HIGHT, WEIGHT, MOBLEPHONE, DOB, SEX, CREATEDTIMETAMP) VALUES ('1003', '王五', '110101199203030003', 180.0, 85.0, '13900139003', '1992-03-03', '男', '2024-01-03');
