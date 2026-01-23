SRC=(
    myPrintAlpha.cob
    myPrintRevAlpha.cob
    myPrintDigits.cob
    myIsNeg.cob
    myPutNbr.cob
    myPrintComb.cob
    myPrintComb2.cob
    myPrintCombN.cob
)

MAIN=tests.cob

cobc $@ -x $MAIN ${SRC[@]}
