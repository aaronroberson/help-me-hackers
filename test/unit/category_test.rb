class CategoryTest < Test::Unit::TestCase
  should_have_many :problems
  should_validate_presence_of :name
end