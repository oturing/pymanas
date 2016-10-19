0 rem *** random sentences ***
1 rem *** c64 basic implementation (c) 2016 nick montfort ***
2 rem
3 rem   copying and distribution of this file, with or without modification,
4 rem   are permitted in any medium without royalty provided the copyright
5 rem   notice and this notice are preserved. this file is offered as-is,
6 rem   without any warranty.
7 rem
10 rem !!! set these next two values appropriately each time !!!
15 l$ = "New York City" : d$ = "2016-07-22"
20 poke 53272,23
25 input "The 24-hour time as HHMMSS"; t$
30 x = rnd(-ti)
40 open 3,4,7 : cmd3 : rem send to printer ***
45 print "Random Sentences, Victor H. Yngve (1961), Nick Montfort (2016)"
50 print "Generated in "l$", "d$" ";
55 print left$(t$,2)":"mid$(t$,3,2)":"right$(t$,2) : print
60 p=0 : c=1 : rem position on line, sentence-initial capitalization
70 gosub 100
80 w$="." : gosub 3000 : print : print
90 goto 60

100 rem <sentence> ::= <short-sentence> / <long-sentence>
110 x=rnd(1)
120 if x < .7 then gosub 200 : return
130 gosub 300 : return

200 rem <short-sentence> ::= <subject> <verb-1> " it" /
201 rem                      <subject> <verb-1> <some-objects> /
202 rem                      <subject> <verb-2> <some-adjectives>
210 x=rnd(1)
220 if x < .1 then gosub 400 : gosub 1500 : w$=" it" : gosub 3000 : return
230 if x < .6 then gosub 400 : gosub 1500 : gosub 1900 : return
230 gosub 400 : gosub 1600 : gosub 700 : return

300 rem <long-sentence> ::= " when" <short-sentence> "," <short-sentence>
310 w$=" when" : gosub 3000 : gosub 200 : w$="," : gosub 3000 : gosub 200
320 return

400 rem <subject> ::= <proper-noun> / <subject-pronoun> / <singular-np> /
401 rem               <singular-np> <preposition> <singular-np>
410 x=rnd(1)
420 if x < .25 then gosub 2000 : return
430 if x < .5 then gosub 2100 : return
440 if x < .75 then gosub 500 : return
450 gosub 500 : gosub 2200 : gosub 500 : return

500 rem <singular-np> ::= <consonant-noun> / <an-or-adjs> " engine"
510 x=rnd(1)
520 if x < .8  then gosub 600 : return
530 gosub 1200 : w$=" engine" : gosub 3000 : return

600 rem <consonant-noun> ::= <a-or-adjs> <countable> /
601 rem                      <the-or-adjs> <uncountable>
610 x=rnd(1)
620 if x < .8 then gosub 1100 : gosub 2500 : return
630 gosub 1300 : gosub 2600 : return

700 rem <some-adjectives> ::= <adjective> /
701 rem                       <adjective> <maybe-adjectives> " and" <adjective>
710 x=rnd(1)
720 if x < .6 then gosub 2400 : return
730 gosub 2400 : gosub 1000 : w$=" and" : gosub 3000 : gosub 2400 : return

800 rem <indef-adjective> ::= " a little" / " a black" / " a shiny" /
801 rem                       " an oiled" / " a polished" / " a heated" /
802 rem                       " a big"
810 x=rnd(1)
820 if x < .14 then  w$=" a little" : gosub 3000 : return
830 if x < .28 then  w$=" a black" : gosub 3000 : return
840 if x < .42 then  w$=" a shiny" : gosub 3000 : return
850 if x < .56 then  w$=" an oiled" : gosub 3000 : return
860 if x < .70 then  w$=" a polished" : gosub 3000 : return
870 if x < .84 then  w$=" a heated" : gosub 3000 : return
880 w$=" a big" : gosub 3000 : return

