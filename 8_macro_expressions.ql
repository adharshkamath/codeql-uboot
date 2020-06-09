import cpp 

from MacroInvocation minvoc
where minvoc.getMacroName().regexpMatch("ntoh(s|ll?)")
select minvoc.getExpr(), " - ntoh* expanded to"