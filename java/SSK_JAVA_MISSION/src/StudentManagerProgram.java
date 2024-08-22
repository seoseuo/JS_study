import java.awt.print.Pageable;
import java.util.InputMismatchException;
import java.util.Scanner;

public class StudentManagerProgram {
    private final Scanner sc = new Scanner(System.in); //입력받을 스캐너
    private int length = 0; // 학생 수


    public void studentManagerProgram() {

            //유효성 체크
            boolean plag = false;
            String strSelect="";
            int select=0;

            while(!plag) {
                System.out.print("학생 수 입력 : ");
                try {
                    String strLength = sc.nextLine();
                    if(strLength.isEmpty()) { // 예외 1 : 빈 값을 입력하였을 때
                        System.out.println("[빈 값 입니다.]");
                        continue;
                    }
                    else if(strLength.contains(" ")) { // 예외 4 : 앞 뒤로 공백이 있을 땐
                        System.out.println("[앞 뒤 공백 없이 학생 수를 입력하세요.]");
                        continue;
                    }
                    else {
                        length = Integer.parseInt(strLength);
                    }
                    if(length<=0) { // 예외 2 : 음수를 입력하였을 때
                        System.out.println("[양의 정수를 입력해주세요.]");
                        continue;
                    }

                    plag=true; //이상 없으면 반복문 탈출
                }

                catch (NumberFormatException e) { // 예외 3 : 숫자가 아닌 다른 값을 입력핫였을 때
                    System.out.println("[정수를 입력해주세요.]");
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
                // 선택 할 메뉴
                try {
                    strSelect =sc.nextLine();
                    if(strSelect.isEmpty()) { // 예외 1 : 입력 값이 빈칸일 때
                        System.out.println("[빈 값 입니다.]");
                        continue;
                    }
                    else if(strSelect.contains(" ")) { // 예외 2 : 공백이 앞 뒤로 포함되었으 ㄹ때
                        System.out.println("[앞 뒤 공백 없이 관리 번호를 입력하세요.]");
                        continue;
                    }
                    else {
                        select = Integer.parseInt(strSelect);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("[1~5 까지만 입력할 수 있습니다.]"); // 예외 3: 1-5 까지의 숫자를 입력하지 않았을 때
                    continue;
                }


                //자원,메모리 관리. 일관성 유지를 위하여 Scanner 객체를 파라미터로 넘겼습니다.
                //학생 클래스 객체 변수
                Student student;
                if(select ==1) { // 1. 학생 등록 메뉴 실행
                    int i=0;
                    while(i++<length) {
                        studentManagerService.addStudent(sc);
                    }
                    length=1;
                }
                else if(select ==2) {
                    studentManagerService.printAllList();
                }
                else if(select ==3) {
                    student = studentManagerService.searchStudent(sc);
                    if(student !=null) { // 조회 값이 null이 아닐 대
                        studentManagerService.printStudent(student);
                    }
                }
                else if(select ==4) {
                    student = studentManagerService.searchStudent(sc);
                    if(student !=null) {
                        studentManagerService.editStudent(student,sc);
                    }
                }

                else if(select ==5){
                    System.out.print("프로그램을 종료하시겠습니까? (y/n) : ");
                    String quit = sc.nextLine(); //y,n
                    quit = quit.toLowerCase(); // 예외 1 ) 대문자를 입력하였을 때

                    if (quit.equals("y")) {
                        System.out.println("--------------------");
                        System.out.println("[프로그램을 종료합니다.]");
                        break;

                    } else if(quit.equals("n")) {
                        System.out.println("[프로그램 종료를 취소합니다. 초기 메뉴로 돌아갑니다.]");
                        continue;

                    }else { // 예외-1 ) y 또는 n 말고 다른 값을 입력했을 때
                        System.out.println("[y또는 n을 입력해주세요. 초기 메뉴로 돌아갑니다.]");
                    }
                }

            }while(true);

            sc.close(); // 스캐너 마무리
        }
}