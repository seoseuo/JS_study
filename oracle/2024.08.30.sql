-- Q1. 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 직책,사원번호,이름,급여,부서번호,부서이름을 출력하기
SELECT JOB
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE JOB = 'SALESMAN'
    AND E.DEPTNO = D.DEPTNO;

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE JOB = 'SALESMAN'
    AND E.DEPTNO = D.DEPTNO
ORDER BY SAL DESC , EMPNO DESC;

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE JOB = (
    SELECT JOB
    FROM EMP
    WHERE ENAME = 'ALLEN'
)
    AND E.DEPTNO = D.DEPTNO
ORDER BY SAL DESC , EMPNO DESC;

select job, empno, ename, sal, e.deptno,dname
from emp e,dept d
where e.deptno =30 and e.deptno = d.deptno and job = (select job from emp where ename = 'ALLEN');


SELECT E.JOB,E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME
FROM EMP E ,DEPT D
WHERE  E.DEPTNO = D.DEPTNO
AND JOB IN ( SELECT JOB
                FROM EMP
                WHERE ENAME = 'ALLEN'
                );

SELECT E.JOB AS "JOB",
    E.EMPNO AS "EMPNO",
    E.ENAME AS "ENAME",
    E.SAL AS "SAL",
    E.DEPTNO AS "DEPTNO",
    D.DNAME AS "DNAME"
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN')
ORDER BY SAL DESC, EMPNO DESC;

SELECT JOB, EMPNO, ENAME, SAL, DEPTNO, DNAME
FROM EMP
JOIN DEPT USING (DEPTNO)
WHERE JOB = (
     SELECT JOB
     FROM EMP
     WHERE ENAME = 'ALLEN'
);

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB IN (SELECT JOB
                FROM EMP
                WHERE JOB = 'SALESMAN');
                
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB IN (SELECT JOB
                FROM EMP
                WHERE JOB = 'SALESMAN')
ORDER BY SAL DESC;

-- Q2. 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 
-- 사원들의 사원번호, 사원이름, 부서이름, 입사일, 부서지역, 급여, 급여 등급 정보를 출력하기
-- 단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원 번호를 기준으로 오름차순으로 정렬하세요.

SELECT AVG(SAL)
FROM EMP;

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND SAL > 2073
ORDER BY E.SAL DESC, E.EMPNO;

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND SAL > (
        SELECT AVG(SAL)
        FROM EMP
    )
ORDER BY E.SAL DESC, E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.ENAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, SALGRADE S, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND SAL > (SELECT AVG(SAL)
                FROM EMP)
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, EMPNO ASC;

select empno,ename,dname,hiredate,loc,sal,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno and 
sal between losal and hisal and
sal > (select avg(sal) from emp)
order by sal desc,empno;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DNAME, EMP.HIREDATE, DEPT.LOC, EMP.SAL, SALGRADE.GRADE
FROM EMP
JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL
    WHERE SAL > (
     SELECT AVG(SAL)
     FROM EMP
)
ORDER BY SAL DESC, EMPNO ASC;

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E JOIN DEPT D USING(DEPTNO), SALGRADE S
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP) 
    AND SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY SAL DESC, EMPNO ASC;

SELECT E.EMPNO,E.ENAME,D.DNAME,E.HIREDATE,D.LOC,E.SAL,S.GRADE
FROM EMP E,DEPT D,SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL > ( SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL DESC,EMPNO;

SELECT E.EMPNO, E.ENAME, D.DNAME, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
)
AND E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY E.SAL DESC, E.EMPNO;

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL,S.GRADE        
FROM EMP E JOIN DEPT D ON E.DEPTNO =D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.SAL > (
            SELECT AVG(SAL)
            FROM EMP);

-- Q3. 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 
-- 사원들의 사원번호, 사원이름, 직책, 부서번호, 부서명, 부서지역을 출력하기
SELECT *
FROM EMP
WHERE DEPTNO = 10;

SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 30;

SELECT *
FROM EMP
WHERE DEPTNO = 10
AND JOB NOT IN(
    SELECT DISTINCT JOB
    FROM EMP
    WHERE DEPTNO = 30
);

SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 10
AND JOB NOT IN(
    SELECT DISTINCT JOB
    FROM EMP
    WHERE DEPTNO = 30
);

select empno, ename, job, e.deptno, dname, loc 
from emp e,dept d
where e.deptno = d.deptno and
e.deptno = 10 and
job != all(select job from emp where deptno = 30);

SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10 AND 
    E.JOB NOT IN (SELECT JOB 
                  FROM EMP 
                  WHERE DEPTNO = 30);
                  
SELECT EMP.EMPNO, EMP.ENAME, EMP.JOB, EMP.DEPTNO, DEPT.DNAME, DEPT.LOC
FROM EMP
JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE JOB NOT IN (
    SELECT JOB
    FROM EMP
    WHERE DEPTNO = 30
)
AND EMP.DEPTNO = 10;                  
 
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10
AND E.JOB NOT IN(SELECT JOB
                FROM EMP
                WHERE DEPTNO = 30);
                  
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 10
    AND E.JOB NOT IN(SELECT JOB
                        FROM EMP
                        WHERE DEPTNO = 30);
                        
SELECT EMPNO , ENAME ,JOB ,E.DEPTNO , DNAME ,LOC
FROM EMP E, DEPT D , SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND 
E.SAL BETWEEN S.LOSAL AND S.HISAL  AND
E.DEPTNO=10 AND
JOB NOT IN ( SELECT JOB
                FROM EMP
                WHERE DEPTNO=30);                        
 
SELECT E.EMPNO, E.ENAME,E.JOB, E.DEPTNO, D.DNAME,D.LOC
                FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
                WHERE E.DEPTNO = 10
                AND E.JOB NOT IN(SELECT JOB FROM EMP WHERE DEPTNO = 30);
                        
-- Q4-1. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의
-- 사원번호,사원이름,급여,급여등급을 출력하기
-- 단 서브쿼리를 활용할때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하기
-- 1) 다중행 서브쿼리를 활용
-- 2) 다중행 연산자를 사용하는 방법 (> ALL)
-- 3) 사원 번호를 기준으로 오름차순으로 정렬 (EMPNO ASC)

SELECT DISTINCT SAL
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL > ALL(
    SELECT DISTINCT SAL
    FROM EMP
    WHERE JOB = 'SALESMAN'
)
ORDER BY E.EMPNO;

-- Q4-2. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의
-- 사원번호,사원이름,급여,급여등급을 출력하기
-- 단 서브쿼리를 활용할때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하기
-- 1) 단일행 서브쿼리를 활용
-- 2) 다중행 연산자를 사용하지 않는 방법(다중행 함수를 사용)
-- 3) 사원 번호를 기준으로 오름차순으로 정렬

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL > (
    SELECT MAX(SAL)
    FROM EMP
    WHERE JOB = 'SALESMAN'
)
ORDER BY E.EMPNO;

-- DEPT 테이블을 복사해서 DEPT_TCL 테이블 만들기
CREATE TABLE DEPT_TCL
    AS SELECT * FROM DEPT;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- DEPT_TCL 테이블에 데이터를 입력/수정/삭제하기
INSERT INTO DEPT_TCL
VALUES (50, 'DATABASE', 'SEOUL');

UPDATE DEPT_TCL
SET LOC = 'BUSAN'
WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL
WHERE DNAME = 'RESEARCH';

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- ROLLBACK 으로 명령어 실행 취소하기
ROLLBACK;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- DEPT_TCL 테이블에 데이터를 입력/수정/삭제하기
INSERT INTO DEPT_TCL
VALUES (50, 'NETWORK', 'SEOUL');

UPDATE DEPT_TCL
SET LOC = 'BUSAN'
WHERE DEPTNO = 20;

DELETE FROM DEPT_TCL
WHERE DEPTNO = 40;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- COMMIT으로 명령어 반영하기
COMMIT;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- 50번 부서 데이터를 삭제하기
DELETE FROM DEPT_TCL
WHERE DEPTNO = 50;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- COMMIT으로 명령어 반영하기
COMMIT;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- 30번 부서의 데이터 변경하기
UPDATE DEPT_TCL
SET LOC = 'SEOUL'
WHERE DEPTNO = 30;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- 30번 부서의 데이터 변경하기
UPDATE DEPT_TCL
SET DNAME = 'DATABASE'
WHERE DEPTNO = 30;

-- COMMIT으로 명령어 반영하기
COMMIT;

-- DEPT_TCL 테이블의 전체 열 출력하기
SELECT *
FROM DEPT_TCL;

-- 모든 열의 각 자료형을 정의해서 테이블 생성하기
CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4), 
    ENAME VARCHAR2(10),
    JOB   VARCHAR2(9),
    MGR  NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

