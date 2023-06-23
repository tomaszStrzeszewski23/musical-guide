# frozen_string_literal: true

require_relative './test_helper'
require_relative './../lib/map'
require_relative './../lib/cursor'

cursor = Cursor.new
map = Map.new(5, 5)
puts map

def test_map(map)
  Assert.assert_equal(false) { map.nil? }
  Assert.assert_equal(5) { map.height }
  Assert.assert_equal(5) { map.width }
end

def test_moves(map)
  Assert.assert_equal(1) do
    map.move(:right)
    map.cursor.x
  end

  Assert.assert_equal(1) do
    map.move(:down)
    map.cursor.y
  end

  map.cursor.x = 2
  map.cursor.y = 2

  Assert.assert_equal(1) do
    map.move(:up)
    map.cursor.y
  end

  Assert.assert_equal(1) do
    map.move(:left)
    map.cursor.x
  end
end

def test_cursor(cursor)
  Assert.assert_equal(0) { cursor.x }
  Assert.assert_equal(0) { cursor.x }
end

def test_invalid_cases(map)
  map.cursor.x = 0
  Assert.assert_error(RangeError){map.move(:left)}
  map.cursor.x = 4
  Assert.assert_error(RangeError){map.move(:right)}

  map.cursor.y = 4
  Assert.assert_error(RangeError){map.move(:down)}
  map.cursor.y = 0
  Assert.assert_error(RangeError){map.move(:up)}

  Assert.assert_error(ArgumentError){map.move(:nowhere)}
end


test_cursor(cursor)
test_map(map)
test_moves(map)
test_invalid_cases(map)
