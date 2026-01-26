SRC=(
    myComputeFactorialIt.cob
    myComputeFactorialRec.cob
    myComputePowerIt.cob
    myComputePowerRec.cob
    myComputeSquareRoot.cob
    myIsPrime.cob
    myFindPrimeSup.cob
)

MAIN=tests.cob

cobc $@ -x ${0%/*}/$MAIN "${SRC[@]/#/${0%/*}/}"
