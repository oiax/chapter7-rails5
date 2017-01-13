require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  def setup
    @members = [
      FactoryGirl.create(:member, name: "xa", full_name: "x ab", number: 1),
      FactoryGirl.create(:member, name: "yy", full_name: "yy ab", number: 2),
      FactoryGirl.create(:member, name: "bb", full_name: "z bb", number: 3)
    ]
  end

  test "match all" do
    results = Member.search("b")
    assert_equal 3, results.length
  end

  test "no results" do
    results = Member.search("c")
    assert_equal 0, results.length
  end

  test "search by name" do
    results = Member.search("xa")
    assert_equal 1, results.length
    assert_equal @members[0], results[0]
  end

  test "search by name or full_name" do
    results = Member.search("a")
    assert_equal 2, results.length
    assert_equal @members[0], results[0]
    assert_equal @members[1], results[1]
  end
end
