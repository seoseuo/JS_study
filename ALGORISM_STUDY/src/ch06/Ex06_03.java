package ch06;

import java.util.Scanner;

public class Ex06_03 {

    public static void main(String[] args) {

        Scanner stdIn = new Scanner(System.in);
        int nx;

        System.out.println("버블 정렬(버전 3)");
        System.out.print("요솟수: ");
        nx = stdIn.nextInt();

        int[] x = new int[nx];

        // 입력
        for (int i = 0; i < nx; i++) {
            System.out.print("x[" + i + "]: ");
            x[i] = stdIn.nextInt();
        }

        // 버블 정렬
        bubbleSort(x, nx);

        // 출력
        for (int i = 0; i < nx; i++){
            System.out.println("x[" + i + "]: " + x[i]);
        }

    }

    // 버블 정렬
    static void bubbleSort(int[] a, int n) {

        int k = 0;

        while (k < n - 1) {
            int last = n - 1;
            for (int j = n - 1; j > k; j--) {
                if (a[j - 1] > a[j]) {
                    swap(a, j - 1, j);
                    last = j;
                }
            }
            k = last;
        }

    }

    // 값의 교환
    static void swap(int[] a, int idx1, int idx2) {
        int temp = a[idx1];
        a[idx1] = a[idx2];
        a[idx2] = temp;
    }

}
