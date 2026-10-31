#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdint>

using U8  = std::uint8_t;
using I64 = std::int64_t;

void sieve(I64 start, I64 end)
{
    if (start < 0) start = 0;

    if (end < 2 || end < start) {
        std::cout << "Brak liczb pierwszych w przedziale ["
                  << start << ", " << end << "]\n";
        return;
    }

    // Sito liczymy od 2 do 'end'
    I64 n = end;

    std::vector<U8> is_prime(n + 1, 1);
    is_prime[0] = 0;
    if (n >= 1) is_prime[1] = 0;

    for (I64 i = 2; i * i <= n; ++i) {
        if (is_prime[i]) {
            for (I64 j = i * i; j <= n; j += i)
                is_prime[j] = 0;
        }
    }

    // Wypisujemy tylko te z przedziału [start, end]
    std::cout << "Liczby pierwsze w przedziale ["
              << start << ", " << end << "]:\n";

    I64 count = 0;
    for (I64 i = std::max<I64>(start, 2); i <= end; ++i) {
        if (is_prime[i]) {
            std::cout << i << ' ';
            ++count;
        }
    }
    std::cout << "\nZnaleziono: " << count << '\n';
}

int main()
{
    I64 start = 0, end = 0;

    std::cout << "Podaj poczatek przedzialu: ";
    if (!(std::cin >> start)) {
        std::cerr << "Blad: to nie jest liczba.\n";
        return 1;
    }

    std::cout << "Podaj koniec przedzialu: ";
    if (!(std::cin >> end)) {
        std::cerr << "Blad: to nie jest liczba.\n";
        return 1;
    }

    if (start > end) {
        std::swap(start, end);
        std::cout << "(Zamienilem kolejnosc: teraz ["
                  << start << ", " << end << "])\n";
    }

    sieve(start, end);
    return 0;
}
