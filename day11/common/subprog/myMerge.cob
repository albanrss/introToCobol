       identification division.
       program-id. myMerge.


       data division.
       working-storage section.
       01  ws-current2-ptr pointer.
       01  ws-next2-ptr    pointer.
       01  ws-current1-ptr pointer.
       01  ws-prev1-ptr    pointer.
       01  ws-cmp-result   pic s9(9) value 0.

       linkage section.
       01  lk-head1-ptr    pointer.
       01  lk-head2-ptr    pointer.
       01  lk-cmp-ptr      usage program-pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-node1==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-node2==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-prev1==.
       01  lk-val1        pic x(1).
       01  lk-val2        pic x(1).


       procedure division using lk-head1-ptr lk-head2-ptr lk-cmp-ptr.
       if lk-head2-ptr = null
           goback
       end-if

       if lk-head1-ptr = null
           set lk-head1-ptr to lk-head2-ptr
           goback
       end-if

       set ws-current2-ptr to lk-head2-ptr

       perform until ws-current2-ptr = null
           set address of lk-node2 to ws-current2-ptr
           set ws-next2-ptr to nodeNext of lk-node2

           set ws-current1-ptr to lk-head1-ptr
           set address of lk-node1 to ws-current1-ptr

           set address of lk-val1 to nodeValue of lk-node2
           set address of lk-val2 to nodeValue of lk-node1
           call lk-cmp-ptr using lk-val1 lk-val2
           move return-code to ws-cmp-result

           if ws-cmp-result <= 0
               set nodeNext of lk-node2 to lk-head1-ptr
               set lk-head1-ptr to ws-current2-ptr
           else
               set ws-prev1-ptr to ws-current1-ptr
               set ws-current1-ptr to nodeNext of lk-node1
               set address of lk-node1 to ws-current1-ptr

               perform until ws-current1-ptr = null
                   set address of lk-val1
                       to nodeValue of lk-node2
                   set address of lk-val2
                       to nodeValue of lk-node1
                   call lk-cmp-ptr using lk-val1 lk-val2
                   move return-code to ws-cmp-result
                   if ws-cmp-result <= 0
                       set address of lk-prev1 to ws-prev1-ptr
                       set nodeNext of lk-prev1 to ws-current2-ptr
                       set nodeNext of lk-node2 to ws-current1-ptr
                       exit perform
                   end-if
                   set ws-prev1-ptr to ws-current1-ptr
                   set ws-current1-ptr to nodeNext of lk-node1
                   set address of lk-node1 to ws-current1-ptr
               end-perform

               if ws-current1-ptr = null
                   set address of lk-prev1 to ws-prev1-ptr
                   set nodeNext of lk-prev1 to ws-current2-ptr
                   set nodeNext of lk-node2 to null
               end-if
           end-if

           set ws-current2-ptr to ws-next2-ptr
       end-perform.

       goback.

       end program myMerge.
