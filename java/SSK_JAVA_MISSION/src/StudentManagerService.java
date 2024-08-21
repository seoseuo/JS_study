import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.regex.Pattern;

public class StudentManagerService {
    private int length;
    private ArrayList<Student> list;
    //Scanner sc = new Scanner(System.in);



    public StudentManagerService(int length) {
        this.length = length;
        list = new ArrayList<Student>(this.length);
    }


    //학생 등록 메소드
    public void addStudent(Scanner sc) {
        boolean plag = false;
        String name="";
        int num=0;
        String major="";
        String phonePattern= "010-\\d{4}-\\d{4}$";
        String phone="";

        System.out.println("\n[학생을 등록합니다.]");

        if(list.size()==this.length) {
            System.out.println("경고) 등록하신 학생 수를 초과하였습니다.");
            return;
        }

        while(!plag) {
            try {
                System.out.print("학   번 입력 : ");
                num= sc.nextInt();
                sc.nextLine();

            } catch (InputMismatchException e) {
                System.out.println("경고) 정수여야 합니다.\n");
                sc.nextLine();
                continue;
            }

            plag=true; // 입력에 대해 아무 이상이 없다고 가정.

            if(!list.isEmpty()) {
                for(Student student:list) {
                    if (num==student.getNum()) {
                        System.out.println("[동일한 학번입니다 . 다시 입력하세요 .]");
                        plag = false;
                        break;
                        }
                    }
                }
            }



            System.out.print("이   름 입력 : ");
            name=sc.nextLine().trim(); //공백 제거


            System.out.print("학   과 입력 : ");
            major=sc.nextLine().trim();


            while(plag) { //전화번호 입력 양식 체크
                System.out.print("전화번호 입력 : ");
                phone=sc.nextLine().trim();

                if(Pattern.matches(phonePattern,phone)) {
                    plag=false;
                } else {
                    System.out.println("[전화번호 형식이 잘못되었습니다. ( 010-****-**** ) ]");
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

        for(Student student : list){
            if(num==student.getNum()) {
                return student;
            }
        }
        System.out.println("[일치하는 학번이 없습니다.]");
        return null;
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
