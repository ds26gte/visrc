-- AsciiDoc LPeg lexer
-- created 2025-04-21
-- last modified 2025-04-21
-- Dorai Sitaram

local lexer = lexer
local P = lpeg.P

local lex = lexer.new(...)

-- comments
lex:add_rule('comment', lex:tag(lexer.COMMENT,
  lexer.to_eol(lexer.starts_line('//'))))

-- section headers
lex:add_rule('header', lex:tag(lexer.HEADING,
  lexer.to_eol(lexer.starts_line('=') * P('=')^0 * P(' '))))

return lex
