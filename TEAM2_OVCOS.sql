
DROP TABLE UPLOAD;
DROP TABLE INQUIRY;
DROP TABLE CUT;
DROP TABLE FOLLOW;
DROP TABLE MEMBER;
DROP SEQUENCE SEQ_INQ_NO;


--------------------------------------------------
--------------     MEMBER ����	-------------------
--------------------------------------------------
CREATE TABLE MEMBER (
	MEM_ID	VARCHAR(100) CONSTRAINT MEM_ID_PK PRIMARY KEY,
	MEM_PWD	VARCHAR2(20)  NOT NULL,
	MEM_NAME VARCHAR2(15) NOT NULL,
	MEM_NICK VARCHAR2(24) NOT NULL,
	MEM_INTRO VARCHAR2(300),
	MEM_BIRTH DATE,
	MEM_ADMIN_NY CHAR(10) DEFAULT '�Ϲ�' NOT NULL CONSTRAINT MEM_ADMIN_NY_CK CHECK(MEM_ADMIN_NY IN('�Ϲ�','������')),
	MEM_STATUS VARCHAR2(12) DEFAULT 'ȸ��' NOT NULL CONSTRAINT MEM_STATUS_CK CHECK(MEM_STATUS IN('ȸ��','Ż��','�޸�','�Ͻ�����','������')),
	MEM_LOC_INFO VARCHAR(200),
	MEM_PUBLIC_NY CHAR(1) DEFAULT 'Y' CONSTRAINT MEM_PUBLIC_NY_CK CHECK(MEM_PUBLIC_NY IN('Y','N')),
	MEM_GOAL_DTN NUMBER DEFAULT 0,
	MEM_CODE_NY	VARCHAR2(20),
	MEM_RPR_CUM	NUMBER DEFAULT 0 NOT NULL,
	MEM_API_TYPE VARCHAR2(30) CONSTRAINT MEM_API_TYPE_CK CHECK(MEM_API_TYPE IN('�Ϲ�','īī��','���̹�','����')),
	MEM_API_TOKEN VARCHAR2(50),
	MEM_EML	VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN MEMBER.MEM_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '�̸�';
COMMENT ON COLUMN MEMBER.MEM_NICK IS '�г���';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '�ڱ�Ұ� ��';
COMMENT ON COLUMN MEMBER.MEM_BIRTH IS '�������';
COMMENT ON COLUMN MEMBER.MEM_ADMIN_NY IS '������/ȸ��';
COMMENT ON COLUMN MEMBER.MEM_STATUS IS 'ȸ������';
COMMENT ON COLUMN MEMBER.MEM_LOC_INFO IS '��ġ����';
COMMENT ON COLUMN MEMBER.MEM_PUBLIC_NY IS '���������� ��������';
COMMENT ON COLUMN MEMBER.MEM_GOAL_DTN IS '��ǥ�Ÿ�';
COMMENT ON COLUMN MEMBER.MEM_CODE_NY IS '�����ڵ�';
COMMENT ON COLUMN MEMBER.MEM_RPR_CUM IS '���� �Ű��';
COMMENT ON COLUMN MEMBER.MEM_API_TYPE IS '�Ҽ�����';
COMMENT ON COLUMN MEMBER.MEM_API_TOKEN IS '��ū ������';
COMMENT ON COLUMN MEMBER.MEM_EML IS '�̸���';

INSERT INTO MEMBER VALUES('Qdfca12','qwe123','�����','Kim_ki','�츮 ���� ������ ��� ����','19911013',DEFAULT,DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,'�Ϲ�', NULL,'Qdfca12@gamil.com');
INSERT INTO MEMBER VALUES('wSDF23','asd214','��â��','parkCH','�ȳ��ϼ���','19811013',DEFAULT,DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,'�Ϲ�', NULL,'wSDF23@gamil.com');
INSERT INTO MEMBER VALUES('cvxzv34','pouih1!','���ؽ�','flag123','�ȳ��ϼ���','19711213',DEFAULT,'�޸�','����Ư���� ������',DEFAULT,120,NULL,2,'īī��', 'adsfqwercva','cvxzv34@gamil.com');
INSERT INTO MEMBER VALUES('vdfety1111','jryff3#','����','jhon','���̿�','19970203',DEFAULT,'�Ͻ�����','��õ ��籸','N',60,'PYJYJYU',3,'���̹�', 'AFCETEDF','vdfety1111@gamil.com');
INSERT INTO MEMBER VALUES('user01','pass01','������','kangji','���� ����غ���','20001013',DEFAULT,'ȸ��','��õ ������','Y',70,'afewrq',3,'���̹�', 'asdfewr','user01@gamil.com');
INSERT INTO MEMBER VALUES('admin','admin','������','������','������ ������ ����',NULL,'������','������',NULL,DEFAULT,DEFAULT,NULL,0,'�Ϲ�', NULL,'ADMIN@gamil.com');

--------------------------------------------------
--------------     UPLOAD ����	-------------------
--------------------------------------------------
CREATE TABLE UPLOAD(
    UPL_ID VARCHAR2(20) NOT NULL,
    UPL_STT VARCHAR2(30) NOT NULL CHECK(UPL_STT IN('challenge','profile','background','gpx','contest')),
    UPL_NO NUMBER NOT NULL,
    UPL_TITLE VARCHAR2(60) NOT NULL,
    UPL_VER CHAR(1) DEFAULT 'F' CHECK(UPL_VER IN('F','T')),
    UPL_DEL_NY CHAR(1) DEFAULT 'N' CHECK(UPL_DEL_NY IN('Y','N'))
);

INSERT INTO UPLOAD VALUES('admin','contest',1,'contest1.img','T','N');
INSERT INTO UPLOAD VALUES('Qdfca12','profile',3,'odfcprofile.img','F','N');
INSERT INTO UPLOAD VALUES('wSDF23','gpx',2,'dmz.gpx','T','N');
INSERT INTO UPLOAD VALUES('cvxzv34','challenge',4,'chal4.img','F','N');
INSERT INTO UPLOAD VALUES('vdfety1111','background',2,'back2.img','F','N');

-- UPLOAD COMMENTS
COMMENT ON COLUMN UPLOAD.UPL_ID IS '���ε��� ���� ���̵�';
COMMENT ON COLUMN UPLOAD.UPL_STT IS '���� ���ε��� �Խñ� ī�װ�';
COMMENT ON COLUMN UPLOAD.UPL_NO IS '�Խñ� ��ȣ';
COMMENT ON COLUMN UPLOAD.UPL_TITLE IS '���� �̸�';
COMMENT ON COLUMN UPLOAD.UPL_VER IS '��������';

--------------------------------------------------
--------------     INQUIRY ����	-------------------
--------------------------------------------------
CREATE TABLE INQUIRY(
    INQ_NO NUMBER NOT NULL CONSTRAINT INQ_NO_PK PRIMARY KEY,
    INQ_CTG VARCHAR2(30) NOT NULL CONSTRAINT INQ_CTG_CK CHECK(INQ_CTG IN ('�ǵ�', 'ç����', '���ε�', '��Ÿ')),
    INQ_TITLE VARCHAR2(100) NOT NULL,
    INQ_DATE DATE DEFAULT SYSDATE NOT NULL,
    INQ_CNT VARCHAR2(2000) NOT NULL,
    ANS_CNT VARCHAR(3000),
    INQ_DEL_NY CHAR(1) DEFAULT 'N' CHECK(INQ_DEL_NY IN('N','Y')),
    MEM_ID VARCHAR2(20) NOT NULL REFERENCES MEMBER
    
);

COMMENT ON COLUMN INQUIRY.INQ_NO IS '���ǹ�ȣ';
COMMENT ON COLUMN INQUIRY.INQ_CTG IS 'ī�װ�';
COMMENT ON COLUMN INQUIRY.INQ_TITLE IS '��������';
COMMENT ON COLUMN INQUIRY.INQ_DATE IS '�����ۼ���';
COMMENT ON COLUMN INQUIRY.INQ_CNT IS '���ǳ���';
COMMENT ON COLUMN INQUIRY.INQ_DEL_NY IS '��������';
COMMENT ON COLUMN INQUIRY.ANS_CNT IS '�亯����';

CREATE SEQUENCE SEQ_INQ_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'�ǵ�','�� �� �ʹ� �����մϴ�',SYSDATE,'������ ���ó����� �ִ°� �����ϴ�. ���� ��Ź�帳�ϴ�', 'ȸ���� ������ ��� �˼��մϴ�.�ش� �� ���� ó�� �Ǿ����ϴ�.', 'N','Qdfca12' );
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'ç����','�� ��ȸ���� ����',SYSDATE,'�� ��ȸ�� ���� �˰� ������ ������ �����Ѱ� ���ƿ�.', 'ȸ���� �ȳ��Ͻʴϱ� �����Ͻ� ��ȸ�� �ش� ��ȸ Ŭ�� �� Ȩ�������� �̵��մϴ� ��ſ� ��ǽʽÿ�.','N','wSDF23');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'���ε�','���ε� ���� ���ǵ帳�ϴ�.',SYSDATE,'������ �ø����µ� �߰��� ���� �ʽ��ϴ�.������Ź�帳�ϴ�.', 'ȸ���� ������ ��� �˼��մϴ�. ���ε� �����߻����� ���Ͽ� �������Դϴ�.','N','cvxzv34');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'��Ÿ','���� ���ù���',SYSDATE,'���� �ʹ� ���� �����°� ���ƿ�', 'ȸ���� ������ ��� �˼��մϴ�. ����ȸ��� �����ϵ��� �ϰڽ��ϴ�','N','vdfety1111');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'�ǵ�','���� ����',SYSDATE,'�� ���� �ø��� �ͽ��ϴ� �����ڿ� ��ȭ �� �� �������?', '���� ���� �ʽ��ϴ�.�˼��մϴ�.','N','vdfety1111');

