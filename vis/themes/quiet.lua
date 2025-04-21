-- last modified 2025-04-20
-- created 2025-04-19

local lexers = vis.lexers

-- lexers.STYLE_DEFAULT = 'fore:#b5b5b5,back:#1c1c1c'
-- lexers.STYLE_DEFAULT = 'fore:#a5a5a5,back:#1c1c1c'
-- lexers.STYLE_DEFAULT = 'fore:#a5a5a5,back:#00000000'
lexers.STYLE_DEFAULT = 'fore:#959595'
-- lexers.STYLE_NOTHING = ''

lexers.STYLE_CLASS = ''
lexers.STYLE_COMMENT = 'fore:#8c8c8c,back:#262626'
lexers.STYLE_CONSTANT = ''
-- lexers.STYLE_DEFINITION = ''
-- lexers.STYLE_EMBEDDED = ''
-- lexers.STYLE_ERROR = ''
lexers.STYLE_FUNCTION = ''
lexers.STYLE_HEADING = 'fore:#80b080'
-- lexers.STYLE_IDENTIFIER = ''
lexers.STYLE_KEYWORD = ''
lexers.STYLE_LABEL = ''
lexers.STYLE_NUMBER = ''
lexers.STYLE_OPERATOR = ''
lexers.STYLE_PREPROCESSOR = lexers.STYLE_HEADING
-- lexers.STYLE_REGEX = ''
lexers.STYLE_STRING = lexers.STYLE_HEADING
-- lexers.STYLE_TAG = ''
-- lexers.STYLE_TYPE = ''
-- lexers.STYLE_VARIABLE = ''
-- lexers.STYLE_WHITESPACE = ''

-- lexers.STYLE_LINENUMBER = 'fore:#666666'
lexers.STYLE_LINENUMBER = 'fore:#222222'
lexers.STYLE_LINENUMBER_CURSOR = lexers.STYLE_LINENUMBER
-- lexers.STYLE_CURSOR = 'back:#888888'
lexers.STYLE_CURSOR = 'fore:black,back:#888888'
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR
-- lexers.STYLE_CURSOR_PRIMARY = 'fore:white,back:#0000c0,bold'
-- lexers.STYLE_CURSOR_LINE = 'back:#444444'
-- lexers.STYLE_CURSOR_LINE = 'fore:black,back:white'
lexers.STYLE_CURSOR_LINE = lexers.STYLE_STRING
lexers.STYLE_COLOR_COLUMN = lexers.STYLE_COMMENT
lexers.STYLE_SELECTION = 'fore:black,back:white'
lexers.STYLE_STATUS = 'fore:#6b6b6b,back:#242424'
lexers.STYLE_STATUS_FOCUSED = lexers.STYLE_STATUS
-- lexers.STYLE_SEPARATOR = ''
-- lexers.STYLE_INFO = ''
lexers.STYLE_EOF = lexers.STYLE_LINENUMBER

lexers.STYLE_LINK = ''
lexers.STYLE_LIST = ''
lexers.STYLE_CODE = lexers.STYLE_STRING
