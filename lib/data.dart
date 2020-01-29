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
      "Per gikk en tur på ski, og Anne gikk på skøyter",
      "Per gikk en tur på ski og Anne gikk på skøyter",
      0),
  Training(
      "Kondrad skifta jobb for tredje gang på to år, og Aud fulgte opp med sin andre skilsmisse på to år",
      "Kondrad skifta jobb for tredje gang på to år og Aud fulgte opp med sin andre skilsmisse på to år",
      0),
  Training(
      "Skal vi kjøpe nytt hus i år, eller skal vi vente til neste år?",
      "Skal vi kjøpe nytt hus i år eller skal vi vente til neste år?",
      0),
  Training(
      "Dette hadde jeg ikke ventet fra deg, for vi hadde jo avtalt noe annet",
      "Dette hadde jeg ikke ventet fra deg for vi hadde jo avtalt noe annet",
      0),
  Training(
      "Dette var svært hyggelig, men nå må vi dra hjem",
      "Dette var svært hyggelig men nå må vi dra hjem",
      0),
  Training(
      "Hvis helsa holder og tiden strekker til, kommer vi på besøk i jula",
      "Hvis helsa holder og tiden strekker til kommer vi på besøk i jula",
      1),
  Training(
      "Hvis helsa holder, og hvis tiden strekker til, kommer vi på besøk i jula",
      "Hvis helsa holder og tiden strekker til kommer vi på besøk i jula",
      1),
  Training(
      "Dersom dette er alt du har å by på og humøret er like dårlig, tar vi kvelden nå",
      "Dersom dette er alt du har å by på og humøret er like dårlig tar vi kvelden nå",
      1),
  Training(
      "Dersom dette er alt du har å by på, og dersom humøret er like dårlig, tar vi kvelden nå",
      "Dersom dette er alt du har å by på og dersom humøret er like dårlig tar vi kvelden nå",
      1),
  Training(
      "Da Knut kom hjem, døde kona",
      "Da Knut kom hjem døde kona",
      2),
  Training(
      "Hvis du vil ha billetter til festspillene i Bayruth mens du lever, må du søke før du blir tjue",
      "Hvis du vil ha billetter til festspillene i Bayruth mens du lever må du søke før du blir tjue",
      2),
  Training(
      "Når Jarle blir engasjert, glemmer han å spise",
      "Når Jarle blir engasjert glemmer han å spise",
      2),
  Training(
      "Da Blakken kom inn fra beite, var han oppspist av mygg",
      "Da Blakken kom inn fra beite var han oppspist av mygg",
      2),
  Training(
      "Hvis du ikke kan ta deg selv i nakken, skal jeg gjøre det!",
      "Hvis du ikke kan ta deg selv i nakken skal jeg gjøre det!",
      2),
  Training(
      "Forestilling som var ny for oss, svarte fullt ut til forventningene",
      "Forestilling som var ny for oss svarte fullt ut til forventningene",
      3),
  Training(
      "Desserten som vi hadde sett frem til, var en gedigen nedtur",
      "Desserten som vi hadde sett frem til var en gedigen nedtur",
      3),
  Training(
      "Gutten som forvolte skaden, forsvant som dugg for sola",
      "Gutten som forvolte skaden forsvant som dugg for sola",
      3),
  Training(
      "Pizzadeigen som hadde hevet i 48 timer, gav en fantastisk fin bunn",
      "Pizzadeigen som hadde hevet i 48 timer gav en fantastisk fin bunn",
      3),
  Training(
      "Maten vi fikk til middag, smakte fortreffelig",
      "Maten vi fikk til middag smakte fortreffelig",
      3),
  Training(
      "Kniven, som hadde sort skaft, var en vanlig kjøkkenkniv",
      "Kniven som hadde sort skaft var en vanlig kjøkkenkniv",
      4),
  Training(
      "Jenta, som hadde blå jakke, var ute på heisatur",
      "Jenta som hadde blå jakke var ute på heisatur",
      4),
  Training(
      "Filmen, som var i lengste laget, var tekstet på polsk",
      "Filmen som var i lengste laget var tekstet på polsk",
      4),
  Training(
      "Studenten, som ofte var for sein, møtte ikke opp til eksamen",
      "Studenten som ofte var for sein møtte ikke opp til eksamen",
      4),
  Training(
      "Den nye kua, som var kollet, melket best av all",
      "Den nye kua, som var kollet, melket best av all",
      4),
  Training(
      "Hovedstaden i Norge, Oslo, het før Kristiania",
      "Hovedstaden i Norge Oslo het før Kristiania",
      5),
  Training(
      "Richard Wagner, tidenes største operakomponist, bygde sitt eget operahus i Bayruth",
      "Richard Wagner tidenes største operakomponist bygde sitt eget operahus i Bayruth",
      5),
  Training(
      " ",
      " ",
      5),
  Training(
      " ",
      " ",
      5),
  Training(
      " ",
      " ",
      5),
];


