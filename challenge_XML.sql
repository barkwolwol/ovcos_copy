SELECT * FROM CONTEST;
SELECT * FROM ENTRY_LIST;

-- 대회 조회
SELECT 
       CNTS_NAME
     , CNTS_DATE
     , CNTS_URL
  FROM CONTEST;

-- 대회 챌린지 참가중
SELECT 
       COUNT(*)
  FROM ENTRY_LIST
  JOIN CHALLENGE ON (CHLG_NO = CHLG_NO_INLIST)
 WHERE CHLG_ENTRY_ID = ?
   AND CHLG_DATE > SYSDATE;

-- 대회 챌린지 참가완료
SELECT 
       COUNT(*)
  FROM ENTRY_LIST
  JOIN CHALLENGE ON (CHLG_NO = CHLG_NO_INLIST)
 WHERE CHLG_ENTRY_ID = ?
   AND CHLG_DATE < SYSDATE;

-- 일반 챌린지 참가중
SELECT 
       COUNT(*)
  FROM NENTRY_LIST
  JOIN NORMAL_CHALLENGE ON (NCHLG_NO = NCHLG_NO_INLIST)
 WHERE NCHLG_ENTRY_ID = ?
   AND NCHLG_DATE > SYSDATE;

-- 일반 챌린지 참가완료
SELECT 
       COUNT(*)
  FROM NENTRY_LIST
  JOIN NORMAL_CHALLENGE ON (NCHLG_NO = NCHLG_NO_INLIST)
 WHERE NCHLG_ENTRY_ID = ?
   AND NCHLG_DATE < SYSDATE;

