#!/usr/local/bin/julia

function upload(f, target)
  println(f)
  `aws put junolab/$target $f --public --progress` |> run
end

upload("dist/juno.dmg", "latest/juno-mac-x64.dmg")
for plat in ["windows", "linux"], a in ["32", "64"]
  upload("dist/$plat$a.zip", "latest/juno-$plat-x$a.zip")
end
