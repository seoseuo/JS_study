import java.util.Scanner;

public class Q7_서승권Ex {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("1부터 n 까지의 총합을 구합니다.");
        System.out.print("n값: ");
        int n = scanner.nextInt();

        int sum = 0;

        sum = n*(n+1)*1/2;

//        for (int i = 1; i <= n; i++) {
//            sum += i;
//
//            if (i == n) {
//                System.out.print(i);
//            } else {
//                System.out.print(i + " + ");
//            }
//        }
        System.out.println("1부터 n 까지의 총합은" + sum);
    }
}
