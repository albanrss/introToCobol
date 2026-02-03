SRC=(
    myStrCat.cob
    myStrNCat.cob
)

MAIN=tests.cob

cobc $@ -x ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"

cobc $@ -x ${0%/*}/myPrintParams.cob

cobc $@ -x ${0%/*}/myRevParams.cob

cobc $@ -x ${0%/*}/mySortParams.cob
