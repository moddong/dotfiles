local api, uv, lsp = vim.api, vim.uv, vim.lsp

local stl_bg
if not stl_bg then
  stl_bg = api.nvim_get_hl(0, { name = "StatusLine" }).bg
end

local function stl_attr(group, trans)
  local color = api.nvim_get_hl(0, { name = group, link = false })
  trans = trans or false
  return {
    bg = trans and "NONE" or stl_bg,
    fg = color.fg,
  }
end

local function alias_mode()
  return {
    --Normal
    ["n"] = "Normal",
    ["no"] = "O-Pending",
    ["nov"] = "O-Pending",
    ["noV"] = "O-Pending",
    ["no\x16"] = "O-Pending",
    ["niI"] = "Normal",
    ["niR"] = "Normal",
    ["niV"] = "Normal",
    ["nt"] = "Normal",
    ["ntT"] = "Normal",
    ["v"] = "Visual",
    ["vs"] = "Visual",
    ["V"] = "V-Line",
    ["Vs"] = "V-Line",
    ["\x16"] = "V-Block",
    ["\x16s"] = "V-Block",
    ["s"] = "Select",
    ["S"] = "S-Line",
    ["\x13"] = "S-Block",
    ["i"] = "Insert",
    ["ic"] = "Insert",
    ["ix"] = "Insert",
    ["R"] = "Replace",
    ["Rc"] = "Replace",
    ["Rx"] = "Replace",
    ["Rv"] = "V-Replace",
    ["Rvc"] = "V-Replace",
    ["Rvx"] = "V-Replace",
    ["c"] = "Command",
    ["cv"] = "Ex",
    ["ce"] = "Ex",
    ["r"] = "Replace",
    ["rm"] = "More",
    ["r?"] = "Confirm",
    ["!"] = "Shell",
    ["t"] = "Terminal",
  }
end

local function modeinfo()
  local alias = alias_mode()
  local result = {
    stl = function()
      local mode = api.nvim_get_mode().mode
      local m = alias[mode] or alias[string.sub(mode, 1, 1)] or "UNK"
      return m:sub(1, 3):upper()
    end,
    name = "modeinfo",
    default = "NOR",
    event = { "ModeChanged" },
    attr = stl_attr("DiagnosticWarn"),
  }
  return result
end

local function path_sep()
  return uv.os_uname().sysname == "Windows_NT" and "\\" or "/"
end

local function fileinfo()
  local result = {
    stl = "%f %P",
    name = "fileinfo",
    event = { "BufEnter" },
  }

  return result
end

local function lspinfo()
  local function lsp_stl(args)
    local client = lsp.get_client_by_id(args.data.client_id)
    local msg = client and client.name or ""
    if args.data.result then
      local val = args.data.result.value
      msg = val.title
        .. " "
        .. (val.message and val.message .. " " or "")
        .. (val.percentage and val.percentage .. "%" or "")
      if not val.message or val.kind == "end" then
        ---@diagnostic disable-next-line: need-check-nil
        msg = client.name
      end
    elseif args.event == "LspDetach" then
      msg = ""
    end
    return '%.40{"' .. msg .. '"}'
  end

  local result = {
    stl = lsp_stl,
    name = "Lspinfo",
    event = { "LspProgress", "LspAttach", "LspDetach" },
    attr = stl_attr("Function"),
  }

  return result
end

local function gitsigns_data(bufnr, type)
  local ok, dict = pcall(api.nvim_buf_get_var, bufnr, "gitsigns_status_dict")
  if not ok or vim.tbl_isempty(dict) or not dict[type] then
    return 0
  end

  return dict[type]
end

local function git_icons(type)
  local tbl = {
    ["added"] = "+",
    ["changed"] = "~",
    ["deleted"] = "-",
  }
  return tbl[type]
end

local function gitadd()
  local sign = git_icons("added")
  local result = {
    stl = function(args)
      local res = gitsigns_data(args.buf, "added")
      return res > 0 and ("%s%s%s"):format(sign, res, " ") or ""
    end,
    name = "gitadd",
    event = { "User GitSignsUpdate", "BufEnter" },
    attr = stl_attr("DiffAdd"),
  }

  return result
end

local function gitchange()
  local sign = git_icons("changed")
  local result = {
    stl = function(args)
      local res = gitsigns_data(args.buf, "changed")
      return res > 0 and ("%s%s%s"):format(sign, res, " ") or ""
    end,
    name = "gitchange",
    event = { "User GitSignsUpdate", "BufEnter" },
    attr = stl_attr("DiffChange"),
  }

  return result
end

local function gitdelete()
  local sign = git_icons("deleted")
  local result = {
    stl = function(args)
      local res = gitsigns_data(args.buf, "removed")
      return res > 0 and ("%s%s"):format(sign, res) or ""
    end,
    name = "gitdelete",
    event = { "User GitSignsUpdate", "BufEnter" },
    attr = stl_attr("DiffDelete"),
  }

  return result
end

