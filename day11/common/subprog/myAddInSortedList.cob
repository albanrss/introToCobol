       identification division.
       program-id. myAddInSortedList.


       data division.
       working-storage section.
       copy "myList" replacing ==01  node== by ==01  ws-node based==.
       01  ws-new-node-ptr pointer.
       01  ws-current-ptr  pointer.
       01  ws-prev-ptr     pointer.
       01  ws-cmp-result   pic s9(9) value 0.

       linkage section.
       01  lk-head-ptr     pointer.
       01  lk-data         pointer.
       01  lk-cmp-ptr      usage program-pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-new-node==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-prev-node==.
       01  lk-val1        pic x(1).
       01  lk-val2        pic x(1).


       procedure division using lk-head-ptr lk-data lk-cmp-ptr.
       allocate ws-node returning ws-new-node-ptr
       set address of lk-new-node to ws-new-node-ptr
       set nodeValue of lk-new-node to lk-data
       set nodeNext of lk-new-node to null

       if lk-head-ptr = null
           set lk-head-ptr to ws-new-node-ptr
           goback
       end-if

       set ws-current-ptr to lk-head-ptr
       set address of lk-current-node to ws-current-ptr

       set address of lk-val1 to lk-data
       set address of lk-val2 to nodeValue of lk-current-node
       call lk-cmp-ptr using lk-val1 lk-val2
       move return-code to ws-cmp-result
       if ws-cmp-result <= 0
           set nodeNext of lk-new-node to lk-head-ptr
           set lk-head-ptr to ws-new-node-ptr
           goback
       end-if

       set ws-prev-ptr to ws-current-ptr
       set ws-current-ptr to nodeNext of lk-current-node
       set address of lk-current-node to ws-current-ptr

       perform until ws-current-ptr = null
           set address of lk-val1 to lk-data
           set address of lk-val2
               to nodeValue of lk-current-node
           call lk-cmp-ptr using lk-val1 lk-val2
           move return-code to ws-cmp-result
           if ws-cmp-result <= 0
               set address of lk-prev-node to ws-prev-ptr
               set nodeNext of lk-prev-node to ws-new-node-ptr
               set nodeNext of lk-new-node to ws-current-ptr
               goback
           end-if
           set ws-prev-ptr to ws-current-ptr
           set ws-current-ptr to nodeNext of lk-current-node
           set address of lk-current-node to ws-current-ptr
       end-perform.

       set address of lk-prev-node to ws-prev-ptr
       set nodeNext of lk-prev-node to ws-new-node-ptr.
       goback.

       end program myAddInSortedList.
