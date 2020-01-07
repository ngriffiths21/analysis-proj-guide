# Reproducible data analysis projects

These are some guidelines I find helpful when working on data analysis projects. I currently use R but the general ideas should apply to any language.

### 1. Keep a folder of all the raw data in original form and never modify it

All original data should be saved to a directory (here, `data/raw/`) exactly as received from the source. Once changes are made, the files go in a different folder (`data/working/`). This ensures that the entire process can be reproduced from the original state of the data.

### 2. Don't edit data by hand, write code instead

Changes made by hand are harder to remember and reproduce. Write code to do all the work, and make sure the output files are written to new folders like `data/working/` (for intermediate files) and `output/` (for final tidy datasets).

### 3. Write all the code in R Markdown documents

Keep a directory of documents that run your analysis. R Markdown documents are useful because you can convert them into PDF or HTML files that are very easy to read and share with others. If all the code is kept in `.R` scripts, a collaborator has to actually run the code to see what the output is, but R Markdown documents can display the output alongside the code. See the example [`notebooks/ex_analysis.Rmd`][1].

[1]: notebooks/ex_analysis.md

### 4. Write your code so it is as readable as possible

R Markdown is designed for sharing code with others by combining code, output and text into a single document. To make it as easy as possible to follow, use a predictable format.

- Write functions that carry out discrete steps of the analysis and arrange them in the order they are called
- Write each step so that it takes the full dataset as input, modifies it, and returns it
- Write a function that composes all the steps together (this function can be placed at the top, before the steps, in order to introduce the overall process)
- Write code that loads the data and runs the pipeline

An example of this format is in [`notebooks/ex_analysis.Rmd`][1]. The goal is to present the reader with an overview at the beginning, fully explain the steps in the middle, and restrict all the side effects (file I/O, assigning global variables) to the end.

Other helpful tips:

- Think carefully about naming functions and variables, since this can have a big impact on readability
- Write short functions that only do one thing (I usually aim for <10 lines)

### 5. If needed, write helper functions (but be careful)

Sometimes it makes sense to write code in separate files and load them to your analysis notebook with `source()`. These functions can be stored in their own directory `R/`. **Only do this when it improves readability**. It should be easy to read the analysis without having to look up the helper function definitions.

- Write helper functions that are easy to understand and remember from their names and the way they are called. They should do just what they say, like `mean(x)` and `colnames(df)`.
- Write functions that will be easy to reason about. The best strategy is to write pure functions, which always return the same thing when given the same inputs, and never produce side-effects like new files or changes to global variables.
- Don't write helpers that depend on the names of your data columns or other ways you format your data, since these details tend to change. Instead of `doSomethingToField1(entiredataframe)`, pass the column you're trying to modify: `doSomething(Field1)`.

See the example [`R/ex_std_error.R`](R/ex_std_error.R).

### 6. Write tests

Write tests that can be loaded with `source()` and run at the end of the analysis notebooks. These can be used to check that your final dataset has the correct number of rows, has columns of the correct type, contains data within expected ranges, etc.

### 7. Document if needed

Analysis notebooks should be (in theory) extremely readable and comprehensive, but you may want to keep a high-level summary of the project in a central document. R Markdown is great for writing documentation, too, because it can easily be converted to a PDF.

### Summary

These guidelines have been a helpful way to ensure that projects are readable, reproducible, and easy to share. The rest of this project is a simple example of how it could look in practice.

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

To use this as a template for a new project, clone the repo (`git clone https://github.com/ngriffiths21/analysis-proj-guide.git`).

## References

1. https://r4ds.had.co.nz/r-markdown-workflow.html
2. https://adv-r.hadley.nz/fp.html

Hadley Wickham's [books](http://hadley.nz/#teaching) are my go-to references on data analysis in R.

## License

[MIT](https://choosealicense.com/licenses/mit/)
