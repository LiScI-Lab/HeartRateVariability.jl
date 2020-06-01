using Documenter, HRV

makedocs(sitename = "HRV.jl",
         authors = "Jasmin Walter",
         pages = [
                  "Introduction" => "introduction.md",
                  #"Tutorials" => Any[
                  #          "Quick Start" => "tutorials/firstTutorial.md"
                  #                   ],
                   "API" => "index.md"
                  #  "License" => "LICENSE.md"
                  ],
                  # Use clean URLs, unless built as a "local" build
          )

deploydocs(
    repo = "github.com/LiScI-Lab/HRV.jl.git",
)
