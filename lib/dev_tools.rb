
# A simple printf that includes calling location.
#
# This convenience function is a diagnostic printf, that aids debugging by
# including the calling location. positional and keyword arguments can be
# passed. The printed form of values is made via "inspect". If this is a
# problem, arguments should be coerced to a suitable form.
#
def dbg(*args)
	print("DEBUG: #{caller()[0]}:\n")
	args.each { |a|
		if a.is_a?(Hash)
			a.each_pair { |k,v|
				print "* #{k.inspect} => #{v.inspect}\n"
			}
		else
			print "* #{a.inspect}\n"
		end
	}
end
