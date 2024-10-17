package Exam02;

import java.util.Scanner;

public class Q16_서승권 {

    public static void main(String args[]) {

        int count = 0;

        for (int i = 2; i <= 1000; i++) {  // 1은 소수가 아니므로 2부터 시작
            if (prime(i)) {
                System.out.println(i);
                ++count;
            }
        }
    }

    static boolean prime(int num) {
        // 제곱근 법칙을 사용한다.
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                return false;  // 나누어 떨어지면 소수가 아님
            }
        }

        return true;  // 나누어 떨어지지 않으면 소수

    }
}


//public class Q17_홍길동 {
//
//    static final int MAX = 21;  // 시력 분포 갯수
//
//    static class PhyscData {
//
//        // 필드
//        String name;    // 이름
//        int height;     // 키
//        double vision;  // 시력
//
//        // 생성자
//        public PhyscData(String name, int height, double vision) {
//            this.name = name;
//            this.height = height;
//            this.vision = vision;
//        }
//
//    }
//
//    // 키의 평균값을 구하는 메소드(이름은 aveHeight)
//    static double aveHeight(PhyscData[] data){
//
//        double sum = 0.0;
//        double avg = 0.0;
//
//        for (int i = 0; i < data.length; i++) {
//            sum += data[i].height;
//        }
//
//        avg = sum / data.length;
//
//        return avg;
//    }
//
//    // 시력분포를 구하는 메소드(이름은 distVision)
//    static void  distVision(PhyscData[] data, int[] dist){
//
//        int i = 0;
//
//        dist[i] = 0;
//        for (i = 0; i < data.length; i++)
//            if (data[i].vision >= 0.0 && data[i].vision <= MAX / 10.0)
//                dist[(int)(data[i].vision * 10)]++;
//
//    }
//
//    public static void main(String[] args) {
//
//        // 배열 객체를 생성하여 화면에 제시된 내용을 출력해주세요.
//        PhyscData[] person = {
//                new PhyscData("강민하", 162, 0.3),
//                new PhyscData("김찬우", 173, 0.7),
//                new PhyscData("박준서", 175, 2.0),
//                new PhyscData("유서범", 171, 1.5),
//                new PhyscData("이수연", 168, 0.4),
//                new PhyscData("장경오", 174, 1.2),
//                new PhyscData("황지안", 169, 0.8),
//        };
//
//        int[] distVision = new int[MAX];
//
//        // 이름 키 시력 출력
//        System.out.println("■ 신체검사 리스트 ■");
//        System.out.println(" 이름    키   시력");
//        System.out.println("--------------------");
//
//        for (int i = 0; i < person.length; i++) {
//            System.out.printf("%-6s%3d%5.1f\n", person[i].name, person[i].height, person[i].vision);
//        }
//
//        //  평균 키 출력
//        System.out.printf("\n평균 키: %5.1fcm\n", aveHeight(person));
//
//        distVision(person, distVision);
//
//        // 시력분포 출력
//        System.out.println();
//        System.out.println("시력 분포");
//
//        for (int i = 0; i < MAX; i++){
//            System.out.printf("%3.1f～: %2d명\n", i / 10.0, distVision[i]);
//        }
//
//    }
//}