--------------------------------------------------
--------------     CUT ����	-------------------
--------------------------------------------------
CREATE TABLE CUT(
    MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT MEM_ID_FK REFERENCES MEMBER,
    CUT_ID VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN CUT.MEM_ID IS '���� ���̵�';
COMMENT ON COLUMN CUT.CUT_ID IS '���� ���̵�';

INSERT INTO CUT VALUES('Qdfca12','wSDF23');
INSERT INTO CUT VALUES('Qdfca12','cvxzv34');
INSERT INTO CUT VALUES('Qdfca12','vdfety1111');
INSERT INTO CUT VALUES('vdfety1111','Qdfca12');
INSERT INTO CUT VALUES('vdfety1111','cvxzv34');

--------------------------------------------------
--------------     FOLLOW ����	-------------------
--------------------------------------------------
CREATE TABLE FOLLOW(
    MEM_ID VARCHAR2(20) REFERENCES MEMBER,
    FLW_ID VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN FOLLOW.MEM_ID IS '���� ���̵�';
COMMENT ON COLUMN FOLLOW.FLW_ID IS '�ȷο� ���̵�';

INSERT INTO FOLLOW VALUES('vdfety1111','wSDF23');
INSERT INTO FOLLOW VALUES('wSDF23','cvxzv34');
INSERT INTO FOLLOW VALUES('user01','wSDF23');
INSERT INTO FOLLOW VALUES('user01','Qdfca12');
INSERT INTO FOLLOW VALUES('user01','vdfety1111');


