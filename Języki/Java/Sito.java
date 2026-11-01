import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;

public class Sito {

    // Zwraca listę liczb pierwszych z przedziału [start, end]
    public static List<Long> primesInRange(long start, long end) {
        List<Long> result = new ArrayList<>();
        if (end < 2 || end < start) return result;
        if (start < 0) start = 0;

        // Sito liczymy od 2 do end
        int n = (int) end; // Java wymaga int do indeksowania tablic
        boolean[] isPrime = new boolean[n + 1];

        // Domyślnie wszystkie są false, więc ustawiamy true
        for (int i = 0; i <= n; i++) {
            isPrime[i] = true;
        }
        isPrime[0] = false;
        if (n >= 1) isPrime[1] = false;

        for (int i = 2; (long) i * i <= n; i++) {
            if (isPrime[i]) {
                for (long j = (long) i * i; j <= n; j += i) {
                    isPrime[(int) j] = false;
                }
            }
        }

        long lo = Math.max(start, 2);
        for (long x = lo; x <= end; x++) {
            if (isPrime[(int) x]) {
                result.add(x);
            }
        }
        return result;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        long start = readLong(scanner, "Podaj początek przedziału: ");
        long end   = readLong(scanner, "Podaj koniec przedziału: ");

        if (start > end) {
            long temp = start;
            start = end;
            end = temp;
            System.out.printf("(Zamieniłem kolejność: teraz [%d, %d])%n", start, end);
        }

        List<Long> primes = primesInRange(start, end);

        if (primes.isEmpty()) {
            System.out.printf("Brak liczb pierwszych w przedziale [%d, %d]%n", start, end);
            return;
        }

        System.out.printf("Liczby pierwsze w przedziale [%d, %d]:%n", start, end);
        for (long p : primes) {
            System.out.print(p + " ");
        }
        System.out.println();
        System.out.println("Znaleziono: " + primes.size());
    }

    private static long readLong(Scanner scanner, String prompt) {
        while (true) {
            System.out.print(prompt);
            String line = scanner.nextLine().trim();
            try {
                return Long.parseLong(line);
            } catch (NumberFormatException e) {
                System.err.println("To nie jest liczba, spróbuj ponownie.");
            }
        }
    }
}
