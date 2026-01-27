       identification division.
       program-id. myPutNbrBase.


       data division.
       working-storage section.
       01  bufLen pic 9(9) comp.
       01  buf pic x
           occurs 1 to 1000000
           depending on bufLen.
       01  tmp pic 9(9).
       01  lenBase pic 9(9) comp.
       01  nbrRest pic 9(9).
       01  idx pic 9(9).

       linkage section.
       01  nbr pic 9(9).
       01  base pic x any length.


       procedure division using nbr base.
       move function length(base) to lenBase.
       move nbr to tmp.

       move 0 to bufLen.
       perform until tmp = 0
           divide tmp by lenBase giving tmp
           add 1 to bufLen
       end-perform.

       perform varying idx from 1 until nbr = 0
           divide nbr by lenBase giving nbr remainder nbrRest
           move base(nbrRest + 1:1) to buf(idx)
       end-perform.

       perform varying idx from bufLen by -1 until idx = 0
           display buf(idx) with no advancing
       end-perform.

       display " ".

       end program myPutNbrBase.
