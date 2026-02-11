       identification division.
       program-id. mySortList.


       data division.
       working-storage section.
       01  ws-current-ptr pointer.
       01  ws-next-ptr    pointer.
       01  ws-swapped     pic 9 value 0.
       01  ws-cmp-result  pic s9(9) value 0.
       01  ws-temp-value  pointer.

       linkage section.
       01  lk-head-ptr    pointer.
       01  lk-cmp-ptr     usage program-pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-next-node==.
       01  lk-val1        pic x(1).
       01  lk-val2        pic x(1).


       procedure division using lk-head-ptr lk-cmp-ptr.
       if lk-head-ptr = null
           goback
       end-if

       move 1 to ws-swapped
       perform until ws-swapped = 0
           move 0 to ws-swapped
           set ws-current-ptr to lk-head-ptr
           set address of lk-current-node to ws-current-ptr

           perform until nodeNext of lk-current-node = null
               set ws-next-ptr to nodeNext of lk-current-node
               set address of lk-next-node to ws-next-ptr

               set address of lk-val1
                   to nodeValue of lk-current-node
               set address of lk-val2
                   to nodeValue of lk-next-node
               call lk-cmp-ptr using lk-val1 lk-val2
               move return-code to ws-cmp-result

               if ws-cmp-result > 0
                   set ws-temp-value to nodeValue of lk-current-node
                   set nodeValue of lk-current-node 
                       to nodeValue of lk-next-node
                   set nodeValue of lk-next-node to ws-temp-value
                   move 1 to ws-swapped
               end-if

               set ws-current-ptr to ws-next-ptr
               set address of lk-current-node to ws-current-ptr
           end-perform
       end-perform.

       goback.

       end program mySortList.
