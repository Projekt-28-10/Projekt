#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// --- Definicje naśladujące HolyC ---
#define U0 void
#define I64 int64_t
#define U8 uint8_t
#define TRUE 1
#define FALSE 0
#define MAlloc malloc
#define Free free
#define Print printf

// Odpowiednik funkcji z HolyC
U0 Sieve(I64 start, I64 end)
{
    U8 *is_prime;
    I64 i, j, count = 0;

    if (start < 0) start = 0;
    if (end < 2 || end < start) {
        Print("Brak liczb pierwszych w przedziale [%lld, %lld]\n", 
              (long long)start, (long long)end);
        return;
    }

    I64 n = end;
    is_prime = MAlloc(n + 1);
    if (!is_prime) {
        fprintf(stderr, "Brak pamieci dla zakresu do %lld\n", (long long)n);
        return;
    }

    for (i = 0; i <= n; i++)
        is_prime[i] = TRUE;

    is_prime[0] = FALSE;
    is_prime[1] = FALSE;

    for (i = 2; i * i <= n; i++) {
        if (is_prime[i]) {
            for (j = i * i; j <= n; j += i)
                is_prime[j] = FALSE;
        }
    }

    Print("Liczby pierwsze w przedziale [%lld, %lld]:\n", 
          (long long)start, (long long)end);
    
    for (i = start; i <= end; i++) {
        if (i >= 2 && is_prime[i]) {
            Print("%lld ", (long long)i);
            count++;
        }
    }
    Print("\nZnaleziono: %lld\n", (long long)count);

    Free(is_prime);
}

// Ponieważ w C nie ma wywołania funkcji na najwyższym poziomie,
// musimy użyć main(). W HolyC ten kod byłby po prostu wywołaniem Sieve(...)
int main()
{
    I64 start, end;
    int rc;

    Print("Podaj poczatek przedzialu: ");
    rc = scanf("%lld", (long long *)&start);
    if (rc != 1) {
        fprintf(stderr, "Blad: to nie jest liczba.\n");
        return 1;
    }

    Print("Podaj koniec przedzialu: ");
    rc = scanf("%lld", (long long *)&end);
    if (rc != 1) {
        fprintf(stderr, "Blad: to nie jest liczba.\n");
        return 1;
    }

    if (start > end) {
        I64 temp = start;
        start = end;
        end = temp;
        Print("(Zamienilem kolejnosc: teraz [%lld, %lld])\n", 
              (long long)start, (long long)end);
    }

    Sieve(start, end);
    return 0;
}
