-- last modified 2025-04-21
-- created 2025-04-18

require('vis')

vis.ftdetect.filetypes.pyret =  {
  ext = { '%.arr$' },
}

require('plugins/vis-commentary')

vis.comment_string.asciidoc = '//'
vis.comment_string.pyret = '#'
vis.comment_string.text = '//'

require('plugins/vis-cursors')
require('plugins/vis-ins-completion')
require('plugins/vis-copypasta')
-- require('plugins/vis-surround')

local qf = require('plugins/vis-quickfix')
qf.grepprg = 'grep -HIns'

-- dictfiles.dirname = '/usr/share/dict/words'

vis.events.subscribe(vis.events.INIT, function()
  require('themes/quiet')
  -- require('old-quiet')
  -- require('themes/solarized')
  -- require('plugins/oil6')
  -- require('plugins/vis-minimal-theme/minimal-clear')
  -- require('plugins/darkest-space')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function()
  vis:command('set number')
  vis:command('set expandtab')
  vis:command('set ignorecase')
  -- vis.win.options.expandtab = true
  -- vis.win.options.ignorecase = true
  -- vis.win.options.number = true
  vis.win.options.tabwidth = 2
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
