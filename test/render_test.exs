defmodule ExAdminTest.Render do
  use ExUnit.Case, async: true
  alias ExAdmin.Render

  test "string" do
    assert Render.to_string("test") == "test"
  end

  test "integer" do
    assert Render.to_string(123) == "123"
  end

  test "float" do
    assert Render.to_string(10.99) == "10.99"
  end

  test "atom" do
    assert Render.to_string(:test) == "test"
  end

  test "list" do
    assert Render.to_string([:one, :two]) == ~s/["one","two"]/
  end

  test "map" do
    assert Render.to_string(%{one: 1, two: 2}) == ~s/{"one":1,"two":2}/
  end

  test "Decimal" do
    assert Render.to_string(Decimal.new(10.99)) == "10.99"
  end

  test "Date" do
    assert Render.to_string(~D[2016-10-10]) == "2016-10-10"
  end

  test "Time" do
    assert Render.to_string(~T[15:30:00]) == "15:30:00"
  end

  test "DateTime" do
    dt = DateTime.from_unix!(1_464_096_368)
    result = Render.to_string(dt)
    assert String.starts_with?(result, "2016-05-24 ")
    assert String.ends_with?(result, ":26:08")
  end
end
