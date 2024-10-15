package Exam02;

import java.util.Arrays;
import java.util.Scanner;

public class Q14_서승권 {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int i = 0;

        do {
            System.out.print("요솟수 : ");
            i = sc.nextInt();
        } while (i <= 0);

        int[] x = new int[i];
        i = 0;

        while (i < x.length) {
            System.out.print("x[" + i + "] : ");
            x[i++] = sc.nextInt();
        }

        System.out.print("요소를 역순으로 정렬했습니다.\nx = [");
        for (i = x.length - 1; i >= 0; i--) {
            if (i == 0) System.out.println(x[i] + "]");
            else System.out.print(x[i] + ", ");
        }

    }
}
