-- last modified 2025-06-12
-- created 2025-04-18

require('vis')

vis.ftdetect.filetypes.pyret =  {
  ext = { '%.arr$' },
}

require('plugins/vis-commentary')
require('plugins/vis-copypasta')
require('plugins/vis-cursors')
require('plugins/vis-ins-completion')
require('plugins/vis-quickfix')

-- require('plugins/vis-surround')

vis.events.subscribe(vis.events.INIT, function()
  require('themes/plain')
  -- require('plugins/darkest-space')
  -- require('plugins/oil6')
  -- require('plugins/vis-minimal-theme/minimal-clear')
  -- require('themes/solarized')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function()
  vis.win.options.tabwidth = 2
  vis:command('set expandtab')
  vis:command('set ignorecase')
  vis:command('set number')
  -- vis.win.options.expandtab = true
  -- vis.win.options.ignorecase = true
  -- vis.win.options.number = true
end)

vis:map(vis.modes.INSERT, 'jj', function()
  vis.mode = vis.modes.NORMAL
end)

-- from vis api doc
vis:operator_new('gq', function(file, range)
  local ideal_text_width = 66
  local status, out, err = vis:pipe(file, range,
    'fmt -w ' .. ideal_text_width .. ' | sed -e "s/\\(\\S\\)\\s\\+/\\1 /g"')
  if status ~= 0 then
    vis:info(err)
  else
    file:delete(range)
    file:insert(range.start, out)
  end
  return range.start -- new cursor location
end, 'format paragraphs')

vis.events.subscribe(vis.events.FILE_SAVE_POST, function(_, path)
  local pos = vis.win.selection.pos
  os.execute('vidatestamp ' .. path)
  vis:command('e!')
  vis.win.selection.pos = pos
  return true
end)
