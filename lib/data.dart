class Kommaregler {
  String regel;
  String medKomma;
  String utenKomma;

  Kommaregler(this.regel, this.medKomma, this.utenKomma);

}

class Training {

  String tekstMedKomma;
  String tekstUtenKomma;
  int regelNr;

  Training(this.tekstMedKomma, this.tekstUtenKomma, this.regelNr);
}

List kommaregler = [
  Kommaregler(
      "Komma mellom setninger som er bundet sammen med og, eller, for og men. Alltid komma foran men.",
      "Petter skifta jobb for tredje gang på to år, og Aud fulgte opp med sin andre skilsmisse på to år.",
      "Petter skifta jobb for tredje gang på to år og Aud fulgte opp med sin andre skilsmisse på to år."),
  Kommaregler(
      "Ikke komma mellom to leddsetninger (bisetninger) dersom subjunksjonen ikke gjentas\nSubjunksjoner:\n'da', 'når', 'hvis', 'dersom', 'mens', 'etter at', 'før', 'fordi', 'om', 'enda', 'selv om', 'at', 'for at', 'slik at', 'slik som, 'å' og 'som' og 'enn' når de innleder leddsetninger.",
      "Hvis helsa holder og økonomien er i orden, drar vi på ferie til Mexico neste år.\nMen: \nHvis helsa holder, og hvis økonomien er i orden, drar vi på ferie til Mexico neste år.",
      "Hvis helsa holder og økonomien er i orden drar vi på ferie til Mexico neste år.\n2: \nHvis helsa holder og hvis økonomien er i orden drar vi på ferie til Mexico neste år."),
  Kommaregler("Komma etter leddsetning som står først i en helsetning",
      "Da Else kom, hadde de andre allerede spist.", ""),
  Kommaregler("Komma etter innskutt leddsetning",
      "Boka som lå på bordet, var mi.", ""),
  Kommaregler(
      "Komma også foran innskutt leddsetning som ikke er nødvendig i helsetningen",
      "Direktøren, som hadde vært ute på rangel, møtte ikke opp.",
      ""),
  Kommaregler("Komma foran og etter forklarende tillegg",
      "Harare, hovedstaden i Zimbabwe, het før Salisbury.", ""),
  Kommaregler(
      "Komma foran og etter tiltaleord, svarord og utropsord",
      "Ole, kan du komme hit?\nKom hit med deg, din gjøk!\nJa, det forstår jeg godt.\nHei sann, den satt!",
      ""),
  Kommaregler(
      "Komma mellom ledd i oppregning dersom det ikke står noen konjunksjon('og', 'men', 'for', 'eller')",
      "Berit, Else, Gerd og Marit.",
      ""),
  Kommaregler(
      "Komma etter anførselstegnet ved ordrett sitat og gjengivelse av utsagn når ytringssetningen kommer etter det siterte.",
      "«Jeg kommer på fredag», sa han.",
      ""),
  Kommaregler(
      "Ikke komma etter anførselstegnet når sitatet slutter med et spørsmålstegn eller utropstegn.",
      "«Kommer du på fredag?» spurte hun.\n«Kom hit nå med en gang!» ropte hun.",
      "")
];

List setninger = [
  Training(
      "Dette er tekst med komma, og ikke uten komma",
      "Dette er tekst uten komma og ikke med komma",
      1),
  Training(
      "Dette er også en tekst med komma, og ikke uten komma",
      "Dette er også en tekst uten komma og ikke med komma",
      1)
];
