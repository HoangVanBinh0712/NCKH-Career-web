-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: careerwebsite
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_confirm` bit(1) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `avatar_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c0r9atamxvbhjjvy5j8da1kam` (`email`),
  KEY `FK3d2i4to51p7w2kaoudn9ev03f` (`avatar_id`),
  KEY `FK4ey6tpx7rtrtkm2eufmfnbmlf` (`city_id`),
  CONSTRAINT `FK3d2i4to51p7w2kaoudn9ev03f` FOREIGN KEY (`avatar_id`) REFERENCES `media_resource` (`id`),
  CONSTRAINT `FK4ey6tpx7rtrtkm2eufmfnbmlf` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,_binary '','thu duc',NULL,'thebest11447@gmail.com',_binary '','Hoang Van Binh','$2a$10$BpGcCwmcnlUHhgrsleKGMuXGPJFXAtcxncZhrpD/ah/tRfyR4cRQK','0337445596',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_p738egrkomomgourst3hqfipb` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'ho-chi-minh','TP Hồ Chí Minh'),(2,'binh-duong','Bình Dương'),(3,'dong-nai','Đồng Nai'),(4,'an-giang','An Giang'),(5,'ba-ria-vung-tau','Bà Rịa – Vũng Tàu'),(6,'bac-giang','Bắc Giang'),(7,'bac-kan','Bắc Kạn'),(8,'bac-lieu','Bạc Liêu'),(9,'bac-ninh','Bắc Ninh'),(10,'ben-tre','Bến Tre'),(11,'binh-dinh','Bình Định'),(12,'binh-phuoc','Bình Phước'),(13,'binh-thuan','Bình Thuận'),(14,'ca-mau','Cà Mau'),(15,'can-tho','Cần Thơ'),(16,'cao-bang','Cao Bằng '),(17,'da-nang','Đà Nẵng'),(18,'dak-lak','Đắk Lắk'),(19,'dak-nong','Đắk Nông'),(20,'dien-bien','Điện Biên'),(21,'dong-thap','Đồng Tháp'),(22,'gia-lai','Gia Lai'),(23,'ha-giang','Hà Giang'),(24,'ha-nam','Hà Nam'),(25,'ha-noi','Hà Nội '),(26,'ha-tinh','Hà Tĩnh'),(27,'hai-duong','Hải Dương'),(28,'hai-phong','Hải Phòng'),(29,'hau-giang','Hậu Giang'),(30,'hoa-binh','Hòa Bình'),(31,'hung-yen','Hưng Yên'),(32,'khanh-hoa','Khánh Hòa'),(33,'kien-giang','Kiên Giang'),(34,'kon-tum','Kon Tum'),(35,'lai-chau','Lai Châu'),(36,'lam-dong','Lâm Đồng'),(37,'lang-son','Lạng Sơn'),(38,'lao-cai','Lào Cai'),(39,'long-an','Long An'),(40,'nam-dinh','Nam Định'),(41,'nghe-an','Nghệ An'),(42,'ninh-binh','Ninh Bình'),(43,'ninh-thuan','Ninh Thuận'),(44,'phu-tho','Phú Thọ'),(45,'phu-yen','Phú Yên'),(46,'quang-binh','Quảng Bình'),(47,'quang-nam','Quảng Nam'),(48,'quang-ngai','Quảng Ngãi'),(49,'quang-ninh','Quảng Ninh'),(50,'quang-tri','Quảng Trị'),(51,'soc-trang','Sóc Trăng'),(52,'son-la','Sơn La'),(53,'tay-ninh','Tây Ninh'),(54,'thai-binh','Thái Bình'),(55,'thai-nguyen','Thái Nguyên'),(56,'thanh-hoa','Thanh Hóa'),(57,'thua-thien-hue','Thừa Thiên Huế'),(58,'tien-giang','Tiền Giang'),(59,'tra-vinh','Trà Vinh'),(60,'tuyen-quang','Tuyên Quang'),(61,'vinh-long','Vĩnh Long'),(62,'vinh-phuc','Vĩnh Phúc'),(63,'yen-bai','Yên Bái');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cvsubmit`
--

DROP TABLE IF EXISTS `cvsubmit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cvsubmit` (
  `media_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `match_percent` bigint DEFAULT NULL,
  PRIMARY KEY (`media_id`,`post_id`,`user_id`),
  KEY `FKqku9e8075xelp7tm8ilymcu1x` (`post_id`),
  KEY `FKt99c8dc7ivt24v2lef9neah3j` (`media_id`,`user_id`),
  CONSTRAINT `FKqku9e8075xelp7tm8ilymcu1x` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKt99c8dc7ivt24v2lef9neah3j` FOREIGN KEY (`media_id`, `user_id`) REFERENCES `profile` (`media_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cvsubmit`
--

LOCK TABLES `cvsubmit` WRITE;
/*!40000 ALTER TABLE `cvsubmit` DISABLE KEYS */;
INSERT INTO `cvsubmit` VALUES (13,2,1,'2022-08-31 16:53:12.402000',50),(17,1,2,'2022-08-31 16:53:53.706000',28),(17,2,2,'2022-08-31 16:53:55.032000',20),(24,1,1,'2022-09-06 21:48:15.349000',55);
/*!40000 ALTER TABLE `cvsubmit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_confirm` bit(1) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `employee` bigint DEFAULT NULL,
  `avatar_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `field_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kde6jr4yp7v8fc949kh1tgyvp` (`email`),
  KEY `FK9lri5v2cof2l56nmqw6jy3pga` (`avatar_id`),
  KEY `FKnopx5tkgjmuiy628hawfjbl99` (`city_id`),
  KEY `FKbjyob07n475lihd1erldl9c6j` (`field_id`),
  CONSTRAINT `FK9lri5v2cof2l56nmqw6jy3pga` FOREIGN KEY (`avatar_id`) REFERENCES `media_resource` (`id`),
  CONSTRAINT `FKbjyob07n475lihd1erldl9c6j` FOREIGN KEY (`field_id`) REFERENCES `field` (`id`),
  CONSTRAINT `FKnopx5tkgjmuiy628hawfjbl99` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,_binary '','Thủ đức',NULL,'cnttcompany@gmail.com',_binary '\0','Công ty CNTT TP Hồ Chí Minh','$2a$10$iW7nt914s/kEU1seUdpBOumwAbVDi6S4ixG.uUBjNQfxsd8DGh.rq','0904730050',300,33,1,9),(2,_binary '','Ba đình',NULL,'contructcompay@gmail.com',_binary '\0','Xây dựng','$2a$10$HEWcKxY9m4zr6oOqNuSZkug3vOcED5Y/4cyC2TvRfXKFYRTO8MhDW','0810810810',100,23,6,15),(3,_binary '','Cửu long',NULL,'salecompany@gmail.com',_binary '\0','Công ty bán hàng','$2a$10$HEWcKxY9m4zr6oOqNuSZkug3vOcED5Y/4cyC2TvRfXKFYRTO8MhDW','0987123458',100,21,5,26);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bpg2hvntg0iitx56dwrfu9ryo` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
INSERT INTO `field` VALUES (4,'businessdevelopment','Business Development'),(5,'aviation','Aviation'),(6,'banking','Banking'),(7,'publicrelations','Bublic Relations'),(8,'chef','Chef'),(9,'accountant','Accountant'),(10,'teacher','Teacher'),(11,'consultant','Consultant'),(12,'digitalmedia','Digitalmedia'),(13,'apparel','Apparel'),(14,'javadeveloper','Java Developer'),(15,'construction','Construction'),(16,'testing','Testing'),(17,'finance','Finance'),(18,'agriculture','Agriculture'),(19,'devopsengineer','Devops Engineer'),(20,'pythondeveloper','Python Developer'),(21,'webdesigning','Web Designing'),(22,'hr','HR'),(23,'hadoop','Hadoop'),(24,'blockchain','Blockchain'),(25,'mechanicalengineer','Mechanical Engineer'),(26,'sales','Sales'),(27,'etldeveloper','Etl Developer'),(28,'operationsmanager','Operations Manager'),(29,'datascience','Data Science'),(30,'arts','Arts'),(31,'automobile','Automobile'),(32,'database','Database'),(33,'healthandfitness','Health and Fitness'),(34,'pmo','PMO'),(35,'electricalengineering','Electrical Engineering'),(36,'dotnetdeveloper','Dot Net Developer'),(37,'businessanalyst','Business Analyst'),(38,'automationtesting','Automation Testing'),(39,'networksecurityengineer','Network Security Engineer'),(40,'civilengineer','Civil Engineer'),(41,'sapdeveloper','SAP Developer'),(42,'bpo','BPO'),(43,'advocate','Advocate'),(44,'engineering','Engineering');
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_resource`
--

