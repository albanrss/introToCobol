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
    myStrIsNum.cob
    myStrIsLower.cob
    myStrIsUpper.cob
    myStrIsPrintable.cob
    myPutNbrBase.cob
    myGetNbrBase.cob
    myShowStr.cob
    myShowMem.cob
)

MAIN=tests.cob

cobc $@ -x ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"
