# R Markdown Analysis Template

Template repo for R data analysis projects using R Markdown.

## How to use it

```
├── data
│   ├── raw
│   └── working
├── notebooks
|   └── *.Rmd
├── output
├── R
|   └── *.R
├── tests
|   └── *.R
└── [docs]
```

### Organize your data

Save original data in `data/raw` exactly as received from the source. Once you start making changes, put them in `data/working`.

Make sure your code writes its output to either `data/working` (for intermediate files) or `output` (for final tidy datasets).

### Write R code

Write code directly in R Markdown documents saved in `notebooks`. See the example [`notebooks/ex_analysis.html`](notebooks/ex_analysis.html) for ideas on how to format these documents.

If needed, write helper functions and save them to separate files in the `R` directory, but *only do this if it improves the readability of the analysis*. Writing a helper function only makes sense if the helper function:

- Will accomplish something you can easily understand and remember without having to consult source code (it does some math, applies a filter, sorts data, etc)
- Will be pure (its output only depends on inputs, making it even easier to reason about)
- Will not depend on the names of your data columns or other ways you format your data (since these details tend to change)

Write tests that you can source and run at the end of your analysis notebooks, and save these in `tests`.

### Document

Analysis notebooks should be (in theory) extremely readable and comprehensive, but it may help to keep a high-level summary of the project in one central document. Write up documentation in R Markdown (for easy PDF creation) and save it in `docs`.