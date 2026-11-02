const zakres = parseInt(prompt("Podaj zakres:"));

// Tworzymy tablicę wypełnioną wartościami true
let lista = Array(zakres + 1).fill(true);

// 0 i 1 nie są liczbami pierwszymi
lista[0] = false;
lista[1] = false;

// Sito Eratostenesa
for (let i = 2; i <= Math.sqrt(zakres); i++) {
    if (lista[i]) {
        for (let w = i * i; w <= zakres; w += i) {
            lista[w] = false;
        }
    }
}

// Wyświetlanie liczb pierwszych
for (let i = 2; i <= zakres; i++) {
    if (lista[i]) {
        console.log(i);
    }
}
