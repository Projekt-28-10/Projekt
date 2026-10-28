// Sieve of Eratosthenes in HolyC
// Compile/run inside TempleOS

U0 Sieve(I64 n)
{
  U8 *is_prime;
  I64 i, j;

  if (n < 2) {
    Print("No primes below %d\n", n);
    return;
  }

  // Allocate a byte array, one byte per number
  is_prime = MAlloc(n + 1);

  // Initialize: assume everything is prime
  for (i = 0; i <= n; i++)
    is_prime[i] = TRUE;

  is_prime[0] = FALSE;
  is_prime[1] = FALSE;

  // Main sieve loop
  for (i = 2; i * i <= n; i++) {
    if (is_prime[i]) {
      for (j = i * i; j <= n; j += i)
        is_prime[j] = FALSE;
    }
  }

  // Print the primes
  Print("Primes up to %d:\n", n);
  for (i = 2; i <= n; i++) {
    if (is_prime[i])
      Print("%d ", i);
  }
  Print("\n");

  Free(is_prime);
}

// Entry point
Sieve(100);
