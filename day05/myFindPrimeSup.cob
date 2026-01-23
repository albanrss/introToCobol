       identification division.
       program-id. myFindPrimeSup.


       data division.
       working-storage section.
       01  isOk pic x value "N".

       linkage section.
       01  nb pic 9(9).


       procedure division using nb.
       perform varying nb from nb until isOk = "Y"
           call "myIsPrime" using nb
           if return-code = 1
               move nb to return-code
               exit perform
           end-if
       end-perform.


       end program myFindPrimeSup.
