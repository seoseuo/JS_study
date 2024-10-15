package Exam01;

public class Q13_서승권Ex {
    public static void main(String[] args) {

        System.out.println("정사각형을 출력합니다.");


        for (int i = 1; i <= 9; i++) {
            System.out.printf(" %d |", i);
            for (int j = 1; j <= 9; j++) {
                System.out.printf(" %2d", i + j);
            }
            System.out.println();
        }
    }
}
