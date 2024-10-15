package Exam01;

import java.util.Scanner;

public class Q1_서승권 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.print("a의 값: ");
        int a = scanner.nextInt();

        System.out.print("b의 값: ");
        int b = scanner.nextInt();

        System.out.print("c의 값: ");
        int c = scanner.nextInt();

        int max = a;  // 일단 a를 최댓값으로 가정

        if (b > max) {
            max = b;
        }

        if (c > max) {
            max = c;
        }

        // 최종 결과 출력
        System.out.println("최댓값은 " + max + "입니다.");
    }
}
