package Exam01;

import java.util.Scanner;

public class Q3_서승권Ex {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("네 정수의 최솟값을 구합니다.");
        System.out.print("a의 값: ");
        int a = scanner.nextInt();
        System.out.print("b의 값: ");
        int b = scanner.nextInt();
        System.out.print("c의 값: ");
        int c = scanner.nextInt();
        System.out.print("d의 값: ");
        int d = scanner.nextInt();

        int min = a;
        if (b < min) min = b;
        if (c < min) min = c;
        if (d < min) min = d;

        System.out.println("최솟값은 " + min + "입니다.");
    }
}
