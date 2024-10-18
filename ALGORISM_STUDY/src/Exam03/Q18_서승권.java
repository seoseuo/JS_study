package Exam03;

import java.util.Scanner;

public class Q18_서승권 {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);

        // 배열의 크기를 입력받음
        int size;
        do {
            System.out.print("요솟수 : ");
            size = sc.nextInt();
        } while (size <= 0);

        int[] x = new int[size];
        for (int i = 0; i < size; i++) {
            System.out.print("x[" + i + "]: ");
            x[i] = sc.nextInt();
        }

        // 검색할 값 입력
        System.out.print("검색할 값: ");
        int find = sc.nextInt();

        // 검색
        int idx = -1; // 값을 찾았는지 나타내는 인덱스 (-1: 값 없음)
        for (int i = 0; i < size; i++) {
            if (x[i] == find) {
                idx = i;
                break;
            }
        }

        // 결과 출력
        if (idx != -1) {
            System.out.println("검색 값은 x[" + idx + "]에 있습니다.");
        } else {
            System.out.println("그 값의 요소가 없습니다.");
        }

        sc.close();
    }
}
