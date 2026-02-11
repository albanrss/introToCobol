       identification division.
       program-id. addNodeToStart.


       data division.
       working-storage section.
       copy "myList" replacing ==01  node== by ==01  ws-node based==.
       01  ws-new-node-ptr pointer.

       linkage section.
       01  lk-head-ptr pointer.
       01  lk-value    pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-new-node==.


       procedure division using lk-head-ptr lk-value.
       allocate ws-node returning ws-new-node-ptr
       set address of lk-new-node to ws-new-node-ptr

       set nodeValue of lk-new-node to lk-value
       set nodeNext of lk-new-node to lk-head-ptr
       set lk-head-ptr to ws-new-node-ptr.

       goback.

       end program addNodeToStart.
