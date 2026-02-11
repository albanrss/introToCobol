       identification division.
       program-id. tests.


       data division.
       working-storage section.
       copy "myList" replacing ==01  node== 
                                by ==01  ws-node==.
       01  ws-head-ptr      pointer value null.
       01  ws-head2-ptr     pointer value null.
       01  ws-current-ptr   pointer.
       01  ws-found-ptr     pointer.
       01  ws-data1         pic x(10) value "Hello".
       01  ws-data2         pic x(10) value "World".
       01  ws-data3         pic x(10) value "COBOL".
       01  ws-data4         pic x(10) value "Test".
       01  ws-data5         pic x(10) value "Alpha".
       01  ws-search-ref    pic x(10) value "World".
       01  ws-int1          pic s9(9) value 30.
       01  ws-int2          pic s9(9) value 10.
       01  ws-int3          pic s9(9) value 20.
       01  ws-int4          pic s9(9) value 40.
       01  ws-int5          pic s9(9) value 25.
       01  ws-strcmp-ptr    usage program-pointer.
       01  ws-intcmp-ptr    usage program-pointer.
       01  ws-print-ptr     usage program-pointer.

       linkage section.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-node==.
       01  lk-data          pic x(10).
       01  lk-int           pic s9(9).


       procedure division.
       set ws-strcmp-ptr to entry "myStrCmp"
       set ws-intcmp-ptr to entry "myIntCmp"
       set ws-print-ptr to entry "printData"

      * ===== Test addNodeToStart =====
       display "=== Test addNodeToStart ===".
       call "addNodeToStart" using ws-head-ptr address of ws-data1
       call "addNodeToStart" using ws-head-ptr address of ws-data2
       call "addNodeToStart" using ws-head-ptr address of ws-data3
       display "Added 3 nodes (COBOL, World, Hello)".

      * ===== Test myListSize =====
       display "=== Test myListSize ===".
       call "myListSize" using ws-head-ptr
       display "List size: " return-code " (expected 3)".

      * ===== Print list =====
       display "=== Print list ===".
       perform print-list.

      * ===== Test myRevList =====
       display "=== Test myRevList ===".
       call "myRevList" using ws-head-ptr
       display "After reverse:".
       perform print-list.

      * ===== Test addNodeToEnd =====
       display "=== Test addNodeToEnd ===".
       call "addNodeToEnd" using ws-head-ptr address of ws-data4
       display "Added 'Test' at end:".
       perform print-list.

      * ===== Test myFindNode =====
       display "=== Test myFindNode ===".
       call "myFindNode" using ws-head-ptr address of ws-search-ref
                               ws-strcmp-ptr ws-found-ptr
       if ws-found-ptr not = null
           set address of lk-node to ws-found-ptr
           set address of lk-data to nodeValue of lk-node
           display "Found: " lk-data
       else
           display "Not found"
       end-if.

      * ===== Test myApplyOnNodes =====
       display "=== Test myApplyOnNodes ===".
       call "myApplyOnNodes" using ws-head-ptr ws-print-ptr
       display "Applied printData to all nodes".

      * ===== Test myConcatList =====
       display "=== Test myConcatList ===".
       set ws-head2-ptr to null
       call "addNodeToStart" using ws-head2-ptr address of ws-data5
       display "List2 content:".
       set ws-current-ptr to ws-head2-ptr
       set address of lk-node to ws-current-ptr
       set address of lk-data to nodeValue of lk-node
       display "  " lk-data.
       call "myConcatList" using ws-head-ptr ws-head2-ptr
       display "After concat:".
       perform print-list.

      * ===== Test myDeleteNodes =====
       display "=== Test myDeleteNodes ===".
       call "myDeleteNodes" using ws-head-ptr address of ws-search-ref
                                  ws-strcmp-ptr
       display "After deleting 'World':".
       perform print-list.

      * ===== Test mySortList with integers =====
       display "=== Test mySortList ===".
       set ws-head-ptr to null
       call "addNodeToStart" using ws-head-ptr address of ws-int1
       call "addNodeToStart" using ws-head-ptr address of ws-int2
       call "addNodeToStart" using ws-head-ptr address of ws-int3
       call "addNodeToStart" using ws-head-ptr address of ws-int4
       display "Integer list before sort:".
       perform print-int-list.
       call "mySortList" using ws-head-ptr ws-intcmp-ptr
       display "Integer list after sort:".
       perform print-int-list.

      * ===== Test myAddInSortedList =====
       display "=== Test myAddInSortedList ===".
       call "myAddInSortedList" using ws-head-ptr address of ws-int5
                                      ws-intcmp-ptr
       display "After adding 25 to sorted list:".
       perform print-int-list.

      * ===== Test myMerge =====
       display "=== Test myMerge ===".
       set ws-head2-ptr to null
       move 5 to ws-int1
       move 35 to ws-int2
       call "addNodeToStart" using ws-head2-ptr address of ws-int2
       call "addNodeToStart" using ws-head2-ptr address of ws-int1
       display "List2 for merge: 5, 35".
       call "myMerge" using ws-head-ptr ws-head2-ptr ws-intcmp-ptr
       display "After merge:".
       perform print-int-list.

       call "myListSize" using ws-head-ptr
       display "Final size: " return-code.

       stop run.


       print-list.
           set ws-current-ptr to ws-head-ptr
           perform until ws-current-ptr = null
               set address of lk-node to ws-current-ptr
               set address of lk-data to nodeValue of lk-node
               display "  " lk-data
               set ws-current-ptr to nodeNext of lk-node
           end-perform.


       print-int-list.
           set ws-current-ptr to ws-head-ptr
           perform until ws-current-ptr = null
               set address of lk-node to ws-current-ptr
               set address of lk-int to nodeValue of lk-node
               display "  " lk-int
               set ws-current-ptr to nodeNext of lk-node
           end-perform.


      * ===== Helper functions =====
       identification division.
       program-id. printData.
       data division.
       linkage section.
       01  lk-data pic x(10).
       procedure division using lk-data.
           display "  -> " lk-data.
           move 0 to return-code.
           goback.
       end program printData.


       identification division.
       program-id. myStrCmp.
       data division.
       linkage section.
       01  lk-str1 pic x(10).
       01  lk-str2 pic x(10).
       procedure division using lk-str1 lk-str2.
           if lk-str1 = lk-str2
               move 0 to return-code
           else
               if lk-str1 < lk-str2
                   move -1 to return-code
               else
                   move 1 to return-code
               end-if
           end-if.
           goback.
       end program myStrCmp.


       identification division.
       program-id. myIntCmp.
       data division.
       linkage section.
       01  lk-int1 pic s9(9).
       01  lk-int2 pic s9(9).
       procedure division using lk-int1 lk-int2.
           if lk-int1 = lk-int2
               move 0 to return-code
           else
               if lk-int1 < lk-int2
                   move -1 to return-code
               else
                   move 1 to return-code
               end-if
           end-if.
           goback.
       end program myIntCmp.

       end program tests.
