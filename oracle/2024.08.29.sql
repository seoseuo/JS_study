-- Q1. 소속 부서별 평균 급여를 부서번호와 함께 출력하기
-- 별칭: 부서 번호, 급여 평균

SELECT 
    DEPTNO AS "부서 번호", 
    AVG(SAL) AS "급여 평균"
FROM EMP
GROUP BY DEPTNO;

SELECT 
    DEPTNO AS "부서 번호", 
    AVG(SAL) AS "급여 평균"
FROM EMP
GROUP BY DEPTNO 
ORDER BY DEPTNO; 

SELECT '10' "부서 번호", AVG(SAL) AS "급여 평균"
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT '20' "부서 번호", AVG(SAL) AS "급여 평균"
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT '30' "부서 번호", AVG(SAL) AS "급여 평균"
FROM EMP
WHERE DEPTNO = 30;

-- 다중 컬럼을 이용하여 그룹별로 출력하기
SELECT DEPTNO, JOB, COUNT(*), SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- Q2. 부서별 급여 총액이 3000 이상인 부서의 번호와 부서별 급여 총액 출력하기

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) >= 3000;

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) >= 3000
ORDER BY DEPTNO;

SELECT 
    DEPTNO AS "부서 번호", 
    SUM(SAL) AS "급여 총액"
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) >= 3000
ORDER BY DEPTNO;

SELECT 
    DEPTNO AS "부서 번호", 
    SUM(SAL) AS "부서별 급여 총액"
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) >= 3000;


-- Q3. MANAGER를 제외하고 급여 총액이 5000 이상인 직급별 급여 총액 구하기
-- 급여 총액이 5000을 넘는 직급에 대해서 직급과 급여 총액을 표시하되 직급이 MANAGER인 사원은 제외한 후 급여 총액에 따라 정렬하기

SELECT JOB, SUM(SAL)
FROM EMP
WHERE JOB NOT LIKE '%MANAGER%'
GROUP BY JOB
HAVING SUM(SAL) >= 5000
ORDER BY SUM(SAL);

SELECT JOB AS "직급", SUM(SAL) AS "급여 총액"
FROM EMP
WHERE JOB != 'MANAGER'
GROUP BY JOB
HAVING SUM(SAL) >= 5000
ORDER BY SUM(SAL);

SELECT JOB , SUM(SAL)
FROM EMP
GROUP BY JOB
HAVING JOB !='MANAGER' AND SUM(SAL) >=5000
ORDER BY SUM(SAL);

select job as 직급, sum(sal)as 급여총액
from emp
where job != 'MANAGER'
group by job
having sum(sal) >= 5000
order by sum(sal);

SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB
HAVING SUM(SAL) >= 5000
    AND JOB != 'MANAGER'
ORDER BY SUM(SAL);

SELECT 
    JOB,
    SUM(SAL) AS TOTAL_SALARY
FROM EMP
WHERE JOB != 'MANAGER'
GROUP BY JOB
HAVING SUM(SAL) >= 5000
ORDER BY JOB;

SELECT JOB, SUM(SAL)
FROM EMP
WHERE JOB <> 'MANAGER'
GROUP BY  JOB
HAVING SUM(SAL) >= 5000
ORDER BY SUM(SAL);

SELECT JOB, SUM(SAL)
FROM EMP
WHERE JOB ^= 'MANAGER'
GROUP BY  JOB
HAVING SUM(SAL) >= 5000
ORDER BY SUM(SAL);

-- 부서별 평균 급여 중 최고 급여 출력하기
SELECT MAX(AVG(SAL))
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- Q4. 사원번호가 7788인 사원의 이름과 소속 부서명을 출력하기

SELECT DEPTNO
FROM EMP
WHERE EMPNO = 7788;

SELECT DNAME
FROM DEPT
WHERE DEPTNO = 20;

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.EMPNO = 7788;

SELECT 
    E.ENAME AS "사원 이름", 
    D.DNAME AS "부서명"
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.EMPNO = 7788;

select e.ename, d.dname
from emp e natural join dept d
where e.empno = 7788;

SELECT 
    EMP.ENAME,  
    DEPT.DNAME
FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMPNO = 7788;

SELECT ENAME, DEPT.DNAME
FROM EMP, DEPT
WHERE  EMP.DEPTNO = DEPT.DEPTNO 
    AND EMPNO = 7788;

SELECT E.ENAME, D.DNAME
FROM EMP E NATURAL JOIN DEPT D
WHERE E.EMPNO = 7788
ORDER BY E.EMPNO, E.ENAME;

SELECT E.ENAME, D.DNAME
FROM EMP E JOIN DEPT D USING (DEPTNO)
WHERE E.EMPNO = 7788;

