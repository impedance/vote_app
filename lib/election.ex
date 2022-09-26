defmodule Election do
    defstruct(
        name: "Mayor",
        candidates: [
            Candidate.new(1, "Will Ferrel"),
            Candidate.new(2, "Kristen Wiig")
        ],
        next_id: 1
    )
end