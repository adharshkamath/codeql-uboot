import cpp 

from MacroInvocation minvoc
where minvoc.getMacroName() = "ntohs" or minvoc.getMacroName() = "ntohl" or minvoc.getMacroName() = "ntohll"
select "ntoh* expanded to - ", minvoc.getExpr()