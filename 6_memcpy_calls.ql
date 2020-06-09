import cpp

from FunctionCall fcall
where fcall.getTarget().getName() = "memcpy"
select fcall, "memcpy called"