DROP TABLE IF EXISTS `media_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `public_id` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `url` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_resource`
--

LOCK TABLES `media_resource` WRITE;
/*!40000 ALTER TABLE `media_resource` DISABLE KEYS */;
INSERT INTO `media_resource` VALUES (7,'bmejppt91gy8cw3yc5yr','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1661825343/bmejppt91gy8cw3yc5yr.pdf'),(13,'xfw2vy2x5umoobluqatv','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1661855157/xfw2vy2x5umoobluqatv.pdf'),(14,'wms2n0tuis6wwxeq9qww','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1661857116/wms2n0tuis6wwxeq9qww.pdf'),(17,'tksiuixdbqcudvuujnb6','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1661938642/tksiuixdbqcudvuujnb6.pdf'),(21,'rkzwag8ak0jmgwggc7iz','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1661941543/rkzwag8ak0jmgwggc7iz.jpg'),(23,'j1clradpfcsemmecel9r','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1661941720/j1clradpfcsemmecel9r.jpg'),(24,'roydzvsgcvllvk1gst8j','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1662475651/roydzvsgcvllvk1gst8j.pdf'),(25,'h9aczrxiykosponaiphz','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1664373880/h9aczrxiykosponaiphz.pdf'),(33,'tha7gjzpoy3mrudrmxtc','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666017246/tha7gjzpoy3mrudrmxtc.jpg'),(34,'xdnn2ueiktdt5dak4l2v','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666017564/xdnn2ueiktdt5dak4l2v.webp'),(36,'cw45gp5oyc7ch93kbeyn','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666067002/cw45gp5oyc7ch93kbeyn.webp'),(37,'vsp9zyfy7klu6s3qa6dj','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666067020/vsp9zyfy7klu6s3qa6dj.jpg'),(45,'geeh3eervohzwyecxgit','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666108546/geeh3eervohzwyecxgit.jpg'),(46,'t1vsj5dxzzg2clgoiakm','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666150310/t1vsj5dxzzg2clgoiakm.jpg'),(47,'vsafdpnhupregpiazpiy','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666150511/vsafdpnhupregpiazpiy.jpg'),(48,'dbhhxivbvsgxhc2hjyy8','image','https://res.cloudinary.com/dwezyh13q/image/upload/v1666150675/dbhhxivbvsgxhc2hjyy8.jpg');
/*!40000 ALTER TABLE `media_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accepted_date` datetime(6) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `expiration_date` datetime(6) NOT NULL,
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recruit` bigint DEFAULT NULL,
  `salary` bigint NOT NULL,
  `salary_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `accepted_by` bigint DEFAULT NULL,
  `avatar_id` bigint DEFAULT NULL,
  `city` bigint DEFAULT NULL,
  `author` bigint DEFAULT NULL,
  `field` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfgna97yh882924tk04695xq9y` (`accepted_by`),
  KEY `FKn0yjnh7nawba0pauh69o6sxgf` (`avatar_id`),
  KEY `FKgujw94bnvv7w9j8eyd4mymrtf` (`city`),
  KEY `FKjt5qelg59dl30kurr2nb7ljf8` (`author`),
  KEY `FKvuyp3gdvyjcdoy88c49fmadu` (`field`),
  CONSTRAINT `FKfgna97yh882924tk04695xq9y` FOREIGN KEY (`accepted_by`) REFERENCES `admin` (`id`),
  CONSTRAINT `FKgujw94bnvv7w9j8eyd4mymrtf` FOREIGN KEY (`city`) REFERENCES `city` (`id`),
  CONSTRAINT `FKjt5qelg59dl30kurr2nb7ljf8` FOREIGN KEY (`author`) REFERENCES `employer` (`id`),
  CONSTRAINT `FKn0yjnh7nawba0pauh69o6sxgf` FOREIGN KEY (`avatar_id`) REFERENCES `media_resource` (`id`),
  CONSTRAINT `FKvuyp3gdvyjcdoy88c49fmadu` FOREIGN KEY (`field`) REFERENCES `field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2022-10-06 17:11:28.354000','2022-10-18 11:23:21.150000','Java Software Engineer responsibilities include: • Analyzing user and system requirements • Designing flowcharts to illustrate software solutions • Writing efficient code based on feature specifications Job brief We are looking for a Java Software Engineer to help us build functional products and applications. Java Software Engineer responsibilities include defining software requirements, writing clean and efficient code for various applications and running tests to improve system functionality. If you have hands-on experience with programming in Java and are interested in agile methodologies, we’d like to meet you. Ultimately, you’ll implement and maintain Java components and frameworks throughout the software development life cycle. Responsibilities • Analyze user and system requirements • Design flowcharts to illustrate software solutions • Write efficient code based on feature specifications • Develop user interfaces • Prioritize and execute tasks in the software development life cycle • Design database architecture • Test and debug Java applications • Validate software functionality and security Requirements • Work experience as a Java Software Engineer, Java Developer or similar role • Experience building Java EE applications • Experience in JSP/Servlet, Hibernate, JDBC, Swing • Familiarity with Object-Oriented Design (OOD) • Well verse with web Technologies such as HTML, CSS, Ajax, Javascript • Good knowledge of popular Java frameworks like JSF and Spring MVC • Experience with test-driven development • Problem-solving skills • BSc in Computer Science, Engineering or relevant field','2022-12-15 07:00:00.000000','Hải Phòng 01',50,13,'MILLION','Quản lý dự án phần mềm',1,36,1,1,14),(2,'2022-08-30 10:12:36.120000','2022-10-18 11:23:36.119000','CAREER OBJECTIVE Having 10 year of experience as a Python Developer. Having experience in developing web applications using Python and Django Knowledge on front end designing HTML, CSS. Through knowledge of Object Oriented Programming. Exceptional ability to work independently with a team of Python coders. Ability to learn and adapt quickly and to correctly apply new tools and technologies. Self-starter who can prioritize in order to meet deadlines. Capable of working alone as well as a team player with strong interpersonal skills. PROFESSIONAL EXPERIENCE Python Developer Company Name, Location – August 2017 to Present Description: Transport management system is a system used to manage Driving Licenses that are to be maintained in Transport Authority of Oregon State in U.S. This application deals with Issue, Renewal and Cancellation of Driving Licenses, Issuing, Renewal ID Cards, Customer Management, Transaction and Financial Management and Insurance Management etc. Roles& Responsibilities: Monitoring and finding the issues in the platform. Developing and improving the performance issues in the platform. Performing code coverage and standardization. Preparing user interfaces for the application. Ensuring that the applications being developed can be used by non-technical person. Getting thoroughly involved in the programming of web based applications. Involved in writing test cases script using python. Python Developer Company Name, Location – 2016 Roles& Responsibilities: Developed SQL Queries, Stored Procedures, and Triggers Using Oracle, SQL, PL/SQL. Responsible for debugging and troubleshooting the web application. Supported user groups by handling target-related software issues/service requests, identifying/fixing bugs. Involved in Agile Methodologies and SCRUM Process. Worked through the entire lifecycle of the projects including Design, Development, and Deployment, Testing and Implementation and support. EDUCATIONAL QUALIFICATIONS Course (Stream)/ Examination Institution/University/School Year of Passing Performance BCA SRM College of Engineering and Technology – Chennai 2016 90% HSC K.C.S Higher Secondary School 2013 84% SSLC D.L.S Higher Secondary School 2011 80% ADDITIONAL INFORMATION Technical Skills:- Operating System: Windows Languages: Python DBMS: MySQL Web Technologies: HTML, CSS. Web Framework: Django. Editors: IDLE, notepad++ Methodologies Agile, Waterfall Operating Systems Window, Linux(Ubuntu, Fedora) Testing tools Unittest, pytest Messaging Queue’s RabbitMQ DECLARATION: I hereby declare that all the information given above are true to the best of my knowledge and belief.','2022-12-15 07:00:00.000000','Hải Phòng 01',50,13,'MILLION','Quản lý dự án phần mềm',1,37,2,1,14),(5,NULL,'2022-08-31 17:44:33.042000','Mô tả công việc\n- Tư vấn hỗ trợ khách hàng qua điện thoại sản phẩm và dịch vụ của công ty (Thiết bị gia dụng điện tử).\n\n- Chốt đơn, theo dõi đơn hàng.\n\n- Được cung cấp trang thiết bị\n\n- Làm việc tại văn phòng.\n\n- Thời gian làm việc: 8h15-17h30 ( nghỉ trưa 12h-13h30), 1 tuần off 1 ngày\n\nYêu cầu công việc\n- Chăm chỉ, trung thực, vui vẻ, hòa đồng, nhanh nhẹn\n\n- Độ Tuổi từ 18-30 tuổi ( 2003-1992)\n\nQuyền lợi\n- THU NHẬP ỔN ĐỊNH: 8-15 triệu (lương cứng + TỪ 7% hoa hồng +40K/đơn hàng)+ thưởng nóng\n\n- Được làm việc trong môi trường chuyên nghiệp, năng động, cơ chế linh hoạt\n\n- Được đào tạo\n\n- Được tham gia đóng BHXH, BHYT, BHTN\n\n- Được hưởng các quyền lợi theo quy định của bộ luật lao động và theo quy chế của công ty.\n\n- KHÔNG YÊU CẦU KINH NGHIỆM','2022-08-31 07:00:00.000000','Lầu 6 Tòa Nhà Thái An, 2290 Quốc Lộ 1A, P.Trung Mỹ Tây,Q12, Tp.Hồ Chí Minh.',10,15,'MILLION','Nhân Viên Tư Vấn Làm Việc Tại Văn Phòng Lương Trên 15 Triệu',NULL,NULL,1,2,11),(6,NULL,'2022-10-18 21:37:24.468000','Công ty TNHH Panel Plus Việt Nam - chuyên sản xuất, phân phối sản phẩm gỗ công nghiệp của Thái Lan: MDF, MFC, PB, HDF..., cần tuyển GẤP vị trí nhân viên marketing thực hiện:\n\nTheo dõi và báo cáo hiệu suất của tất cả các chiến dịch markting online và offline.\nPhát triển chiến lược Marketing online và lên nội dung quảng cáo trên tất cả các nền tảng trực tuyến.\nThực hiện marketing theo xu hướng thị trường, phân tích đối thủ cạnh tranh và hiểu biết sâu sắc thị trường để phát triển chiến lược.\nKhám phá các khách hàng mới / nguồn tiềm năng để phát triển thiết kế mới của sản phẩm.\nChi tiết công việc trao đổi khi phỏng vấn.','2025-12-12 07:00:00.000000','Bình thạnh',12,12,'MILLION','Công Ty Gỗ',1,NULL,1,1,17),(7,'2022-10-06 17:15:16.688000','2022-10-19 10:35:08.964000','Mô tả công việc\n Lập kế hoạch Digital Marketing, triển khai, theo dõi và báo cáo chiến dịch quảng cáo sản phẩm và hình ảnh thương hiệu trên các nền tảng.\nXây dựng và quản lý tối ưu hóa các kênh quảng cáo trực tuyến (Google Ads, Facebook, Youtube, Zalo, Email Marketing...).\nLập kế hoạch, triển khai chiến dịch quảng bá và xây dựng thương hiệu qua SEO/SEM, Online Advertising, Affiliate Marketing, ... - bao gồm thử nghiệm, triển khai và đánh giá kết quả.\nLập kế hoạch, điều phối, phối hợp với Content Marketing để phát triển các kênh Marketing Online đảm bảo các kết quả đã đặt ra.\nPhân tích và báo cáo hiệu quả hoạt động truyền thông Digital Marketing, từ đó đưa ra đề xuất nâng cao chất lượng truyền thông Digital Marketing.\nUpdate các xu hướng truyền thông mới phù hợp với thương hiệu.\nCác công việc khác theo yêu cầu của quản lý trực tiếp và công ty.\nYêu cầu ứng viên\nCó ít nhất 2 năm kinh nghiệm trong vị trí tương đương (lĩnh vực truyền thông, quảng cáo, digital marketing).\nAm hiểu về Digital Marketing và các công cụ Google Ads, Facebook Ads, Viral Video, E-Marketing…, có kinh nghiệm quản lý website.\nCó kinh nghiệm xây dựng và quản lý nội dung quảng cáo (ý tưởng về nội dung, trình bày nội dung, ý tưởng hình ảnh & video...).\nCó kỹ năng tổng hợp, thành thạo phân tích data và report, có khả năng tư duy làm việc độc lập và teamwork.\nTrung thực, nhanh nhẹn, cầu tiến, nghiêm túc trong công việc.\nBằng cấp: Đại học\nĐộ tuổi: Không giới hạn\nHình thức: Nhân viên chính thức.\nQuyền lợi\n Lương 15tr-20tr + KPIs ( Có kinh nghiệm chạy ads facebook ads, google ads, … )\n Thời gian làm việc: Thứ 2 – Thứ 6 : 9h-18h ; 2 ngày thứ 7 xen kẽ trong tháng\n Địa điểm làm việc: 237 Nguyễn Trãi, Phường Nguyễn Cư Trinh, Quận 1\n Xét tăng lương 6 tháng/lần , có lộ trình thăng tiến rõ ràng Được tham gia các hoạt động chung của công ty: team building, happy hour...\n Được thỏa sức sáng tạo trong công việc\nĐóng BHXH theo quy định luật lao động\n Môi trường làm việc trẻ trung, năng động và sáng tạo\n Lương theo thỏa thuận Thời gian làm việc: Thứ 2 – Thứ 6 : 9h-18h ; 2 ngày thứ 7 xen kẽ trong tháng.','2025-12-12 07:00:00.000000','319B2 Lý Thường Kiệt , Phường 15, Quận 11, Thành phố Hồ Chí Minh, Việt Nam\n',23,12,'MILLION','Nhân Viên Digital Marketing',1,47,2,1,17),(8,NULL,'2022-09-27 22:08:21.984000','Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.','2022-12-12 07:00:00.000000','123213213a',12,12,'MILLION','12312321',NULL,NULL,2,1,17),(9,NULL,'2022-10-19 10:31:47.407000','Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.\nMaterial Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.Material Icons\nMaterial Icons are available in five styles and a range of downloadable sizes and densities. The icons are based on the core Material Design principles and metrics.','2022-12-12 07:00:00.000000','Dĩ An',12,12,'MILLION','Công việc số 1',1,46,2,1,17),(10,NULL,'2022-09-27 22:11:21.521000','\"Skills * Programming Languages: Python (pandas, numpy, scipy, scikit-learn, matplotlib), Sql, Java, JavaScript/JQuery. * Machine learning: Regression, SVM, Na????ve Bayes, KNN, Random Forest, Decision Trees, Boosting techniques, Cluster Analysis, Word Embedding, Sentiment Analysis, Natural Language processing, Dimensionality reduction, Topic Modelling (LDA, NMF), PCA & Neural Nets. * Database Visualizations: Mysql, SqlServer, Cassandra, Hbase, ElasticSearch D3.js, DC.js, Plotly, kibana, matplotlib, ggplot, Tableau. * Others: Regular Expression, HTML, CSS, Angular 6, Logstash, Kafka, Python Flask, Git, Docker, computer vision - Open CV and understanding of Deep learning.Education Details \n\nData Science Assurance Associate \n\nData Science Assurance Associate - Ernst & Young LLP\nSkill Details \nJAVASCRIPT- Exprience - 24 months\njQuery- Exprience - 24 months\nPython- Exprience - 24 monthsCompany Details \ncompany - Ernst & Young LLP\ndescription - Fraud Investigations and Dispute Services   Assurance\nTECHNOLOGY ASSISTED REVIEW\nTAR (Technology Assisted Review) assists in accelerating the review process and run analytics and generate reports.\n* Core member of a team helped in developing automated review platform tool from scratch for assisting E discovery domain, this tool implements predictive coding and topic modelling by automating reviews, resulting in reduced labor costs and time spent during the lawyers review.\n* Understand the end to end flow of the solution, doing research and development for classification models, predictive analysis and mining of the information present in text data. Worked on analyzing the outputs and precision monitoring for the entire tool.\n* TAR assists in predictive coding, topic modelling from the evidence by following EY standards. Developed the classifier models in order to identify \"\"red flags\"\" and fraud-related issues.\n','2022-12-12 07:00:00.000000','123213213a',12,12,'MILLION','12312321',NULL,NULL,2,1,17),(15,NULL,'2022-10-18 22:55:43.261000','Quần què\nDĩ dãng dơ dáy dễ dì giấu diếm\n? Kích thước sp có 2 size :size M và size L\n\nSize M: dùng cho người có khối lượng 40-50kg\n\nSize L: Dành cho người có khối lượng 50-60kg\n\n?Chất liệu: vải cotton cao cấp phong cách nữ tính, trẻ trung.\n\n?Màu sắc có 8 màu : trắng, hồng, đỏ, xanh, đen, tím, màu da đậm, màu da nhạt \n\n♥️ Style: Korea \n\n♥️ QUẦN LOT NỮ THUN LẠNH  không những là món phụ kiện thời trang mà còn là vũ khí thể hiện sự sexxy của bạn\n\nHãy chọn cho mình 1 màu phù hợp nhé...\n\n❤️ Trong thế giới thời trang của phái đẹp chiếc QUẦN LÓT NỮ MÀU HỒNG luôn chiếm một vị trí quan trọng.\n','2022-12-12 07:00:00.000000','Thuận An',12,12,'THOUSAND','Công Việc Số 2',1,45,2,1,17),(16,NULL,'2022-10-19 10:37:53.103000','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01\n\n\nQUẦN LÓT NỮ  đẹp phong cách hàn quốc\n\nQUẦN LÓT\n\n? Kích thước sp có 2 size :size M và size L\n\nSize M: dùng cho người có khối lượng 40-50kg\n\nSize L: Dành cho người có khối lượng 50-60kg\n\n?Chất liệu: vải cotton cao cấp phong cách nữ tính, trẻ trung.\n\n?Màu sắc có 8 màu : trắng, hồng, đỏ, xanh, đen, tím, màu da đậm, màu da nhạt \n\n♥️ Style: Korea \n\n♥️ QUẦN LOT NỮ THUN LẠNH  không những là món phụ kiện thời trang mà còn là vũ khí thể hiện sự sexxy của bạn\n\nHãy chọn cho mình 1 màu phù hợp nhé...\n\n❤️ Trong thế giới thời trang của phái đẹp chiếc QUẦN LÓT NỮ MÀU HỒNG luôn chiếm một vị trí quan trọng.\n\nTừ những cô nàng bình thường nhất cho tới những ngôi sao hàng đầu, tất cả đều chia sẻ một tình yêu vĩ đại với QUẦN LÓT NỮ DỄ THƯƠNG của mình\n\nQUẦN LOT NỮ REN  hợp dáng người, hợp màu sắc làm tăng vẻ đẹp của trang phục bạn mặc và khẳng định ấn tượng của bạn trong mắt người đối diện.\n\nTuy nhiên, không phải ai cũng biết chọn một chiếc QUẦN LOT NỮ COTTON thực sự phù hợp với phom cơ thể của mình.\n\nMang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn , chiếc QUẦN LOT NỮ SU đã trở thành người bạn không thể thiếu các nàng.\n\nChúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp.\n\nVà nếu bạn cũng đang đi tìm một chiếc QUẦN LOT NỮ GỢI CẢM  thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ của\n\n? Luôn là nơi cập nhật những xu hướng QUẦN LOT NỮ SEXXY mới nhất\n\nVua Giá Rẻ 999 đã khẳng định vị trí của mình với nhiều bạn trẻ bởi phong cách thời trang sang trọng, thanh lịch nhưng không thiếu sự năng động và cá tính.\n\nKhéo léo kết hợp trang phục cùng phụ kiện, bạn dễ dàng mang lại một set đồ hài hòa, thể hiện được cá tính riêng của bạn\n\nVuagiare999 chuyên nhận sỉ, nhận đặt hàng sản xuất các mẫu túi đeo chéo, túi xách, ví cầm tay, ví clutch, ví nam, balo thời trang, balo học sinh.... \n\nVuagiare999 cam kết những hình ảnh về chất lượng sản phẩm là hoàn toàn chính xác \n\n⚠️Lưu ý khi mua hàng!\n1. Shop chỉ giải quyết những khiếu nại của khách hàng khi có bằng chứng cụ thể, rõ ràng (video, phiếu giao hàng...)\n2. Shop không thay đổi màu sản phẩm thông qua inbox riêng\n3. Shop không hỗ trợ khách hàng đồng kiểm với bên vận chuyển\n\nCảm ơn quý khách đã ghé thăm và ủng hộ shop!\n\n#quanlotnu #quanlotnuthunlanh #quanlotnamnumacchung #quanlotnumauhong #quanlotnudethuong #quanlotnuthunlanhbong #quanlotnucottonnhat #quanlot #quanlotcotton #quanlotnuren #quanlotnucotton #quanlotnusu #quanlotnugoicamr #quanlotnusexxy #quanlotxeday #quanlotnitbung #quanlotsuduc','2022-12-12 07:00:00.000000','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',12,12,'THOUSAND','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',1,48,2,1,17),(17,NULL,'2022-09-27 22:38:50.949000','Quần Lót Nữ ❤️ Quần lót lụa băng mã s93\n\nFEEDBACK 100% KHÁCH MUA HÀNG GỬI CHO SHOP ? CHẤT LƯỢNG ĐI CÙNG THƯƠNG HIỆU?\n?CAM KẾT RẺ NHẤT THỊ TRƯỜNG ? GIÁ LẺ=GIÁ BUÔN\n✨✨✨ Mô tả sản Phẩm ✨✨✨\n✔️ Chất Liệu Vải: lụa băng, siêu co giãn, mỏng mát, tôn dáng siêu gợi cảm, kháng khuẩn không lộ viền khi mặc quần áo\n✔️ Size: M/L\n✔️ Kiểu Dáng: Form chuẩn phù hợp với vóc dáng phụ nữ Việt Nam.\n✔️ ĐƯỢC CHỌN MẪU THEO Ý THÍCH\n✔️ FREESHIP EXTRA - MIỄN PHÍ ĐƠN HÀNG TỪ 50K \n\n⛔ Shop CAM KẾT ⛔\n➡️ Về chất lượng sản phẩm: \nShop cam kết cả về CHẤT LIỆU cũng như HÌNH DÁNG (đúng với mô tả, hình ảnh sản phẩm chân thực, video, ảnh thật do SHOP tự quay và chụp)\n➡️ Về dịch vụ: Shop sẽ cố gắng phản hồi mọi thắc mắc của quý khách nhanh nhất có thể\n➡️ Thời gian chuẩn bị hàng: Hàng có sẵn, thời gian chuẩn bị tối ưu nhất. \n➡️ Quyền Lợi của Khách Hàng:\n? Chính sách bao đổi trả hàng khi sản phẩm kém chất lượng và không giống hình, nhầm size, số lượng, lỗi từ xưởng sản xuất... \n\n❌ LƯU Ý KHI SỬ DỤNG CÁC SẢN PHẨM CỦA SHOP ❌\n- Đối với sản phẩm thường có thể giặt máy thoải mái và nên phân loại sản phẩm cùng màu, cùng loại vải khi giặt.\n- Đối vơi sản phẩm cao cấp, sang chảnh, đa dạng về chất liệu, kiểu dáng, cách bảo quản sản phẩm tốt nhất là giặt tay với bột (nước) giặt nhẹ để giữ được độ bền của vải, tránh bị phai màu từ các loại quần áo khác. \n- Nên phơi sản phẩm ở nơi thoáng mát, tránh để ẩm ướt kéo dài gây mốc, nên làm khô quần áo bằng cách phơi ở những điểm đón gió sẽ giữ được màu vải tốt hơn. \nshop phanngoc05 chuyên cập nhật bra , quần lót mẫu mới siêu xinh\n#Quầnlótsu #quanlotsu #quần_lót_su #quan_lot_su #quan_lot_su #lotsu \n#quần_lót_nữ #quầnlótnữ #quanlotnu #quan_lot_nu #quầnlọtkhe #quần_lọt_khe #lot_khe\n#quầnlót #quan_lot #quần_lot #quanlot #lot_su  #quầnlótthunlạnh#quanlotducsu#quầnlótđúcsu#quầnđúcsu','2022-12-12 07:00:00.000000','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',12,12,'THOUSAND','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',1,NULL,2,1,17),(18,NULL,'2022-09-27 22:39:22.370000','CÁC PHÚC LỢI DÀNH CHO BẠN\nLương và thưởng.\nChế độ bảo hiểm.\nHoạt động gắn kết.\nMÔ TẢ CÔNG VIỆC\nChương trình đào tạo 12 tháng hấp dẫn với các chủ đề và dự án thực tế.\nMôi trường làm việc năng động và nhiều thách thức.\nTrở thành nhân viên chính thức với mức lương cạnh tranh.\nYÊU CẦU CÔNG VIỆC\nMới tốt nghiệp (chưa đủ 1 năm) hoặc sinh viên năm cuối.\nChuyên ngành Cơ Khí - Chế tạo máy\nĐiểm tốt nghiệp từ 7.5 trở lên.\nBiết sử dụng Solidworks.\nTiếng Anh giao tiếp.\nĐam mê thiết kế kỹ thuật.\nĐỊA ĐIỂM LÀM VIỆC\n 32 Đại Lộ Hữu Nghị, VSIP1, Thuận An, Bình Dương, Thành phố Thuận An, Tỉnh Bình Dương','2022-12-12 07:00:00.000000','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',12,12,'THOUSAND','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',1,NULL,2,1,17),(19,NULL,'2022-09-27 22:39:56.183000','CÁC PHÚC LỢI DÀNH CHO BẠN\nQuyền lợi\n\nĐược trả trợ cấp và các chế độ khác đầy đủ, đúng thời gian theo qui định dành cho thực tập sinh của công ty\nĐược trang bị bảo hộ lao động, công cụ dụng cụ theo yêu cầu của vị trí thực tập\nThực tập sinh được thực tập tại công ty, được tham gia các khóa đào tạo theo qui chế đào tạo của công ty và yêu cầu thực tế của vị trí thực tập\nĐược hưởng chế độ nghỉ ngơi theo qui định của công ty.\nMÔ TẢ CÔNG VIỆC\nNHIỆM VỤ\nLà một phần của Chương trình Thực tập, sinh viên được tiếp xúc với:\n• Đào tạo tại chỗ cho kỹ sư dự án thực tế trong lĩnh vực Tự động hóa \n• Hỗ trợ phát triển hệ thống tự động hóa và điều khiển (có thể lựa chọn trong số BMS (Hệ thống quản lý tòa nhà), DCS (Hệ thống điều khiển phân tán) và PLC / SCADA\n• Hỗ trợ tạo giao diện người dùng đồ họa cho hệ thống điều khiển.\n• Cố vấn từ các giám sát viên và chuyên gia giàu kinh nghiệm\n• Tiếp xúc với môi trường làm việc chuyên nghiệp với đạo đức kinh doanh tốt và quy tắc ứng xử sớm trong cuộc sống nghề nghiệp của bạn\n\nYÊU CẦU CÔNG VIỆC\nTrình độ\n\nSinh viên năm 4\nChương trình cấp bằng kỹ sư điện / điện tử (Chuyên ngành điều khiển tự động hóa)\nKỹ năng \n\nThể hiện thái độ Cần - Làm và sẵn sàng học hỏi những điều mới\nĐiểm trung bình tích lũy (Điểm trung bình) tối thiểu là 7.0 / 10 hoặc 2.5 / 4\nGiao tiếp tiếng anh tốt\nKhả năng cơ bản để sử dụng các chương trình Microsoft Office bao gồm nhưng không giới hạn, Word, Excel, PowerPoint, AutoCad hoặc Visio là một điểm cộng.\nĐỊA ĐIỂM LÀM VIỆC\n Tầng 4, 28 Phùng Khắc Khoan, Phường Đa Kao, Quận 1, TP.HCM, Quận 1, Thành phố Hồ Chí Minh\n\nTỪ KHÓA\nBảo trì / Sữa chữCơ khí / Chế tạo / Tự động hóa','2022-12-12 07:00:00.000000','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',12,12,'THOUSAND','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',1,NULL,2,1,17),(20,NULL,'2022-09-27 22:40:33.996000','CÁC PHÚC LỢI DÀNH CHO BẠN\n1. PHÚC LỢI\n\nBảo hiểm Xã hội tham gia trên 100% lương và được tính từ thời gian thử việc\n\nBảo hiểm sức khỏe & bảo hiểm tai nạn 24/24 cho bản thân và người thân\n\n14 ngày nghỉ phép/năm & tăng theo thâm niên từ năm làm việc thứ 5\n\nTrợ cấp thâm niên, mỗi năm làm việc sẽ được tích lũy 1/4 tháng lương\n\nHoạt động Teambuilding hàng năm\n\nKhám sức khỏe định kỳ hàng năm\n\nTiệc cuối năm tổ chức cho nhân viên và thành viên trong gia đình\n\nCác chính sách khác tùy từng đối tượng đặc biệt áp dụng\n\n2. CƠ HỘI PHÁT TRIỂN\n\nChương trình đào tạo phát triển được thiết kế riêng phù hợp với từng cấp bậc, tập trung chuyên môn và kỹ năng mềm\n\nĐược thảo luận về cơ hội nghề nghiệp & thăng tiến\n\nĐội ngũ lãnh đạo dày dặn kinh nghiệm, tâm huyết và chỉ dẫn tận tình, đồng nghiệp hỗ trợ và gắn kết\n\n \n\n3. MÔI TRƯỜNG LÀM VIỆC\n\nTOP 100 nơi làm việc tốt nhất Việt Nam – Năm 2021 (Anphabe bình chọn)\n\nTOP 50 thương hiệu tuyển dụng hấp dẫn với Sinh viên – Năm 2022 (Anphabe bình chọn)\n\nMôi trường làm việc đề cao An toàn – Trang bị đầy đủ thiết bị an toàn, bảo hộ lao động\n\nMÔ TẢ CÔNG VIỆC\nKỸ SƯ BẢO TRÌ CƠ KHÍ - DÀNH CHO SINH VIÊN MỚI RA TRƯỜNG DƯỚI 1 NĂM KINH NGHIỆM\n\n- Nơi làm việc:  Nhà máy INSEE - KCN Hiệp Phước - Nhà Bè - Tp.Hồ Chí Minh\n\n- Thời gian làm việc: Thứ 2 - Thứ 6\n\n- Có xe đưa đón hàng ngày từ  Q.1 - TP.HCM\n\nCÔNG VIỆC CHÍNH:\n\nLên kế hoạch bảo trì đúng cách và tuân thủ quy trình, hướng dẫn công việc\nCập nhật thông tin sau khi kết thúc công việc trên yêu cầu công việc\nPhản hồi, báo cáo cho giám sát về các sự cố không an toàn\nSử dụng vật tư đúng với công việc được giao.\nBảo quản tốt dụng cụ và sử dụng đúng cách.\nTham gia đầy đủ các khóa đào tạo theo kế hoạch.\nTuân thủ tất cả chính sách về An toàn và Sức khỏe nghề nghiệp của công ty\nYÊU CẦU CÔNG VIỆC\nYÊU CẦU ỨNG VIÊN:\n\nỨng viên mới ra trường, dưới 1 năm Kinh nghiệm, có định hướng nghề nghiệp rõ ràng theo bảo trì Cơ khí (Có thể làm việc full-time sau khi trúng tuyển)\nỨng viên TN Đại ngành Cơ khí / Cơ điện tử / Bảo dưỡng Công nghiệp\nĐiểm TB tốt nghiệp (GPA) >=6.5/10 hoặc 2.6/4\nToeic >=450 hoặc trình độ tương đương\nNăng động, sáng tạo, tinh thần học hỏi, làm việc có kế hoạch và mục tiêu rõ ràng\nĐỊA ĐIỂM LÀM VIỆC\n KCN Hiệp Phước - Nhà Bè - Tp.HCM, Huyện Nhà Bè, Thành phố Hồ Chí Minh\n\nTỪ KHÓA\nBảo trì / Sữa chữCơ khí / Chế tạo / Tự động hóaSản xuất','2022-12-12 07:00:00.000000','ahajh',12,12,'THOUSAND','Quần lót nữ đúc su cotton thun lạnh dễ thương sexy gợi cảm ELLY QL01',1,NULL,2,1,17),(21,NULL,'2022-09-27 22:41:31.193000','CÁC PHÚC LỢI DÀNH CHO BẠN\n1. PHÚC LỢI\n\nBảo hiểm Xã hội tham gia trên 100% lương và được tính từ thời gian thử việc\n\nBảo hiểm sức khỏe & bảo hiểm tai nạn 24/24 cho bản thân và người thân\n\n14 ngày nghỉ phép/năm & tăng theo thâm niên từ năm làm việc thứ 5\n\nTrợ cấp thâm niên, mỗi năm làm việc sẽ được tích lũy 1/4 tháng lương\n\nHoạt động Teambuilding hàng năm\n\nKhám sức khỏe định kỳ hàng năm\n\nTiệc cuối năm tổ chức cho nhân viên và thành viên trong gia đình\n\nCác chính sách khác tùy từng đối tượng đặc biệt áp dụng\n\n2. CƠ HỘI PHÁT TRIỂN\n\nChương trình đào tạo phát triển được thiết kế riêng phù hợp với từng cấp bậc, tập trung chuyên môn và kỹ năng mềm\n\nĐược thảo luận về cơ hội nghề nghiệp & thăng tiến\n\nĐội ngũ lãnh đạo dày dặn kinh nghiệm, tâm huyết và chỉ dẫn tận tình, đồng nghiệp hỗ trợ và gắn kết\n\n \n\n3. MÔI TRƯỜNG LÀM VIỆC\n\nTOP 100 nơi làm việc tốt nhất Việt Nam – Năm 2021 (Anphabe bình chọn)\n\nTOP 50 thương hiệu tuyển dụng hấp dẫn với Sinh viên – Năm 2022 (Anphabe bình chọn)\n\nMôi trường làm việc đề cao An toàn – Trang bị đầy đủ thiết bị an toàn, bảo hộ lao động\n\nMÔ TẢ CÔNG VIỆC\nKỸ SƯ BẢO TRÌ CƠ KHÍ - DÀNH CHO SINH VIÊN MỚI RA TRƯỜNG DƯỚI 1 NĂM KINH NGHIỆM\n\n- Nơi làm việc:  Nhà máy INSEE - KCN Hiệp Phước - Nhà Bè - Tp.Hồ Chí Minh\n\n- Thời gian làm việc: Thứ 2 - Thứ 6\n\n- Có xe đưa đón hàng ngày từ  Q.1 - TP.HCM\n\nCÔNG VIỆC CHÍNH:\n\nLên kế hoạch bảo trì đúng cách và tuân thủ quy trình, hướng dẫn công việc\nCập nhật thông tin sau khi kết thúc công việc trên yêu cầu công việc\nPhản hồi, báo cáo cho giám sát về các sự cố không an toàn\nSử dụng vật tư đúng với công việc được giao.\nBảo quản tốt dụng cụ và sử dụng đúng cách.\nTham gia đầy đủ các khóa đào tạo theo kế hoạch.\nTuân thủ tất cả chính sách về An toàn và Sức khỏe nghề nghiệp của công ty\nYÊU CẦU CÔNG VIỆC\nYÊU CẦU ỨNG VIÊN:\n\nỨng viên mới ra trường, dưới 1 năm Kinh nghiệm, có định hướng nghề nghiệp rõ ràng theo bảo trì Cơ khí (Có thể làm việc full-time sau khi trúng tuyển)\nỨng viên TN Đại ngành Cơ khí / Cơ điện tử / Bảo dưỡng Công nghiệp\nĐiểm TB tốt nghiệp (GPA) >=6.5/10 hoặc 2.6/4\nToeic >=450 hoặc trình độ tương đương\nNăng động, sáng tạo, tinh thần học hỏi, làm việc có kế hoạch và mục tiêu rõ ràng\nĐỊA ĐIỂM LÀM VIỆC\n KCN Hiệp Phước - Nhà Bè - Tp.HCM, Huyện Nhà Bè, Thành phố Hồ Chí Minh\n\nTỪ KHÓA\nBảo trì / Sữa chữCơ khí / Chế tạo / Tự động hóaSản xuất','2022-12-18 07:00:00.000000','ahajh',12,12,'THOUSAND','21ip93u21i3jlaksdjaklsdlasjdaslkd',1,NULL,1,1,17),(23,NULL,'2022-09-28 14:15:25.031000','K&igrave;m B&oacute;p Tay, K&igrave;m T?p C? Tay, D?ng C? T?p Gym T?i Nh&agrave; ?i?u Ch?nh L?c C&oacute; ??m 10-60kg ---------------------------------------------------------------------------------- ?? M&Ocirc; T? S?N PH?M ?? K&igrave;m b&oacute;p tay ch? A ?i?u ch?nh l?c l&agrave; d?ng c? t?p c? tay b&agrave;n tay v&agrave; ng&oacute;n tay, ??c bi?t th&iacute;ch h?p cho ng??i t?p v&otilde;, t?p th? l?c ho?c cho nh&acirc;n vi&ecirc;n v?n ph&ograve;ng mu?n luy?n t?p c? tay do g&otilde; b&agrave;n ph&iacute;m nhi?u. ?? S?n ph?m c&oacute; th? s? d?ng ??n gi?n, thi?t k? nh? g?n d? d&agrave;ng mang theo, c&oacute; th? luy?n t?p m?i n?i, m?i l&uacute;c. ?? TH&Ocirc;NG TIN CHI TI?T S?N PH?M ?? Ph?n ngo&agrave;i c?a tay c?m b?c nh?a cao c?p ch?ng tr?n, th?m m? h&ocirc;i v&agrave; l&ograve; xo c&oacute; ?? ?&agrave;n h?i l?n. ?? N&uacute;m ?i?u ch?nh l?c b&oacute;p t? 10=&gt;60kg. ?? K&iacute;ch th??c:15 x 12 x 3 cm. ?? Ch?t li?u: Nh?a + Th&eacute;p l&ograve; xo ?&agrave;n h?i cao. ?? T?p c? b&agrave;n tay, ng&oacute;n tay. ?? Kh&oacute;a l&ograve; xo: L&agrave;m b?ng th&eacute;p kh&ocirc;ng r? ch?t l??n cao tay c?m ch?c ch?n. ?? Thi?t k? nh? g?n, c&oacute; th? mang ?i ch?i ho?c ?i du l?ch. ?? C&Ocirc;NG D?NG S?N PH?M ?? T?ng s?c m?nh cho tay: s? gi&uacute;p b?n gi? t? trong th?i gian l&acirc;u h?n khi tham gia t?p th? h&igrave;nh; t?ng s?c m?nh vung v?t l&ecirc;n ?&aacute;ng k? khi ch?i c?u l&ocirc;ng, Tennis gi&uacute;p &iacute;ch khi t?p luy?n th? d?c d?ng c? ho?c t?p leo n&uacute;i. ?? T?ng c? b?p cho c?ng tay: Theo nhi?u hu?n luy?n vi&ecirc;n th? h&igrave;nh, n?u mu?n c? tay ?n t??ng h?n v&agrave; to h?n ng??i kh&aacute;c th&igrave; b?n n&ecirc;n t?p luy?n v?i k&igrave;m b&oacute;p tay th??ng xuy&ecirc;n. ?? C?i thi?n kh&eacute;o l&eacute;o ?&ocirc;i tay: K&igrave;m b&oacute;p tay s? ho?t ??ng ?? r&egrave;n luy?n cho c&aacute;c ng&oacute;n tay c?a b?n m?t c&aacute;ch ??c l?p t? ?&oacute; c?i thi?n ???c s? kh&eacute;o l&eacute;o cho ?&ocirc;i tay. ?? T&aacute;c d?ng cho s?c kh?e: gi&uacute;p tu?n ho&agrave;n m&aacute;u, gi&uacute;p gi?m stress hi?u qu? v&agrave; ??ng th?i gi&uacute;p t?ng c??ng s?c kh?e. ---------------------------------------------------------------------------------- ?? CH&Iacute;NH S&Aacute;CH ??I TR? H&Agrave;NG ?? TR??NG H?P CH?P NH?N ??I TR? ?? ??i tr? trong tr??ng h?p sai h&agrave;ng, h?ng h&agrave;ng, h&agrave;ng kh&ocirc;ng ?? s? l??ng ?? TR??NG H?P KH&Ocirc;NG CH?P NH?N ??I TR? ?? H?ng h&agrave;ng do qu&aacute; tr&igrave;nh s? d?ng c?a kh&aacute;ch h&agrave;ng ?? Sai h&agrave;ng, thi?u h&agrave;ng, l?i h&agrave;ng nh?ng kh&aacute;ch h&agrave;ng kh&ocirc;ng quay video --------------------------------------------------------------------------------- ?. CH&Iacute;NH S&Aacute;CH B&Aacute;N H&Agrave;NG HTSPORT CAM K?T ? V? s?n ph?m: Shop cam k?t c? v? CH?T LI?U c?ng nh? H&Igrave;NH D&Aacute;NG ( ?&uacute;ng v?i nh?ng g&igrave; ???c n&ecirc;u b?t trong ph?n m&ocirc; t? v&agrave; h&igrave;nh ?nh s?n ph?m). ? V? gi&aacute; c?: Shop nh?p v?i s? l??ng nhi?u v&agrave; tr?c ti?p t? h&atilde;ng n&ecirc;n gi&aacute; s? lu&ocirc;n T?T NH?T v&agrave; CH?T L??NG nh?t ? V? d?ch v?: Shop s? c? g?ng tr? l?i h?t nh?ng th?c m?c xoay quanh s?n ph?m c&aacute;c b?n c? Inbox cho shop ? Th?i gian chu?n b? h&agrave;ng: H&agrave;ng c&oacute; s?n, th?i gian chu?n b? t?i ?u nh?t. ? QUY?N L?I C?A KH&Aacute;CH H&Agrave;NG - Cam k?t 100% ??i h&agrave;ng trong v&ograve;ng 3 ng&agrave;y theo ch&iacute;nh s&aacute;ch Shopee n?u s?n ph?m kh&aacute;ch ??t l?i do nh&agrave; s?n xu?t - Shop h? tr? ??i sang s?n ph?m kh&aacute;c c&ugrave;ng gi&aacute; ho?c cao h?n n?u kh&aacute;ch c&oacute; nhu c?u ??i m?u kh&aacute;c. - N?u c&oacute; b?t k&igrave; khi?u n?i c?n Shop h? tr? v? s?n ph?m, khi m? s?n ph?m c&aacute;c b?n vui l&ograve;ng quay l?i video qu&aacute; tr&igrave;nh m? s?n ph?m ?? ???c ??m b?o 100% ??i l?i s?n ph?m m?i n?u Shop giao b? l?i. - C&aacute;c b?n nh?n ???c s?n ph?m, vui l&ograve;ng ?&aacute;nh gi&aacute; gi&uacute;p Shop ?? h??ng th&ecirc;m nhi?u ?u ?&atilde;i h?n','2022-12-12 07:00:00.000000','askdaskjld',12,12,'MILLION','Dung Cu Tap Tay',1,NULL,2,1,17),(24,NULL,'2022-09-28 14:17:12.889000','K&igrave;m B&oacute;p Tay, K&igrave;m T?p C? Tay, D?ng C? T?p Gym T?i Nh&agrave; ?i?u Ch?nh L?c C&oacute; ??m 10-60kg ---------------------------------------------------------------------------------- <br />?? M&Ocirc; T? S?N PH?M <br />?? K&igrave;m b&oacute;p tay ch? A ?i?u ch?nh l?c l&agrave; d?ng c? t?p c? tay b&agrave;n tay v&agrave; ng&oacute;n tay, ??c bi?t th&iacute;ch h?p cho ng??i t?p v&otilde;, t?p th? l?c ho?c cho nh&acirc;n vi&ecirc;n v?n ph&ograve;ng mu?n luy?n t?p c? tay do g&otilde; b&agrave;n ph&iacute;m nhi?u. <br />?? S?n ph?m c&oacute; th? s? d?ng ??n gi?n, thi?t k? nh? g?n d? d&agrave;ng mang theo, c&oacute; th? luy?n t?p m?i n?i, m?i l&uacute;c.','2022-12-12 07:00:00.000000','12sa',12,12,'MILLION','h?p cho ng??i t?p',1,NULL,2,1,17),(25,'2022-10-06 17:16:09.776000','2022-09-28 14:25:17.584000','Kìm Bóp Tay, Kìm Tập Cơ Tay, Dụng Cụ Tập Gym Tại Nhà Điều Chỉnh Lực Có Đếm 10-60kg\n----------------------------------------------------------------------------------\n✍️ MÔ TẢ SẢN PHẨM \n➡️ Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.\n➡️ Sản phẩm có thể sử dụng đơn giản, thiết kế nhỏ gọn dễ dàng mang theo, có thể luyện tập mọi nơi, mọi lúc.\n\n✍️ THÔNG TIN CHI TIẾT SẢN PHẨM\n➡️ Phần ngoài của tay cầm bọc nhựa cao cấp chống trơn, thấm mồ hôi và lò xo có độ đàn hồi lớn.\n➡️ Núm điều chỉnh lực bóp từ 10=>60kg.\n➡️ Kích thước:15 x 12 x 3 cm.\n➡️ Chất liệu: Nhựa + Thép lò xo đàn hồi cao.\n➡️ Tập cơ bàn tay, ngón tay.\n➡️ Khóa lò xo: Làm bằng thép không rỉ chất lượn cao tay cầm chắc chắn.\n➡️ Thiết kế nhỏ gọn, có thể mang đi chơi hoặc đi du lịch.\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Ainh Bình Đ',1,NULL,1,1,17),(26,NULL,'2022-09-28 14:25:51.606000','Kìm Bóp Tay, Kìm Tập Cơ Tay, Dụng Cụ Tập Gym Tại Nhà Điều Chỉnh Lực Có Đếm 10-60kg\n----------------------------------------------------------------------------------\n✍️ MÔ TẢ SẢN PHẨM \n➡️ Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.\n➡️ Sản phẩm có thể sử dụng đơn giản, thiết kế nhỏ gọn dễ dàng mang theo, có thể luyện tập mọi nơi, mọi lúc.\n\n✍️ THÔNG TIN CHI TIẾT SẢN PHẨM\n➡️ Phần ngoài của tay cầm bọc nhựa cao cấp chống trơn, thấm mồ hôi và lò xo có độ đàn hồi lớn.\n➡️ Núm điều chỉnh lực bóp từ 10=>60kg.\n➡️ Kích thước:15 x 12 x 3 cm.\n➡️ Chất liệu: Nhựa + Thép lò xo đàn hồi cao.\n➡️ Tập cơ bàn tay, ngón tay.\n➡️ Khóa lò xo: Làm bằng thép không rỉ chất lượn cao tay cầm chắc chắn.\n➡️ Thiết kế nhỏ gọn, có thể mang đi chơi hoặc đi du lịch.\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Ainh Bình Đ',1,NULL,1,1,17),(27,NULL,'2022-09-28 14:34:12.375000','Kìm Bóp Tay, Kìm Tập Cơ Tay, Dụng Cụ Tập Gym Tại Nhà Điều Chỉnh Lực Có Đếm 10-60kg\n----------------------------------------------------------------------------------\n✍️ MÔ TẢ SẢN PHẨM \n➡️ Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.\n➡️ Sản phẩm có thể sử dụng đơn giản, thiết kế nhỏ gọn dễ dàng mang theo, có thể luyện tập mọi nơi, mọi lúc.\n\n✍️ THÔNG TIN CHI TIẾT SẢN PHẨM\n➡️ Phần ngoài của tay cầm bọc nhựa cao cấp chống trơn, thấm mồ hôi và lò xo có độ đàn hồi lớn.\n➡️ Núm điều chỉnh lực bóp từ 10=>60kg.\n➡️ Kích thước:15 x 12 x 3 cm.\n➡️ Chất liệu: Nhựa + Thép lò xo đàn hồi cao.\n➡️ Tập cơ bàn tay, ngón tay.\n➡️ Khóa lò xo: Làm bằng thép không rỉ chất lượn cao tay cầm chắc chắn.\n➡️ Thiết kế nhỏ gọn, có thể mang đi chơi hoặc đi du lịch.\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Ainh Bình Đ',1,NULL,1,1,17),(28,NULL,'2022-09-28 14:36:02.094000','Kìm Bóp Tay, Kìm Tập Cơ Tay, Dụng Cụ Tập Gym Tại Nhà Điều Chỉnh Lực Có Đếm 10-60kg\n----------------------------------------------------------------------------------\n✍️ MÔ TẢ SẢN PHẨM \n➡️ Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.\n➡️ Sản phẩm có thể sử dụng đơn giản, thiết kế nhỏ gọn dễ dàng mang theo, có thể luyện tập mọi nơi, mọi lúc.\n\n✍️ THÔNG TIN CHI TIẾT SẢN PHẨM\n➡️ Phần ngoài của tay cầm bọc nhựa cao cấp chống trơn, thấm mồ hôi và lò xo có độ đàn hồi lớn.\n➡️ Núm điều chỉnh lực bóp từ 10=>60kg.\n➡️ Kích thước:15 x 12 x 3 cm.\n➡️ Chất liệu: Nhựa + Thép lò xo đàn hồi cao.\n➡️ Tập cơ bàn tay, ngón tay.\n➡️ Khóa lò xo: Làm bằng thép không rỉ chất lượn cao tay cầm chắc chắn.\n➡️ Thiết kế nhỏ gọn, có thể mang đi chơi hoặc đi du lịch.\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Ainh Bình Đ',1,NULL,1,1,17),(29,NULL,'2022-09-28 14:39:10.667000','Kìm Bóp Tay, Kìm Tập Cơ Tay, Dụng Cụ Tập Gym Tại Nhà Điều Chỉnh Lực Có Đếm 10-60kg\n----------------------------------------------------------------------------------\n✍️ MÔ TẢ SẢN PHẨM \n➡️ Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.\n➡️ Sản phẩm có thể sử dụng đơn giản, thiết kế nhỏ gọn dễ dàng mang theo, có thể luyện tập mọi nơi, mọi lúc.\n\n✍️ THÔNG TIN CHI TIẾT SẢN PHẨM\n➡️ Phần ngoài của tay cầm bọc nhựa cao cấp chống trơn, thấm mồ hôi và lò xo có độ đàn hồi lớn.\n➡️ Núm điều chỉnh lực bóp từ 10=>60kg.\n➡️ Kích thước:15 x 12 x 3 cm.\n➡️ Chất liệu: Nhựa + Thép lò xo đàn hồi cao.\n➡️ Tập cơ bàn tay, ngón tay.\n➡️ Khóa lò xo: Làm bằng thép không rỉ chất lượn cao tay cầm chắc chắn.\n➡️ Thiết kế nhỏ gọn, có thể mang đi chơi hoặc đi du lịch.\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Ainh Bình Đ',1,NULL,1,1,17),(30,NULL,'2022-09-28 14:41:03.144000','Kìm Bóp Tay, Kìm Tập Cơ Tay, Dụng Cụ Tập Gym Tại Nhà Điều Chỉnh Lực Có Đếm 10-60kg\n----------------------------------------------------------------------------------\n✍️ MÔ TẢ SẢN PHẨM \n➡️ Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.\n➡️ Sản phẩm có thể sử dụng đơn giản, thiết kế nhỏ gọn dễ dàng mang theo, có thể luyện tập mọi nơi, mọi lúc.\n\n✍️ THÔNG TIN CHI TIẾT SẢN PHẨM\n➡️ Phần ngoài của tay cầm bọc nhựa cao cấp chống trơn, thấm mồ hôi và lò xo có độ đàn hồi lớn.\n➡️ Núm điều chỉnh lực bóp từ 10=>60kg.\n➡️ Kích thước:15 x 12 x 3 cm.\n➡️ Chất liệu: Nhựa + Thép lò xo đàn hồi cao.\n➡️ Tập cơ bàn tay, ngón tay.\n➡️ Khóa lò xo: Làm bằng thép không rỉ chất lượn cao tay cầm chắc chắn.\n➡️ Thiết kế nhỏ gọn, có thể mang đi chơi hoặc đi du lịch.\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Ainh Bình Đ',1,NULL,1,1,17),(35,'2022-10-06 17:16:14.427000','2022-09-28 21:11:03.118000','bỏ qua nội dung chính\nKênh Người Bán\nTrở thành Người bán Shopee\nTải ứng dụng\nKết nối\nĐăng ký và nhận voucher bạn mới đến 70k!\n\nÁo Khoác\nDép\nTúi Xách Nữ\nÁo Croptop\nỐp iPhone\nTai Nghe Bluetooth\nVáy\nBánh Tráng Phơi Sương\nShopee\nThời Trang Nam\nÁo Khoác\nÁo Khoác Mùa Đông & Áo Choàng\nÁo Khoác Bomber NEW YORK - phong cách nam nữ WILL SHOP chất nỉ bông cotton\n\n\nChia sẻ:\n\n\nĐã thích (2,6k)\nÁo Khoác Bomber NEW YORK - phong cách nam nữ WILL SHOP chất nỉ bông cotton\n4.9\n2,8k\nĐánh Giá\n7,6k\nĐã Bán\n₫200.000\n₫125.000\n38% GIẢM\nBảo Hiểm\nBảo hiểm Thời trang\nMới\nTìm hiểu thêm\nVận Chuyển\nMiễn phí vận chuyển\nVận Chuyển Tới\nPhí Vận Chuyển\nSIZE\nM\nL\nXL\nSố Lượng\n\n1\n\n925 sản phẩm có sẵn\n\nThêm Vào Giỏ Hàng\nMua Ngay\n\nShopee Đảm Bảo\n3 Ngày Trả Hàng / Hoàn Tiền\n\nwillshop_01\nOnline 8 Phút Trước\nChat Ngay\nXem Shop\nĐánh Giá\n5,5k\nSản Phẩm\n214\nTỉ Lệ Phản Hồi\n99%\nThời Gian Phản Hồi\ntrong vài giờ\nTham Gia\n21 tháng trước\nNgười Theo Dõi\n3,2k\nCHI TIẾT SẢN PHẨM\nDanh Mục\nShopee\nThời Trang Nam\nÁo Khoác\nÁo Khoác Mùa Đông & Áo Choàng\nChất liệu\nNỉ\nXuất xứ\nViệt Nam\nKiểu Áo khoác\nÁo khoác bomber\nKho hàng\n925\nGửi từ\nTP. Hồ Chí Minh\nMÔ TẢ SẢN PHẨM\nÁo Khoác Bomber NEW YORK - phong cách nam nữ WILL SHOP chất nỉ bông cotton\nÁo khoác BOMBER vải nỉ bông cotton, đẹp, không co rút, Hình in không bong tróc, đặc biệt không những giúp bạn giữ ấm trong mùa lạnh mà còn có thể chống nắng, chống gió, chống bụi, chống rét, chống tia UV cực tốt, rất tiện lợi nhé!!!\nForm rộng Unisex cho cả nam và nữ,  Hình Shop tự chụp\n? Đường may kỹ, tinh tế, sắc xảo.\n? Form chuẩn #ulzzang   #unisex Nam Nữ Couple đều mặc được.\nSize: M L XL\nSize M: 40 -54kg, cao từ 1m5\nSize L: 55 -64kg, cao từ 1m66\nSize XL: 65 -80kg, cao từ 1m73\n✔️ Cam kết hàng form chuẩn và giống hình\n✔️ Hoàn trả miễn phí nếu sản phẩm lỗi do sản xuất.\n#willshopunisex \n#aokhoac\n#quanao\n#aokhoacni \n#bomber \n#ni #dạ\n\nĐÁNH GIÁ SẢN PHẨM\n4.9 trên 5\nminhman4.4.3\n2022-09-28 15:31 | Phân loại hàng: M\nChất liệu: vải mềm rất đã\nMàu sắc: đúng với mô tả\nĐúng với mô tả: rất oce\nMn nên mua nhá cho shop5★ ..\n0:24\nHữu Ích?\n\nnhuphuc2106\n2022-09-07 12:17 | Phân loại hàng: L\náooo cũnggg đượcccc nói chungg là ổnnn. Lúc nhận thì áo có giấy thơm\n0:34\n3\n\nnampoin\n2022-09-18 16:15 | Phân loại hàng: L\nChất liệu: ngon\nMàu sắc: pro\nĐúng với mô tả: đẹp\nđánh giá lấy xu thôi hê trong trường hợp nhóm này bị điều tra bởi\n0:49\n4\n\nquocthang7522\n2022-09-19 15:20 | Phân loại hàng: XL\nChất liệu: vãi\nMàu sắc: đen trắng\nĐúng với mô tả: như mô tả\nÁo mua giùm nên không biết chất lượng nhưng ncl giao nhanh shop thân thiện nên mua nha mn đánh giá nhận xu\n0:06\n2\ntruyp\n2022-09-14 17:12 | Phân loại hàng: XL\nChất liệu: vải đẹp\nMàu sắc: đen trắng\nĐúng với mô tả: rất đúng với mô tả\nSản phẩm đẹp, có giấy thơm giúp sản phẩm không có mùi, gấp quá không có hình nhưng sản phẩm tuyệt vời đáng mua nhe m.n\nChất lượng sản phẩm tuyệt vời\n0:10\n1\nbtran.260509\n2022-08-13 23:00 | Phân loại hàng: XL\nShop cưtê lắm nên có dì cứ ib hỏi nha , giao hàng nhanh , áo khá dày dặn , chất liệu ổn=))))))))))))))))))))))))))))))))))))\n0:16\n4\n\n2\n3\n4\n5\n...\n\nCÁC SẢN PHẨM KHÁC CỦA SHOP\nXem Tất Cả \nCÓ THỂ BẠN CŨNG THÍCH\nXem Thêm\nmmmmmmmmmmlli\n','2022-12-12 07:00:00.000000','123a',12,12,'NONE','Áo Khoác',1,NULL,1,1,17),(39,NULL,'2022-10-05 14:52:52.384000','Nhân Viên Part-time\nNhận trợ cấp xăng xe, bảo hiểm\nLàm 8 tiếng 1 ngày\n','2022-12-05 07:00:00.000000','Dĩ An, Bình Dương',23,11,'MILLION','Trà Sữa Chân Châu Hạ Long',1,NULL,2,1,8);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `media_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`media_id`,`user_id`),
  KEY `FKawh070wpue34wqvytjqr4hj5e` (`user_id`),
  CONSTRAINT `FKawh070wpue34wqvytjqr4hj5e` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKqitv6qsbqikwwp1h8sgku01vb` FOREIGN KEY (`media_id`) REFERENCES `media_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (7,1,1,'CV01'),(13,1,1,'cv11'),(14,1,1,'cv112'),(17,2,0,'12a'),(24,1,1,'acac'),(25,1,1,'Main CV');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_confirm` bit(1) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `birth` datetime(6) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `avatar_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  KEY `FK64ydoqa8wkadupx8aci0k4v2h` (`avatar_id`),
  KEY `FK29eqyw0gxw5r4f1ommy11nd9i` (`city_id`),
  CONSTRAINT `FK29eqyw0gxw5r4f1ommy11nd9i` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FK64ydoqa8wkadupx8aci0k4v2h` FOREIGN KEY (`avatar_id`) REFERENCES `media_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '','Dĩ An',NULL,'user01@example.com',_binary '\0','Hoàng Zăn Bềnh','$2a$10$nAWk4pPrctgW4kQ08tsNOO3Y1BEkhEb9WDh2aah866W/jjyHlESlS','0615843974','2012-07-12 07:00:00.000000','MALE',34,10),(2,_binary '','string',NULL,'user02@example.com',_binary '\0','User 02','$2a$10$q.o2i/DjXLMc4si3gGUmWe9ssiWELoSOEboIsY54DYL3E0ADHWhoa','0615843174',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 21:08:29
