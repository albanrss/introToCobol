SRC=(
    myStrCpy.cob
    myStrNCpy.cob
    myRevStr.cob
    myStrStr.cob
    myStrCmp.cob
    myStrNCmp.cob
    myStrUpCase.cob
    myStrLowCase.cob
    myStrCapitalize.cob
    myStrIsAlpha.cob
)

MAIN=tests.cob

cobc $@ -x ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"
