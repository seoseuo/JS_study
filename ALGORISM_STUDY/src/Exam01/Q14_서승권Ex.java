package Exam01;

import java.util.Scanner;

public class Q14_서승권Ex {
    static void triangleLB(int n) {
        System.out.println("왼쪽 아래 직각삼각형");

        for (int i = 0; i < n; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

    static void triangleLU(int n) {
        System.out.println("왼쪽 위 직각삼각형");
        for (int i = n; i > 0; i--) {
            for (int j = 0; j < i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

    static void triangleRB(int n) {
        System.out.println("오른쪽 아래 직각삼각형");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

    static void triangleRU(int n) {
        System.out.println("오른쪽 위 직각삼각형");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j < n - i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {

        System.out.println("삼각형을 출력합니다.");
        int n = 0;

        Scanner scanner = new Scanner(System.in);
        System.out.print("단수는 : ");
        n = scanner.nextInt();

        triangleLB(n);
        triangleLU(n);
        triangleRU(n);
        triangleRB(n);
    }
}
