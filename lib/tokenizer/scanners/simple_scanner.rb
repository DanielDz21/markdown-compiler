class SimpleScanner
  TOKEN_TYPES = [
    '_' => 'UNDERSCORE',
    '*' => 'STAR',
    "\n" => 'NEWLINE'
  ].freeze

  def self.from_string(plain_markdown)
    char = plain_markdown[0]
    Token.new(TOKEN_TYPES[char], char)
  rescue InvalidTokenError
    Token.null
  end
end
