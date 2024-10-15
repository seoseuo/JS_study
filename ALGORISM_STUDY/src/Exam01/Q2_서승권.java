package Exam01;

import java.util.Scanner;

public class Q2_서승권 {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.print("a의 값: ");
        int a = scanner.nextInt();

        System.out.print("b의 값: ");
        int b = scanner.nextInt();

        System.out.print("c의 값: ");
        int c = scanner.nextInt();


        int medium;

        // 조건문으로 중간값(중앙값) 구하기
        if ((a >= b && a <= c) || (a <= b && a >= c)) {
            medium = a;
        } else if ((b >= a && b <= c) || (b <= a && b >= c)) {
            medium = b;
        } else {
            medium = c;
        }

        // 중간값 출력
        System.out.println("중간값은 " + medium + "입니다.");
    }
}
