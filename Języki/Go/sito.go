package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// primesInRange zwraca liczby pierwsze z przedziału [start, end].
// Sito liczy od 2 do end, potem filtruje do zakresu.
func primesInRange(start, end int64) []int64 {
	if end < 2 || end < start {
		return nil
	}
	if start < 0 {
		start = 0
	}

	n := int(end)
	isPrime := make([]bool, n+1)
	for i := range isPrime {
		isPrime[i] = true
	}
	isPrime[0] = false
	if n >= 1 {
		isPrime[1] = false
	}

	for i := 2; i*i <= n; i++ {
		if isPrime[i] {
			for j := i * i; j <= n; j += i {
				isPrime[j] = false
			}
		}
	}

	var result []int64
	lo := start
	if lo < 2 {
		lo = 2
	}
	for x := lo; x <= end; x++ {
		if isPrime[x] {
			result = append(result, x)
		}
	}
	return result
}

// readInt64 pyta użytkownika o liczbę, powtarza aż dostanie poprawną.
func readInt64(reader *bufio.Reader, prompt string) int64 {
	for {
		fmt.Print(prompt)
		line, err := reader.ReadString('\n')
		if err != nil {
			fmt.Fprintln(os.Stderr, "Błąd odczytu.")
			os.Exit(1)
		}
		line = strings.TrimSpace(line)
		v, err := strconv.ParseInt(line, 10, 64)
		if err != nil {
			fmt.Fprintln(os.Stderr, "To nie jest liczba, spróbuj ponownie.")
			continue
		}
		return v
	}
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	start := readInt64(reader, "Podaj początek przedziału: ")
	end := readInt64(reader, "Podaj koniec przedziału: ")

	if start > end {
		start, end = end, start
		fmt.Printf("(Zamieniłem kolejność: teraz [%d, %d])\n", start, end)
	}

	primes := primesInRange(start, end)

	if len(primes) == 0 {
		fmt.Printf("Brak liczb pierwszych w przedziale [%d, %d]\n", start, end)
		return
	}

	fmt.Printf("Liczby pierwsze w przedziale [%d, %d]:\n", start, end)
	for _, p := range primes {
		fmt.Printf("%d ", p)
	}
	fmt.Println()
	fmt.Printf("Znaleziono: %d\n", len(primes))
}
