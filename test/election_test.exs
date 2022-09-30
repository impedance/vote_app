defmodule ElectionTest do
  use ExUnit.Case
  doctest Election

  setup do
    %{election: %Election{}}
  end

  test "updating election name from a command", context do
    command = "name Will Ferrell"
    election = Election.update(context.election, command)
    assert election == %Election{name: "Will Ferrell"}
  end

  test "adding a new candidate from a command", context do
    command = "add Tuna Fei"
    election = Election.update(context.election, command)

    assert election == %Election{
             candidates: [%Candidate{name: "Tuna Fei", id: 1, votes: 0}],
             next_id: 2
           }
  end

  test "voting for a candidate from a command", context do
    election = Election.update(context.election, "add Tuna Fei")
    candidate_id = List.first(election.candidates).id
    Election.update(election, "vote #{candidate_id}")
  end

  # test "invalid command", context do
  #   command = "here"
  #   Election.update(context.election, command)
  # end

  test "quitting the app" do
    command = "q"
    Election.update(%{}, command)
  end
end
