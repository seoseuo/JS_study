package ch06;

import java.util.Scanner;

public class Ex06_04 {

    public static void main(String[] args) {

        Scanner stdIn = new Scanner(System.in);
        int nx;

        System.out.println("단순 선택 정렬 ");
        System.out.print("요솟수: ");
        nx = stdIn.nextInt();

        int[] x = new int[nx];

        // 입력
        for (int i = 0; i < nx; i++) {
            System.out.print("x[" + i + "]: ");
            x[i] = stdIn.nextInt();
        }

        // 선택 정렬
        selectionSort(x, nx);

        // 출력
        for (int i = 0; i < nx; i++){
            System.out.println("x[" + i + "]: " + x[i]);
        }


    }
    
    // 선택 정렬
    static void selectionSort(int[] a, int n) {

        for (int i = 0; i < n - 1; i++) {
            int min = i;
            for (int j = i + 1; j < n; j++) {
                if (a[j] < a[min]) {
                    min = j;
                }
            }
            swap(a,i,min);
        }

    }

    // 값의 교환
    static void swap(int[] a, int idx1, int idx2) {
        int temp = a[idx1];
        a[idx1] = a[idx2];
        a[idx2] = temp;
    }

}
