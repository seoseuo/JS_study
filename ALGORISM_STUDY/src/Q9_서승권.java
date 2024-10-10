import java.util.Scanner;

public class Q9_서승권 {
    public static void main(String[] args) {
        int n=0;
        int w=0;

        Scanner scanner = new Scanner(System.in);
        System.out.print("n값 : ");
        n = scanner.nextInt();

        System.out.print("w값 : ");
        w = scanner.nextInt();

        for(int i=1; i<=n; i++) {
            System.out.print("*");
            if(i%w==0) {
                System.out.println();
            }
        }
        
    }
}
