# Organizing an R Markdown data analysis project

R has a conventional [folder structure](http://r-pkgs.had.co.nz/package.html#package-structure) for developing packages, but it is not necessarily convenient for a data analysis project. These are the guidelines I follow instead.

```
├── data
│   ├── raw
│   └── working
├── notebooks
│   └── *.Rmd
├── output
├── R
│   └── *.R
├── tests
│   └── *.R
└── [docs]
```

### 1. Keep a folder of all the raw data in original form and never modify it

All original data is saved to `data/raw/` exactly as received from the source. Once changes are made, the files go in a different folder such as `data/working/`. This ensures that the entire process can be reproduced from the original state of the data.

### 2. Don't edit data by hand, write code instead

Changes made by hand are harder to remember and reproduce. Write code to do all the work, and make sure the output files are written to new folders like `data/working/` (for intermediate files) and `output/` (for final tidy datasets).

### 3. Write all the code in R Markdown documents

Keep a directory of documents that run your analysis. R Markdown documents are useful because you can convert them into PDF or HTML files that are very easy to read and share with others. If all the code is kept in `.R` scripts, a collaborator has to actually run the code to see what the output is, but R Markdown documents can display the output alongside the code. See the example [`notebooks/ex_analysis.Rmd`][1].

[1]: notebooks/ex_analysis.md

### 4. Write your code so it is as readable as possible

R Markdown allows you to write code in a format that is meant to be read. To make it as easy as possible to follow, use a predictable format.

- Write functions that carry out discrete steps of the analysis and arrange them in the order they are called
- Write each step so that it takes the full dataset as input, modifies it, and returns it
- Write a function that composes all the steps together (this function can be placed at the top, before the steps, in order to introduce the overall process)
- Write code that loads the data and runs the pipeline

An example of this format is in [`notebooks/ex_analysis.Rmd`][1]. The goal is to present the reader with an overview at the beginning, fully explain the steps in the middle, and restrict all side effects (file I/O, assigning global variables) to the end.

### 5. If needed, write helper functions, but *only do this if it improves the readability of the analysis*.

Sometimes it makes sense to write code in separate files and load them to your analysis notebook with `source()`. These functions can be stored in their own directory `R/`. Writing a helper function only makes sense if the helper function is easy to remember, easy to think about, and unrelated to your actual dataset:

- Write helper functions that you can easily understand and remember without having to consult source code. This could be some math, applying a filter, sorting data, etc.
- Write functions that will be easy to reason about. The best strategy is to write pure functions, which always return the same thing when given the same inputs, and never produce side-effects like new files or changes to global variables.
- Don't write helpers that depend on the names of your data columns or other ways you format your data, since these details tend to change.

See the example [`R/ex_std_error.R`](R/ex_std_error.R).

### 6. Write tests

Write tests that can be loaded with `source()` and run at the end of the analysis notebooks.

### 7. Document

Analysis notebooks should be (in theory) extremely readable and comprehensive, but it may help to keep a high-level summary of the project in one central document. R Markdown is great for writing documentation, too, because it can easily be converted to a PDF.

## Notes

To use this project as a template, you can either [create a GitHub repo](https://github.com/ngriffiths21/rmd-analysis-template/generate) or clone it locally (`git clone https://github.com/ngriffiths21/rmd-analysis-template.git`).

## References

1. https://r4ds.had.co.nz/r-markdown-workflow.html

## License

[MIT](https://choosealicense.com/licenses/mit/)
