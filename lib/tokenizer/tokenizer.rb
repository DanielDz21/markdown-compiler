class Tokenizer
  TOKEN_SCANNERS = [
    SimpleScanner, # Scans for simple tokens (`_` and `*`)
    TextScanner    # Scans for text tokens
  ].freeze

  def tokenize(plain_markdown)
    tokens_array = token_as_array(plain_markdown)
    TokenList.new(tokens_array)
  end

  private

  def token_as_array(plain_markdown)
    if plain_markdown.nil? || plain_markdown.empty?
      return [Token.end_of_file]
    else
      token = scan_one_token(plain_markdown)
      [token] + token_as_array(plain_markdown[token.length..-1])
    end
  end

  def scan_one_token(plain_markdown)
    TOKEN_SCANNERS.each do |scanner|
      token = scanner.from_string(plain_markdown)
      return token unless token.null?
    end

    raise "The scanners could not match the given input: #{plain_markdown}"
  end
end
