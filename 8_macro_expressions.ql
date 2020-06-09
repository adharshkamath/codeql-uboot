import cpp 

from MacroInvocation minvoc
where minvoc.getMacroName().regexpMatch("ntoh(s|ll?)")
select "ntoh* expanded to - ", minvoc.getExpr()