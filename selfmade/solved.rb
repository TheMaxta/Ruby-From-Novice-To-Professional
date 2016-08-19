def numbers(a, b)
  if a>b 
    a1=b
    b1=a
  else
    a1=a
    b1=b
  end
  while b1 != 0
    t = b1
    b1 = a1%b1
    a1=t
  end
print(a/a1," ",b/a1)
end
numbers(10, 80)