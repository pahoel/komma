class Kommaregler {
  String regel;
  String medKomma;

  Kommaregler(this.regel, this.medKomma);
}

class Training {

  String tekstMedKomma;
  String tekstUtenKomma;
  int regelNr;

  Training(this.tekstMedKomma, this.tekstUtenKomma, this.regelNr);
}

List kommaregler = [
  Kommaregler(
      "Komma mellom helsetninger som er bundet sammen med og, eller, for og men. Alltid komma foran men.\nMen ikke komma når den siste setninga ikke inneholder subjekt",
      "Petter skifta jobb for tredje gang på to år, og Aud fulgte opp med sin andre skilsmisse på to år."),
  Kommaregler(
      "Ikke komma mellom to leddsetninger (bisetninger) dersom subjunksjonen('da', 'når', 'hvis', 'dersom',...) ikke gjentas.",
      "Hvis helsa holder og økonomien er i orden, drar vi på ferie til Mexico neste år.\nMen: \nHvis helsa holder, og hvis økonomien er i orden, drar vi på ferie til Mexico neste år.",),
  Kommaregler("Komma etter leddsetning som står først i en helsetning",
      "Da Else kom, hadde de andre allerede spist."),
  Kommaregler("Komma etter innskutt leddsetning.\n'Som' markerer ofte starten på en leddsetning. Men etterfølges 'som' ikke av et verb, skal det ikke være komma",
      "Boka som lå på bordet, var mi.\nMen: Med gult som farge går landslaget for gull."),
  Kommaregler(
      "Komma også foran innskutt leddsetning som ikke er nødvendig i helsetningen",
      "Direktøren, som hadde vært ute på rangel, møtte ikke opp."),
  Kommaregler("Komma foran og etter forklarende tillegg",
      "Harare, hovedstaden i Zimbabwe, het før Salisbury."),
  Kommaregler(
      "Komma foran og etter tiltaleord, svarord og utropsord",
      "Ole, kan du komme hit?\nKom hit med deg, din gjøk!\nJa, det forstår jeg godt.\nHei sann, den satt!"),
  Kommaregler(
      "Komma mellom ledd i oppregning dersom det ikke står noen konjunksjon('og', 'men', 'for', 'eller')",
      "Berit, Else, Gerd og Marit."),
  Kommaregler(
      "Komma etter anførselstegnet ved ordrett sitat og gjengivelse av utsagn når ytringssetningen kommer etter det siterte.",
      "«Jeg kommer på fredag», sa han."),
  Kommaregler(
      "Ikke komma etter anførselstegnet når sitatet slutter med et spørsmålstegn eller utropstegn.",
      "«Kommer du på fredag?» spurte hun.\n«Kom hit nå med en gang!» ropte hun.")
];