-- EMP_DDL 테이블의 구조 확인하기
DESC EMP_DDL;

-- 다른 테이블 복사하여 테이블 생성하기
CREATE TABLE DEPT_DDL
    AS SELECT * FROM DEPT;

-- DEPT_DDL 테이블의 구조 확인하기
DESC DEPT_DDL;

-- DEPT_DDL 테이블 전체 열 조회하기
SELECT *
FROM DEPT_DDL;

-- 다른 테이블의 일부를 복사하여 테이블 생성하기
CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP WHERE DEPTNO = 30;

-- EMP_DDL_30 테이블 전체 열 조회하기
SELECT *
FROM EMP_DDL_30;

-- 다른 테이블을 복사하여 테이블 생성하기
CREATE TABLE EMPDEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, 
            E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE 1 <> 1;

-- EMPDEPT_DDL 테이블 전체 열 조회하기
SELECT *
FROM EMPDEPT_DDL;

-- EMP 테이블을 복사하여 EMP_ALTER 테이블 생성하기
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;

-- EMP_ALTER 테이블 전체 열 조회하기
SELECT *
FROM EMP_ALTER;

-- ALTER 명령어로 HP 열 추가하기
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20);
    
-- EMP_ALTER 테이블 전체 열 조회하기
SELECT *
FROM EMP_ALTER;

-- ALTER 명령어로 HP 열 이름을 TEL로 변경하기
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
-- EMP_ALTER 테이블 전체 열 조회하기
SELECT *
FROM EMP_ALTER;

-- EMP_ATLER 테이블 구조 확인하기
DESC EMP_ALTER;


-- ALTER 명령어로 EMPNO 열 길이 변경하기
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);

-- EMP_ATLER 테이블 구조 확인하기
DESC EMP_ALTER;

-- ALTER 명령어로 TEL 열 삭제하기
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL;

-- EMP_ALTER 테이블 전체 열 조회하기
SELECT *
FROM EMP_ALTER;

-- 테이블 이름 변경하기
RENAME EMP_ALTER TO EMP_RENAME;

-- 바꾸기 전 이름으로 테이블 구조 확인하기
DESC EMP_ALTER;

-- 변경된 테이블 이름(EMP_RENAME)으로 조회하기
SELECT *
FROM EMP_RENAME;

-- EMP_RENAME 테이블의 전체 데이터 삭제하기
TRUNCATE TABLE EMP_RENAME;

-- EMP_RENAME 테이블 전체 열 출력하기
SELECT *
FROM EMP_RENAME;

-- EMP_RENAME 테이블 삭제하기
DROP TABLE EMP_RENAME;

-- EMP_RENAME 테이블 구조 확인하기
DESC EMP_RENAME;

-- SCOTT 계정에서 사용 가능한 데이터 사전 살펴보기(1)
SELECT *
FROM DICT;

-- SCOTT 계정에서 사용 가능한 데이터 사전 살펴보기(2)
SELECT *
FROM DICTIONARY;

-- SCOTT 계정이 가지고 있는 객체 정보 살펴보기
SELECT TABLE_NAME
FROM USER_TABLES;

-- SCOTT 계정이 사용할 수 있는 객체 정보 살펴보기
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- SCOTT 계정으로 DBA_ 접두어 사용하기
SELECT *
FROM DBA_TABLES;

-- SYSTEM 계정으로 DBA_ 접두어 사용하기
SELECT *
FROM DBA_TABLES;

-- DBA_USERS를 사용하여 사용자 정보를 알아보기
SELECT *
FROM DBA_USERS
WHERE USERNAME = 'SCOTT';

-- SCOTT 계정이 소유한 인덱스 정보 알아보기
SELECT *
FROM USER_INDEXES;

-- SCOTT 계정이 소유한 인덱스 컬럼 정보 알아보기
SELECT *
FROM USER_IND_COLUMNS;

-- EMP 테이블의 SAL 열에 인덱스 생성하기
CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL);

-- 생성된 인덱스 살펴보기
SELECT * FROM USER_IND_COLUMNS;

-- 인덱스 삭제하기
DROP INDEX IDX_EMP_SAL;

-- 생성된 인덱스 살펴보기
SELECT * FROM USER_IND_COLUMNS;

-- 뷰를 생성하기 위해 권한 부여하기
GRANT CREATE VIEW TO SCOTT;

