function minify(code)
	code = code:gsub("%-%-[^\n]*", "")

	code = code:gsub("%s+", " ")
	code = code:gsub("%s*\n%s*", "")

	code = code:gsub('%[(=*)%[.-%]%1%]', function(equal)
		return '['..equal..'['..code:gsub('[%c%s]', function(ch)
			if ch == '\n' then return '\\n'
			elseif ch == '\t' then return '\\t'
			elseif ch == ' ' then return ' '
			else return string.format('\\%03d', ch:byte())
			end
		end)..']]'
	end)

	return code
end
