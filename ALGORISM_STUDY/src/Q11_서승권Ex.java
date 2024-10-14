public class Q11_서승권Ex {
    public static void main(String[] args) {

//        System.out.print("   |");
        System.out.printf("%4s","|");
        for (int i = 1; i <= 9; i++) {
            System.out.printf(" %2d", i);
        }
        System.out.println("\n---+---------------------------");

        for (int i = 1; i <= 9; i++) {
            System.out.printf(" %d |", i);
            for (int j = 1; j <= 9; j++) {
                System.out.printf(" %2d", i * j);
            }
            System.out.println();
        }
    }
}
