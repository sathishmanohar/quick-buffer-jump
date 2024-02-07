local M = {}

M.config = {
    alphabet = "abcdefghijklmnopqrstuvwxyz",
}

M.setup = function(params)
  M.config = vim.tbl_deep_extend('force', {}, M.config, params)
end

-- Define a highlight group for the alphabet label
vim.api.nvim_command('highlight AlphabetLabel guifg=Cyan ctermfg=Cyan')

-- Function to create a floating window and list buffers
function M.quick_buffer_jump()
    local api = vim.api
    local buffers = api.nvim_list_bufs()
    local lines = {}
    local buffer_map = {}  -- Table to map line numbers to buffer numbers
    local alphabet = M.config.alphabet
    local alphabet_count = 1

    -- Create buffer for the floating window
    local float_buf = api.nvim_create_buf(false, true)

    for _, buf in ipairs(buffers) do
        if api.nvim_buf_is_loaded(buf) then
            local name = api.nvim_buf_get_name(buf)
            if name and name ~= "" then
                local alphabet_label = alphabet:sub(alphabet_count, alphabet_count)
                local label = name .. " [" .. alphabet_label .. "]"
                table.insert(lines, label)
                buffer_map[#lines] = buf  -- Map the line number to the buffer number

                -- Map the alphabet key to the buffer number
                local map_cmd = '<cmd>lua vim.api.nvim_win_close(vim.fn.bufwinid('..float_buf..'), true); vim.api.nvim_set_current_buf('..buf..')<CR>'
                api.nvim_buf_set_keymap(float_buf, 'n', alphabet_label, map_cmd, {noremap = true, silent = true})

                alphabet_count = (alphabet_count % #alphabet) + 1
            end
        end
    end

    local max_height = math.max(1, math.min(#lines, math.floor(vim.o.lines * 0.8)))
    local width = 130
    local row = (vim.o.lines - max_height) / 2
    local col = (vim.o.columns - width) / 2

    -- Create the floating window
    local float_win = api.nvim_open_win(float_buf, true, {
		title = "Quick Buffer Jump - Open Buffers",
        relative = 'editor',
        width = width,
        height = max_height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded'
    })

	-- Enable cursorline for the floating window
    api.nvim_win_set_option(float_win, 'cursorline', true)

	-- Enable line numbers for the floating window
	api.nvim_win_set_option(float_win, 'number', true)

    api.nvim_buf_set_lines(float_buf, 0, -1, false, lines)

    -- Store the buffer map in a buffer-local variable
    api.nvim_buf_set_var(float_buf, "buffer_map", buffer_map)

    -- Apply highlights for each alphabet label
    for i, _ in ipairs(lines) do
        local start_pos = #lines[i] - 3
        local end_pos = #lines[i] - 1
        api.nvim_buf_add_highlight(float_buf, -1, 'AlphabetLabel', i - 1, start_pos, end_pos)
    end

    -- Key mapping for Enter to switch to the buffer of the current line
    local enter_cmd = '<cmd>lua local buf_id = vim.api.nvim_buf_get_var('..float_buf..', "buffer_map")[vim.api.nvim_win_get_cursor(0)[1]]; vim.api.nvim_win_close(vim.fn.bufwinid('..float_buf..'), true); vim.api.nvim_set_current_buf(buf_id)<CR>'
    api.nvim_buf_set_keymap(float_buf, 'n', '<CR>', enter_cmd, {noremap = true, silent = true})

    -- Key mappings for closing the window
    api.nvim_buf_set_keymap(float_buf, 'n', 'q', '<cmd>lua vim.api.nvim_win_close(vim.fn.bufwinid('..float_buf..'), true)<CR>', {noremap = true, silent = true})
    api.nvim_buf_set_keymap(float_buf, 'n', '<Esc>', '<cmd>lua vim.api.nvim_win_close(vim.fn.bufwinid('..float_buf..'), true)<CR>', {noremap = true, silent = true})
end

-- Create the Vim command
vim.api.nvim_create_user_command('QuickBufferJump', M.quick_buffer_jump, {})

return M
