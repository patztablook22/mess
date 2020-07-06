def nchr(n, chr)

  buf = ""
  
  for i in 1..n
    buf += chr
  
  end
  
  buf

end
   

def tab(str, max, right = false)

  str = str.to_s
  buf = ""

  unless right
    buf += str
  end

  buf += nchr(max - str.length, ' ')

  if right
    buf += str
  end

  return buf

end
