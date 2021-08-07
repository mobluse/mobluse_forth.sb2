when flag clicked
hide

when I receive "rtWORDS"
..DQ. (join join join (Built_in) " " (Words) " ")

when I receive "rtIMMEDIATE"
add item last of Words to Immediates

when I receive "rtBELL"
broadcast "bell"
wait 0.1 secs

when I receive "bell"
set instrument to 2
play note 70 for 0.25 beats

when I receive "rtCLEAR"
clear

when I receive "rtPAGE"
PAGE

when I receive "rtCR"
println ""

when I receive "rtSPACE"
..DQ. " "

when I receive "rt.KEYB"
.KEYB

define PAGE
broadcast "cls" and wait

define println [s]
..DQ. (s)
change Current_row by 1
set Current_column to 0

define ..DQ. [s]
set String to s
broadcast "print" and wait

define .KEYB
println ""
println "1! 2@ 3# 4[ 5% 6] 7& 8_ 9© 0␈"
println "Q' W| E~ R{ T\\ Y} U$ I( O) P\""
println "Aa S` D´  F£ G€ H^ J- K+ L="
println "Z: X; C? V/ B* N< M> ␠b ␈µ ␍Å .,"

define .ZXFKEYB
println ""
println "1  2  3  4  5  6  7  8  9  0␈"
println "Q@ W! E# R  T  Y  U£ I( O) P\""
println "A, S[ D  F  G] H  J- K+ L="
println "Z: X; C? V/ B* N< M> ␠  ␈  ␍  .,"

define .JAKEYB
println ""
println "1! 2@ 3# 4$ 5% 6& 7' 8( 9) 0_␈"
println "Q  W  E  R< T> Y[ U] I© O; P\""
println "A~ S| D\\ F[  G]  H^ J- K+ L="
println "Z: X£ C? V/ B* N, M. ␠  ␈  ␍  s"
