import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Pattern;

import static java.lang.Integer.parseInt;

public class StudentManagerService {
    private final int length; // 학생 수 , 사용자가 입력한 초기 학생 수를 기억하기 위한 필드
    private final ArrayList<Student> list;  // Student 객체 배열
    //Scanner sc = new Scanner(System.in);



    public StudentManagerService(int length) {
        this.length = length;
        list = new ArrayList<Student>(this.length);
    }


    //학생 등록 메소드
    public void addStudent(Scanner sc) {
        int num=0;
        String strNum ="";
        String name="";
        String major="";
        String phonePattern= "010-\\d{4}-\\d{4}$"; // 전화번호 정규 표현 식
        String korean = "^[가-힣]+$"; //한글 정규 표현 식
        String phone="";

        if(list.size()==this.length) { // 예외 1 : 처음에 입력한 학생 수를 넘었을 때.
            System.out.println("[초기에 설정한 학생 수를 초과하였습니다.]");
            return; //addStudent 메소드를 종료합니다.
        }

        else {
            for(int i=0; i<this.length; i++) {
                System.out.println("\n[학생을 등록합니다.]");

                while(true) {// 학번 등록 단계
                    try {
                        System.out.print("학   번 입력 : ");
                        strNum = sc.nextLine(); // 문자열로 입력 받기


                        if(strNum.isEmpty()) { // 예외 2 : 반컨을 입력하였을 때
                            System.out.println("[등록 학번이 빈 값 입니다.]");
                            continue;
                        }
                        else if(strNum.contains(" ")) { //예외 7 : 공백 포함
                            System.out.println("[공백 없이 학번을 입력해주세요.]");
                            continue;
                        }
                        else {
                            num = Integer.parseInt(strNum); // 정수형으로 변경
                        }

                        if(num<=0) { // 예외 3 : 학번이 음수일 때
                            System.out.println("[학번은 양수여야 합니다.]");
                        }

                        else if (Integer.toString(num).length()!=8) { // 예외 4 : 입력한 학번이 8자리가 아닐 때.
                            System.out.println("[학번은 여덟 자리여야 합니다.]");
                        }

                        else if (!list.isEmpty()) { // 예외 5 : 동일한 학번이 있을 때
                            boolean plag = false;
                            for (Student student : list) {
                                if (student.getNum() == num) {
                                    System.out.println("[동일한 학번입니다, 다시 입력하세요.]");
                                    plag = true;
                                    break;
                                }
                            }
                            if (plag) {
                                continue; // 중복된 학번이 발견되면 다시 학번 입력 받기
                            } else {
                                break; // 중복되지 않은 경우 반복문 탈출
                            }
                        }

                        else { // 예외 없이 진행되었다면 ?
                            break; // 반복문 탈출
                        }

                    } catch (NumberFormatException e) { // 예외 6 : 학번이 숫자가 아닐 때
                        System.out.println("[학번은 숫자여야 합니다.]");
                    }
                }

                while(true){ // 이름 등록
                    System.out.print("이   름 입력 : ");
                    name = sc.nextLine();

                    if(name.isEmpty()) { // 에외 1 : 아무 값도 입력하지 않았을 때
                        System.out.println("[등록 이름이 빈 값 입니다.]");

                    }
                    else if(name.contains(" ")) { // 예외 2 : 공백을 포함할 때
                        System.out.println("[공백 없이 이름을 입력해주세요.]");
                    }
                    else if (!(name.matches(korean))) { // 예외 3 : 이름이 한글이 아닐 때
                        System.out.println("[이름을 한글로 바르게 입력해주세요.]");
                    }
                    else { // 예외 없이 진행되었다면 ?
                        break; // 반복문 탈출
                    }
                }
                while(true){ // 학과 등록
                    System.out.print("학   과 입력 : ");
                    major = sc.nextLine();

                    if(major.isEmpty()) { // 에외 1 : 아무 값도 입력하지 않았을 때
                        System.out.println("[수정 학과가 빈 값 입니다.]");
                    }
                    else if(major.contains(" ")) { // 예외 2 : 공백을 포함할 때
                        System.out.println("[공백 없이 학과를 입력해주세요.]");
                    }
                    else if (!(major.matches(korean))) { // 예외 3 : 이름이 한글이 아닐 때
                        System.out.println("[학과를 한글로 바르게 입력해주세요.]");
                    }
                    else { // 예외 없이 진행되었다면 ?
                        break; // 반복문 탈출
                    }
                }
                while(true){ // 전화번호 등록
                    System.out.print("전화번호 입력 : ");
                    phone = sc.nextLine().trim(); // 전화번호 공백 제거.

                    if (!(Pattern.matches(phonePattern, phone))) { // 예외 1 : 전화번호 정규식 표현에 위배되었을 때
                        System.out.println("[전화번호 형식이 잘못되었습니다. ( 010-****-**** ) ]");
                    }
                    else { // 예외 없이 진행되었다면 ?
                        break; // 반복문 탈출
                    }
                }
                list.add(new Student(name,num,major,phone)); //Array List의 add 메소드 사용
            }
        }
    }


