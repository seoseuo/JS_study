package Exam02;

import java.lang.reflect.Array;
import java.util.Arrays;

public class Q17_서승권 {

    // 키의 평균값을 구하는 함수(이름은 aveHeight)
    static double aveHeight(PhyscData[] pdatas) {
        double sum = 0;
        for (PhyscData pdata : pdatas) {
            sum += pdata.height;
        }
        return Math.round(sum / pdatas.length * 10) / 10.0;
    }

    // 시력분포를 구하는 함수(이름은 distVision)
    static void distVision(PhyscData[] pdatas) {
        int[] visionData = new int[21]; // 0.0~2.0까지 0.1 단위로 21개 구간

        // 시력 데이터를 구간별로 분류
        for (PhyscData pdata : pdatas) {
            int index = (int) (pdata.vision * 10); // 시력을 0.1 단위로 구간화
            if (index >= 0 && index < visionData.length) {
                visionData[index]++;
            }
        }

        double vision = 0.0;
        for (int visionDatum : visionData) {
            System.out.printf("%.1f ~: %d명\n", Math.round(vision * 10) / 10.0, visionDatum);
            vision += 0.1;
        }
    }


    //추가 메소드
    static void printPhyscData(PhyscData[] pdatas) {
        for (PhyscData pdata : pdatas) {
            System.out.printf("%-6s %-6s %-6s\n", pdata.name, pdata.vision, pdata.vision);
        }
    }

    static class PhyscData {

        // 필드
        public String name;
        public int height;
        public double vision;

        // 생성자
        public PhyscData(String name, int height, double vision) {
            this.name = name;
            this.height = height;
            this.vision = vision;
        }

    }

    public static void main(String[] args) {
        // 배열 객체를 생성하여 화면에 제시된 내용을 출력해주세요.

        PhyscData[] pdatas = {
                new PhyscData("강민하", 162, 0.3),
                new PhyscData("김찬우", 173, 0.7),
                new PhyscData("박준서", 175, 2.0),
                new PhyscData("유서범", 171, 1.5),
                new PhyscData("이수연", 168, 0.4),
                new PhyscData("장경오", 174, 1.2),
                new PhyscData("황지안", 169, 0.8)
        };

        System.out.println("■ 신체검사 리스트 ■");
        System.out.printf("%-6s %-6s %-6s", "이름", "키", "시력");
        System.out.println("\n--------------------");

        printPhyscData(pdatas);
        System.out.println("\n평균 키: " + aveHeight(pdatas) + " cm");
        System.out.println("\n시력 분포");
        distVision(pdatas);


    }
}


