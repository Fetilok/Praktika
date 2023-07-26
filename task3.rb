require 'test/unit'
require "./f1/task2"

class TestPerson < Test::Unit::TestCase
  def setup
    @person = Person.new("John Doe", 30)
  end

  def test_name
    assert_equal("John Doe", @person.name)
  end

  def test_age
    assert_equal(30, @person.age)
  end

  def test_to_s
    assert_equal("Name: John Doe, Age: 30", @person.to_s)
  end
end

class TestPersonRepository < Test::Unit::TestCase
  def setup
    @repository = PersonRepository.new
    @person1 = Person.new("John Doe", 30)
    @person2 = Person.new("Jane Smith", 25)
  end

  def test_add_person
    @repository.add_person(@person1)
    @repository.add_person(@person2)

    assert_equal([@person1, @person2], @repository.get_all_persons)
  end

  def test_get_all_persons
    @repository.add_person(@person1)
    @repository.add_person(@person2)

    assert_equal([@person1, @person2], @repository.get_all_persons)
  end
end