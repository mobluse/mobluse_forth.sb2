# mobluse_forth.sb2
\#MOBLuSE_FORTH -- a Forth (programming language) in Scratch 2 for Scratch.MIT.Edu
Article: https://scratch.mit.edu/discuss/topic/233532/

## Instructions
Shift+click a green flag to start Turbo Mode, then click a green flag. It first runs a demo with graphics and sound at the end.

The FORTH programming language is good for embedded systems and is used in successful deep space missions, radio astronomy, and medical devices. This simulates a retro computer like e.g. Jupiter Ace, or ZX81 with ZX-FORTH from the early eighties. For these old computers FORTH was usually the fastest high level programming language/integrated development environment (IDE) available. http://www.forth.org/successes.html

Type using these keyboard keys (due to Scratch limitations):
0-9, A-Z = types key. FORTH is case insensitive.
Arrow right = Full stop, <.>.
Arrow left = Backspace, <BS>.
Arrow down = Carriage return/Enter, <CR>.
Arrow up = Shift - pressed before 0-9, A-Z, <.>, <SPACE>, <CR>.
Shift+J = -. Shift+K = +. Shift+B = *. Shift+V = /. Shift+M = >. Shift+1 = !. Shift+2 = @. Shift+I = (. Shift+O = ). Shift+P = ". Shift+Arrow right = ,. Shift+Z = :. Shift+X = ;. Shift+C = ?.
Shift+A = Ask – this makes copying from a tutorial and pasting into Scratch possible – typographical quote-characters from pasted text are converted to ASCII.
Shift+SPACE = Break.

The keyboard layout is inspired by SPONZY – a ROM for ZX81 which makes that computer ZX Spectrum compatible (Speccy on Zeddy).

If you run this on a device w/o keyboard, you may use the screen keyboard by clicking the blue keyboard in the upper right corner (same as Shift+A / Arrow up+A).

You can hide the stacks by going inside and click the check-boxes for the lists in the category Data.

The error codes are explained in: http://lars.nocrew.org/dpans/dpans9.htm

Examples (press <CR> i.e. arrow down after each command): 
WORDS – Lists all commands.

.KEYB – Prints the keyboard layout.

: QUADRATIC  ( a b c x – n ) >R SWAP ROT R@ *  + R> *  + ; 2 7 9 3 QUADRATIC .<CR> – Computes a*x^2 + b*x + c, where a=2, b=7, c=9, x=3.

: GIFT   .” chocolate“ ; : GIVER   .” Mum“ ; : THANKS CR .” Dear “ GIVER .” ,“ CR  .”  Thanks for the “ GIFT .” . “ ; THANKS

: FACT ?DUP IF DUP 1 - FACT * ELSE 1 THEN ; 7 FACT .

: STAR  42 EMIT ; 
: STARS  0 ?DO STAR LOOP ; 
: MARGIN  CR 25 SPACES ; 
: BLIP  MARGIN STAR ; 
: BAR  MARGIN 5 STARS ; 
: F  BAR BLIP BAR BLIP BLIP CR ; F

All characters:
: .charset 1 do i emit loop ; 288 .charset

: .matrix ( r c – ) swap 0 ?do cr dup 0 ?do ." (" j 1 + . ." ," i 1 + . ." ) " loop loop drop ; 5 3 .matrix

Mutually recursive functions:
: EVEN? ; 
: ODD? ( +n – true | false ) DUP 0= IF EXIT THEN 1 - EVEN? ; 
: EVEN? ( +n – true | false ) DUP 0= IF 1 - EXIT THEN 1 - ODD? ;
This is not standard FORTH, but simpler, because this FORTH currently uses the latest definition of a word during run-time.

Function pointers:
: COUNTS  ' ROT ROT 0 DO  OVER EXECUTE LOOP  NIP ; 
: CONVICTED-OF  ( -- no-sentence )  0 ; : ARSON ( sentence -- sentence+10 )  10 + ; : HOMICIDE ( sentence -- sentence+20 )  20 + ; : BOOKMAKING ( sentence -- sentence+2 )  2 + ; : TAX-EVASION   ( sentence -- sentence+5 )  5 + ; : WILL-SERVE ( sentence -- )  . ." years " ; 
CONVICTED-OF BOOKMAKING 3 COUNTS TAX-EVASION WILL-SERVE

Extending the compiler, example from: https://rosettacode.org/wiki/Extend_your_language#Forth :
: BOTH    postpone IF   postpone IF ; immediate : ORELSE  postpone THEN postpone ELSE postpone IF ; immediate : NEITHER postpone THEN postpone THEN ; immediate : 
fb ( n -- )  dup 5 mod 0=  over 3 mod 0=  BOTH   ." FizzBuzz "  ELSE   ." Fizz "  ORELSE ." Buzz "  ELSE   dup .  NEITHER drop ; 
: fizzbuzz ( n -- ) 0 do i 1+ fb loop ; 100 fizzbuzz

: STRING   CREATE ALLOT  DOES> + ; 5 STRING VALVE 
3 VALVE C@ .

I have made some new videos about this FORTH programming language and a FORTH playlist:

1. (old) https://youtu.be/VZfUFnioLko     1 min <-- Dec 26 2016
2. (new) https://youtu.be/FwEgRetggFg     1 min <-- Feb 2 2017
3. (new) https://youtu.be/tPk1nNgq6NE     1 min
4. (new) https://youtu.be/tZOYPTv77pI     1 min
5. (new) https://youtu.be/nr0c87lrC64     1 min

https://www.youtube.com/playlist?list=PLD8D8534DD63B28EA

Please report bugs and test-code in the comments!


## Notes
It's called #MOBLuSE_FORTH.

FORTH: https://en.wikipedia.org/wiki/Forth_(programming_language)

The goal is to be compatible with the book "Starting FORTH" by Leo Brodie:
https://www.forth.com/starting-forth/ . I have now tested it with chapter 1-2, 3 (except disk) & 4-11 (except strings and formatted number printing).

Jupiter Ace was a computer with FORTH built-in:
https://en.wikipedia.org/wiki/Jupiter_Ace . This program should have a Jupiter Ace compatibility mode. Also for ZX-FORTH for ZX81: http://zx81.ordi5.free.fr/k7/k7.htm . Also for ANS FORTH: http://lars.nocrew.org/dpans/dpans.htm .

Works in Phosphorus, but w/o showing stacks as lists:
http://phosphorus.github.io/#137676871
http://phosphorus.github.io/app.html?id=137676871&turbo=true&full-screen=true

Used Tosh as editor: https://tosh.tjvr.org/ . I also used Scratch 2 Offline Editor for debugging. I use FORTH-code from @BookOwl's Scratching FORTH in the sprite Compiled for testing: https://scratch.mit.edu/discuss/topic/213122/ .

TODO: IF with empty stack, answer to exercise 4-5 in "Starting FORTH", editing command-line, history, all Scratch-commands, INCLUDED, screens, rest of the words from "Starting FORTH", optimizations e.g. stack-compression, bit-wise operators e.g. https://scratch.mit.edu/projects/18323862/ .

Rules for programming FORTH: ftp.rssd.esa.int/pub/Cluster/directory/PP/Software/LSE_SW_Development/LSE-FORTH-Coding-Rules.PDF

Books about FORTH:
https://www.jupiter-ace.co.uk/index_forth_books.html