-- Q5. 사원별로 급여 등급을 출력하기 (컬럼은 사원이름,급여,등급만 표시해주세요.)

select ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

SELECT 
    E.ENAME AS "사원이름", 
    E.SAL AS "급여", 
    S.GRADE AS "등급"
FROM EMP E JOIN SALGRADE S 
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND HISAL;

-- Q6. 사원의 이름과 소속된 부서의 이름과 급여, 급여가 몇 등급인지를 출력하기

select e.ename, d.dname,e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno 
    and e.sal between s.losal and s.hisal;

SELECT 
    E.ENAME AS "사원이름", 
    D.DNAME AS "부서이름", 
    E.SAL AS "급여", 
    S.GRADE AS "급여등급"
FROM EMP E 
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT ENAME, DNAME, SAL, GRADE
FROM EMP, DEPT, SALGRADE
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND EMP.SAL BETWEEN LOSAL AND HISAL;

SELECT
    E.ENAME AS "사원이름",
    E.JOB AS "소속부서이름",
    E.SAL AS "급여",
    S.GRADE AS "급여등급"
FROM EMP E JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT E.ENAME, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL;
    
SELECT E.ENAME, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND
    E.SAL BETWEEN LOSAL AND HISAL;   
    
SELECT DISTINCT
    E.ENAME AS "사원이름", 
    D.DNAME AS "부서이름", 
    E.SAL AS "급여", 
    S.GRADE AS "급여등급"
FROM EMP E
JOIN DEPT D USING(DEPTNO)
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;    
    
SELECT
    E.ENAME AS "사원이름", 
    D.DNAME AS "부서이름", 
    E.SAL AS "급여", 
    S.GRADE AS "급여등급"
FROM EMP E
JOIN DEPT D USING(DEPTNO)
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;        

-- 사원이름과 직속 상관 이름을 출력하기
SELECT 
    E1.ENAME AS "사원이름", 
    E2.ENAME AS "직속 상관 이름"
FROM EMP E1, EMP E2 
WHERE E1.MGR = E2.EMPNO;

-- JION ~ ON절을 사용하여 출력하기
SELECT  E1.ENAME || '의 직속 상관은 ' || E2.ENAME
FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- Q7. SCOTT 보다 급여를 많이 받는 사원을 출력하기
SELECT SAL
FROM EMP
WHERE ENAME='SCOTT';

SELECT *
FROM EMP
WHERE SAL > 3000;

SELECT *
FROM EMP
WHERE SAL > (
    SELECT SAL
    FROM EMP
    WHERE ENAME='SCOTT'
);

select ename, sal
from emp
where sal > ( select sal from emp where ename = 'SCOTT');

SELECT ENAME AS "사원이름", SAL AS "급여"
FROM EMP
WHERE SAL > (SELECT SAL 
            FROM EMP 
             WHERE ENAME = 'SCOTT');
             
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (
    SELECT SAL
    FROM EMP
    WHERE ENAME ='SCOTT');  
     
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL> (
    SELECT SAL
    FROM EMP
    WHERE ENAME = 'SCOTT'
 );
 
 
-- Q8. SCOTT와 동일한 부서에서 근무하는 사원의 이름과 부서번호를 출력하기

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM EMP
    WHERE ENAME = 'SCOTT'
);

SELECT ENAME AS "사원이름", DEPTNO AS "부서번호"
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO 
                FROM EMP 
                WHERE ENAME = 'SCOTT');

select ename, deptno
from emp
where deptno = (select deptno from emp where ename = 'SCOTT');

SELECT
     E1.ENAME,
     E1.DEPTNO
FROM EMP E1
JOIN EMP E2 ON E1.DEPTNO = E2.DEPTNO
WHERE E2.ENAME = 'SCOTT';

SELECT E.ENAME, E.DEPTNO
FROM EMP E , EMP E1
WHERE E.DEPTNO = E1.DEPTNO
    AND E1.ENAME = 'SCOTT';


-- Q9. 최소 급여를 받는 사원의 이름, 담당 업무, 급여 출력하기
SELECT MIN(SAL)
FROM EMP;

SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL = 800;
 
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL = (
    SELECT MIN(SAL)
    FROM EMP
);
 
select ename, job, sal
from emp
where sal = (select min(sal) from emp);
 
SELECT ENAME AS "사원 이름", JOB AS "담당 업무", SAL AS "급여"
FROM EMP
WHERE SAL = (SELECT MIN(SAL)
             FROM EMP);
 
SELECT E.ENAME, E.JOB, E.SAL
FROM EMP E
WHERE E.SAL =(
    SELECT MIN(SAL)
    FROM EMP
);
 
