package Exam02;

import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Q13_서승권 {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int i = 0;

        System.out.println("키의 최댓값을 구합니다.");
        System.out.print("사람 수 : ");

        int h[] = new int[sc.nextInt()];

        while(i<h.length) {
            System.out.print("height[" + i + "] : ");
            h[i++] = sc.nextInt();
        }
        Arrays.sort(h);
        System.out.println("최댓값은 " + h[h.length - 1] + "입니다.");

    }
}