900 rem <adjective-phrase> ::= <indef-adjective> <maybe-adjectives> /
901 rem                        " the" <adjective> <maybe-adjectives> /
902 rem                        <possessive> <adjective> <maybe-adjectives>
910 x=rnd(1)
920 if x < .33 then gosub 800 : gosub 1000 : return
930 if x < .66 then w$=" the" : gosub 3000 : gosub 2400 : gosub 1000 : return
940 gosub 2300 : gosub 2400 : gosub 1000 : return

1000 rem <maybe-adjectives> ::= "," <adjective> <maybe-adjectives> / ""
1010 x=rnd(1)
1020 if x < .4 then w$="," : gosub 3000 : gosub 2400 : gosub 1000 : return
1030 return

1100 rem <a-or-adjs> ::= " a" / " the" / <possessive> / <adjective-phrase>
1110 x=rnd(1)
1120 if x < .25 then w$=" a" : gosub 3000 : return
1130 if x < .5 then w$=" the" : gosub 3000 : return
1140 if x < .75 then gosub 2300 : return
1150 gosub 900 : return

1200 rem <an-or-adjs> ::= " an" / " the" / <possessive> / <adjective-phrase>
1210 x=rnd(1)
1220 if x < .25 then w$=" an" : gosub 3000 : return
1230 if x < .5 then w$=" the" : gosub 3000 : return
1240 if x < .75 then gosub 2300 : return
1250 gosub 900 : return

1300 rem <the-or-adjs> ::= " the" / <possessive> / <adjective-phrase> / ""
1310 x=rnd(1)
1330 if x < .3 then w$=" the" : gosub 3000 : return
1340 if x < .6 then gosub 2300 : return
1350 gosub 900 : return

1400 rem <four-the-adjs> ::= " the" / <possessive> / " four" /
1401 rem                     " the" <some-adjectives> /
1402 rem                     <possessive> <some-adjectives> /
1403 rem                     " four" <some-adjectives>
1410 x=rnd(1)
1420 if x < .17 then w$=" the" : gosub 3000 : return
1420 if x < .33 then gosub 2300 : return
1420 if x < .5 then w$=" four" : gosub 3000 : return
1420 if x < .67 then w$=" the" : gosub 3000 : gosub 700 : return
1420 if x < .83 then gosub 2300 : gosub 700 : return
1420 w$=" four" : gosub 3000 : gosub 700 : return

1500 rem <verb-1> ::= " has" / " is" / " is proud of" / " makes"
1510 x=rnd(1)
1520 if x<.25 then w$=" has" : gosub 3000 : return 
1530 if x<.5 then w$=" is" : gosub 3000 : return 
1540 if x<.7 then w$=" is proud of" : gosub 3000 : return 
1550 w$=" makes" : gosub 3000 : return 

1600 rem <verb-2> ::= " is" / " keeps" <object> / " keeps it"
1610 x=rnd(1)
1620 if x<.5 then w$=" is" : gosub 3000 : return
1630 if x<.8 then w$=" keeps" : gosub 3000 : gosub 1700 : return
1640 w$=" keeps it" : gosub 3000 : return

1700 rem <object> ::= <proper-noun> / <singular-np> /
1701 rem              <four-the-adjs> <plural-countable> /
1702 rem              <singular-np> <preposition> <singular-np>
1710 x=rnd(1)
1720 if x<.25 then gosub 2000 : return
1730 if x<.5 then gosub 500 : return
1740 if x<.75 then gosub 1400 : gosub 2700 : return
1750 gosub 500 : gosub 2200 : gosub 500 : return

1800 rem <maybe-objects> ::= "," <object> <maybe-objects> / ""
1810 x=rnd(1)
1820 if x < .4 then w$="," : gosub 3000 : gosub 1700 : gosub 1800 : return
1830 return

1900 rem <some-objects> ::= <object> / <object> <maybe-objects> " and" <object>
1910 x=rnd(1)
1920 if x < .6 then gosub 1700 : return
1930 gosub 1700 : gosub 1800 : w$=" and" : gosub 3000 : gosub 1700 : return

