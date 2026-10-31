use std::io::{self, Write};

/// Zwraca wektor liczb pierwszych z przedziału [start, end].
/// Sito liczy zawsze od 2 do `end`, a potem filtruje do zakresu.
fn primes_in_range(start: i64, end: i64) -> Vec<i64> {
    if end < 2 || end < start {
        return Vec::new();
    }

    let start = start.max(0);
    let n = end as usize;

    let mut is_prime = vec![true; n + 1];
    is_prime[0] = false;
    if n >= 1 {
        is_prime[1] = false;
    }

    let mut i = 2usize;
    while i * i <= n {
        if is_prime[i] {
            let mut j = i * i;
            while j <= n {
                is_prime[j] = false;
                j += i;
            }
        }
        i += 1;
    }

    (start.max(2)..=end)
        .filter(|&x| is_prime[x as usize])
        .collect()
}

fn read_i64(prompt: &str) -> i64 {
    loop {
        print!("{}", prompt);
        io::stdout().flush().expect("flush failed");

        let mut buf = String::new();
        if io::stdin().read_line(&mut buf).is_err() {
            eprintln!("Blad odczytu.");
            std::process::exit(1);
        }

        match buf.trim().parse::<i64>() {
            Ok(v) => return v,
            Err(_) => eprintln!("To nie jest liczba, sprobuj ponownie."),
        }
    }
}

fn main() {
    let mut start = read_i64("Podaj poczatek przedzialu: ");
    let mut end   = read_i64("Podaj koniec przedzialu: ");

    if start > end {
        std::mem::swap(&mut start, &mut end);
        println!("(Zamienilem kolejnosc: teraz [{}, {}])", start, end);
    }

    let primes = primes_in_range(start, end);

    if primes.is_empty() {
        println!("Brak liczb pierwszych w przedziale [{}, {}]", start, end);
        return;
    }

    println!("Liczby pierwsze w przedziale [{}, {}]:", start, end);
    for p in &primes {
        print!("{} ", p);
    }
    println!();
    println!("Znaleziono: {}", primes.len());
}
