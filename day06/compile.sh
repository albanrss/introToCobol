SRC=(
    myStrCpy.cob
    myStrNCpy.cob
    myRevStr.cob
)

MAIN=tests.cob

cobc $@ -x ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"
