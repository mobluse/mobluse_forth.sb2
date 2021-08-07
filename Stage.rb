define add_examples
delete all of Examples
defex ": TASK2 ; : QUADRATIC ( a b c x -- n ) >R SWAP ROT R@ *  + R> *  + ; 2 7 9 3 QUADRATIC ."
defex ": GIFT  .\" chocolate\" ; : GIVER  .\" Mum\" ; : THANKS  CR .\" Dear \" GIVER .\" ,\" CR  .\"  Thanks for the \" GIFT .\" . \" ; THANKS"
defex ": STAR  [CHAR] * EMIT ;  : STARS  0 ?DO STAR LOOP ;  : MARGIN  CR 25 SPACES ;  : BLIP  MARGIN STAR ;  : BAR  MARGIN 5 STARS ;  : F  BAR BLIP BAR BLIP BLIP CR ; F"
defex ": FACT  ?DUP IF DUP 1 - FACT * ELSE 1 THEN ; 7 FACT ."
defex ": EVEN? ; : ODD?  DUP 0= IF EXIT THEN 1 - EVEN? ; : EVEN?  DUP 0= IF 1 - EXIT THEN 1 - ODD? ; 8 ODD? . 8 EVEN? ."
defex ": .charset 1 do i emit loop ; 159 .charset"
defex ": .matrix ( r c -- ) swap 0 ?do cr dup 0 ?do .\" (\" j 1 + . .\" ,\" i 1 + . .\" ) \" loop loop drop ; 5 3 .matrix"
defex ": R% ( n1 % -- n2 ) 10 */ 5 + 10 / ; : DOUBLED ( amount interest -- ) OVER 2* SWAP ROT 21 1 DO CR .\" Year \" I 2 .R 3 SPACES 2DUP R% + DUP .\" Bal \" . DUP 2OVER DROP > IF CR CR .\" More than doubled in \" I . .\" years \" LEAVE THEN LOOP 2DROP DROP ; 3000 11 DOUBLED"
defex ": COUNTS  ' ROT ROT 0 DO  OVER EXECUTE LOOP  NIP ; : CONVICTED-OF  ( -- no-sentence )  0 ; : ARSON         ( sentence -- sentence+10 )  10 + ; : HOMICIDE      ( sentence -- sentence+20 )  20 + ; : BOOKMAKING    ( sentence -- sentence+2 )  2 + ; : TAX-EVASION   ( sentence -- sentence+5 )  5 + ; : WILL-SERVE    ( sentence -- )  . .\" years \" ; CONVICTED-OF BOOKMAKING 3 COUNTS TAX-EVASION WILL-SERVE"
defex ": BOTH    postpone IF   postpone IF ; immediate : ORELSE  postpone THEN postpone ELSE postpone IF ; immediate : NEITHER postpone THEN postpone THEN ; immediate : fb ( n -- )  dup 5 mod 0=  over 3 mod 0=  BOTH   .\" FizzBuzz \"  ELSE   .\" Fizz \"  ORELSE .\" Buzz \"  ELSE   dup .  NEITHER drop ; : fizzbuzz ( n -- ) 0 do i 1+ fb loop ; 100 fizzbuzz"
defex ": STRING   CREATE ALLOT  DOES> + ; 5 STRING VALVE  3 VALVE C@ ."
defex ": PENTAGRAM 0x00ff0000 COLOR ! 5 0 -200 MOVE DOWN DO 200 MOVE 144 DIR +! I 1+ 0.25 DRUM LOOP UP ; PENTAGRAM  FORGET TASK2"
stop this script

define add_defs
delete all of Defs
def ": CORE ;"
def "32 CONSTANT BL"
def "-1 CONSTANT INSTRUMENT"
def "-2 CONSTANT TEMPO"
def "-3 CONSTANT VOL"
def "-4 CONSTANT X"
def "-5 CONSTANT Y"
def "-6 CONSTANT DIR"
def "-7 CONSTANT COLOR"
def "-8 CONSTANT HUE"
def "-9 CONSTANT SHADE"
def "-10 CONSTANT SIZE"
def ": R@ I' ;"
def ": ABORT  ABORT\" \" ;"
def ": U.  . ;"
def ": U<  < ;"
def ": EXT ;"
def ": FALSE  0 ;"
def ": TRUE  -1 ;"
def ": U.R  .R ;"
def ": U>  > ;"
def ": 0>  0 > ;"
def ": NIP  ( a b -- b ) swap drop ;"
def ": TUCK  ( a b -- b a b ) swap over ;"
def ": ?  @ . ;"
def ": TASK ;"
def ": -ROT  ( a b c -- c a b ) rot rot ;"
def ": CELLS ;"
def ": CELL+ 1+ ;"
def ": ERASE ( addr n -- ) CELLS OVER + SWAP DO 0 I ! 1 CELLS +LOOP ;"
def ": DUMP ( addr n -- ) CELLS OVER + SWAP DO CR I @ 5 U.R 1 CELLS +LOOP ;"
def ": FILL ( addr n b -- ) -ROT CELLS OVER + SWAP DO DUP I ! 1 CELLS +LOOP DROP ;"
def ": C! ! ;"
def ": C@ @ ;"
def ": C, , ;"
def ": KEY ( -- ascii ) BEGIN 50 MS INKEY ?DUP UNTIL ;"
stop this script

define defex [string1]
add string1 to Examples

define def [string1]
add string1 to Defs

when I receive "run_defs"
add_defs
set Number to 1
repeat length of Defs
	set TermInpBuf to item Number of Defs
	broadcast "evaluate_buffer" and wait
	change Number by 1
end
delete all of Defs
stop this script

when I receive "run_examples"
add_examples
set Number to 1
repeat length of Examples
	PAGE
	run_example (Number)
	wait 2 secs
	change Number by 1
end
PAGE
clear
delete all of Examples
stop this script

define run_example (ex)
set TermInpBuf to item ex of Examples
..DQ. (join (TermInpBuf) " ")
broadcast "evaluate_buffer" and wait
broadcast "print_response" and wait
add TermInpBuf to History
stop this script

when I receive "run_example"
run_example (Number)

define ..DQ. [s]
set String to s
broadcast "print" and wait

define PAGE
broadcast "cls" and wait
