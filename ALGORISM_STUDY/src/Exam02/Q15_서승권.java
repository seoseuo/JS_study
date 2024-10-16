package Exam02;

import java.util.Scanner;

public class Q15_서승권 {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int n = 0;
        int i = 0;


        System.out.println("10진수를 기수 변환 합니다.");
        do {
            System.out.print("변환하는 음이 아닌 정수 : ");
            n = sc.nextInt();
        } while (n <= 0);

        do {
            do {
                System.out.print("어떤 진수로 변환할까요 (2-36) : ");
                i = sc.nextInt();
            } while (i < 2 || i > 36);

            System.out.println(i + "진수로 " + change(n, i) + "입니다.");

            System.out.print("다시 한번 할까요? (1...예/0...아니요) : ");
            i = sc.nextInt();

        } while (i != 0);

    }

    static String change(int n, int i) {

        String list = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder result = new StringBuilder();

        if (n == 0) return "0"; // n이 0일 때는 바로 0 반환

        while (n > 0) {
            result.append(list.charAt(n % i)); // 나머지를 list 문자열에 해당하는 순서 맵핑하여 result에 추가
            n /= i; // n을 base로 나눈 몫을 사용해 계속 진행
        }

        // 결과는 역순으로 쌓였으므로 뒤집어서 반환
        return result.reverse().toString();
    }
}


