import java.util.Scanner;

public class Q3_서승권 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        for(int i=0; i<3; i++) {
            System.out.print("정수를 입력하세요: ");
            int number = scanner.nextInt();

            if (number > 0) {
                System.out.println("이 수는 양수입니다.");
            } else if (number < 0) {
                System.out.println("이 수는 음수입니다.");
            } else {
                System.out.println("이 수는 0입니다.");
            }
        }
    }
}
