return {
	"benlubas/molten-nvim",
	build = ":UpdateRemotePlugins",

	config = function()
		-- Pick the Python interpreter for Molten:
		-- 1) prefer project-local .venv
		-- 2) fallback to Neovim provider env
		local function molten_python()
			local cwd = vim.fn.getcwd()
			local project_py = cwd .. "/.venv/bin/python"
			if vim.fn.executable(project_py) == 1 then
				return project_py
			end
			return vim.fn.expand("~/.venv/nvim-jupyter/bin/python")
		end

		-- Command: :MoltenInitAuto
		vim.api.nvim_create_user_command("MoltenInitAuto", function()
			vim.g.molten_python_path = molten_python()
			vim.cmd("MoltenInit")
		end, {})

		-- Run the current "# %%" cell (Jupytext / VSCode style)
		local function run_percent_cell()
			local cur = vim.api.nvim_win_get_cursor(0)[1] -- 1-indexed line
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

			local function is_marker(i)
				local s = lines[i] or ""
				return s:match("^%s*#%s*%%%%") ~= nil -- matches "#%%" or "# %%"
			end

			-- Find start: first line after previous marker
			local start = 1
			for i = cur, 1, -1 do
				if is_marker(i) then
					start = i + 1
					break
				end
			end

			-- Find end: last line before next marker
			local finish = #lines
			for i = cur + 1, #lines do
				if is_marker(i) then
					finish = i - 1
					break
				end
			end

			if start > finish then
				vim.notify("No code in this #%% cell", vim.log.levels.WARN)
				return
			end

			-- Define a Molten cell for [start, finish] and run it
			-- (Molten exposes a VimL function MoltenDefineCell)
			vim.fn.MoltenDefineCell(start, finish)

			-- Move cursor into the cell so Molten knows what "current cell" is
			vim.api.nvim_win_set_cursor(0, { start, 0 })

			-- Run (or rerun) the current cell
			vim.cmd("MoltenReevaluateCell")
		end

		-- Keymaps (kept local to Molten config)
		local map = vim.keymap.set
		local opts = { silent = true, noremap = true }

		map("n", "<leader>mi", "<cmd>MoltenInitAuto<cr>", opts)
		map("n", "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", opts)
		map("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>", opts)
		map("n", "<leader>mr", "<cmd>MoltenRestart<cr>", opts)
		map("n", "<leader>mc", run_percent_cell, opts)
	end,
}
