-- --------------------------------------------------------

--
-- Table structure for table "authors"
--

DROP TABLE IF EXISTS "authors";
CREATE TABLE "authors" (
  "id" serial NOT NULL,
  "username" varchar(50) NOT NULL,
  "password" varchar(50) NOT NULL,
  "level" smallint NOT NULL DEFAULT 0,
  "name" varchar(200) NOT NULL DEFAULT '',
  "location" varchar(200) NOT NULL DEFAULT '',
  "email" varchar(100) NOT NULL DEFAULT '',
  "subscribe" smallint NOT NULL DEFAULT 0,
  "reg_date" date NOT NULL DEFAULT CURRENT_DATE,
  "ip" varchar(20) NOT NULL DEFAULT '',
  CONSTRAINT authors_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "definitions"
--

DROP TABLE IF EXISTS "definitions";
CREATE TABLE "definitions" (
  "id" serial NOT NULL,
  "word_id" bigint NOT NULL,
  "tags" varchar(200) NOT NULL DEFAULT '',
  "meaning" text NOT NULL,
  "submit_date" date NOT NULL DEFAULT CURRENT_DATE,
  "example" text NOT NULL,
  "image_id" integer NOT NULL,
  "up" integer NOT NULL DEFAULT 0,
  "down" integer NOT NULL DEFAULT 0,
  "under_review" smallint NOT NULL DEFAULT 0,
  "under_verification" smallint NOT NULL DEFAULT 0,
  "verify_code" varchar(100) NOT NULL DEFAULT '',
  "author_id" integer NOT NULL DEFAULT 0,
  CONSTRAINT definitions_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "forum_question"
--

DROP TABLE IF EXISTS "forum_question";
CREATE TABLE "forum_question" (
  "id" serial NOT NULL,
  "topic" varchar(255) NOT NULL DEFAULT '',
  "detail" varchar(1000) NOT NULL,
  "name" varchar(65) NOT NULL DEFAULT '',
  "email" varchar(65) NOT NULL DEFAULT '',
  "datetime" varchar(25) NOT NULL DEFAULT '',
  "view" integer NOT NULL DEFAULT 0,
  "reply" integer NOT NULL DEFAULT 0,
  CONSTRAINT forum_questions_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "images"
--

DROP TABLE IF EXISTS "images";
CREATE TABLE "images" (
  "id" serial NOT NULL,
  "thumb" varchar(100) NOT NULL,
  "source" varchar(100) NOT NULL,
  "caption" varchar(500) NOT NULL,
  "need_review" smallint NOT NULL DEFAULT 0,
  CONSTRAINT images_pkey PRIMARY KEY (id)
);



--
-- Table structure for table "levels"
--

DROP TABLE IF EXISTS "levels";
CREATE TABLE "levels" (
  "id" serial NOT NULL,
  "author_id" bigint NOT NULL,
  "system_level" smallint NOT NULL,
  "active_level" smallint NOT NULL,
  "score" bigint NOT NULL,
  CONSTRAINT levels_pkey PRIMARY KEY (id)
);

--
-- Table structure for table "members"
--

DROP TABLE IF EXISTS "members";
CREATE TABLE "members" (
  "id" serial NOT NULL,
  "name" varchar(100) DEFAULT NULL,
  "username" varchar(100) NOT NULL DEFAULT '',
  "password" varchar(32) NOT NULL DEFAULT '',
  "level" smallint NOT NULL DEFAULT 0,
  "location" varchar(50) NOT NULL,
  "email" varchar(100) NOT NULL,
  CONSTRAINT members_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "offences"
--

DROP TABLE IF EXISTS "offences";
CREATE TABLE "offences" (
  "id" serial NOT NULL,
  "offence" varchar(100) NOT NULL,
  CONSTRAINT offences_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "origins"
--

DROP TABLE IF EXISTS "origins";
CREATE TABLE "origins" (
  "id" serial NOT NULL,
  "origin" varchar(100) NOT NULL,
  CONSTRAINT origins_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "requests"
--

DROP TABLE IF EXISTS "requests";
CREATE TABLE "requests" (
  "id" serial NOT NULL,
  "word" varchar(50) NOT NULL,
  "submit_date" date NOT NULL,
  "type" integer NOT NULL,
  "answered" smallint NOT NULL DEFAULT 0,
  "author_id" bigint NOT NULL,
  "ip" varchar(50) NOT NULL,
  CONSTRAINT requests_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "tags"
--

DROP TABLE IF EXISTS "tags";
CREATE TABLE "tags" (
  "id" serial NOT NULL,
  "word_id" bigint NOT NULL,
  "author_id" bigint NOT NULL,
  "word" varchar(50) NOT NULL,
  "date" date NOT NULL,
  "type" smallint NOT NULL DEFAULT '1',
  "answered" smallint NOT NULL DEFAULT 0,
  "ip" varchar(50) NOT NULL,
  CONSTRAINT tags_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "words"
--

DROP TABLE IF EXISTS "words";
CREATE TABLE "words" (
  "id" serial NOT NULL,
  "word" varchar(500) NOT NULL,
  "author_id" bigint NOT NULL,
  "submit_date" date NOT NULL,
  "views" bigint NOT NULL,
  CONSTRAINT words_pkey PRIMARY KEY (id)
);


--
-- Table structure for table "word_examples"
--

DROP TABLE IF EXISTS "word_examples";
CREATE TABLE "word_examples" (
  "id" serial NOT NULL,
  "word_id" bigint NOT NULL,
  "example" text NOT NULL,
  "author_id" bigint NOT NULL,
  PRIMARY KEY (id)
);


--
-- Table structure for table "word_image"
--

DROP TABLE IF EXISTS "word_image";
CREATE TABLE "word_image" (
  "id" serial NOT NULL,
  "word_id" bigint NOT NULL,
  "image_id" bigint NOT NULL,
  PRIMARY KEY (id)
);


--
-- Table structure for table "word_offence"
--

DROP TABLE IF EXISTS "word_offence";
CREATE TABLE "word_offence" (
  "id" serial NOT NULL,
  "word_id" bigint NOT NULL,
  "offence_id" smallint NOT NULL,
  PRIMARY KEY (id)
);


--
-- Table structure for table "word_origin"
--

DROP TABLE IF EXISTS "word_origin";
CREATE TABLE "word_origin" (
  "id" serial NOT NULL,
  "word_id" bigint NOT NULL,
  "origin_id" smallint NOT NULL,
  PRIMARY KEY (id)
);