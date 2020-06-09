import cpp

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        exists(MacroInvocation macinv | 
            macinv.getMacroName().regexpMatch("ntoh(s|ll?)") and macinv.getExpr() = this
        )
    }
}

from NetworkByteSwap nswap
select nswap
