local keys = {
  leader = " ",
  write = "<leader>w",
  movement = {
    start_of_line = "gh",
    end_of_line = "gl",
    matching_item = "mm",
  },
  close_window = "<leader>q",
  dismiss_notifications = "<leader>;",
  yank_to_clipboard = "<leader>y",
  paste_from_clipboard = "<leader>p",
  hide_search_highlight = ";",
  redo = "U",
  buffer = {
    prev = "<leader>j",
    next = "<leader>k",
    move_prev = "gJ",
    move_next = "gK",
    pick = "<C-s>",
    close = "<leader>c",
    close_force = "<leader>C",
  },
  trouble = {
    document_diagnostics = "<leader>xx",
    workspace_diagnostics = "<leader>xw",
    location_list = "<leader>xL",
    quickfix_list = "<leader>xQ",
  },
  magma = {
    init = "<localleader>i",
    enter_output = "<localleader><return>",
    evaluate_operator = "<localleader>r",
    evaluate_visual = "<localleader>r",
    evaluate_line = "<localleader>rr",
    reevaluate_cell = "<localleader>rc",
    delete = "<localleader>rd",
  },
  conflict = {
    next = "]x",
    previous = "[x",
    choose_ours = "co",
    choose_theirs = "ct",
    choose_both = "cb",
    choose_none = "c0",
  },
  resume_selection = "<leader><tab>",
  open_file_selection = "<leader>e",
  show_buffers = "<leader>,",
  live_grep = "<leader>/",
  command_history = "<leader>:",
  show_keymaps = "<leader>?",
  toggle_file_tree = "<leader>t",
  split_navigation = {
    left = "<C-h>",
    down = "<C-j>",
    up = "<C-k>",
    right = "<C-l>",
  },
  iswap = "<leader>s",
  lsp = {
    code_action = "<leader>q",
    hover = "K",
    signature_help = "<c-k>",
    rename = "<leader>r",
    format = "<leader>f",
    goto_definition = "gd",
    goto_declaration = "gD",
    goto_implementations = "gI",
    goto_type = "gy",
    goto_references = "gr",
    next_reference = "]r",
    prev_reference = "[r",
  },
  diagnostic = {
    goto_prev = "[d",
    goto_next = "]d",
    open_float = "<leader>d",
    show_list = "<leader>l",
  },
  surround = {
    add = "sa",
    delete = "sd",
    find = "sf",
    find_left = "sF",
    highlight = "sh",
    replace = "sr",
  },
  comment = {
    comment = "gc",
    comment_line = "gcc",
    text_object = "gc",
  },
  git = {
    next_hunk = "]h",
    prev_hunk = "[h",
    stage_hunk = "<leader>hs",
    reset_hunk = "<leader>hr",
    undo_stage_hunk = "<leader>hu",
    preview_hunk = "<leader>hp",
    blame_line = "<leader>gb",
    reset_buffer = "<leader>gR",
    stage_buffer = "<leader>gS",
    diff = "<leader>hd",
    status = "<leader>gs",
    coauthors = "<leader>ga",
    show_commits = "<leader>gc",
  },
  snippets = {
    expand_or_jump = "<c-l>",
    jump_prev = "<c-h>",
  },
  completion = {
    scroll_docs_down = "<C-d>",
    scroll_docs_up = "<C-u>",
    complete = "<C-Space>",
    next = "<Tab>",
    previous = "<S-Tab>",
    abort = "<C-c>",
    confirm = "<Enter>",
  },
}

return keys