-- 뷰 생성하기
CREATE VIEW VW_EMP20
    AS (
        SELECT EMPNO, ENAME, JOB, DEPTNO
        FROM EMP
        WHERE DEPTNO = 20
    );

-- 생성한 뷰 확인하기
SELECT *
FROM USER_VIEWS;

-- 생성한 뷰 내용 확인하기
SELECT VIEW_NAME, TEXT_LENGTH, TEXT
FROM USER_VIEWS;

-- 생성한 뷰 조회하기
SELECT *
FROM VW_EMP20;

-- 뷰 삭제하기
DROP VIEW VW_EMP20;

-- 생성한 뷰 내용 확인하기
SELECT VIEW_NAME, TEXT_LENGTH, TEXT
FROM USER_VIEWS;

-- 생성한 뷰 확인하기
SELECT *
FROM USER_VIEWS;

-- ROWNUM을 추가로 조회하기
SELECT ROWNUM, E.*
FROM EMP E;

-- EMP 테이블을 SAL 열 기준으로 정렬하기
SELECT ROWNUM, E.*
FROM EMP E
ORDER BY SAL DESC;

-- 인라인 뷰(서브쿼리)
SELECT ROWNUM, E.*
FROM (
    SELECT *
    FROM EMP E
    ORDER BY SAL DESC
) E;

-- 인라인 뷰(WITH절 사용)
WITH E AS (
    SELECT *
    FROM EMP E
    ORDER BY SAL DESC
)
SELECT ROWNUM, E.*
FROM E;

-- 인라인 뷰로 TOP-N 추출하기(서브쿼리)
SELECT ROWNUM, E.*
FROM (
    SELECT *
    FROM EMP E
    ORDER BY SAL DESC
) E
WHERE ROWNUM <=3;

-- 인라인 뷰로 TOP-N 추출하기(WITH절 사용)
WITH E AS (
    SELECT *
    FROM EMP E
    ORDER BY SAL DESC
)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <=3;

-- DEPT 테이블을 사용하여 DEPT_SEQUENCE 테이블 생성하기
CREATE TABLE DEPT_SEQUENCE
    AS SELECT *
        FROM DEPT
        WHERE 1 <> 1;
        
--  DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스 생성하기
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 2;

-- 생성한 시퀀스 확인하기
SELECT *
FROM USER_SEQUENCES;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 가장 마지막으로 생성된 시퀀스 확인하기
SELECT SEQ_DEPT_SEQUENCE.CURRVAL
FROM DUAL;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- 시퀀스 옵션 수정하기
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 3
MAXVALUE 99
CYCLE;

-- 옵션을 수정한 시퀀스 조회하기
SELECT *
FROM USER_SEQUENCES;

-- 수정한 시퀀스를 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 수정한 시퀀스를 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 수정한 시퀀스를 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 수정한 시퀀스를 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE;

-- 수정한 시퀀스를 사용하여 INSERT문 실행하기
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

-- DEPT_SEQUENCE 테이블 전체 열 조회하기
SELECT *
FROM DEPT_SEQUENCE 
ORDER BY DEPTNO;

-- 시퀀스 삭제하기
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

-- 삭제한 시퀀스 조회하기
SELECT *
FROM USER_SEQUENCES;

--[질문에 대한 답변]
-- 시퀀스 지정하기
CREATE SEQUENCE SEQ_DEPT_SEQUENCE;

--테이블을 생성하기
CREATE TABLE SEQ_TABLE1
    AS SELECT * FROM DEPT; 
    
--테이블을 생성하기
CREATE TABLE SEQ_TABLE2
    AS SELECT * FROM EMP;   
    
-- SEQ_TABLE1 테이블 전체 열 조회하기
SELECT * 
FROM SEQ_TABLE1;

-- SEQ_TABLE2 테이블 전체 열 조회하기
SELECT * 
FROM SEQ_TABLE2;

-- SEQ_TABLE1 테이블에 데이터 입력하기
INSERT INTO SEQ_TABLE1
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'AI','DENVER' );

-- SEQ_TABLE1 테이블 전체 열 조회하기
SELECT * 
FROM SEQ_TABLE1;

-- SEQ_TABLE2 테이블에 데이터 입력하기
INSERT INTO SEQ_TABLE2 (DEPTNO)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL);

-- SEQ_TABLE2 테이블 전체 열 조회하기
SELECT * 
FROM SEQ_TABLE2;

-- TCL
COMMIT;

