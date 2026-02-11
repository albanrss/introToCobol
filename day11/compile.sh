SRC=(
    common/subprog/addNodeToStart.cob
    common/subprog/addNodeToEnd.cob
    common/subprog/myListSize.cob
    common/subprog/myRevList.cob
    common/subprog/myApplyOnNodes.cob
    common/subprog/myApplyOnMatchingNodes.cob
    common/subprog/myFindNode.cob
    common/subprog/myDeleteNodes.cob
    common/subprog/myConcatList.cob
    common/subprog/mySortList.cob
    common/subprog/myAddInSortedList.cob
    common/subprog/myMerge.cob
    common/subprog/myParamsToList.cob
)

MAIN=tests.cob

CPYSRC=common/copy/

cobc $@ -x -I ${0%/*}/$CPYSRC ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"
