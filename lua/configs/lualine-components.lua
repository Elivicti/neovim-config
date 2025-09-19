
local icon = {
	cmake = {
		CMake = "",
		Build = "",
		Run   = "",
		Debug = "",
	},
}

local has_cmake, cmake = pcall(require, "cmake-tools")
if not has_cmake then
	cmake = {
		is_cmake_project = function() return false end
	}
end

local cmake_component_condition = function()
	return cmake.is_cmake_project() and vim.bo.buftype == ""
end

local components = {
	filename = {
		"filename",
		cond = function() return not cmake_component_condition() end
	},
	datetime = {
		function()
			return os.date("%Y-%m-%d %H:%M", os.time())
		end
	},
	cmake = {
		configure_preset = {},
		build_target = {},
		debug = {},
		launch = {},
	}
}

-- only load cmake stuff when it's available and inside of a cmake project
if has_cmake and cmake.is_cmake_project() then
	local has_nvim_dap, _ = pcall(require, "dap")
	components.cmake = {
		configure_preset = {
			function()
				if cmake.has_cmake_preset() then
					local b_preset = cmake.get_configure_preset()
					if not b_preset then
						return icon.cmake.CMake
					end
					return icon.cmake.CMake .. string.format(" [%s]", b_preset)
				end

				local b_type = cmake.get_build_type()
				if not b_type then
					return icon.cmake.CMake
				end
				return icon.cmake.CMake .. string.format(" [%s]", b_type)
			end,
			cond = cmake_component_condition,
			on_click = function(n, mouse)
				if (n ~= 1) then return end
				if (mouse == "l") then
					cmake.generate(cmake.get_generate_options())
				elseif (mouse == "r") then
					if cmake.has_cmake_preset() then
						cmake.select_configure_preset()
					else
						cmake.select_build_type()
					end
				end
			end
		},
		build_target = {
			function()
				local b_target = cmake.get_build_target()[1]
				if not b_target or b_target == "all" then
					return icon.cmake.Build
				end
				return icon.cmake.Build .. string.format(" [%s]", b_target)
			end,
			cond = cmake_component_condition,
			on_click = function(n, mouse)
				if (n ~= 1) then return end
				if (mouse == "l") then
					local b_target = cmake.get_build_target()
					local options = cmake.get_build_options()
					if not b_target then
						options.target = { cmake.get_launch_target() }
						if not options.target then
							options.target = { "all" }
						end
					else
						options.target = b_target
					end
					cmake.build(options)
				elseif (mouse == "r") then
					cmake.select_build_target()
				end
			end
		},
		debug = {
			function()
				return icon.cmake.CMake
			end,
			cond = function ()
				return has_nvim_dap and cmake_component_condition()
			end,
			on_click = function(n, mouse)
				if (n ~= 1) then return end
				if (mouse == "l") then
					local target = cmake.get_launch_target()
					if not target then
						target = cmake.get_build_target()
					end
					if not target then
						cmake.select_launch_target()
						return
					end
					cmake.debug({ target = target })
				elseif (mouse == "r") then
					cmake.select_launch_target()
				end
			end
		},
		launch = {
			function ()
				local target = cmake.get_launch_target()
				if not target then
					return icon.cmake.Run
				end
				return icon.cmake.Run .. string.format(" [%s]", target)
			end,
			cond = cmake_component_condition,
			on_click = function(n, mouse)
				if (n ~= 1) then return end
				if (mouse == "l") then
					local target = cmake.get_launch_target()
					if not target then
						target = cmake.get_build_target()
					end
					if not target then
						cmake.select_launch_target()
						return
					end
					cmake.run({ target = target })
				elseif (mouse == "r") then
					cmake.select_launch_target()
				end
			end
		}
	}

end


return components
