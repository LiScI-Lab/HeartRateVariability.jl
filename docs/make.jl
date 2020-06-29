using Documenter, HeartRateVariability

makedocs(sitename = "HeartRateVariability.jl",
         authors = "Jasmin Walter",
         pages = [
                  "Introduction" => "introduction.md",
                  "Installation" => "installation.md",
                  "Quick Start" => "quickstart.md",
                   "API" => "index.md",
                   "License" => "LICENSE.md"
                  ],
          )

deploydocs(
    repo = "github.com/LiScI-Lab/HeartRateVariability.jl.git",
)
