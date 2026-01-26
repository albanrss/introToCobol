SRC=(
    myStrCpy.cob
)

MAIN=tests.cob

cobc $@ -x ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"
