package Exam01;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Q16_서승권Ex {
    static void npria(int n) {
        for (int i = 1; i <= n; i++) {
            for (int j = n - 1; j >= i; j--) {
                System.out.print(" ");
            }
            for (int j = 1; j < i; j++) {
                System.out.print(i);
            }
            for (int j = 1; j <= i; j++) {
                System.out.print(i);
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        int n = 0;

        Scanner scanner = new Scanner(System.in);
        System.out.println("피라미드를 출력합니다.");

        while (true) {
            try {
                System.out.print("단수는 : ");
                n = scanner.nextInt();
            } catch (InputMismatchException e) {
                scanner.nextLine();
                continue;
            }
            if (n > 0) break;
        }
        npria(n);
    }

}
