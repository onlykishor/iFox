-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: iFox
-- Source Schemata: iFox
-- Created: Sat May 03 23:17:20 2014
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema iFox
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `iFox` ;
CREATE SCHEMA IF NOT EXISTS `iFox` ;

-- ----------------------------------------------------------------------------
-- Table iFox.books
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`books` (
  `bookid` INT NOT NULL,
  `subjectcode` CHAR(12) NULL,
  `author` CHAR(100) NULL,
  `title` CHAR(100) NULL,
  `publisher` LONGTEXT NULL,
  `pur_date` DATETIME NULL,
  `price` DOUBLE NULL,
  `bookinfo` LONGTEXT NULL,
  `grants` CHAR(20) NULL,
  `classification` CHAR(10) NULL,
  `isbn` CHAR(15) NULL,
  `discarded` TINYINT(1) NULL,
  `discdate` DATETIME NULL,
  `disctype` TINYINT UNSIGNED NULL,
  `billno` CHAR(5) NULL,
  `remarks` CHAR(30) NULL,
  `status` TINYINT(1) NULL,
  `source` CHAR(25) NULL,
  `invno` CHAR(6) NULL,
  `pubyear` INT NULL,
  `edition` CHAR(10) NULL,
  `discount` CHAR(10) NULL,
  `pages` CHAR(20) NULL,
  `author2` CHAR(100) NULL,
  `supplier` CHAR(50) NULL,
  `invdate` DATETIME NULL,
  `isbn13` CHAR(13) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.cgrades
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`cgrades` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `range1` DOUBLE NULL,
  `range2` DOUBLE NULL,
  `grade` CHAR(15) NULL,
  `fail` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.daybook
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`daybook` (
  `rowid` INT NOT NULL,
  `date` DATETIME NULL,
  `headid` INT NULL,
  `alias` CHAR(10) NULL,
  `narration` CHAR(80) NULL,
  `debit` DOUBLE NULL,
  `credit` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.documents
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`documents` (
  `docid` INT NOT NULL,
  `context` CHAR(30) NULL,
  `groupname` CHAR(50) NULL,
  `description` CHAR(150) NULL,
  `filename` CHAR(100) NULL,
  `filetype` CHAR(6) NULL,
  `filedata` LONGBLOB NOT NULL,
  `fdatetime` DATETIME NULL,
  `filesize` DOUBLE NULL,
  `userid` INT NULL,
  `shared` TINYINT(1) NULL,
  `lastmod` DATETIME NULL,
  `rootid` INT NULL,
  `admno` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.AttSubjects
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`AttSubjects` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `class` CHAR(20) NOT NULL,
  `studyyear` INT NULL,
  `semester` CHAR(10) NULL,
  `colid` INT NULL,
  `colname` CHAR(10) NULL,
  `coldesc` CHAR(20) NULL,
  `colcode` CHAR(4) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.duedates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`duedates` (
  `rowid` INT NOT NULL,
  `feeid` INT NOT NULL,
  `duedate` DATETIME NULL,
  `amount` DOUBLE NULL,
  `class` CHAR(20) NULL,
  `status` CHAR(12) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.enq
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`enq` (
  `enqno` INT NOT NULL,
  `enqdate` DATETIME NOT NULL,
  `name` CHAR(30) NOT NULL,
  `sex` CHAR(10) NULL,
  `dob` DATETIME NULL,
  `father` CHAR(30) NULL,
  `occupation` CHAR(20) NULL,
  `mother` CHAR(10) NULL,
  `admtoclass` CHAR(12) NULL,
  `preclass` CHAR(12) NULL,
  `preschool` CHAR(30) NULL,
  `paddress` CHAR(30) NULL,
  `pstreet` CHAR(30) NULL,
  `parea` CHAR(30) NULL,
  `caddress` CHAR(30) NULL,
  `cstreet` CHAR(30) NULL,
  `carea` CHAR(30) NULL,
  `phones` CHAR(30) NULL,
  `idmark1` CHAR(30) NULL,
  `idmark2` CHAR(30) NULL,
  `religion` CHAR(15) NULL,
  `caste` CHAR(15) NULL,
  `class` CHAR(20) NULL,
  `remarks` LONGTEXT NULL,
  `coordinator` CHAR(20) NULL,
  `application` TINYINT(1) NOT NULL,
  `admtest` TINYINT(1) NOT NULL,
  `admission` TINYINT(1) NOT NULL,
  `applno` INT NULL,
  `appldate` DATETIME NULL,
  `applamount` DOUBLE NULL,
  `examname` CHAR(20) NULL,
  `examdate` DATETIME NULL,
  `examtoclass` CHAR(12) NULL,
  `marks` INT NULL,
  `rank` INT NULL,
  `concession` INT NULL,
  `status` CHAR(15) NULL,
  `reexamdate` DATETIME NULL,
  `comments` CHAR(50) NULL,
  `registerid` INT NULL,
  `admno` INT NULL,
  `admdate` DATETIME NULL,
  `admgivenby` CHAR(10) NULL,
  `admfee` DOUBLE NULL,
  `sent` TINYINT(1) NOT NULL,
  `receipt` INT NULL,
  `mobile` CHAR(15) NULL,
  `status1` CHAR(20) NULL,
  `transport` INT NULL,
  `stopid` INT NULL,
  `studyyear` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.eventlog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`eventlog` (
  `logid` INT NOT NULL,
  `logdate` DATETIME NOT NULL,
  `userid` INT NOT NULL,
  `logaction` CHAR(10) NOT NULL,
  `logdescr` CHAR(150) NULL,
  `module` CHAR(100) NULL,
  `registerid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.examgroups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`examgroups` (
  `groupid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `name` CHAR(20) NULL,
  `shortname` CHAR(10) NULL,
  `grouppercent` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.exams
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`exams` (
  `exam_id` INT NOT NULL,
  `registerid` INT NOT NULL,
  `exam` CHAR(20) NOT NULL,
  `description` CHAR(70) NULL,
  `shortname` CHAR(5) NULL,
  `groupid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.fbooks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`fbooks` (
  `bookid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `name` CHAR(20) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.fee
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`fee` (
  `rowid` INT NOT NULL,
  `bookid` INT NOT NULL,
  `receipt` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `descri` CHAR(100) NULL,
  `admno` INT NOT NULL,
  `class` CHAR(20) NULL,
  `amount` DOUBLE NOT NULL,
  `concession` DOUBLE NULL,
  `netamount` DOUBLE NOT NULL,
  `dddetails` CHAR(15) NULL,
  `paid` TINYINT(1) NOT NULL,
  `paidamount` DOUBLE NULL,
  `balance` DOUBLE NULL,
  `userid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.feeitems
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`feeitems` (
  `rowid` INT NOT NULL,
  `bookid` INT NOT NULL,
  `receipt` INT NOT NULL,
  `feeid` INT NOT NULL,
  `name` CHAR(25) NOT NULL,
  `amount` DOUBLE NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.feetemp
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`feetemp` (
  `feeid` INT NOT NULL,
  `name` CHAR(50) NOT NULL,
  `amount` DOUBLE NULL DEFAULT 0,
  `checked` TINYINT(1) NULL DEFAULT 0,
  `userid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.feetypes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`feetypes` (
  `feeid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `name` CHAR(30) NOT NULL,
  `admfee` TINYINT(1) NOT NULL,
  `nodues` TINYINT(1) NOT NULL,
  `amount` INT NULL,
  `selected` INT NULL,
  `shortname` CHAR(10) NULL,
  `headid` INT NULL,
  `groupid` INT NULL,
  `studentacc` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.holidays
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`holidays` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `holidaydate` DATETIME NOT NULL,
  `description` CHAR(50) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.filters
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`filters` (
  `filterid` INT NOT NULL,
  `name` CHAR(60) NOT NULL,
  `recordfilter` CHAR(100) NOT NULL,
  `disporder` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.grades
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`grades` (
  `rowid` INT NOT NULL,
  `exam_id` INT NOT NULL,
  `class` CHAR(20) NULL,
  `range1` DOUBLE NULL,
  `range2` DOUBLE NULL,
  `grade` CHAR(5) NULL,
  `points` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.heads
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`heads` (
  `headid` INT NOT NULL,
  `rootid` INT NULL,
  `alias` CHAR(10) NOT NULL,
  `name` CHAR(40) NOT NULL,
  `type` CHAR(10) NULL,
  `balance` DOUBLE NULL,
  `sign` CHAR(2) NULL,
  `base` TINYINT(1) NULL,
  `category` CHAR(10) NULL,
  `regnum` CHAR(20) NULL,
  `vehtype` CHAR(20) NULL,
  `model` CHAR(20) NULL,
  `make` CHAR(10) NULL,
  `inscomp` CHAR(30) NULL,
  `insprem` DOUBLE NULL,
  `insdate` DATETIME NULL,
  `insrenew` DATETIME NULL,
  `pollcheck` DATETIME NULL,
  `pollrenew` DATETIME NULL,
  `createdon` DATETIME NULL,
  `userid` INT NULL,
  `lastmod` DATETIME NULL,
  `lastmoduser` INT NULL,
  `active` TINYINT UNSIGNED NULL,
  `notes` LONGTEXT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.issues
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`issues` (
  `issueid` INT NOT NULL,
  `issuedate` DATETIME NOT NULL,
  `admno` INT NULL DEFAULT 0,
  `card` TINYINT UNSIGNED NULL DEFAULT 0,
  `bookid` INT NULL DEFAULT 0,
  `returned` TINYINT(1) NULL DEFAULT 0,
  `retdate` DATETIME NULL,
  `fine` DOUBLE NULL DEFAULT 0,
  `remarks` CHAR(10) NULL,
  `registerid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.attendancebak
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`attendancebak` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `attdate` DATETIME NOT NULL,
  `admno` INT NOT NULL,
  `class` CHAR(10) NULL,
  `status` INT NOT NULL,
  `rsncode` INT NULL,
  `userid` INT NOT NULL,
  `entrydate` DATETIME NULL,
  `hr1` TINYINT(1) NULL,
  `hr2` TINYINT(1) NULL,
  `hr3` TINYINT(1) NULL,
  `hr4` TINYINT(1) NULL,
  `hr5` TINYINT(1) NULL,
  `hr6` TINYINT(1) NULL,
  `hr7` TINYINT(1) NULL,
  `hr8` TINYINT(1) NULL,
  `hr9` TINYINT(1) NULL,
  `ptotal` INT NULL,
  `wtotal` INT NULL,
  `studyyear` INT NULL,
  `semester` CHAR(10) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.studyconduct
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`studyconduct` (
  `certid` INT NOT NULL,
  `certtype` TINYINT UNSIGNED NOT NULL,
  `certdate` DATETIME NOT NULL,
  `admno` INT NOT NULL,
  `studyyear` TINYINT UNSIGNED NULL,
  `registerid` INT NOT NULL,
  `userid` INT NOT NULL,
  `lastmod` DATETIME NOT NULL,
  `rowid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.marks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`marks` (
  `rowid` INT NOT NULL,
  `admno` INT NOT NULL,
  `exam_id` INT NOT NULL,
  `class` CHAR(20) NULL,
  `rollno` INT NULL,
  `col1` CHAR(5) NULL,
  `col2` CHAR(5) NULL,
  `col3` CHAR(5) NULL,
  `col4` CHAR(5) NULL,
  `col5` CHAR(5) NULL,
  `col6` CHAR(5) NULL,
  `col7` CHAR(5) NULL,
  `col8` CHAR(5) NULL,
  `col9` CHAR(5) NULL,
  `col10` CHAR(5) NULL,
  `col11` CHAR(5) NULL,
  `col12` CHAR(5) NULL,
  `col13` CHAR(5) NULL,
  `col14` CHAR(5) NULL,
  `col15` CHAR(5) NULL,
  `col16` CHAR(5) NULL,
  `col17` CHAR(5) NULL,
  `col18` CHAR(5) NULL,
  `col19` CHAR(5) NULL,
  `col20` CHAR(5) NULL,
  `total` DOUBLE NULL,
  `average` DOUBLE NULL,
  `rank` INT NULL,
  `grade` CHAR(3) NULL,
  `percentage` DOUBLE NULL,
  `status` CHAR(6) NULL,
  `remarks` CHAR(50) NULL,
  `checked` TINYINT(1) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.modules
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`modules` (
  `rowid` INT NOT NULL,
  `userid` INT NULL,
  `modcode` CHAR(5) NULL,
  `modname` CHAR(40) NULL,
  `canopen` TINYINT(1) NULL,
  `canadd` TINYINT(1) NULL,
  `canedit` TINYINT(1) NULL,
  `candelete` TINYINT(1) NULL,
  `canview` TINYINT(1) NULL,
  `cansms` TINYINT(1) NULL,
  `vouchlimit` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.registerbak
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`registerbak` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `admno` INT NOT NULL,
  `name` CHAR(40) NULL,
  `sex` CHAR(6) NOT NULL,
  `dob` DATETIME NULL,
  `father` CHAR(40) NULL,
  `occupation` CHAR(20) NULL,
  `mother` CHAR(30) NULL,
  `paddress` CHAR(30) NULL,
  `pstreet` CHAR(30) NULL,
  `parea` CHAR(30) NULL,
  `caddress` CHAR(30) NULL,
  `cstreet` CHAR(30) NULL,
  `carea` CHAR(30) NULL,
  `phones` CHAR(30) NULL,
  `admittedin` CHAR(10) NULL,
  `tc` TINYINT(1) NULL,
  `bc` TINYINT(1) NULL,
  `pr` TINYINT(1) NULL,
  `idmark1` CHAR(100) NULL,
  `idmark2` CHAR(100) NULL,
  `religion` CHAR(10) NULL,
  `caste` CHAR(20) NULL,
  `class` CHAR(20) NULL,
  `doa` DATETIME NULL,
  `discontinu` TINYINT(1) NULL,
  `tcnum` INT NULL,
  `tcdate` DATETIME NULL,
  `status` CHAR(20) NULL,
  `selected` TINYINT(1) NULL,
  `photo` TINYBLOB NULL,
  `transport` INT NULL,
  `prevschool` CHAR(100) NULL,
  `ssid` CHAR(16) NULL,
  `address` LONGTEXT NULL,
  `dueamount` DOUBLE NOT NULL,
  `stopid` INT NULL,
  `concession` DOUBLE NOT NULL,
  `notes` LONGTEXT NULL,
  `shortname` CHAR(15) NULL,
  `email` CHAR(80) NULL,
  `mobile` CHAR(60) NULL,
  `feetype` TINYINT UNSIGNED NULL,
  `subcaste` CHAR(20) NULL,
  `studenttype` CHAR(20) NULL,
  `hosteltype` CHAR(20) NULL,
  `sscnum` CHAR(20) NULL,
  `sscyear` CHAR(4) NULL,
  `sscmarks` INT NULL,
  `sscdivision` CHAR(10) NULL,
  `internum` CHAR(20) NULL,
  `interyear` CHAR(4) NULL,
  `intermarks` INT NULL,
  `interdivision` CHAR(10) NULL,
  `sscmemo` TINYINT(1) NULL,
  `intermemo` TINYINT(1) NULL,
  `ccstudycert` TINYINT(1) NULL,
  `castecert` TINYINT(1) NULL,
  `incomecert` TINYINT(1) NULL,
  `eamcetrankcard` TINYINT(1) NULL,
  `eamcethtkt` TINYINT(1) NULL,
  `regdnum` CHAR(30) NULL,
  `sscpercent` DOUBLE NULL,
  `interpercent` DOUBLE NULL,
  `house` CHAR(10) NULL,
  `activity` CHAR(20) NULL,
  `iitcoaching` CHAR(1) NULL,
  `rollnum` INT NULL,
  `optional` CHAR(10) NULL,
  `studyyear` INT NULL,
  `stdue` DOUBLE NULL,
  `pmdue` DOUBLE NULL,
  `newadm` TINYINT(1) NULL,
  `semester` CHAR(10) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.msgcontrol
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`msgcontrol` (
  `srvid` TINYINT UNSIGNED NOT NULL,
  `srvstatus` CHAR(10) NOT NULL,
  `srvmessage` CHAR(100) NULL,
  `comport` CHAR(10) NULL,
  `baud` CHAR(20) NULL,
  `smspause` INT NULL,
  `sendoption` CHAR(10) NULL,
  `provider` CHAR(100) NULL,
  `username` CHAR(30) NULL,
  `passwd` CHAR(30) NULL,
  `serviceurl` CHAR(200) NULL,
  `balanceurl` CHAR(200) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.msgoutbox
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`msgoutbox` (
  `msgid` INT NOT NULL,
  `msgdate` DATETIME NOT NULL,
  `recipient` CHAR(80) NOT NULL,
  `message` CHAR(200) NOT NULL,
  `status` CHAR(10) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`notes` (
  `noteid` INT NOT NULL,
  `entrydate` DATETIME NOT NULL,
  `userid` INT NULL,
  `note` LONGTEXT NULL,
  `context` CHAR(10) NOT NULL,
  `lastmod` DATETIME NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.options
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`options` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `schoolname` CHAR(40) NULL,
  `address` CHAR(60) NULL,
  `phones` CHAR(60) NULL,
  `title1` CHAR(60) NULL,
  `title2` CHAR(60) NULL,
  `title3` CHAR(120) NULL,
  `feefoot1` CHAR(60) NULL,
  `feefoot2` CHAR(60) NULL,
  `examfoot1` CHAR(150) NULL,
  `examfoot2` CHAR(150) NULL,
  `skipranks` INT NULL,
  `includeabsent` INT NULL,
  `includefailure` INT NULL,
  `ranktofail` INT NULL,
  `failstring` CHAR(1) NULL,
  `reportpause` INT NULL,
  `autoremarks` INT NULL,
  `preprinted` INT NULL,
  `grading` INT NULL,
  `printmode` INT NULL,
  `rep1head` LONGTEXT NULL,
  `rep1foot` LONGTEXT NULL,
  `rep2head` LONGTEXT NULL,
  `rep2foot` LONGTEXT NULL,
  `rep3head` LONGTEXT NULL,
  `rep3foot` LONGTEXT NULL,
  `rep4head` LONGTEXT NULL,
  `rep4foot` LONGTEXT NULL,
  `rep5head` LONGTEXT NULL,
  `rep5foot` LONGTEXT NULL,
  `rep6head` LONGTEXT NULL,
  `rep6foot` LONGTEXT NULL,
  `rep7head` LONGTEXT NULL,
  `rep7foot` LONGTEXT NULL,
  `rep8head` LONGTEXT NULL,
  `rep8foot` LONGTEXT NULL,
  `rep9head` LONGTEXT NULL,
  `rep9foot` LONGTEXT NULL,
  `rep10head` LONGTEXT NULL,
  `rep10foot` LONGTEXT NULL,
  `rep11head` LONGTEXT NULL,
  `rep11foot` LONGTEXT NULL,
  `rep12head` LONGTEXT NULL,
  `rep12foot` LONGTEXT NULL,
  `rep13head` LONGTEXT NULL,
  `rep13foot` LONGTEXT NULL,
  `rep14head` LONGTEXT NULL,
  `rep14foot` LONGTEXT NULL,
  `printgrade` INT NULL,
  `gradetofail` INT NULL,
  `letterhead` LONGTEXT NULL,
  `letterfoot` LONGTEXT NULL,
  `compressmode` INT NULL,
  `printranks` INT NULL,
  `repc1head` LONGTEXT NULL,
  `repc1foot` LONGTEXT NULL,
  `billheader` LONGTEXT NULL,
  `billfooter` LONGTEXT NULL,
  `website` CHAR(60) NULL,
  `email1` CHAR(60) NULL,
  `email2` CHAR(60) NULL,
  `email3` CHAR(60) NULL,
  `ftpuser` CHAR(30) NULL,
  `ftppass` CHAR(18) NULL,
  `logo` TINYBLOB NULL,
  `mobile1` VARCHAR(12) NULL,
  `mobile2` VARCHAR(12) NULL,
  `mobile3` VARCHAR(12) NULL,
  `astart` DATETIME NULL,
  `aend` DATETIME NULL,
  `pregisterid` INT NULL,
  `grades` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.register
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`register` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `admno` INT NOT NULL,
  `name` CHAR(40) NULL,
  `sex` CHAR(6) NOT NULL,
  `dob` DATETIME NULL,
  `father` CHAR(40) NULL,
  `occupation` CHAR(20) NULL,
  `mother` CHAR(30) NULL,
  `paddress` CHAR(30) NULL,
  `pstreet` CHAR(30) NULL,
  `parea` CHAR(30) NULL,
  `caddress` CHAR(30) NULL,
  `cstreet` CHAR(30) NULL,
  `carea` CHAR(30) NULL,
  `phones` CHAR(30) NULL,
  `admittedin` CHAR(10) NULL,
  `tc` TINYINT(1) NULL,
  `bc` TINYINT(1) NULL,
  `pr` TINYINT(1) NULL,
  `idmark1` CHAR(100) NULL,
  `idmark2` CHAR(100) NULL,
  `religion` CHAR(10) NULL,
  `caste` CHAR(20) NULL,
  `class` CHAR(20) NULL,
  `doa` DATETIME NULL,
  `discontinu` TINYINT(1) NULL,
  `tcnum` INT NULL,
  `tcdate` DATETIME NULL,
  `status` CHAR(20) NULL,
  `selected` TINYINT(1) NULL DEFAULT 0,
  `photo` TINYBLOB NULL,
  `transport` INT NULL,
  `prevschool` CHAR(100) NULL,
  `ssid` CHAR(16) NULL,
  `address` LONGTEXT NULL,
  `dueamount` DOUBLE NOT NULL DEFAULT 0,
  `stopid` INT NULL DEFAULT 0,
  `concession` DOUBLE NOT NULL DEFAULT 0,
  `notes` LONGTEXT NULL,
  `shortname` CHAR(15) NULL,
  `email` CHAR(80) NULL,
  `mobile` CHAR(60) NULL,
  `feetype` TINYINT UNSIGNED NULL,
  `subcaste` CHAR(20) NULL,
  `studenttype` CHAR(20) NULL,
  `hosteltype` CHAR(20) NULL,
  `sscnum` CHAR(20) NULL,
  `sscyear` CHAR(4) NULL,
  `sscmarks` INT NULL,
  `sscdivision` CHAR(10) NULL,
  `internum` CHAR(20) NULL,
  `interyear` CHAR(4) NULL,
  `intermarks` INT NULL,
  `interdivision` CHAR(10) NULL,
  `sscmemo` TINYINT(1) NULL,
  `intermemo` TINYINT(1) NULL,
  `ccstudycert` TINYINT(1) NULL,
  `castecert` TINYINT(1) NULL,
  `incomecert` TINYINT(1) NULL,
  `eamcetrankcard` TINYINT(1) NULL,
  `eamcethtkt` TINYINT(1) NULL,
  `regdnum` CHAR(30) NULL,
  `sscpercent` DOUBLE NULL,
  `interpercent` DOUBLE NULL,
  `house` CHAR(10) NULL,
  `activity` CHAR(20) NULL,
  `iitcoaching` CHAR(1) NULL,
  `rollnum` INT NULL,
  `optional` CHAR(10) NULL,
  `studyyear` INT NULL,
  `stdue` DOUBLE NULL,
  `pmdue` DOUBLE NULL,
  `newadm` TINYINT(1) NULL,
  `semester` CHAR(10) NULL,
  `fqualification` CHAR(15) NULL,
  `bankac` CHAR(15) NULL,
  `bankbranch` CHAR(15) NULL,
  `ifsccode` CHAR(11) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.bills
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`bills` (
  `billno` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `name` CHAR(40) NULL DEFAULT '',
  `total` DOUBLE NOT NULL DEFAULT 0,
  `discount` DOUBLE NULL DEFAULT 0,
  `amount` DOUBLE NOT NULL DEFAULT 0,
  `cons` DOUBLE NULL DEFAULT 0,
  `vat` DOUBLE NULL,
  `admno` INT NULL,
  `registerid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.registers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`registers` (
  `registerid` INT NOT NULL,
  `name` CHAR(60) NULL,
  `lastused` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.rmodels
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`rmodels` (
  `model` INT NOT NULL,
  `name` CHAR(30) NULL,
  `header` LONGTEXT NULL,
  `footer` LONGTEXT NULL,
  `bodywidth` CHAR(10) NULL,
  `serial` TINYINT(1) NOT NULL,
  `numwords` TINYINT(1) NOT NULL,
  `selected` TINYINT(1) NOT NULL,
  `repname` CHAR(100) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.routedates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`routedates` (
  `rowid` INT NOT NULL,
  `routeid` INT NOT NULL,
  `duedate` DATETIME NOT NULL,
  `amount` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.routemaster
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`routemaster` (
  `routeid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `name` CHAR(20) NOT NULL,
  `vehicle` CHAR(30) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.routes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`routes` (
  `rowid` INT NULL,
  `stopid` INT NOT NULL,
  `routeid` INT NOT NULL,
  `name` CHAR(30) NOT NULL,
  `termamount` DOUBLE NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.billdetails
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`billdetails` (
  `rowid` INT NOT NULL,
  `referer` INT NOT NULL DEFAULT 0,
  `billno` INT NOT NULL DEFAULT 0,
  `itemid` INT NULL,
  `productid` INT NOT NULL DEFAULT 0,
  `qty` DECIMAL(12,2) NULL,
  `rate` DOUBLE NOT NULL DEFAULT 0,
  `total` DOUBLE NOT NULL DEFAULT 0);

-- ----------------------------------------------------------------------------
-- Table iFox.settings
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`settings` (
  `settingname` CHAR(100) NOT NULL,
  `settingvalue` CHAR(200) NULL,
  `description` CHAR(200) NOT NULL DEFAULT '',
  `useraccess` CHAR(1) NOT NULL DEFAULT 'Y',
  `pkey` INT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.studentfee
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`studentfee` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `admno` INT NOT NULL,
  `feeid` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `duedate` DATETIME NULL,
  `remarks` CHAR(30) NULL,
  `addnlfee` TINYINT UNSIGNED NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.subjects
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`subjects` (
  `rowid` INT NOT NULL,
  `exam_id` INT NOT NULL,
  `class` CHAR(20) NULL,
  `colname` CHAR(5) NOT NULL,
  `subject` CHAR(20) NOT NULL,
  `shortname` CHAR(10) NOT NULL,
  `maxmarks` INT NOT NULL,
  `minmarks` DOUBLE NOT NULL,
  `total` TINYINT(1) NOT NULL,
  `teacher` CHAR(20) NULL,
  `testdate` DATETIME NULL,
  `duration` CHAR(5) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.tc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`tc` (
  `tcnum` INT NOT NULL,
  `tcdate` DATETIME NULL,
  `tcappldate` DATETIME NULL,
  `admno` INT NULL,
  `name` CHAR(35) NULL,
  `father` CHAR(30) NULL DEFAULT '',
  `dob` DATETIME NULL,
  `religion` CHAR(10) NULL DEFAULT ' ',
  `caste` CHAR(5) NULL DEFAULT '',
  `subcaste` CHAR(20) NULL DEFAULT '',
  `leavingclass` CHAR(10) NULL DEFAULT '',
  `subjects` CHAR(45) NULL DEFAULT '',
  `medium` CHAR(7) NULL DEFAULT '',
  `doa` DATETIME NULL,
  `yearjoined` INT NULL,
  `class` CHAR(10) NULL DEFAULT '',
  `leavingdate` DATETIME NULL,
  `leavingreason` CHAR(35) NULL DEFAULT '',
  `idmark1` CHAR(45) NULL DEFAULT '',
  `idmark2` CHAR(45) NULL DEFAULT '',
  `tctype` TINYINT UNSIGNED NULL,
  `selected` TINYINT(1) NULL,
  `qualified` CHAR(60) NULL DEFAULT '',
  `studyyear` INT NULL,
  `feedues` CHAR(20) NULL,
  `medical` CHAR(20) NULL,
  `conduct` CHAR(20) NULL,
  `concession` CHAR(20) NULL,
  `regdnum` CHAR(30) NULL,
  `registerid` INT NULL,
  `rowid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.billtemp
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`billtemp` (
  `rowid` INT NOT NULL,
  `billno` INT NOT NULL,
  `productid` INT NOT NULL,
  `mfr` CHAR(5) NULL,
  `code` CHAR(10) NULL,
  `packing` CHAR(6) NULL,
  `batchno` CHAR(10) NULL,
  `expirydate` DATETIME NULL,
  `qty` DECIMAL(12,2) NULL,
  `free` DECIMAL(12,2) NULL,
  `rate` DOUBLE NOT NULL,
  `mrp` DOUBLE NULL,
  `total` DOUBLE NOT NULL,
  `referer` INT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.groups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`groups` (
  `groupid` INT NOT NULL,
  `name` CHAR(20) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.invoice
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`invoice` (
  `invoiceid` INT NOT NULL,
  `supplierid` INT NOT NULL,
  `invoiceno` CHAR(10) NULL,
  `date` DATETIME NULL,
  `total` DOUBLE NULL,
  `discount` DOUBLE NULL,
  `amount` DOUBLE NULL,
  `sno` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.invoicedetails
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`invoicedetails` (
  `rowid` INT NOT NULL,
  `invoiceid` INT NOT NULL,
  `productid` INT NOT NULL,
  `mfr` CHAR(5) NULL,
  `batchno` CHAR(10) NULL DEFAULT '',
  `expirydate` DATETIME NULL,
  `qty` DECIMAL(12,2) NULL,
  `free` DECIMAL(12,2) NULL,
  `rate` DOUBLE NOT NULL DEFAULT 0,
  `mrp` DOUBLE NOT NULL DEFAULT 0,
  `total` DOUBLE NULL DEFAULT 0,
  `sold` DECIMAL(12,2) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.preturn_details
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`preturn_details` (
  `rowid` INT NOT NULL,
  `retno` INT NOT NULL,
  `productid` INT NOT NULL,
  `qty` DECIMAL(12,2) NULL,
  `free` DECIMAL(12,2) NULL,
  `rate` DOUBLE NULL,
  `total` DOUBLE NULL,
  `referer` INT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`users` (
  `userid` INT NOT NULL,
  `name` CHAR(20) NOT NULL,
  `password` CHAR(10) NULL,
  `disabled` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.preturns
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`preturns` (
  `retno` INT NOT NULL,
  `supplierid` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `narration` CHAR(50) NULL,
  `total` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.voucher
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`voucher` (
  `vrno` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `headid` INT NOT NULL,
  `alias` CHAR(10) NULL,
  `narration` CHAR(250) NULL,
  `debit` DOUBLE NULL,
  `credit` DOUBLE NULL,
  `registerid` INT NULL,
  `rowid` INT NULL,
  `userid` INT NULL,
  `lastmod` DATETIME NULL,
  `approveid` INT NULL,
  `approvedate` DATETIME NULL,
  `remarks` LONGTEXT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.employee
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`employee` (
  `empid` INT NOT NULL,
  `sno` INT NULL,
  `groupid` INT NOT NULL,
  `name` CHAR(25) NOT NULL,
  `dob` DATETIME NULL,
  `address` LONGTEXT NULL,
  `phones` CHAR(10) NULL,
  `mobile` CHAR(10) NULL,
  `qualification` LONGTEXT NULL,
  `experience` LONGTEXT NULL,
  `doj` DATETIME NULL,
  `desig` CHAR(15) NULL,
  `dept` CHAR(15) NULL,
  `type` TINYINT UNSIGNED NULL,
  `parttime` TINYINT UNSIGNED NULL,
  `accnum` CHAR(15) NULL,
  `pfnumber` CHAR(10) NULL,
  `pan` CHAR(15) NULL,
  `scale` TINYINT UNSIGNED NULL,
  `basic` DOUBLE NULL,
  `fpi` DOUBLE NULL,
  `sp` DOUBLE NULL,
  `da` DOUBLE NULL,
  `hra` DOUBLE NULL,
  `others` DOUBLE NULL,
  `gross` DOUBLE NULL,
  `pfund` DOUBLE NULL,
  `pfloan` DOUBLE NULL,
  `lic` DOUBLE NULL,
  `itax` DOUBLE NULL,
  `ptax` DOUBLE NULL,
  `gslis` DOUBLE NULL,
  `other` DOUBLE NULL,
  `total` DOUBLE NULL,
  `ppay` DOUBLE NULL,
  `allowance` DOUBLE NULL,
  `epf` DOUBLE NULL,
  `mgmt` DOUBLE NULL,
  `loan1` DOUBLE NULL,
  `loan2` DOUBLE NULL,
  `netsal` DOUBLE NULL,
  `cleaves` DOUBLE NULL,
  `eleaves` DOUBLE NULL,
  `sleaves` DOUBLE NULL,
  `oleaves` DOUBLE NULL,
  `dropped` TINYINT(1) NULL,
  `photo` TINYBLOB NULL,
  `incrdate` CHAR(10) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.products
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`products` (
  `productid` INT NOT NULL,
  `groupid` INT NULL,
  `productcode` CHAR(10) NULL,
  `name` CHAR(25) NOT NULL,
  `packing` CHAR(6) NULL,
  `price` DECIMAL(10,2) NULL,
  `opening` DECIMAL(12,2) NULL,
  `sale` DECIMAL(12,2) NULL,
  `balance` DECIMAL(12,2) NULL,
  `dropped` TINYINT(1) NULL DEFAULT 0);

-- ----------------------------------------------------------------------------
-- Table iFox.emptrans
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`emptrans` (
  `slipnum` INT NOT NULL,
  `sno` INT NULL,
  `empid` INT NOT NULL,
  `groupid` INT NOT NULL,
  `month` CHAR(10) NOT NULL,
  `wdays` INT NULL,
  `paydate` DATETIME NULL,
  `amount` DOUBLE NULL,
  `basic` DOUBLE NULL,
  `fpi` DOUBLE NULL,
  `sp` DOUBLE NULL,
  `da` DOUBLE NULL,
  `hra` DOUBLE NULL,
  `others` DOUBLE NULL,
  `gross` DOUBLE NULL,
  `pfund` DOUBLE NULL,
  `pfloan` DOUBLE NULL,
  `lic` DOUBLE NULL,
  `itax` DOUBLE NULL,
  `ptax` DOUBLE NULL,
  `gslis` DOUBLE NULL,
  `other` DOUBLE NULL,
  `total` DOUBLE NULL,
  `ppay` DOUBLE NULL,
  `allowance` DOUBLE NULL,
  `epf` DOUBLE NULL,
  `mgmt` DOUBLE NULL,
  `loan1` DOUBLE NULL,
  `loan2` DOUBLE NULL,
  `netsalary` DOUBLE NULL,
  `particulars` CHAR(60) NULL,
  `tchtrust` DOUBLE NULL,
  `tchassn` DOUBLE NULL,
  `ntstrust` DOUBLE NULL,
  `ntsassn` DOUBLE NULL,
  `bankloan` DOUBLE NULL,
  `totalded` DOUBLE NULL,
  `salarybal` DOUBLE NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.sreturn_details
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`sreturn_details` (
  `rowid` INT NOT NULL,
  `retno` INT NOT NULL,
  `productid` INT NOT NULL,
  `qty` DECIMAL(12,2) NULL,
  `rate` DOUBLE NOT NULL,
  `amount` DOUBLE NOT NULL,
  `referer` INT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.workingdays
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`workingdays` (
  `rowid` INT NOT NULL,
  `registerid` TINYINT UNSIGNED NOT NULL,
  `class` CHAR(20) NOT NULL,
  `jan` TINYINT UNSIGNED NULL,
  `feb` TINYINT UNSIGNED NULL,
  `mar` TINYINT UNSIGNED NULL,
  `apr` TINYINT UNSIGNED NULL,
  `may` TINYINT UNSIGNED NULL,
  `jun` TINYINT UNSIGNED NULL,
  `jul` TINYINT UNSIGNED NULL,
  `aug` TINYINT UNSIGNED NULL,
  `sep` TINYINT UNSIGNED NULL,
  `oct` TINYINT UNSIGNED NULL,
  `nov` TINYINT UNSIGNED NULL,
  `dec` TINYINT UNSIGNED NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.sreturns
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`sreturns` (
  `retno` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `amount` DOUBLE NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.suppliers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`suppliers` (
  `supplierid` INT NOT NULL,
  `supplier` CHAR(25) NOT NULL,
  `address` LONGTEXT NULL,
  `contactname` CHAR(30) NULL,
  `phone` CHAR(10) NULL,
  `tin` CHAR(20) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.templates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`templates` (
  `templateid` INT NOT NULL,
  `context` CHAR(30) NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `name` CHAR(50) NOT NULL,
  `description` CHAR(100) NOT NULL,
  `message` CHAR(254) NULL,
  `userid` INT NOT NULL,
  `createdon` DATETIME NOT NULL,
  `lastmod` DATETIME NULL,
  `lastmoduser` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.siblings
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`siblings` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `admno` INT NOT NULL,
  `sadmno` INT NOT NULL,
  `relation` CHAR(10) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.reason
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`reason` (
  `rowid` INT NOT NULL,
  `reason` CHAR(50) NOT NULL,
  `module` CHAR(30) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.classes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`classes` (
  `classid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `sequence` INT NULL,
  `classname` CHAR(20) NULL,
  `subjects` CHAR(100) NULL,
  `shortname` CHAR(10) NOT NULL,
  `duration` INT NULL,
  `active` TINYINT UNSIGNED NULL,
  `description` CHAR(100) NULL,
  `rowid` INT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.msgsent
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`msgsent` (
  `msgid` INT NOT NULL,
  `msgdate` DATETIME NOT NULL,
  `recipient` CHAR(80) NOT NULL,
  `message` CHAR(200) NOT NULL,
  `status` CHAR(10) NOT NULL,
  `sentdate` DATETIME NULL,
  `retries` TINYINT UNSIGNED NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.feetemplates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`feetemplates` (
  `templateid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `templatename` CHAR(50) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.feetemplatedetail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`feetemplatedetail` (
  `rowid` INT NOT NULL,
  `templateid` INT NOT NULL,
  `sequence` INT NOT NULL,
  `feeid` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `duedate` DATETIME NULL,
  `remarks` CHAR(30) NULL,
  `selected` TINYINT(1) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.SysReports
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`SysReports` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `reporttype` CHAR(10) NOT NULL,
  `reportname` CHAR(30) NULL,
  `reportfile` CHAR(200) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.productkits
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`productkits` (
  `kitid` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `active` TINYINT UNSIGNED NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.productkitdetails
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`productkitdetails` (
  `rowid` INT NOT NULL,
  `kitid` INT NOT NULL,
  `productid` INT NOT NULL,
  `qty` DECIMAL(12,2) NULL,
  `active` TINYINT UNSIGNED NOT NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.address
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`address` (
  `rowid` INT NOT NULL,
  `name` CHAR(30) NOT NULL,
  `address` CHAR(30) NULL,
  `street` CHAR(30) NULL,
  `city` CHAR(30) NULL,
  `wphone` CHAR(20) NULL,
  `hphone` CHAR(20) NULL,
  `email` CHAR(50) NULL,
  `mobile` CHAR(40) NULL,
  `groupname` CHAR(30) NULL,
  `title` CHAR(6) NULL,
  `company` CHAR(30) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.admflds
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`admflds` (
  `rowid` INT NOT NULL,
  `checked` TINYINT(1) NOT NULL,
  `descri` CHAR(20) NULL,
  `fieldname` CHAR(15) NULL,
  `expression` CHAR(100) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.attendance
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`attendance` (
  `rowid` INT NOT NULL,
  `registerid` INT NOT NULL,
  `attdate` DATETIME NOT NULL,
  `admno` INT NOT NULL,
  `class` CHAR(10) NULL,
  `status` INT NOT NULL,
  `rsncode` INT NULL,
  `userid` INT NOT NULL,
  `entrydate` DATETIME NULL,
  `hr1` TINYINT(1) NULL,
  `hr2` TINYINT(1) NULL,
  `hr3` TINYINT(1) NULL,
  `hr4` TINYINT(1) NULL,
  `hr5` TINYINT(1) NULL,
  `hr6` TINYINT(1) NULL,
  `hr7` TINYINT(1) NULL,
  `hr8` TINYINT(1) NULL,
  `hr9` TINYINT(1) NULL,
  `ptotal` INT NULL,
  `wtotal` INT NULL,
  `studyyear` INT NULL,
  `semester` CHAR(10) NULL);

-- ----------------------------------------------------------------------------
-- Table iFox.autosubjects
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `iFox`.`autosubjects` (
  `rowid` INT NOT NULL,
  `subject` CHAR(20) NULL,
  `shortname` CHAR(10) NULL,
  `maxmarks` INT NULL,
  `minmarks` DOUBLE NULL,
  `total` TINYINT(1) NULL DEFAULT 1,
  `selected` TINYINT(1) NULL DEFAULT 0);

-- ----------------------------------------------------------------------------
-- Trigger iFox.trUpdMoveSentToOutBox
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `iFox`$$
-- CREATE TRIGGER trUpdMoveSentToOutBox
-- ON msgoutbox
-- AFTER UPDATE
-- AS
-- 
-- SET NOCOUNT ON
-- INSERT INTO
-- 	msgsent
-- 	(msgdate, recipient, message, status, sentdate, retries)
-- SELECT msgdate, recipient, message, status, getdate(), 1
--   FROM inserted
--  WHERE status = 'SENT'
-- 
-- DELETE FROM msgoutbox 
--  WHERE msgid IN (SELECT msgid 
--                    FROM inserted 
--                   WHERE status = 'SENT');
SET FOREIGN_KEY_CHECKS = 1;;
