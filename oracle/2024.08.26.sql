-- DEPT 테이블의 구조 확인하기
DESC DEPT;

-- EMP 테이블의 구조 확인하기
DESCRIBE EMP;

-- SALGRADE 테이블의 구조 확인하기
DESC SALGRADE;

-- EMP 테이블 전체 열 조회하기
SELECT *
FROM EMP;

-- 열을 쉼표로 구분하여 출력하기
SELECT EMPNO, ENAME, DEPTNO
FROM EMP;

-- EMP 테이블에서 부서번호 출력하기
SELECT DEPTNO
FROM EMP;

-- DISTINCT로 열의 중복 제거하기
SELECT DISTINCT DEPTNO
FROM EMP;

-- 여러 개 열을 명시하여 중복 제거하기
SELECT DISTINCT JOB, DEPTNO
FROM EMP;

-- 직책, 부서 번호 출력
SELECT JOB, DEPTNO
FROM EMP;

-- 직책, 부서 번호 출력(ALL 사용)
SELECT ALL JOB, DEPTNO
FROM EMP;

-- 열에 연산식을  사용하여 출력하기
SELECT ENAME, SAL, SAL*12+COMM, COMM
FROM EMP;

-- 별칭을 사용하여 사원의 연간 총 수입 출력하기(1)
SELECT ENAME, SAL, SAL*12+COMM ANNSAL, COMM
FROM EMP;

-- 별칭을 사용하여 사원의 연간 총 수입 출력하기(2)
SELECT ENAME, SAL, SAL*12+COMM "ANNSAL", COMM
FROM EMP;

-- 별칭을 사용하여 사원의 연간 총 수입 출력하기(3)
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

-- 별칭을 사용하여 사원의 연간 총 수입 출력하기(4)
SELECT ENAME, SAL, SAL*12+COMM AS "ANNSAL", COMM
FROM EMP;

-- EMP 테이블의 모든(*) 열을 급여(SAL) 기준으로 오름차순(ORDER BY ~~ [ASC]) 정렬하기
SELECT *
FROM EMP
ORDER BY SAL;

SELECT *
FROM EMP
ORDER BY SAL ASC;

-- EMP 테이블의 모든(*) 열을 급여(SAL) 기준으로 내림차순(ORDER BY ~~ DESC) 정렬하기
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- EMP 테이블의 전체(*) 열을 부서 번호(DEPTNO, 오름차순 - ASC)와 급여(SAL, 내림차순 - DESC)로 정렬하기
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

-- EMP 테이블의 모든 열 출력하기
SELECT *
FROM EMP;

-- (EMP 테이블의) 부서 번호(DEPTNO)가 30인 데이터만 출력하기
SELECT *
FROM EMP
WHERE DEPTNO = 30;

-- AND 연산자로 여러 개의 조건식 사용하기
SELECT *
FROM EMP
WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';

-- OR 연산자로 여러 개의 출력 조건 사용하기
SELECT *
FROM EMP
WHERE DEPTNO = 30
    OR JOB = 'CLERK';

-- 곱셈 산술 연산자를 사용한 예
SELECT *
FROM EMP
WHERE SAL*12=36000;
-- 3000*12=36000

-- 급여가 3000 이상인 사원을 출력하기
SELECT *
FROM EMP
WHERE SAL >= 3000;

-- 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 하나일 때)
SELECT *
FROM EMP
WHERE ENAME >= 'F'; 
-- 사원 이름의 첫 문자가 F와 같거나 뒤쪽인 것만 검색을 합니다. FGHIJKLMNOPQRSTUVWXYZ

-- 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 여러 개일 때)
SELECT *
FROM EMP
WHERE ENAME <= 'FORZ';
-- (사원의 이름) ENAME 열 값이 FORZ를 포함한 문자열보다 알파벳 순서로 앞에 있는 행을 출력하라는 의미입니다.

-- 급여가 3000이 아닌 사원의 데이터 조회하기(1)
SELECT *
FROM EMP
WHERE SAL != 3000;

-- 급여가 3000이 아닌 사원의 데이터 조회하기(2)
SELECT *
FROM EMP
WHERE SAL <> 3000;

-- 급여가 3000이 아닌 사원의 데이터 조회하기(3)
SELECT *
FROM EMP
WHERE SAL ^= 3000;

-- 급여가 3000이 아닌 사원의 데이터 조회하기(4)
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

-- 급여 열이 3000인 사원이거나 직업 열이 CLERK인 사원이거나 부서 번호 열이 30인 사원을 조회하기
SELECT * 
FROM EMP
WHERE SAL = 3000 
  OR JOB = 'CLERK' 
  OR DEPTNO = 30;
  
-- 직책 열이 SALESMAN 이거나 MANAGER 또는 CLERK 중 하나인 사원을 조회하기
SELECT *
FROM EMP
WHERE JOB = 'SALESMAN'
    OR JOB = 'MANAGER'
    OR JOB = 'CLERK';

-- 직책 열이 SALESMAN 이거나 MANAGER 또는 CLERK 중 하나인 사원을 조회하기(IN 연산자)
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER', 'CLERK');

-- 직책 열 값이 MANAGER도 아니고 SALESMAN도 아니고 CLERK도 아닌 사원을 조회하기
SELECT *
FROM EMP
WHERE JOB != 'MANGER'
    AND JOB != 'SALESMAN'
    AND JOB != 'CLERK';

