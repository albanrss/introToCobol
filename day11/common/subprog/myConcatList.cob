       identification division.
       program-id. myConcatList.


       data division.
       working-storage section.
       01  ws-current-ptr pointer.

       linkage section.
       01  lk-head1-ptr   pointer.
       01  lk-head2-ptr   pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.


       procedure division using lk-head1-ptr lk-head2-ptr.
       if lk-head2-ptr = null
           goback
       end-if

       if lk-head1-ptr = null
           set lk-head1-ptr to lk-head2-ptr
           goback
       end-if

       set ws-current-ptr to lk-head1-ptr
       set address of lk-current-node to ws-current-ptr

       perform until nodeNext of lk-current-node = null
           set ws-current-ptr to nodeNext of lk-current-node
           set address of lk-current-node to ws-current-ptr
       end-perform.

       set nodeNext of lk-current-node to lk-head2-ptr.
       goback.

       end program myConcatList.
