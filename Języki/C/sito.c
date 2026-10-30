#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t U8;
typedef int64_t I64;
typedef void    U0;

U0 Sieve(I64 start, I64 end)
{
    U8 *is_prime;
    I64 i, j, n, count = 0;

    // Przedział musi mieć sens
    if (start < 0) start = 0;
    if (end < 2 || end < start) {
        printf("Brak liczb pierwszych w przedziale [%lld, %lld]\n",
               (long long)start, (long long)end);
        return;
    }

    // Sito zawsze liczymy od 2 aż do 'end'
    n = end;

    is_prime = malloc(n + 1);
    if (!is_prime) {
        fprintf(stderr, "Brak pamięci dla zakresu do %lld\n", (long long)n);
        return;
    }

    for (i = 0; i <= n; i++)
        is_prime[i] = 1;

    is_prime[0] = 0;
    is_prime[1] = 0;

    for (i = 2; i * i <= n; i++) {
        if (is_prime[i]) {
            for (j = i * i; j <= n; j += i)
                is_prime[j] = 0;
        }
    }

    // Wypisujemy tylko te z przedziału [start, end]
    printf("Liczby pierwsze w przedziale [%lld, %lld]:\n",
           (long long)start, (long long)end);
    for (i = start; i <= end; i++) {
        if (i >= 2 && is_prime[i]) {
            printf("%lld ", (long long)i);
            count++;
        }
    }
    printf("\n");
    printf("Znaleziono: %lld\n", (long long)count);

    free(is_prime);
}

int main(void)
{
    I64 start, end;
    int rc;

    printf("Podaj poczatek przedzialu: ");
    rc = scanf("%lld", (long long *)&start);
    if (rc != 1) {
        fprintf(stderr, "Blad: to nie jest liczba.\n");
        return 1;
    }

    printf("Podaj koniec przedzialu: ");
    rc = scanf("%lld", (long long *)&end);
    if (rc != 1) {
        fprintf(stderr, "Blad: to nie jest liczba.\n");
        return 1;
    }

    if (start > end) {
        I64 tmp = start;
        start = end;
        end = tmp;
        printf("(Zamienilem kolejnosc: teraz [%lld, %lld])\n",
               (long long)start, (long long)end);
    }

    Sieve(start, end);
    return 0;
}
