#!/usr/bin/liquidsoap

# Lines starting with # are comments, they are ignored.

# Print log messages to the console,
# can also be done by passing the -v option to liquidsoap.
set("log.file", false)
set("log.stdout", true)

fallback_song = mksafe(single("fallback.mp3"))
jingles = playlist("/usr/src/app/jingles.m3u")

def request_func() =
  data = get_process_output("curl http://ls-bridge:8000/api/radio/song/next/")
  next = string.sub(data, start=1, length=(string.length(data) - 2))
  request.create(next)
end

grand_mix = request.dynamic(request_func)
radio = rotate(weights=[1,3], [jingles, grand_mix])
s = fallback([radio, fallback_song])

#output.icecast(%vorbis(quality=-0.1),
#  host="icecast",port=8000,password="hackme",
#  mount="udon.ogg",radio)
output.icecast(%mp3(bitrate=320),
  host="icecast",port=8000,password="hackme",
  mount="udon.mp3", s)