SELECT * 
FROM EMP
WHERE JOB <> 'MANAGER' 
    AND JOB <> 'SALESMAN' 
    AND JOB <> 'CLERK';

SELECT *
FROM EMP
WHERE JOB ^= 'MANAGER'
    AND JOB ^= 'SALESMAN'
    AND JOB ^= 'CLERK';
    
SELECT *
FROM EMP  
WHERE JOB != 'MANAGER' 
    AND JOB ^= 'SALESMAN'
    AND JOB <> 'CLERK';

SELECT *
FROM EMP
WHERE JOB NOT IN ('SALESMAN', 'MANAGER', 'CLERK');

-- 급여 열 값이 2000 이상 3000이하, 즉 급여가 2000~3000인 사원 데이터를 조회하기
SELECT *
FROM EMP
WHERE SAL >= 2000
    AND SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000; 

-- 급여 열이 2000~3000 외의 값을 가진 사원 데이터를 출력하기
SELECT *
FROM EMP
WHERE NOT (SAL >= 2000
    AND SAL <= 3000);

SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000; 

-- 사원 이름 중 S로 시작하는 사원 데이터를 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

-- 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

-- 사원 이름에 AM이 포함되어 있지 않은 사원 데이터 출력하기
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';

-- 별칭을 사용하여 열 이름 출력하기
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

-- 등가 비교 연산자로 NULL 비교하기
SELECT *
FROM EMP
WHERE COMM = NULL;

-- IS NULL 연산자를 사용하여 출력하기
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 추가 수당 열 값이 NULL아닌 데이터만 조회하기
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 직속 상관이 있는 사원 데이터만 출력하기
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

-- AND 연산자와 IS NULL 연산자 사용하기
SELECT *
FROM EMP
WHERE SAL > NULL
    AND COMM IS NULL;
    
-- OR 연산자와 IS NULL 연산자 사용하기
SELECT *
FROM EMP
WHERE SAL > NULL
    OR COMM IS NULL;
      
-- 집합 연산자(UNION)를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 열 개수가 다를 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 열의 자료형이 다를 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT ENAME, EMPNO, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 열 개수와 자료형이 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

-- 집합 연산자(UNION)를 사용하여 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 집합 연산자(UNION ALL)를 사용하여 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 집합 연산자(MINUS)를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 집합 연산자(INTERSECT)를 사용하여 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- UPPER, LOWER, INITCAP 함수 사용하기
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- UPPER 함수로 문자열 비교하기(사원 이름이 SCOTT인 데이터 찾기)
SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('scott');

-- UPPER 함수로 문자열 비교하기(사원 이름에 SCOTT 단어를 포함한 데이터 찾기)
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%scott%');

-- 선택한 열의 문자열 길이 구하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 사원 이름의 길이가 5 이상인 행 출력하기
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- LENGTH 함수와 LENGTHB 함수 비교하기
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

-- SUBSTR 함수를 사용하는 예
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

-- SUBSSTR 함수 안에 다름 함수(LENGTH) 함께 사용하기
SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
FROM EMP;

-- INSTR 함수로 문자열 데이터에서 특정 문자열 찾기
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
    INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
    INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
FROM DUAL;

-- INSTR 함수로 사원 이름에 S가 있는 행 구하기
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

-- LIKE 연산자로 사원 이름에 S가 있는 행 구하기
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

-- REPLACE 함수로 문자열 안에 있는 특정 문자 바꾸기
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

--  LPAD, RPAD 함수 사용하기
SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LPAD_2,
    RPAD('Oracle', 10) AS RPAD_2
FROM DUAL;

-- RPAD 함수를 사용하여 개인정보 뒷자리 * 표시로 출력하기
SELECT 
    RPAD('971225-', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- 두 열 사이에 콜론(:) 넣고 연결하기
SELECT 
    CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(':', ENAME))
FROM EMP
WHERE ENAME = 'SCOTT';

-- TRIM 함수로 공백 제거하여 출력하기
SELECT
    '[' || TRIM(' _ _Oracle_ _ ')  || ']' AS TRIM,
    '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ')  || ']' AS TRIM_LEADING,
    '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ')  || ']' AS TRIM_TRAILING,
    '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ')  || ']' AS TRIM_BOTH
FROM DUAL;

-- TRIM 함수로 삭제할 문자 _ 삭제 후 출력하기
SELECT
    '[' || TRIM('_' FROM '_ _Oracle_ _')  || ']' AS TRIM,
    '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _')  || ']' AS TRIM_LEADING,
    '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _')  || ']' AS TRIM_TRAILING,
    '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _')  || ']' AS TRIM_BOTH
FROM DUAL;

-- TRIM, LTRIM, RTRIM 사용하여 문자열 출력하기
SELECT
    '[' || TRIM(' _Oracle_ ')  || ']' AS TRIM,
    '[' || LTRIM(' _Oracle_ ')  || ']' AS LTRIM,
    '[' || LTRIM('<_Oracle_>', '_<')  || ']' AS LTRIM_2,
    '[' || RTRIM(' _Oracle_ ')  || ']' AS RTRIM,
    '[' || RTRIM('<_Oracle_>', '>_')  || ']' AS RTRIM_2
FROM DUAL;

-- ROUND 함수를 사용하여 반올림된 숫자 출력하기
SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC 함수를 사용하여 숫자 출력하기
SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;



-- 실습 코드 지워도 됨 하단 코드들



