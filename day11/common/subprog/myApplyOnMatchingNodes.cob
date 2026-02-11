       identification division.
       program-id. myApplyOnMatchingNodes.


       data division.
       working-storage section.
       01  ws-current-ptr pointer.
       01  ws-cmp-result  pic s9(9) value 0.

       linkage section.
       01  lk-head-ptr    pointer.
       01  lk-func-ptr    usage program-pointer.
       01  lk-data-ref    pointer.
       01  lk-cmp-ptr     usage program-pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.
       01  lk-val1        pic x(1).
       01  lk-val2        pic x(1).


       procedure division using lk-head-ptr lk-func-ptr 
                                lk-data-ref lk-cmp-ptr.
       if lk-head-ptr = null
           move 0 to return-code
           goback
       end-if

       set ws-current-ptr to lk-head-ptr
       set address of lk-current-node to ws-current-ptr

       perform until ws-current-ptr = null
           set address of lk-val1
               to nodeValue of lk-current-node
           set address of lk-val2 to lk-data-ref
           call lk-cmp-ptr using lk-val1 lk-val2
           move return-code to ws-cmp-result
           if ws-cmp-result = 0
               call lk-func-ptr using lk-val1
           end-if
           set ws-current-ptr to nodeNext of lk-current-node
           set address of lk-current-node to ws-current-ptr
       end-perform.

       move 0 to return-code.
       goback.

       end program myApplyOnMatchingNodes.
