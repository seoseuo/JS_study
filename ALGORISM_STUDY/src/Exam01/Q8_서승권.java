package Exam01;

import java.util.Scanner;

public class Q8_서승권 {
    public static void main(String[] args) {
        int n=0;
        Scanner scanner = new Scanner(System.in);
        System.out.print("n값 : ");
        n = scanner.nextInt();



        for(int i=0; i<n; i++) {
            if(i%2==0) {
                System.out.print("+");
            } else {
                System.out.print("-");
            }
        }

        
    }
}