List setninger = [
  Training(
      "Konvall gikk en tur på ski, og Edvarda gikk på skøyter",
      "Konvall gikk en tur på ski og Edvarda gikk på skøyter",
      0),
  Training(
      "Amandor skifta jobb for tredje gang på to år, og Aud fulgte opp med sin andre skilsmisse på to år",
      "Amandor skifta jobb for tredje gang på to år og Aud fulgte opp med sin andre skilsmisse på to år",
      0),
  Training(
      "Skal vi kjøpe nytt hus i år, eller skal vi vente til neste år?",
      "Skal vi kjøpe nytt hus i år eller skal vi vente til neste år?",
      0),
  Training(
      "Lyder hadde lengtet etter å komme seg ut på ski og lyktes endelig",
      "Lyder hadde lengtet etter å komme seg ut på ski og lyktes endelig",
      0),
  Training(
      "Dette hadde jeg ikke ventet fra deg, for vi hadde jo avtalt noe annet",
      "Dette hadde jeg ikke ventet fra deg for vi hadde jo avtalt noe annet",
      0),
  Training(
      "Karvilde gikk på butikken for å handle og fikk haik hjem igjen",
      "Karvilde gikk på butikken for å handle og fikk haik hjem igjen",
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
      "Mozarella, som kun lages av bøffelmelk, er den beste osten til pizza",
      "Mozarella som kun lages av bøffelmelk er den beste osten til pizza",
      5),
  Training(
      "Grand danois, en hunderase av molossertype, er kjent for sin enorme størrelse",
      "Grand danois en hunderase av molossertype er kjent for sin enorme størrelse",
      5),
  Training(
      "Han, mannen uten egenskaper, gjorde lite utav seg",
      "Han mannen uten egenskaper gjorde lite utav seg",
      5),
  Training(
      "Inger Johanne, kommer du hit i dag?",
      "Inger Johanne kommer du hit i dag?",
      6),
  Training(
      "Å, disse smertene!",
      "Å disse smertene! ",
      6),
  Training(
      "Au, du kjørte over foten min!",
      "Au du kjørte over foten min!",
      6),
  Training(
      "Sussebass, du er så søt",
      "Sussebass du er så søt",
      6),
  Training(
      "Kan vi spille sjakk når vi kommer hjem, pappa?",
      "Kan vi spille sjakk når vi kommer hjem pappa?",
      6),
  Training(
      "Hun hadde fri 11., 13., 15. og 17. mai",
      "Hun hadde fri 11. 13. 15. og 17. mai",
      7),
  Training(
      "Henrik, Jon, Are og Trygve dro på fisketur",
      "Henrik Jon Are og Trygve dro på fisketur",
      7),
  Training(
      "Hun ramset opp en, to, tre og fire utsøkte selvfølgeligheter før hun gav fra seg ordet",
      "Hun ramset opp en to tre og fire utsøkte selvfølgeligheter før hun gav fra seg ordet",
      7),
  Training(
      "På hundeutstillinga var det flere raser tilstede: Afrikansk mynde, Engelsk bulldog, Strihåret forster og Dvergpuddel",
      " På hundeutstillinga var det flere raser tilstede: Afrikansk mynde Engelsk bulldog Strihåret forster og Dvergpuddel",
      7),
  Training(
      "Brie, Camembert, Port Salut og Roquefort er franske ostetyper",
      "Brie, Camembert, Port Salut og Roquefort er franske ostetyper",
      7),
  Training(
      '"Dette stemmer ikke", sa advokaten',
      '"Dette stemmer ikke" sa advokaten',
      8),
  Training(
      '"Jeg kommer senere", sa hun',
      '"Jeg kommer senere" sa hun',
      8),
  Training(
      '"Dette kan vi ikke være fornøyd med", sa han',
      '"Dette kan vi ikke være fornøyd med" sa han',
      8),
  Training(
      '"Her er det ikke noen vits å lete", sa etterforskeren',
      '"Her er det ikke noen vits å lete" sa etterforskeren',
      8),
  Training(
      '"Jeg kommer tilbake senere", sa guiden',
      '"Jeg kommer tilbake senere" sa guiden',
      8),
  Training(
      '"Ser du ikke at dette blir farlig?" sa guiden',
      '"Ser du ikke at dette blir farlig?" sa guiden',
      9),
  Training(
      '"Hvorfor kommer du hit i dag?" sa onkelen',
      '"Hvorfor kommer du hit i dag?" sa onkelen',
      9),
  Training(
      '"Hold kjeft!" ropte konkurrenten',
      '"Hold kjeft!" ropte konkurrenten',
      9),
  Training(
      '"Sett deg ned med en gang!" sa læreren ',
      '"Sett deg ned med en gang!" sa læreren ',
      9),
  Training(
      '"Dette funker ikke lenger!" sa instruktøren',
      '"Dette funker ikke lenger!" sa instruktøren',
      9),
  Training(
      '"Kommer du inn til middag nå?" sa faren',
      '"Kommer du inn til middag nå?" sa faren',
      9),

];


