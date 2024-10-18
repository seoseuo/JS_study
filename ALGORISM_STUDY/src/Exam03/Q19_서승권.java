package Exam03;

import java.util.Scanner;

public class Q19_서승권 {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int num = 0;

        // 배열의 크기를 입력받음
        int size;
        do {
            System.out.print("요솟수 : ");
            size = sc.nextInt();
        } while (size <= 0);

        int[] nums = new int[size];

        System.out.println("오름 차순으로 입력하세요.");

        // 0번째만 따로 입력 받음
        System.out.print("x[0]: ");
        nums[0] = sc.nextInt();

        for (int i = 1; i < size; i++) {
            do {
                System.out.print("x[" + i + "]: ");
                num = sc.nextInt();
            } while (num < nums[i - 1]);
            nums[i] = num;
        }

        // 검색할 값 입력
        System.out.print("검색할 값: ");
        int find = sc.nextInt();

        // 검색
        int result = binSearch(nums, size, find);
        if (result == -1) {
            System.out.println("그 값의 요소가 없습니다.");
        } else {
            System.out.println("검색 값은 x[" + result + "]에 있습니다.");
        }


        sc.close();
    }

    static int binSearch(int[] nums, int size, int find) {

        int pl = 0;
        int pr = size - 1;

        do {
            int pc = (pl + pr) / 2;
            if (nums[pc] == find) return pc;
            else if (nums[pc] < find) pl = pc + 1;
            else pr = pc - 1;
        } while (pl <= pr);

        return -1;

    }
}