-- Q10. 30번 부서에서 최소 급여를 구한 후 부서별 최소 급여가 구한 최소 급여보다 큰 부서만 출력하기
SELECT DEPTNO, MIN(SAL) 
FROM EMP
GROUP BY DEPTNO
HAVING MIN(SAL) > (
    SELECT MIN(SAL)
    FROM EMP
    WHERE DEPTNO = 30 
);
 
select deptno
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno = 30); 
 
SELECT
     MIN(SAL),
     DEPTNO
FROM EMP
GROUP BY DEPTNO
HAVING MIN(SAL) > (
     SELECT MIN(SAL)
     FROM EMP
     WHERE DEPTNO = 30
);
 
-- Q11. 부서별 최소 급여를 받는 사원의 사원번호와 이름을 출력하기
SELECT DEPTNO, MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME
FROM EMP
WHERE SAL = 950
    OR SAL = 800
    OR SAL = 1300; 

SELECT EMPNO, ENAME
FROM EMP
WHERE SAL IN(
    SELECT MIN(SAL)
    FROM EMP
    GROUP BY DEPTNO
);

SELECT EMPNO AS "사원 번호", ENAME AS "사원 이름"
FROM EMP E
WHERE SAL = (SELECT MIN(SAL)
             FROM EMP
             WHERE DEPTNO = E.DEPTNO);

select empno, ename
from emp
where sal = any(select min(sal) from emp group by deptno);

SELECT DEPTNO, ENAME
FROM EMP E
WHERE SAL = (
    SELECT MIN(SAL)
    FROM EMP E1
    WHERE E1.DEPTNO = E.DEPTNO );

SELECT DEPTNO, ENAME
FROM EMP
WHERE SAL = ANY (
    SELECT MIN(SAL)
    FROM EMP
    GROUP BY DEPTNO
);

SELECT DEPTNO, ENAME
FROM EMP
WHERE SAL = ANY (
    SELECT MIN(SAL)
    FROM EMP
    GROUP BY DEPTNO )
ORDER BY DEPTNO;

-- Q12. 직급이 SALESMAN 이 아니면서 급여가 임의의 SALESMAN 보다 급여가 낮은 사원의 사원번호,이름,직급,급여를 출력하기
SELECT SAL
FROM EMP
WHERE JOB ='SALESMAN';

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL < 1600
    AND JOB <> 'SALESMAN';
    
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL < ANY(SELECT SAL
                FROM EMP
                WHERE JOB ='SALESMAN')
    AND JOB <> 'SALESMAN';

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL < ANY(SELECT SAL
                FROM EMP
                WHERE JOB ='SALESMAN')
    AND JOB != 'SALESMAN';

SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL < ANY(SELECT SAL
                FROM EMP
                WHERE JOB ='SALESMAN')
    AND JOB ^= 'SALESMAN';

select empno,ename,job,sal
from emp
where job != 'SALESMAN' and
    sal < any(select sal from emp where job = 'SALESMAN');

SELECT EMPNO AS "사원번호", ENAME AS "사원이름", JOB AS "직급", SAL AS "급여"
FROM EMP
WHERE JOB != 'SALESMAN' AND 
    SAL < ANY(SELECT SAL
    FROM EMP 
    WHERE JOB = 'SALESMAN');
    
SELECT DEPTNO, ENAME, JOB, SAL
FROM EMP
WHERE NOT JOB = 'SALESMAN'
    AND SAL < ANY (SELECT SAL
                    FROM EMP
                    WHERE JOB = 'SALESMAN');    
    
SELECT MIN(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

-- 결과가 다름.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL < ALL(SELECT SAL
                FROM EMP
                WHERE JOB ='SALESMAN')
    AND JOB <> 'SALESMAN';
    
-- 서브쿼리 결과 값이 존재하는 경우
SELECT DNAME
FROM DEPT
WHERE DEPTNO = 10;

SELECT *
FROM EMP
WHERE EXISTS (
    SELECT DNAME
    FROM DEPT
    WHERE DEPTNO = 10
);
    
-- 서브쿼리 결과 값이 존재하지 않는 경우
SELECT *
FROM EMP
WHERE EXISTS (
    SELECT DNAME
    FROM DEPT
    WHERE DEPTNO = 50
);  
    
-- 다중열 서브쿼리 사용하기
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN(
    SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO
);
    
-- 인라인 뷰 사용하기
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO= 10) E10,
    (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;
    
-- WITH절 사용하기    
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO= 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT 절에 서브쿼리 사용하기
SELECT EMPNO, ENAME, JOB, SAL, (
        SELECT GRADE
        FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL
    ) AS SALGRADE,
    DEPTNO, (
        SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO
    ) AS DNAME
FROM EMP E;


-- DEPT 테이블을 복사해서 DEPT_TEMP 테이블 만들기
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

-- DEPT_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP;

-- DEPT_TEMP 테이블에 데이터 추가하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES (50, 'DATABASE','SEOUL');

-- DEPT_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP;

-- DEPT_TEMP 테이블에 데이터 추가하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES (60, 'JAVA');

-- DEPT_TEMP 테이블에 데이터 추가하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES (60, 'NETWORK', 'BUSAN', 'WRONG');

-- DEPT_TEMP 테이블에 데이터 추가하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES ('WRONG', 'NETWORK', 'BUSAN');

-- DEPT_TEMP 테이블에 데이터 추가하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES (600, 'NETWORK', 'BUSAN');    

-- DEPT_TEMP 테이블의 구조 확인하기
DESC DEPT_TEMP;

-- INSERT문에 열 지정없이 데이터 추가하기
INSERT INTO DEPT_TEMP 
VALUES (60, 'NETWORK', 'BUSAN'); 

-- DEPT_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP;

-- NULL을 지정하여 입력하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES (70, ' WEB', NULL); 

-- DEPT_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP;

-- 빈 공백 문자열로 NULL을 입력하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) 
VALUES (80, 'MOBILE', ''); 

