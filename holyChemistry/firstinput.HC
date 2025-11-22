I64 finished_parsing = 0;

struct pieceMolecule {
    U8 atom[3];
    I64 quantity;
};

pieceMolecule pieces[128];
I64 pieces_count = 0;

U0 splitMolecule(U8 *s) {

    pieces_count = 0;

    for (I64 i = 0; s[i] != '\0'; ) {

        if (!IsUpper(s[i])) {
            Print("A molécula deve começar com letra maiúscula.\n");
            return;
        }

        pieces[pieces_count].atom[0] = s[i];
        i++;

        if (IsLower(s[i])) {
            pieces[pieces_count].atom[1] = s[i];
            pieces[pieces_count].atom[2] = '\0';
            i++;
        } else {
            pieces[pieces_count].atom[1] = '\0';
        }

        I64 num = 0;

        if (IsDigit(s[i])) {
            while (IsDigit(s[i])) {
                num = num * 10 + (s[i] - '0');
                i++;
            }
            pieces[pieces_count].quantity = num;
        } else {
            pieces[pieces_count].quantity = 1;
        }

        pieces_count++;
    }

    finished_parsing = 1;
}

U0 processMolecule(U8 *molecularformula) {
    Print("A fórmula molecular passada é %s \n", molecularformula);
    splitMolecule(molecularformula);
}

U0 firstInput() {
    U8 molecularformula[1024];
    Print("Escreva a fórmula molecular da molécula: ");
    GetStr(molecularformula);
    processMolecule(molecularformula);
}
