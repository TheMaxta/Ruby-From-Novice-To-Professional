def binding_elsewhere
	x = 20
	return binding
end

remote_binding = binding_elsewhere
y = 100
x = 10
e = eval("puts y")
eval("puts x")
eval("puts x", remote_binding)