    public void printAllList() {
        if(list.isEmpty()){
            System.out.println("[등록된 학생이 없습니다.]");
            return;

        }
        System.out.println("\n===== 전체 학생 출력 =====");
        for(Student student : list){
            System.out.println("학 번 :"+student.getNum());
            System.out.println("이 름 :"+student.getName());
            System.out.println("학 과 :"+student.getMajor());
            System.out.println("연락처 :"+student.getPhone());
            System.out.println("----------------------");
        }
    }

    public void printStudent(Student student) {
            System.out.println("학 번 :"+student.getNum());
            System.out.println("이 름 :"+student.getName());
            System.out.println("학 과 :"+student.getMajor());
            System.out.println("연락처 :"+student.getPhone());
            System.out.println("----------------------");
    }

    public Student searchStudent(Scanner sc) {

        String strNum="";
        int num=0;
        System.out.println("\n[학생을 조회 합니다.]");

        while(true) {
            try {

                System.out.print("학번을 입력하십시오. : ");
                strNum = sc.nextLine(); // 문자열로 입력 받기


                if(strNum.isEmpty()) { // 예외 1 : 반컨을 입력하였을 때
                    System.out.println("[조회 학번이 빈 값 입니다.]");
                    continue;
                }
                else if(strNum.contains(" ")) { //예외 5 : 공백 포함
                    System.out.println("[앞 뒤 공백 없이 학번을 입력해주세요.]");
                    continue;
                }
                else {
                    num = Integer.parseInt(strNum); // 정수형으로 변경
                }

                if(num<=0) { // 예외 2 : 학번이 음수일 때
                    System.out.println("[학번은 양수여야 합니다.]");
                }

                else if (Integer.toString(num).length()!=8) { // 예외 3 : 입력한 학번이 8자리가 아닐 때.
                    System.out.println("[학번은 여덟 자리여야 합니다.]");
                }

                else { // 예외 없이 진행되었다면 ?
                    break; // 반복문 탈출
                }

            } catch (NumberFormatException e) { // 예외 4 : 학번이 숫자가 아닐 때
                System.out.println("[학번은 숫자여야 합니다.]");
            }
        }

        for(Student student : list){ // 입력한 학번과 일치하는 학생이 있을 때 해당 객체를 리턴
            if(num==student.getNum()) {
                return student;
            }
        }
        System.out.println("[일치하는 학번이 없습니다.]"); // 예외 1 : 일치하는 학번이 없을 때
        return null; // null을 리턴하여 전달
    }

    public void editStudent(Student student,Scanner sc) {
        int step=3;
        String phonePattern= "010-\\d{4}-\\d{4}$"; // 전화번호 정규 표현 식
        String korean = "^[가-힣]+$"; //한글 정규 표현 식
        String changeMajor = "";
        String changePhone = "";

        System.out.println("\n학생 정보를 수정합니다");

        System.out.println("학 번 :"+student.getNum());
        System.out.println("이 름 :"+student.getName());

        while(true){ // 학과 등록
            System.out.print("학   과 입력 : ");
            changeMajor = sc.nextLine();

            if(changeMajor.isEmpty()) { // 에외 1 : 아무 값도 입력하지 않았을 때
                System.out.println("[수정 학과가 빈 값 입니다.]");
            }
            else if(changeMajor.contains(" ")) { // 예외 2 : 공백을 포함할 때
                System.out.println("[공백 없이 학과를 입력해주세요.]");
            }
            else if (!(changeMajor.matches(korean))) { // 예외 3 : 이름이 한글이 아닐 때
                System.out.println("[학과를 한글로 바르게 입력해주세요.]");
            }
            else { // 예외 없이 진행되었다면 ?
                student.setMajor(changeMajor);
                break; // 반복문 탈출
            }
        }
        while(true){ // 전화번호 등록
            System.out.print("전화번호 입력 : ");
            changePhone = sc.nextLine(); // 전화번호 공백 제거.

            if (!(Pattern.matches(phonePattern, changePhone))) { // 예외 1 : 전화번호 정규식 표현에 위배되었을 때
                System.out.println("[전화번호 형식이 잘못되었습니다. ( 010-****-**** ) ]");
            }
            else { // 예외 없이 진행되었다면 ?
                student.setPhone(changePhone);
                break; // 반복문 탈출
            }
        }
    }



}
