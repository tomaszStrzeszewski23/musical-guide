# frozen_string_literal: true

class ExpectationError < StandardError; end

# Add your code here
class Assert
  def self.assert_equal(expected, &actual)
    given_value = actual.call
    if expected == given_value
      puts color_message(green, 'ok')
    else
      puts color_message(red, "Expected #{given_value} to be equal to #{expected}")
    end
  end

  def self.assert_error(expected, &actual)
    actual.call
  rescue StandardError => e
    if e.message == expected.to_s
      puts color_message(green, 'ok')
    else
      puts color_message(red, "Expected #{expected} to be raised, but instead got #{e.message}")
    end
  end

  def self.color_message(color_code, message)
    "\e[#{color_code}m#{message}\e[0m"
  end

  def self.red
    31
  end

  def self.green
    32
  end
end
