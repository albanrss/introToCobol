       identification division.
       program-id. addNodeToEnd.


       data division.
       working-storage section.
       copy "myList" replacing ==01  node== by ==01  ws-node based==.
       01  ws-new-node-ptr pointer.
       01  ws-current-ptr  pointer.

       linkage section.
       01  lk-head-ptr pointer.
       01  lk-value    pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-new-node==.


       procedure division using lk-head-ptr lk-value.
       allocate ws-node returning ws-new-node-ptr
       set address of lk-new-node to ws-new-node-ptr

       set nodeValue of lk-new-node to lk-value
       set nodeNext of lk-new-node to null

       if lk-head-ptr = null
           set lk-head-ptr to ws-new-node-ptr
       else
           set ws-current-ptr to lk-head-ptr
           set address of lk-current-node to ws-current-ptr
           perform until nodeNext of lk-current-node = null
               set ws-current-ptr to nodeNext of lk-current-node
               set address of lk-current-node to ws-current-ptr
           end-perform
           set nodeNext of lk-current-node to ws-new-node-ptr
       end-if.

       goback.

       end program addNodeToEnd.
