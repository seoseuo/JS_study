package Exam01;

import java.util.Scanner;

public class Q12_서승권 {
    public static void main(String[] args) {
        int n = 0;

        Scanner scanner = new Scanner(System.in);
        System.out.print("몇단 삼각형 입니까 ? : ");
        n = scanner.nextInt();

        for (int i = n; i >= 0; i--) {
            for (int j = 0; j < i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }


    }
}
