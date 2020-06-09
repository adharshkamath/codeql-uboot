/**
*    @kind path-problem
*/

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
    NetworkByteSwap() {
        exists(MacroInvocation macinv | 
            macinv.getMacroName().regexpMatch("ntoh(s|ll?)") and macinv.getExpr() = this
        )
    }
}

class Config extends TaintTracking::Configuration {
    Config() {
        this = "NetworkToMemFuncLength"
    }

    override predicate isSource(DataFlow::Node source) {
        source.asExpr() instanceof NetworkByteSwap
    }

    override predicate isSink(DataFlow::Node sink) {
        exists(FunctionCall fncall | 
            fncall.getTarget().getName() = "memcpy" and sink.asExpr() = fncall.getArgument(2)
        )
    }
}


from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Data flows from NetworkbyteSwap to Memcpy"