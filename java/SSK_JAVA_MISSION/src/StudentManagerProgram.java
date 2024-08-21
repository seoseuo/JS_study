import java.util.InputMismatchException;
import java.util.Scanner;

public class StudentManagerProgram {
    private final Scanner sc = new Scanner(System.in); //입력받을 스캐너
    private int select = 0; // 선택 할 메뉴
    private int length = 0; // 학생 수
    private Student student; //학생 클래스 객체 변수


    public void studentManagerProgram() {

            //유효성 체크
            boolean plag = false;

            while(!plag) {
                System.out.print("학생 수 입력 : ");
                try {
                    length = sc.nextInt();

                    if(length<=0) { // 예외 1 : 음수를 입력하였을 때
                        throw new IllegalArgumentException("[양의 정수를 입력해주세요.]");
                    }
                    plag=true; //이상 없으면 반복문 탈출

                }catch (IllegalArgumentException e) {
                    System.out.println(e.getMessage());
                }
                catch (InputMismatchException e) { // 예외 2 : 숫자가 아닌 다른 값을 입력핫였을 때
                    System.out.println("[정수를 입력해주세요.]");
                    sc.nextLine();
                }
            }

            StudentManagerService studentManagerService = new StudentManagerService(length);

            do {
                System.out.println("\n**** 학생 관리 프로그램 ****");
                System.out.println("1. 학생 등록");
                System.out.println("2. 전체 조회");
                System.out.println("3. 학생 조회");
                System.out.println("4. 정보 수정");
                System.out.println("5. 프로그램 종료");
                System.out.print("관리 번호를 입력하세요 : ");
                select = sc.nextInt();
                sc.nextLine(); //입력 버퍼 비우기


                //자원,메모리 관리. 일관성 유지를 위하여 Scanner 객체를 파라미터로 넘겼습니다.
                if(select==1) { // 1. 학생 등록 메뉴 실행
                    int i=0;
                    while(i++<length) {
                        studentManagerService.addStudent(sc);
                    }
                    length=1;
                }
                else if(select==2) {
                    studentManagerService.printAllList();
                }
                else if(select==3) {
                    student = studentManagerService.searchStudent(sc);
                    if(student!=null) { // 조회 값이 null이 아닐 대
                        studentManagerService.printStudent(student);
                    }
                }
                else if(select==4) {
                    student = studentManagerService.searchStudent(sc);
                    if(student!=null) {
                        studentManagerService.editStudent(student,sc);
                    }
                }

                else if(select==5){
                    System.out.print("프로그램을 종료하시겠습니까? (y/n) : ");
                    String quit = sc.nextLine(); //y,n
                    quit = quit.toLowerCase(); //소문자 전환

                    if (quit.equals("y")) {
                        System.out.println("--------------------");
                        System.out.println("[프로그램을 종료합니다.]");
                        break;

                    } else if(quit.equals("n")) {
                        System.out.println("[프로그램 종료를 취소합니다. 초기 메뉴로 돌아갑니다.]");
                        continue;

                    }else {
                        System.out.println("[y또는 n을 입력해주세요. 초기 메뉴로 돌아갑니다.]");
                    }
                }
                else {
                    System.out.println("[1~5 까지만 입력할 수 있습니다.]");
                }

            }while(true);

            sc.close(); // 스캐너 마무리
        }
}