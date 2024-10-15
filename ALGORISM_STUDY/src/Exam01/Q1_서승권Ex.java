package Exam01;

import java.util.Scanner;

public class Q1_서승권Ex {
    static int max4(int a, int b, int c, int d) {
        int max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        if (d > max) max = d;
        return max;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("네 정수의 최댓값을 구합니다.");
        System.out.print("a의 값: ");
        int a = scanner.nextInt();
        System.out.print("b의 값: ");
        int b = scanner.nextInt();
        System.out.print("c의 값: ");
        int c = scanner.nextInt();
        System.out.print("d의 값: ");
        int d = scanner.nextInt();

        int max = max4(a, b, c, d);
        System.out.println("최댓값은 " + max + "입니다.");
    }
}
