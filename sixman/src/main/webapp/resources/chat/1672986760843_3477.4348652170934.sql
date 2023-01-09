DROP TABLE "USER" CASCADE CONSTRAINTS;

CREATE TABLE "USER" (
	"USER_NO"	NUMBER		NOT NULL,
	"RIGHT_NO"	NUMBER		NOT NULL,
	"ID"	VARCHAR2(50)	UNIQUE	NOT NULL,
	"PWD"	VARCHAR2(100)		NOT NULL,
	"NAME"	VARCHAR2(50)		NOT NULL,
	"EMAIL"	VARCHAR2(50)		NOT NULL,
	"NICK"	VARCHAR2(50)	UNIQUE	NOT NULL,
	"ADDRESS"	VARCHAR2(100)		NOT NULL,
	"PHONE"	VARCHAR2(15)		NOT NULL,
	"ENROLL_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"QUIT_YN"	CHAR(1)	DEFAULT 'N' CHECK(QUIT_YN IN ('Y' , 'N'))	NOT NULL,
	"MODIFY_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "USER"."USER_NO" IS 'ȸ���ڵ�';

COMMENT ON COLUMN "USER"."RIGHT_NO" IS 'ȸ���ڵ�';

COMMENT ON COLUMN "USER"."ID" IS '���̵�';

COMMENT ON COLUMN "USER"."PWD" IS '��й�ȣ';

COMMENT ON COLUMN "USER"."NAME" IS '�̸�';

COMMENT ON COLUMN "USER"."EMAIL" IS '�̸���';

COMMENT ON COLUMN "USER"."NICK" IS '�г���';

COMMENT ON COLUMN "USER"."PHONE" IS '�ڵ�����ȣ';

COMMENT ON COLUMN "USER"."ENROLL_DATE" IS '���Գ�¥';

COMMENT ON COLUMN "USER"."QUIT_YN" IS 'Ż�𿩺�';

COMMENT ON COLUMN "USER"."MODIFY_DATE" IS '������������';

DROP TABLE "SERVICE_INFO" CASCADE CONSTRAINTS;

CREATE TABLE "SERVICE_INFO" (
	"SERVICE_NO"	NUMBER		NOT NULL,
	"SERVICE_TYPE_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CHARGE"	NUMBER		NULL,
	"EXP"	NUMBER		NULL,
	"OPEN_TIME"	VARCHAR2(50)		NULL,
	"CLOSE_TIME"	VARCHAR2(50)		NULL,
	"DETAIL"	VARCHAR(4000)		NULL,
	"ESTIMATE_YN"	CHAR(1)	DEFAULT 'N' CHECK(ESTIMATE_YN IN ('Y' , 'N'))	NULL,
	"PAYMENT_ABLE_1"	NUMBER		NOT NULL,
	"PAYMENT_ABLE_2"	NUMBER		NOT NULL,
	"PAYMENT_ABLE_3"	NUMBER		NOT NULL,
	"AREA_1"	NUMBER		NOT NULL,
	"AREA_2"	NUMBER		NOT NULL,
	"AREA_3"	NUMBER		NOT NULL,
	"AREA_4"	NUMBER		NOT NULL,
	"AREA_5"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SERVICE_INFO"."SERVICE_NO" IS '���񽺹�ȣ';

COMMENT ON COLUMN "SERVICE_INFO"."SERVICE_TYPE_NO" IS '�����ڵ�';

COMMENT ON COLUMN "SERVICE_INFO"."USER_NO" IS '���������';

COMMENT ON COLUMN "SERVICE_INFO"."CHARGE" IS '���';

COMMENT ON COLUMN "SERVICE_INFO"."EXP" IS '����';

COMMENT ON COLUMN "SERVICE_INFO"."OPEN_TIME" IS '����۽ð�';

COMMENT ON COLUMN "SERVICE_INFO"."CLOSE_TIME" IS '�����ð�';

COMMENT ON COLUMN "SERVICE_INFO"."DETAIL" IS '�󼼳���';

COMMENT ON COLUMN "SERVICE_INFO"."ESTIMATE_YN" IS '�����ʿ�����';

COMMENT ON COLUMN "SERVICE_INFO"."PAYMENT_ABLE_1" IS '�������ɼ���1';

COMMENT ON COLUMN "SERVICE_INFO"."PAYMENT_ABLE_2" IS '�������ɼ���2';

COMMENT ON COLUMN "SERVICE_INFO"."PAYMENT_ABLE_3" IS '�������ɼ���3';

COMMENT ON COLUMN "SERVICE_INFO"."AREA_1" IS '��������1';

COMMENT ON COLUMN "SERVICE_INFO"."AREA_2" IS '��������2';

COMMENT ON COLUMN "SERVICE_INFO"."AREA_3" IS '��������3';

COMMENT ON COLUMN "SERVICE_INFO"."AREA_4" IS '��������4';

COMMENT ON COLUMN "SERVICE_INFO"."AREA_5" IS '��������5';

DROP TABLE "RESERVATION" CASCADE CONSTRAINTS;

CREATE TABLE "RESERVATION" (
	"RESERVATION_NO"	NUMBER		NOT NULL,
	"SERVICE_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"START_TIME"	TIMESTAMP		NOT NULL,
	"END_TIME"	TIMESTAMP		NOT NULL,
	"RESERVATION_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"PAYMENT_YN"	CHAR(1)	DEFAULT 'N' CHECK(PAYMENT_YN IN ('Y' , 'N'))	NOT NULL,
	"CANCEL_YN"	CHAR(1)	DEFAULT 'N' CHECK(CANCEL_YN IN ('Y' , 'N'))	NOT NULL,
	"CANCEL_DATE"	TIMESTAMP		NULL,
	"ESTIMATE_AMOUNT"	NUMBER		NULL
);

COMMENT ON COLUMN "RESERVATION"."RESERVATION_NO" IS '�����ȣ';

COMMENT ON COLUMN "RESERVATION"."SERVICE_NO" IS '�����Ѽ���';

COMMENT ON COLUMN "RESERVATION"."USER_NO" IS 'ȸ����ȣ';

COMMENT ON COLUMN "RESERVATION"."START_TIME" IS '���񽺽��۽ð�';

COMMENT ON COLUMN "RESERVATION"."END_TIME" IS '��������ð�';

COMMENT ON COLUMN "RESERVATION"."RESERVATION_DATE" IS '����ð�';

COMMENT ON COLUMN "RESERVATION"."PAYMENT_YN" IS '��������';

COMMENT ON COLUMN "RESERVATION"."CANCEL_YN" IS '��ҿ���';

COMMENT ON COLUMN "RESERVATION"."CANCEL_DATE" IS '����Ͻ�';

COMMENT ON COLUMN "RESERVATION"."ESTIMATE_AMOUNT" IS '�����ݾ�';

DROP TABLE "PAYMENT" CASCADE CONSTRAINTS;

CREATE TABLE "PAYMENT" (
	"PAYMENT_NO"	NUMBER		NOT NULL,
	"RESERVATION_NO"	NUMBER		NOT NULL,
	"SERVICE_NO"	NUMBER		NOT NULL,
	"PAYMENT_TYPE_NO"	NUMBER		NOT NULL,
	"PAY"	NUMBER		NULL,
	"PAYMENT_DATE"	TIMESTAMP	DEFAULT SYSDATE	NULL,
	"CANCEL_DATE"	TIMESTAMP		NOT NULL,
	"CANCEL_YN"	CHAR(1)	DEFAULT 'N' CHECK(CANCEL_YN IN ('Y' , 'N'))	NULL,
	"POINT"	NUMBER		NULL
);

COMMENT ON COLUMN "PAYMENT"."PAYMENT_NO" IS '������ȣ';

COMMENT ON COLUMN "PAYMENT"."RESERVATION_NO" IS '�����ȣ';

COMMENT ON COLUMN "PAYMENT"."SERVICE_NO" IS '���񽺹�ȣ';

COMMENT ON COLUMN "PAYMENT"."PAYMENT_TYPE_NO" IS '�����ڵ�';

COMMENT ON COLUMN "PAYMENT"."PAY" IS '�����ݾ�';

COMMENT ON COLUMN "PAYMENT"."PAYMENT_DATE" IS '�����Ͻ�';

COMMENT ON COLUMN "PAYMENT"."CANCEL_DATE" IS '����Ͻ�';

COMMENT ON COLUMN "PAYMENT"."CANCEL_YN" IS '��ҿ���';

DROP TABLE "BOARD" CASCADE CONSTRAINTS;

CREATE TABLE "BOARD" (
	"POST_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE_NO"	NUMBER		NOT NULL,
	"POST_TYPE_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"CONTENT"	VARCHAR2(4000)		NULL,
	"WRITE_TIME"	TIMESTAMP		NULL,
	"DELETE_YN"	CHAR(1)	DEFAULT 'N' CHECK(DELETE_YN IN ('Y' , 'N'))	NULL,
	"MODIFY_DATE"	TIMESTAMP	DEFAULT SYSDATE	NULL,
	"VIEWS"	NUMBER	DEFAULT '0'	NULL
);

DROP TABLE "EVENTHISTORY" CASCADE CONSTRAINTS;

CREATE TABLE "EVENTHISTORY" (
	"EH_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"DIFFICULTY_NO"	NUMBER		NOT NULL,
	"DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"SCORE"	NUMBER		NOT NULL,
	"POINT"	NUMBER		NULL
);

DROP TABLE "SERVICE" CASCADE CONSTRAINTS;

CREATE TABLE "SERVICE" (
	"SERVICE_TYPE_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NULL
);

DROP TABLE "AREA" CASCADE CONSTRAINTS;

CREATE TABLE "AREA" (
	"AREA_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "AREA"."AREA_NO" IS '�����ڵ�';

COMMENT ON COLUMN "AREA"."NAME" IS '������';

DROP TABLE "BANNER" CASCADE CONSTRAINTS;

CREATE TABLE "BANNER" (
	"BANNER_NO"	NUMBER		NOT NULL,
	"B_TYPE_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR(50)		NOT NULL,
	"IMG_LINK"	VARCHAR2(500)		NOT NULL,
	"LINK"	VARCHAR2(500)		NOT NULL
);

DROP TABLE "BANNER_TYPE" CASCADE CONSTRAINTS;

CREATE TABLE "BANNER_TYPE" (
	"B_TYPE_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR(50)		NOT NULL
);

COMMENT ON COLUMN "BANNER_TYPE"."NAME" IS '�̺�Ʈ. ��������, �α�';

DROP TABLE "COMMENT" CASCADE CONSTRAINTS;

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"POST_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NULL,
	"WRITE_TIME"	TIMESTAMP		NULL,
	"DELETE_YN"	CHAR(1)	DEFAULT 'N' CHECK(DELETE_YN IN ('Y' , 'N'))	NULL,
	"MODIFY_DATE"	TIMESTAMP	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "COMMENT"."USER_NO" IS 'ȸ���ڵ�';

DROP TABLE "BOARD_TYPE" CASCADE CONSTRAINTS;

CREATE TABLE "BOARD_TYPE" (
	"BOARD_TYPE_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(20)		NOT NULL
);

DROP TABLE "DIFFICULTY" CASCADE CONSTRAINTS;

CREATE TABLE "DIFFICULTY" (
	"DIFFICULTY_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(20)		NOT NULL
);

DROP TABLE "RIGHT" CASCADE CONSTRAINTS;

CREATE TABLE "RIGHT" (
	"RIGHT_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "RIGHT"."RIGHT_NO" IS 'ȸ�� ���� �ڵ�';

COMMENT ON COLUMN "RIGHT"."NAME" IS 'ȸ����������';

DROP TABLE "PAYMENT_TYPE" CASCADE CONSTRAINTS;

CREATE TABLE "PAYMENT_TYPE" (
	"PAYMENT_TYPE_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "PAYMENT_TYPE"."PAYMENT_TYPE_NO" IS '�����ڵ�';

COMMENT ON COLUMN "PAYMENT_TYPE"."NAME" IS '��������';

DROP TABLE "DOBBY" CASCADE CONSTRAINTS;

CREATE TABLE "DOBBY" (
	"USER_NO"	NUMBER		NOT NULL,
	"BR_NUM"	VARCHAR2(50)		NOT NULL,
	"ACCOUNT_NUM"	VARCHAR2(50)		NOT NULL,
	"SERVICE_1"	NUMBER		NOT NULL,
	"SERVICE_2"	NUMBER		NOT NULL,
	"SERVICE_3"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "DOBBY"."BR_NUM" IS '����ڵ�Ϲ�ȣ';

COMMENT ON COLUMN "DOBBY"."ACCOUNT_NUM" IS '����';

DROP TABLE "POST_TYPE" CASCADE CONSTRAINTS;

CREATE TABLE "POST_TYPE" (
	"POST_TYPE_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(20)		NOT NULL
);

DROP TABLE "ZZIM" CASCADE CONSTRAINTS;

CREATE TABLE "ZZIM" (
	"USER_NO"	NUMBER		NOT NULL,
	"SERVICE_NO"	NUMBER		NOT NULL
);

ALTER TABLE "USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "PK_SERVICE_INFO" PRIMARY KEY (
	"SERVICE_NO"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY (
	"RESERVATION_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"PAYMENT_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "EVENTHISTORY" ADD CONSTRAINT "PK_EVENTHISTORY" PRIMARY KEY (
	"EH_NO"
);

ALTER TABLE "SERVICE" ADD CONSTRAINT "PK_SERVICE" PRIMARY KEY (
	"SERVICE_TYPE_NO"
);

ALTER TABLE "AREA" ADD CONSTRAINT "PK_AREA" PRIMARY KEY (
	"AREA_NO"
);

ALTER TABLE "BANNER" ADD CONSTRAINT "PK_BANNER" PRIMARY KEY (
	"BANNER_NO"
);

ALTER TABLE "BANNER_TYPE" ADD CONSTRAINT "PK_BANNER_TYPE" PRIMARY KEY (
	"B_TYPE_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_TYPE_NO"
);

ALTER TABLE "DIFFICULTY" ADD CONSTRAINT "PK_DIFFICULTY" PRIMARY KEY (
	"DIFFICULTY_NO"
);

ALTER TABLE "RIGHT" ADD CONSTRAINT "PK_RIGHT" PRIMARY KEY (
	"RIGHT_NO"
);

ALTER TABLE "PAYMENT_TYPE" ADD CONSTRAINT "PK_PAYMENT_TYPE" PRIMARY KEY (
	"PAYMENT_TYPE_NO"
);

ALTER TABLE "DOBBY" ADD CONSTRAINT "PK_DOBBY" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "POST_TYPE" ADD CONSTRAINT "PK_POST_TYPE" PRIMARY KEY (
	"POST_TYPE_NO"
);

ALTER TABLE "ZZIM" ADD CONSTRAINT "PK_ZZIM" PRIMARY KEY (
	"USER_NO",
	"SERVICE_NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_RIGHT_TO_USER_1" FOREIGN KEY (
	"RIGHT_NO"
)
REFERENCES "RIGHT" (
	"RIGHT_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_SERVICE_TO_SERVICE_INFO_1" FOREIGN KEY (
	"SERVICE_TYPE_NO"
)
REFERENCES "SERVICE" (
	"SERVICE_TYPE_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_USER_TO_SERVICE_INFO_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_PAYMENT_TYPE_TO_SERVICE_INFO_1" FOREIGN KEY (
	"PAYMENT_ABLE_1"
)
REFERENCES "PAYMENT_TYPE" (
	"PAYMENT_TYPE_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_PAYMENT_TYPE_TO_SERVICE_INFO_2" FOREIGN KEY (
	"PAYMENT_ABLE_2"
)
REFERENCES "PAYMENT_TYPE" (
	"PAYMENT_TYPE_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_PAYMENT_TYPE_TO_SERVICE_INFO_3" FOREIGN KEY (
	"PAYMENT_ABLE_3"
)
REFERENCES "PAYMENT_TYPE" (
	"PAYMENT_TYPE_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_AREA_TO_SERVICE_INFO_1" FOREIGN KEY (
	"AREA_1"
)
REFERENCES "AREA" (
	"AREA_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_AREA_TO_SERVICE_INFO_2" FOREIGN KEY (
	"AREA_2"
)
REFERENCES "AREA" (
	"AREA_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_AREA_TO_SERVICE_INFO_3" FOREIGN KEY (
	"AREA_3"
)
REFERENCES "AREA" (
	"AREA_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_AREA_TO_SERVICE_INFO_4" FOREIGN KEY (
	"AREA_4"
)
REFERENCES "AREA" (
	"AREA_NO"
);

ALTER TABLE "SERVICE_INFO" ADD CONSTRAINT "FK_AREA_TO_SERVICE_INFO_5" FOREIGN KEY (
	"AREA_5"
)
REFERENCES "AREA" (
	"AREA_NO"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_SERVICE_INFO_TO_RESERVATION_1" FOREIGN KEY (
	"SERVICE_NO"
)
REFERENCES "SERVICE_INFO" (
	"SERVICE_NO"
);

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_USER_TO_RESERVATION_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_RESERVATION_TO_PAYMENT_1" FOREIGN KEY (
	"RESERVATION_NO"
)
REFERENCES "RESERVATION" (
	"RESERVATION_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_SERVICE_INFO_TO_PAYMENT_1" FOREIGN KEY (
	"SERVICE_NO"
)
REFERENCES "SERVICE_INFO" (
	"SERVICE_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_PAYMENT_TYPE_TO_PAYMENT_1" FOREIGN KEY (
	"PAYMENT_TYPE_NO"
)
REFERENCES "PAYMENT_TYPE" (
	"PAYMENT_TYPE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_USER_TO_BOARD_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_1" FOREIGN KEY (
	"BOARD_TYPE_NO"
)
REFERENCES "BOARD_TYPE" (
	"BOARD_TYPE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_POST_TYPE_TO_BOARD_1" FOREIGN KEY (
	"POST_TYPE_NO"
)
REFERENCES "POST_TYPE" (
	"POST_TYPE_NO"
);

ALTER TABLE "EVENTHISTORY" ADD CONSTRAINT "FK_USER_TO_EVENTHISTORY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "EVENTHISTORY" ADD CONSTRAINT "FK_DIFFICULTY_TO_EVENTHISTORY_1" FOREIGN KEY (
	"DIFFICULTY_NO"
)
REFERENCES "DIFFICULTY" (
	"DIFFICULTY_NO"
);

ALTER TABLE "BANNER" ADD CONSTRAINT "FK_BANNER_TYPE_TO_BANNER_1" FOREIGN KEY (
	"B_TYPE_NO"
)
REFERENCES "BANNER_TYPE" (
	"B_TYPE_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_BOARD_TO_COMMENT_1" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "BOARD" (
	"POST_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_USER_TO_COMMENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "DOBBY" ADD CONSTRAINT "FK_USER_TO_DOBBY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "DOBBY" ADD CONSTRAINT "FK_SERVICE_TO_DOBBY_1" FOREIGN KEY (
	"SERVICE_1"
)
REFERENCES "SERVICE" (
	"SERVICE_TYPE_NO"
);

ALTER TABLE "DOBBY" ADD CONSTRAINT "FK_SERVICE_TO_DOBBY_2" FOREIGN KEY (
	"SERVICE_2"
)
REFERENCES "SERVICE" (
	"SERVICE_TYPE_NO"
);

ALTER TABLE "DOBBY" ADD CONSTRAINT "FK_SERVICE_TO_DOBBY_3" FOREIGN KEY (
	"SERVICE_3"
)
REFERENCES "SERVICE" (
	"SERVICE_TYPE_NO"
);

ALTER TABLE "ZZIM" ADD CONSTRAINT "FK_USER_TO_ZZIM_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"USER_NO"
);

ALTER TABLE "ZZIM" ADD CONSTRAINT "FK_SERVICE_INFO_TO_ZZIM_1" FOREIGN KEY (
	"SERVICE_NO"
)
REFERENCES "SERVICE_INFO" (
	"SERVICE_NO"
);

-------------------------------------------------------------------------------
--������
-------------------------------------------------------------------------------