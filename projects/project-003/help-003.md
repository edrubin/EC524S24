# Trees, ensembles, and imputation

## Part 0: Data cleaning

0.1\ Use `skimr` to check out the data. We're predicting penguin species in the [`palmerpenguins`](https://allisonhorst.github.io/palmerpenguins/) dataset. How many species do we have? Are they fairly balanced in the data? Why does it matter?

```{r, 01-setup}
# Load packages
library(pacman)
p_load(palmerpenguins, collapse, tidymodels)
# Load the penguin data
data('penguins')
```

0.2\ What is imputation?

0.3\ Hopefully you noticed we have some missing data. Let's impute. By hand. Since we're doing it by hand, let's start simply. For categorical variables, you can use the modal class. For numeric, let's use the median.

```{r, 03-answer}
# Find the mode of 'sex'
mode_index = penguins$sex |> table() |> which.max()
mode_sex = mode_index |> names()
# Find the penguins with NA for 'sex'
na_sex = penguins$sex |> is.na() |> which()
penguins$sex[na_sex] = mode_sex
```

*Note:* It would have been easier to just use `fmode()` from the `collapse` package. But now you have options.

0.4\ Now let's repeat using `tidymodels`. Make a `recipe` and then `prep` and `bake` it. Check out the objects!

```{r, 04-answer}
# Reload data
data(penguins)
# Define recipe
basic_recipe =
  recipe(species ~ ., data = penguins) |>
  step_impute_mode(all_nominal_predictors()) |>
  step_impute_median(all_numeric_predictors())
# Prep and bake
basic_prep = basic_recipe |> prep()
basic_bake = basic_prep |> bake(new_data = NULL)
```

0.5\ How could we be more sophisticated/clever about imputation? Why would it matter?

## Part 1: A short tree

Now we'll grow a (short) tree. By hand. In this section, we're going to focus on the mechanics of growing a tree. We will ignore CV for now.

1.1\ For the moment, let's focus on the possible splits of the `island` variable. There are three islands. How many possible splits are there? 

3

- A v BC
- B v AC
- C v AB

1.2\ Try each split of `island` and then calculate the split's accuracy, entropy, and gini.

```{r, 12-answer}
# Find the islands
islands = penguins$island |> unique()
# Example: Biscoe
lapply(X = islands, FUN = function(i) {
  # Split into Biscoe and not Biscoe
  grp1 = penguins |> filter(island == i)
  grp2 = penguins |> filter(island != i)
  # Find the modal species in each group
  species1 = grp1$species |> fmode()
  species2 = grp2$species |> fmode()
  # Calculate accuracy
  fmean(grp1$species == species1)
  fmean(grp2$species == species2)
  # Calculate gini
  g1 = grp1$species |> table() |> prop.table()
  g2 = grp2$species |> table() |> prop.table()
  gini1 = sum(g1 * (1 - g1))
  gini2 = sum(g2 * (1 - g2))
  (gini1 + gini2)/2
})
```

1.3\ Repeat 1.2 but for the `sex` variable.

1.4\ Which variable and split would you make? Why?

1.5\ We would typically want to consider all possible splits for the numeric variables as well. Explain (or code) an approach that would try all of the splits for `bill_length_mm`.