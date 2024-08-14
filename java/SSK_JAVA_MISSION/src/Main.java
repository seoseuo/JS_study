import java.util.InputMismatchException;
import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int select = 0;
        int length = 0;
        boolean plag = false;
        Student student;


        //유효성 체크
        while(!plag) {
            System.out.print("학생 수 입력 : ");
            try {
                length = sc.nextInt();
                if(length<=0) {
                    throw new IllegalArgumentException("경고) 양의 정수여야 합니다.\n");
                }

                plag=true; //이상 없으면 반복문 탈출

            }catch (IllegalArgumentException e) {
                System.out.println(e.getMessage());
            }
            catch (InputMismatchException e) {
                System.out.println("경고) 정수여야 합니다.\n");
                sc.next();
            }

        }

        StudentManager studentManager = new StudentManager(length);

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

                if(select==1) {
                    studentManager.addStudent(sc);
                }
                else if(select==2) {
                    studentManager.printAllList();
                }
                else if(select==3) {
                    student = studentManager.indexing(sc);
                    if(student!=null) {
                        studentManager.printStudent(student);
                    }
                }
                else if(select==4) {
                    student = studentManager.indexing(sc);
                    if(student!=null) {
                        studentManager.editStudent(student,sc);
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
                        System.out.println("정보) y또는 n을 입력해주세요. 초기 메뉴로 돌아갑니다.");
                    }
                }
                else {
                    System.out.println("\n경고) 1~5 까지만 입력할 수 있습니다.");
                }

        }while(true);

        sc.close();

    }
}