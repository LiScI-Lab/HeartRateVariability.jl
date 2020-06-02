using Documenter, HRV

makedocs(sitename = "HRV.jl",
         authors = "Jasmin Walter",
         pages = [
                  "Introduction" => "introduction.md",
                  "Installation" => "install.md",
                  "Quick Start" => "quickstart.md",
                   "API" => "index.md",
                   "License" => "LICENSE.md"
                  ],
          )

deploydocs(
    repo = "github.com/LiScI-Lab/HRV.jl.git",
)
