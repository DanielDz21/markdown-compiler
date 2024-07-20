require 'minitest/autorun'

class TokenizerSpec < Minitest::Test
  def setup
    @tokenizer = Tokenizer.new
  end

  def test_simple
    tokens = @tokenizer.tokenize('Hi')
    assert_equal tokens.first.type, 'TEXT'
    assert_equal tokens.first.value, 'Hi'
  end

  def test_underscore
    tokens = @tokenizer.tokenize('_Hi_')
    assert_equal tokens.first.type, 'UNDERSCORE'
    assert_equal tokens.first.value, '_'

    assert_equal tokens.second.type, 'TEXT'
    assert_equal tokens.second.value, 'Hi'

    assert_equal tokens.third.type, 'UNDERSCORE'
    assert_equal tokens.third.value, '_'
  end

  def test_star
    tokens = @tokenizer.tokenize('*Hi*')
    assert_equal tokens.first.type, 'STAR'
    assert_equal tokens.first.value, '*'

    assert_equal tokens.second.type, 'TEXT'
    assert_equal tokens.second.value, 'Hi'

    assert_equal tokens.third.type, 'STAR'
    assert_equal tokens.third.value, '*'
  end

  def test_newline
    tokens = @tokenizer.tokenize("\nHi\n")
    assert_equal tokens.first.type, 'NEWLINE'
    assert_equal tokens.first.value, "\n"

    assert_equal tokens.second.type, 'TEXT'
    assert_equal tokens.second.value, 'Hi'

    assert_equal tokens.third.type, 'NEWLINE'
    assert_equal tokens.third.value, "\n"
  end
end
