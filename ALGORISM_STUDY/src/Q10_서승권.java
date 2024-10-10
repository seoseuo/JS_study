import java.util.Scanner;

public class Q10_서승권 {
    public static void main(String[] args) {
        int n = 0;
        boolean plag = false;
        Scanner scanner = new Scanner(System.in);
        System.out.println("2자리 양수를 입력하세요.");


        while (!plag) {
            System.out.print("no값 : ");
            n = scanner.nextInt();
            if (Integer.toString(n).length() == 2) {
                System.out.println("변수 no값은" + n + "이(가) 되었습니다.");
                plag = true;
            }
        }

    }
}
