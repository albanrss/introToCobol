       identification division.
       program-id. myApplyOnNodes.


       data division.
       working-storage section.
       01  ws-current-ptr pointer.
       01  ws-result      pic s9(9) value 0.

       linkage section.
       01  lk-head-ptr    pointer.
       01  lk-func-ptr    usage program-pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.
       01  lk-val1        pic x(1).


       procedure division using lk-head-ptr lk-func-ptr.
       move 0 to ws-result

       if lk-head-ptr = null
           move 0 to return-code
           goback
       end-if

       set ws-current-ptr to lk-head-ptr
       set address of lk-current-node to ws-current-ptr

       perform until ws-current-ptr = null
           set address of lk-val1 to nodeValue of lk-current-node
           call lk-func-ptr using lk-val1
           set ws-current-ptr to nodeNext of lk-current-node
           set address of lk-current-node to ws-current-ptr
       end-perform.

       move 0 to return-code.
       goback.

       end program myApplyOnNodes.
