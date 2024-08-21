import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.regex.Pattern;

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
        boolean plag = false;
        int num=0;
        int step = 1;

        String name="";
        String major="";
        String phonePattern= "010-\\d{4}-\\d{4}$"; // 전화번호 정규 표현 식
        String korean = "^[가-힣]+$"; //한글 정규 표현 식
        String phone="";

        System.out.println("\n[학생을 등록합니다.]");

        if(list.size()==this.length) { // 처음에 입력한 학생 수를 넘었을 때.
            System.out.println("[초기에 설정한 학생 수를 초과하였습니다.]");
            return; //addStudent 메소드를 종료합니다.
        }

        while(step<5) { // 학번, 이름, 전공 , 전화번호 순으로 1,2,3,4 단계의 등록 과정으로 분할
            if(step==1) { // 학번 등록 단계
                try {
                    System.out.print("학   번 입력 : ");
                    num= sc.nextInt();
                    sc.nextLine();

                } catch (InputMismatchException e) { // 예외 2 : 학번이 숫자가 아닐 때
                    System.out.println("[학번은 숫자여야 합니다.]");
                    sc.nextLine();
                    continue;
                }
                if(num==0) { // 예외 1 : 아무 값도 입력하지 않았을 때
                    System.out.println("[학번을 입력해주세요.]");
                }
                else if(num<0) { // 예외 3 : 학번이 음수일 때
                    System.out.println("[학번은 양수여야 합니다.]");
                }
                else if(!list.isEmpty()) { // 예외 4 : 동일한 학번이 있을 때
                    for(Student student:list) {
                        if (num==student.getNum()) {
                            System.out.println("[동일한 학번입니다 . 다시 입력하세요 .]");
                        }
                    }
                }
                else if (Integer.toString(num).length()!=8) { // 예외5 : 입력한 학번이 8자리가 아닐 때.
                    System.out.println("[학번은 여덟 자리여야 합니다.]");
                }

                else { // 예외 없이 진행되었다면 ?
                    ++step; // 다음 단계로 진행할 수 있게 step의 크기를 늘려줌.
                }
            }

            else if (step==2) { // 이름 등록
                System.out.print("이   름 입력 : ");
                name = sc.nextLine().trim(); //예외 2 : 이름 처음, 중간, 끝에 있는 공백 제거

                if(name.isEmpty()) { // 에외 1 : 아무 값도 입력하지 않았을 때
                    System.out.println("[이름을 입력해주세요.]");
                }
                else if (!(name.matches(korean))) { // 예외 3 : 이름이 한글이 아닐 때
                    System.out.println("[한글 이름을 입력해주세요.]");
                }
                else { // 예외 없이 진행되었다면 ?
                    ++step; // 다음 단계로 진행할 수 있게 step의 크기를 늘려줌.
                }
            }

            else if (step==3) { // 학과 등록
                System.out.print("학   과 입력 : ");
                major = sc.nextLine().trim(); //예외 2 : 이름 처음, 중간, 끝에 있는 공백 제거

                if(major.isEmpty()) { // 에외 1 : 아무 값도 입력하지 않았을 때
                    System.out.println("[전공을 입력해주세요.]");
                }
                else if (!(major.matches(korean))) { // 예외 3 : 이름이 한글이 아닐 때
                    System.out.println("[전공은 한글로 입력합니다.]");
                }
                else { // 예외 없이 진행되었다면 ?
                    ++step; // 다음 단계로 진행할 수 있게 step의 크기를 늘려줌.
                }
            }
            else { // 전화번호 등록
                System.out.print("전화번호 입력 : ");
                phone = sc.nextLine().trim(); // 전화번호 공백 제거.

                if (!(Pattern.matches(phonePattern, phone))) { // 예외 1 : 전화번호 정규식 표현에 위배되었을 때
                    System.out.println("[전화번호 형식이 잘못되었습니다. ( 010-****-**** ) ]");
                }
                else { // 예외 없이 진행되었다면 ?
                    step++; // 마지막 단게이므로 등록 반복문을 탈출한다.
                }
            }

        }
        list.add(new Student(name,num,major,phone)); //Array List의 add 메소드 사용
    }


    public void printAllList() {
        if(list.isEmpty()){
            System.out.println("\n정보 ) 등록 학생이 없습니다.");
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
        System.out.println("\n[학생을 조회 합니다.]");
        System.out.print("학번을 입력하십시오. : ");
        int num = sc.nextInt();

        for(Student student : list){ // 입력한 학번과 일치하는 학생이 있을 때 해당 객체를 리턴
            if(num==student.getNum()) {
                return student;
            }
        }
        System.out.println("[일치하는 학번이 없습니다.]"); // 예외 1 : 일치하는 학번이 없을 때
        return null; // null을 리턴하여 전달
    }

    public void editStudent(Student student,Scanner sc) {
        sc.nextLine();
        System.out.println("\n학생 정보를 수정합니다");

        System.out.println("학 번 :"+student.getNum());
        System.out.println("이 름 :"+student.getName());

        System.out.print("학   과 입력 : ");
        student.setMajor(sc.nextLine().trim());

        System.out.print("전화번호 입력 : ");
        student.setPhone(sc.nextLine().trim());
    }



}
