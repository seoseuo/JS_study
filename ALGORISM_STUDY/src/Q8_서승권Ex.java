import java.util.Scanner;

public class Q8_서승권Ex {

    public static int sumof(int a, int b) {
        int i = Math.min(a, b);
        int j = Math.max(a, b);
        int sum = i;
        while (++i <= j) sum += i;
        return sum;
    }

    public static void main(String[] args) {
        int n = 0;
        Scanner scanner = new Scanner(System.in);
        System.out.println("a와 b를 포함하여 그 사이에 있는 모든 정수의 총 합을 구합니다.");

        System.out.print("a : ");
        int a = scanner.nextInt();

        System.out.print("b : ");
        int b = scanner.nextInt();

        System.out.println("정수 a,b 사이 모든 정수의 합은 " + sumof(a, b) + " 입니다.");


    }
}
