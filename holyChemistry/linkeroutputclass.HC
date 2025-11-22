#include "/home/archbtw/Downloads/quimicahcc/firstInput.hcc"

firstInput();

while (finished_parsing == 0)
    Yield;

Print("\n=== Resultado do parsing ===\n\n");

for (I64 j = 0; j < pieces_count; j++) {
    Print("Átomo %d: %s\n", j+1, pieces[j].atom);
    Print("Quantidade: %d\n", pieces[j].quantity);
}
