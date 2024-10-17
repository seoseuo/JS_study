package Exam01;

import java.util.Scanner;

public class Q20_서승권 {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int n = 0;


        do {
            System.out.print("정수를 입력하세요 : ");
            n = sc.nextInt();
        } while (n <= 0);

        int result = factorial(n);
        System.out.println(n + "의 팩토리얼은 " + result + "입니다.");

    }

    public static int factorial(int n) {
        if (n == 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }
}


