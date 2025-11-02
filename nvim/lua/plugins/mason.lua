return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	config = function()
		local mason_servers = {
			"clangd",
			"cmake-language-server",
			"lua-language-server",
			"marksman",
			"python-lsp-server",
			"rust-analyzer",
			"texlab",
			"tinymist",
		}

		require("mason").setup({
			ensure_installed = mason_servers,
			PATH = "prepend",
			ui = {
				icons = {
					package_pending = " ",
					package_installed = "󰄳 ",
					package_uninstalled = " 󰚌",
				},
			},

			max_concurrent_installers = 10,
		})

		-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/plugins/init.lua
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if mason_servers and #mason_servers > 0 then
				vim.cmd("Mason")
				local mr = require("mason-registry")

				mr.refresh(function()
					for _, tool in ipairs(mason_servers) do
						local p = mr.get_package(tool)
						if not p:is_installed() then
							p:install()
						end
					end
				end)
			end
		end, {})
	end,
}
