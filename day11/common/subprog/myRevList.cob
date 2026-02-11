       identification division.
       program-id. myRevList.


       data division.
       working-storage section.
       01  ws-prev-ptr    pointer value null.
       01  ws-current-ptr pointer.
       01  ws-next-ptr    pointer.

       linkage section.
       01  lk-head-ptr    pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.


       procedure division using lk-head-ptr.
       if lk-head-ptr = null
           goback
       end-if

       set ws-prev-ptr to null
       set ws-current-ptr to lk-head-ptr
       set address of lk-current-node to ws-current-ptr

       perform until ws-current-ptr = null
           set ws-next-ptr to nodeNext of lk-current-node
           set nodeNext of lk-current-node to ws-prev-ptr
           set ws-prev-ptr to ws-current-ptr
           set ws-current-ptr to ws-next-ptr
           set address of lk-current-node to ws-current-ptr
       end-perform.

       set lk-head-ptr to ws-prev-ptr.
       goback.

       end program myRevList.
