       identification division.
       program-id. myListSize.


       data division.
       working-storage section.
       01  ws-count       pic 9(9) value 0.
       01  ws-current-ptr pointer.

       linkage section.
       01  lk-head-ptr    pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.


       procedure division using lk-head-ptr.
       move 0 to ws-count

       if lk-head-ptr not = null
           set ws-current-ptr to lk-head-ptr
           set address of lk-current-node to ws-current-ptr
           perform until ws-current-ptr = null
               add 1 to ws-count
               set ws-current-ptr to nodeNext of lk-current-node
               set address of lk-current-node to ws-current-ptr
           end-perform
       end-if.

       move ws-count to return-code.
       goback.

       end program myListSize.