-- DEPT_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP;

-- 열 데이터를 넣지 않는 방식으로 NULL 데이터 입력하기
INSERT INTO DEPT_TEMP (DEPTNO, LOC) 
VALUES (90, 'INCHEON'); 

-- DEPT_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP;

-- EMP 테이블을 복사해서 EMP_TEMP 테이블 만들기
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP WHERE 1 <> 1;

-- EMP_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP;

-- INSERT 문으로 날짜 데이터 입력하기
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (9999, '홍길동', 'PRESIDNET', NULL, '2001/01/01', 5000, 1000, 10);

-- EMP_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP;

-- INSERT 문으로 날짜 데이터 입력하기(날짜 사이에 - 입력)
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

-- EMP_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP;

-- 날짜 데이터 형식을 반대로 했을 때
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);

-- TO_DATE 함수를 사용하여 날짜 데이터 입력하기
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001','DD/MM/YYYY'), 4000, NULL, 20);

-- EMP_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP;

-- SYSDATE를 사용하여 날짜 데이터 입력하기
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

-- EMP_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP;

-- 서브쿼리로 여러 데이터 추가하기
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;

-- EMP_TEMP 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP;

-- DETP 테이블을 복사해서 DETP_TEMP2 테이블 만들기
CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- DEPT_TEMP2 테이블 업데이트하기
UPDATE DEPT_TEMP2
SET LOC = 'SEOUL';

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- ROLLBACK으로 테이블 내용을 이전 상태로 되돌리기
ROLLBACK;

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- 테이블 데이터 중 일부분만 수정하기
UPDATE DEPT_TEMP2
SET DNAME = 'DATABASE',
    LOC = 'SEOUL'
WHERE DEPTNO = 40;

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- 서브쿼리로 데이터 일부분 수정하기
UPDATE DEPT_TEMP2
SET (DNAME, LOC) = (
    SELECT DNAME, LOC
    FROM DEPT
    WHERE DEPTNO = 40
)
WHERE DEPTNO =40;

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- 서브쿼리로 데이터 일부분 수정하기
UPDATE DEPT_TEMP2
SET DNAME = (
    SELECT DNAME
    FROM DEPT
    WHERE DEPTNO = 40
), LOC = (
        SELECT LOC
        FROM DEPT
        WHERE DEPTNO = 40
)
WHERE DEPTNO =40;

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- UPDATE문의 WHERE절에 서브쿼리 사용하기
UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPT_TEMP2
    WHERE DNAME = 'OPERATIONS'
);

-- DEPT_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM DEPT_TEMP2;

-- EMP 테이블을 복사해서 EMP_TEMP2 테이블 만들기
CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;
    
-- EMP_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP2;   

-- WHERE절을 사용하여 데이터 일부분만 삭제하기
DELETE FROM EMP_TEMP2
WHERE JOB = 'MANAGER';

-- EMP_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP2;  

-- WHERE절에 서브쿼리를 사용해서 데이터 일부만 삭제하기
DELETE FROM EMP_TEMP2
WHERE EMPNO IN(
    SELECT E.EMPNO
    FROM EMP_TEMP2 E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE = 3
    AND DEPTNO = 30
);

-- EMP_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP2;  

-- 테이블에 있는 전체 데이터 삭제하기
DELETE FROM EMP_TEMP2;

-- EMP_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP2;  
    
-- EMP_TEMP2 테이블 전체 열 조회하기
SELECT * 
FROM EMP_TEMP2;     

-- TCL
COMMIT;









    