local function branch()
  local icon = "  "
  local result = {
    stl = function(args)
      local res = gitsigns_data(args.buf, "head")
      return res and icon .. res or " UNKNOWN"
    end,
    name = "gitbranch",
    event = { "User GitSignsUpdate" },
    attr = stl_attr("Include"),
  }
  return result
end

local function lnumcol()
  local result = {
    stl = "%-5.(%l:%c%)",
    name = "linecol",
    event = { "CursorHold" },
  }

  return result
end

local function diagnostic_info(severity)
  if vim.diagnostic.is_disabled(0) then
    return ""
  end
  local count = #vim.diagnostic.get(0, { severity = severity })
  return count == 0 and "" or "" .. tostring(count) .. " "
end

local function diagError()
  local result = {
    stl = function()
      return diagnostic_info(1)
    end,
    name = "diagError",
    event = { "DiagnosticChanged", "BufEnter" },
    attr = stl_attr("DiagnosticError"),
  }
  return result
end

local function diagWarn()
  local result = {
    stl = function()
      return diagnostic_info(2)
    end,
    name = "diagWarn",
    event = { "DiagnosticChanged", "BufEnter" },
    attr = stl_attr("DiagnosticWarn"),
  }
  return result
end

local function diagInfo()
  local result = {
    stl = function()
      return diagnostic_info(3)
    end,
    name = "diaginfo",
    event = { "DiagnosticChanged", "BufEnter" },
    attr = stl_attr("DiagnosticInfo"),
  }
  return result
end

local function diagHint()
  local result = {
    stl = function()
      return diagnostic_info(4)
    end,
    name = "diaghint",
    event = { "DiagnosticChanged", "BufEnter" },
    attr = stl_attr("DiagnosticHint"),
  }
  return result
end

local function modified()
  return {
    name = "modified",
    stl = '%{&modified?"**":"--"}',
    event = { "BufModifiedSet" },
  }
end

local function eol()
  return {
    name = "eol",
    stl = path_sep() == "/" and ":" or "(Dos)",
    event = { "BufEnter" },
  }
end

local function encoding()
  local map = {
    ["utf-8"] = "U",
    ["utf-16"] = "U16",
    ["utf-32"] = "U32",
    ["unix"] = "U",
    ["linux"] = "L",
    ["dos"] = "W",
  }
  local result = {
    stl = map[vim.o.ff] .. (vim.o.fileencoding and map[vim.o.fileencoding] or map[vim.o.encoding]),
    name = "filencode",
    event = { "BufEnter" },
  }
  return result
end

local function pad()
  return {
    stl = "%=",
    name = "pad",
  }
end

local function space()
  return {
    stl = " ",
    name = "space",
  }
end

local function stl_format(name, val)
  return "%#Stl" .. name .. "#" .. val .. "%*"
end

local function stl_hl(name, attr)
  api.nvim_set_hl(0, "Stl" .. name, attr)
end

local function render(comps, events, pieces)
  return coroutine.create(function(args)
    while true do
      local event = args.event == "User" and args.event .. " " .. args.match or args.event
      for _, idx in ipairs(events[event]) do
        pieces[idx] = stl_format(comps[idx].name, comps[idx].stl(args))
      end

      --because setup use a timer to defer parse and render this will cause missing
      --BufEnter event so add a safe check avoid filename and file icon can't get
      --when running `nvim file`
      if #pieces[6] == 0 then
        pieces[6] = stl_format(comps[6].name, comps[6].stl(args))
      end

      vim.opt.stl = table.concat(pieces)
      args = coroutine.yield()
    end
  end)
end

local comps = {
  modeinfo(),
  space(),
  encoding(),
  eol(),
  modified(),
  space(),

  fileinfo(),
  space(),
  diagError(),
  diagWarn(),
  diagInfo(),
  diagHint(),
  space(),
  pad(),
  lspinfo(),
  pad(),

  space(),
  lnumcol(),
  space(),
  gitadd(),
  gitchange(),
  gitdelete(),
  branch(),
}
local events, pieces = {}, {}

vim
  .iter(ipairs(comps))
  :map(function(key, item)
    if type(item.stl) == "string" then
      pieces[#pieces + 1] = stl_format(item.name, item.stl)
    else
      pieces[#pieces + 1] = item.default and stl_format(item.name, item.default) or ""
      for _, event in ipairs({ unpack(item.event or {}) }) do
        if not events[event] then
          events[event] = {}
        end
        events[event][#events[event] + 1] = key
      end
    end

    if item.attr and item.name then
      stl_hl(item.name, item.attr)
    end
  end)
  :totable()

local stl_render = render(comps, events, pieces)
for _, e in ipairs(vim.tbl_keys(events)) do
  local tmp = e
  local pattern
  if e:find("User") then
    pattern = vim.split(e, "%s")[2]
    tmp = "User"
  end

  api.nvim_create_autocmd(tmp, {
    pattern = pattern,
    callback = function(args)
      vim.schedule(function()
        local ok, res = coroutine.resume(stl_render, args)
        if not ok then
          vim.notify("[Stl] render failed " .. res, vim.log.levels.ERROR)
        end
      end)
    end,
  })
end
