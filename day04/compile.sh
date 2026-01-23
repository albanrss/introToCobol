SRC=(
    myEvilStr.cob
    myGetNbr.cob
    myPutStr.cob
    mySortIntArray.cob
    myStrLen.cob
    mySwap.cob
)

MAIN=tests.cob

cobc $@ -x $MAIN ${SRC[@]}
