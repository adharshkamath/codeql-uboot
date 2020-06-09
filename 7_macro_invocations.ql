import cpp 

from MacroInvocation minvoc
where minvoc.getMacroName() = "ntohs" or minvoc.getMacroName() = "ntohl" or minvoc.getMacroName() = "ntohll"
select minvoc, "ntoh* used"
