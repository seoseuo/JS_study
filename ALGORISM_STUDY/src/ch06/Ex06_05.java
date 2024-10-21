package ch06;

import java.util.Scanner;

public class Ex06_05 {

    public static void main(String[] args) {

        Scanner stdIn = new Scanner(System.in);
        int nx;

        System.out.println("단순 삽입 정렬 ");
        System.out.print("요솟수: ");
        nx = stdIn.nextInt();

        int[] x = new int[nx];

        // 입력
        for (int i = 0; i < nx; i++) {
            System.out.print("x[" + i + "]: ");
            x[i] = stdIn.nextInt();
        }

        // 선택 정렬
        insertionSort(x, nx);

        // 출력
        for (int i = 0; i < nx; i++){
            System.out.println("x[" + i + "]: " + x[i]);
        }


    }

    // 삽입 정렬
    static void insertionSort(int[] a, int n) {

        for (int i = 1; i < n; i++) {
            int j;
            int temp = a[i];
            for (j = i; j > 0 && a[j - 1] > temp; j--){
                a[j] = a[j - 1];
            }
            a[j] = temp;
        }

    }




}
