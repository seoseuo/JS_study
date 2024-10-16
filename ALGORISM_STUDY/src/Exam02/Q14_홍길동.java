import java.util.Arrays;
import java.util.Scanner;

public class Q14_홍길동 {

    public static void main(String[] args) {

        Scanner stdIn = new Scanner(System.in);
        int num;

        do {
            System.out.print("요솟수: ");
            num = stdIn.nextInt();
        } while (num <= 0);

        // 동적 배열
        int[] x = new int[num];

        for (int i = 0; i < num; i++) {
            System.out.print("x[" + i +"] : ");
            x[i] = stdIn.nextInt();
        }

        // 출력을 위한 테스트 구문
//        for (int i = 0; i < num; i++) {
//            System.out.println("x[" + i +"] : " + x[i]);
//        }

        reverse(x);

        System.out.println("요소를 역순으로 정렬했습니다.");
        System.out.println("x = " + Arrays.toString(x));

    }

    // 역순 정렬
    static void reverse(int[] x) {

        for (int i = 0; i < x.length / 2; i++) {
            swap(x, i, x.length - i - 1);
        }

    }
    
    // 데이터 교환
    static void swap(int[] x, int idx1, int idx2){

        int temp = x[idx1];
        x[idx1] = x[idx2];
        x[idx2] = temp;

    }

}
