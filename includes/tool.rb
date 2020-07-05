def tab(str, max, right = false)

  str = str.to_s
  buf = ""

  unless right
    buf += str
  end

  for i in 1 .. max - str.length
    buf += ' '
  end

  if right
    buf += str
  end

  return buf

end
