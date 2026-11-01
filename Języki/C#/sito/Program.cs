using System;
using System.Collections.Generic;

class SieveProgram
{
    // Zwraca listę liczb pierwszych z przedziału [start, end].
    static List<long> PrimesInRange(long start, long end)
    {
        var result = new List<long>();
        if (end < 2 || end < start) return result;
        if (start < 0) start = 0;

        // Sito liczymy od 2 do end
        long n = end;
        var isPrime = new bool[n + 1];
        Array.Fill(isPrime, true);
        isPrime[0] = false;
        if (n >= 1) isPrime[1] = false;

        for (long i = 2; i * i <= n; i++)
        {
            if (isPrime[i])
            {
                for (long j = i * i; j <= n; j += i)
                    isPrime[j] = false;
            }
        }

        long lo = Math.Max(start, 2);
        for (long x = lo; x <= end; x++)
        {
            if (isPrime[x])
                result.Add(x);
        }
        return result;
    }

    static long ReadLong(string prompt)
    {
        while (true)
        {
            Console.Write(prompt);
            string? line = Console.ReadLine();
            if (long.TryParse(line, out long v))
                return v;
            Console.Error.WriteLine("To nie jest liczba, spróbuj ponownie.");
        }
    }

    static void Main()
    {
        long start = ReadLong("Podaj początek przedziału: ");
        long end   = ReadLong("Podaj koniec przedziału: ");

        if (start > end)
        {
            (start, end) = (end, start);
            Console.WriteLine($"(Zamieniłem kolejność: teraz [{start}, {end}])");
        }

        var primes = PrimesInRange(start, end);

        if (primes.Count == 0)
        {
            Console.WriteLine($"Brak liczb pierwszych w przedziale [{start}, {end}]");
            return;
        }

        Console.WriteLine($"Liczby pierwsze w przedziale [{start}, {end}]:");
        foreach (var p in primes)
            Console.Write($"{p} ");
        Console.WriteLine();
        Console.WriteLine($"Znaleziono: {primes.Count}");
    }
}
