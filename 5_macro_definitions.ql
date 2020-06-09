import cpp

from Macro m
where m.getName().regexpMatch("ntoh(s|ll?)")
select m, "an nth* macro"