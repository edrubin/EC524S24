# Trees, ensembles, and imputation

We will start the project in class. It's due by 11:59pm on 28 May 2024.

## Part 0: Data cleaning

0.1\ Use `skimr` to check out the data. We're predicting penguin species in the [`palmerpenguins`](https://allisonhorst.github.io/palmerpenguins/) dataset. How many species do we have? Are they fairly balanced in the data? Why does it matter?

```{r, setup}
# Load packages
library(pacman)
p_load(palmerpenguins, tidymodels)
# Load the penguin data
data('penguins')
```

0.2\ What is imputation?

0.3\ Hopefully you noticed we have some missing data. Let's impute. By hand. Since we're doing it by hand, let's start simply. For categorical variables, you can use the modal class. For numeric, let's use the median.

0.4\ Now let's repeat using `tidymodels`. Make a `recipe` and then `prep` and `bake` it. Check out the objects!

0.5\ How could we be more sophisticated/clever about imputation? Why would it matter?

## Part 1: A short tree

Now we'll grow a (short) tree. By hand. In this section, we're going to focus on the mechanics of growing a tree. We will ignore CV for now.

1.1\ For the moment, let's focus on the possible splits of the `island` variable. There are three islands. How many possible splits are there? 

1.2\ Try each split of `island` and then calculate the split's accuracy, entropy, and gini.

1.3\ Repeat 1.2 but for the `sex` variable.

1.4\ Which variable and split would you make? Why?

1.5\ We would typically want to consider all possible splits for the numeric variables as well. Explain (or code) an approach that would try all of the splits for `bill_length_mm`.

## Part 2: A bigger tree

Now that you know how to grow a tree, we can just let `tidymodels` do it for you. However, we now want to (1) add cross validation and (2) bring our imputation step into the workflow that we're validating. Stick with mode and median imputation.

2.1\ Use `tidymodels` to [grow a tree](https://parsnip.tidymodels.org/reference/decision_tree.html) (actually multiple trees). Remember: We can (need to) *tune* the cost complexity (`cost_complexity`) to try to restrict the tree from overfitting.

2.2\ How did it go? Did the best tree need pruning?

## Part 3: More trees and more randomness

The first "more trees" option that we saw in class was bagging---bootstrap aggregation---where we boostrap our training data and then train a big tree on each of the bootstrapped datasets. Random forests repeat this idea, but they also only let the tree see a random subset of variables at each split.

3.1\ Briefly explain how you could build upon your work in Part 1 to grow a random forest.

3.2\ Now use `tidymodels` to tune (with CV) a [random forest](https://parsnip.tidymodels.org/reference/rand_forest.html). Make sure you tune the relevant parameters (what are they?).

3.3\ Now update your workflow to use "fancier" [approaches](https://recipes.tidymodels.org/reference/) for imputation. Rerun your CV.

3.4\ How does this fancier imputation affect your performance? 

3.5\ Explain why it might be important to include imputation in cross validation (rather than finishing all of the data cleaning before you tune/train/validate).