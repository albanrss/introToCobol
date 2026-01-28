       identification division.
       program-id. myGetNbrBase.


       data division.
       working-storage section.
       01  symMult                 pic s9(1).
       01  lenSym                  pic 9(9).
       01  result                  pic s9(9).
       01  lenStr                  pic 9(9).
       01  lenBase                 pic 9(9).
       01  charToGetBaseVal        pic x.
       01  baseDecVal              pic 9(9).
       01  idx                     pic 9(9).

       linkage section.
       01  str                     pic x any length.
       01  base                    pic x any length.


       procedure division using str base.
       move 1 to symMult.
       perform varying lenSym
           from 0
           until str(lenSym + 1 : 1) not = '+'
             and str(lenSym + 1 : 1) not = '-'

           if str(lenSym + 1 : 1) = '-'
               multiply symMult by -1 giving symMult
           end-if

       end-perform.

       move function length(base) to lenBase.
       move function length(str) to lenStr.

       move 0 to result.
       perform varying idx from lenStr by -1 until idx <= lenSym
           move str(idx:1) to charToGetBaseVal
           perform getBaseDecVal
           compute baseDecVal = baseDecVal * (lenBase ** (lenStr - idx))
           add baseDecVal to result giving result
       end-perform.

       multiply result by symMult giving return-code.

       go to endProgram.

       getBaseDecVal.
           move 0 to baseDecVal.
           perform until base(baseDecVal + 1 : 1) = charToGetBaseVal
               add 1 to baseDecVal
           end-perform.

       endProgram.


       end program myGetNbrBase.
