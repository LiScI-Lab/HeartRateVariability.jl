using Documenter, HRV

makedocs(modules=[HRV],
         clean = false,
         format = :html,
         sitename = "HRV.jl",
         authors = "Jasmin Walter",
         pages = [
                  #"Introduction" => "index.md",
                  #"Tutorials" => Any[
                  #          "Quick Start" => "tutorials/firstTutorial.md"
                  #                   ],
                   "API" => "index.md"
                  #  "License" => "LICENSE.md"
                  ],
                  # Use clean URLs, unless built as a "local" build
          html_prettyurls = !("local" in ARGS),
          html_canonical = "https://LiScI-Lab.github.io/HRV.jl/stable/",
         )
         
deploydocs(
    repo = "github.com/LiScI-Lab/HRV.jl.git",
)