2000 rem <proper-noun> ::= " Engineer Small" / " Small"
2010 x=rnd(1)
2020 if x<.5 then w$=" Engineer Small" : gosub 3000 : return
2030 w$=" Small" : gosub 3000 : return

2100 rem <subject-pronoun> ::= " he" / " it"
2110 x=rnd(1)
2120 if x<.5 then w$=" he" : gosub 3000 : return
2130 w$=" it" : gosub 3000 : return

2200 rem <preposition> ::= " under" / " in"
2210 x=rnd(1)
2220 if x<.5 then w$=" under" : gosub 3000 : return
2230 w$=" in" : gosub 3000 : return

2300 rem <possessive> ::= " his" / " its"
2310 x=rnd(1)
2320 if x<.5 then w$=" his" : gosub 3000 : return
2330 w$=" its" : gosub 3000 : return

2400 rem <adjective> ::= " little" / " black" / " shiny" / " oiled" /
2401 rem                 " polished" / " heated" / " big"
2410 x=rnd(1)
2420 if x < .14 then  w$=" little" : gosub 3000 : return
2430 if x < .28 then  w$=" black" : gosub 3000 : return
2440 if x < .42 then  w$=" shiny" : gosub 3000 : return
2450 if x < .56 then  w$=" oiled" : gosub 3000 : return
2460 if x < .70 then  w$=" polished" : gosub 3000 : return
2470 if x < .84 then  w$=" heated" : gosub 3000 : return
2480 w$=" big" : gosub 3000 : return

2500 rem <countable> ::= " train" / " bell" / " whistle" / " sand dome" /
2501 rem                 " headlight" / " smokestack" / " wheel" /
2502 rem                 " firebox" / " boiler"
2510 x=rnd(1)
2520 if x < .11 then  w$=" train" : gosub 3000 : return
2530 if x < .22 then  w$=" bell" : gosub 3000 : return
2540 if x < .33 then  w$=" whistle" : gosub 3000 : return
2550 if x < .44 then  w$=" sand dome" : gosub 3000 : return
2560 if x < .55 then  w$=" headlight" : gosub 3000 : return
2570 if x < .66 then  w$=" smokestack" : gosub 3000 : return
2580 if x < .77 then  w$=" wheel" : gosub 3000 : return
2590 if x < .88 then  w$=" firebox" : gosub 3000 : return
2595 w$=" boiler" : gosub 3000 : return

2600 rem <uncountable> ::= " water" / " steam"
2610 x=rnd(1)
2620 if x<.5 then w$=" water" : gosub 3000 : return
2630 w$=" steam" : gosub 3000 : return

2700 rem <plural-countable> ::= " trains" / " engines" / " bells" /
2701 rem                        " whistles" / " sand domes" / " headlights" /
2702 rem                        " smokestacks" / " driving wheels" /
2703 rem                        " fireboxes" / " boilers"
2710 x=rnd(1)
2720 if x < .1 then  w$=" trains" : gosub 3000 : return
2730 if x < .2 then  w$=" engines" : gosub 3000 : return
2740 if x < .3 then  w$=" bells" : gosub 3000 : return
2750 if x < .4 then  w$=" whistles" : gosub 3000 : return
2760 if x < .5 then  w$=" sand domes" : gosub 3000 : return
2770 if x < .6 then  w$=" headlights" : gosub 3000 : return
2780 if x < .7 then  w$=" smokestacks" : gosub 3000 : return
2790 if x < .8 then  w$=" wheels" : gosub 3000 : return
2800 if x < .9 then  w$=" fireboxes" : gosub 3000 : return
2810 w$=" boilers" : gosub 3000 : return

3000 if c=0 then goto 3030
3010 c=0: w$=right$(w$,len(w$)-1)
3020 if asc(w$)<91 then w$=chr$(asc(w$)+128)+right$(w$,len(w$)-1)
3030 p=p+len(w$)
3040 if (p > 77) and (len(w$) > 1) then print : p=len(w$)-1 : w$=right$(w$,p)
3050 print w$;
3060 return

4000 print#3 : close3,4 : rem close printer ***
4010 end
