def FindIntersection(strArr)
  res = (strArr[0].split(",").map(&:to_i) & strArr[1].split(",").map(&:to_i)).join(",").delete(" ")
  if res.empty?
    return false
  end
  return res

end
