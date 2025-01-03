return {
	import = function(module_name)
		local success, result = pcall(require, module_name)
		if success then
			return result
		else
			print("import(): " .. module_name .. " not found")
			return nil
		end
	end,
}
