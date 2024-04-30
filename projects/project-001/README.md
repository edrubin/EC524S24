# Prediction

**Due 04 May 2024 by 11:59 PM (Pacific)**

With your fancy new ML tools, we are going to return to the problem of predicting housing-sales prices that you saw in the [first problem set](projects/project-000).

## Help!

In addition to the lab materials, lecture notes, and books, don't forget that we also have a bunhc of Kaggle notebooks that could help:

- [An introduction to preprocessing with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing). (Kaggle notebook)
- [An introduction to modeling with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-modeling). (Kaggle notebook)
- [An introduction to resampling, model tuning, and workflows with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-resampling) (Kaggle notebook)
- [Introduction to `tidymodels`: Follow up for Kaggle](https://www.kaggle.com/edwardarubin/intro-tidymodels-split-kaggle)

You can always look at [what other people have done on Kaggle](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/code?competitionId=5407&language=R&excludeNonAccessedDatasources=true).

Some of the examples from last time might be useful:

- I put together a very [simple example of a Kaggle notebook](https://www.kaggle.com/edwardarubin/project-000-example).
- Connor Lennon has a [helpful guide to Kaggle competitions](https://rpubs.com/Clennon/KagNotes). Some of it uses stuff we haven't seen in our course **yet**.

## Getting started

0. (*Optional*) Form a small group (1 or 2 people).
1. Refresh your knowledge about [the competition](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/)
2. Open a notebook (or maybe an `R` script, `.rmd`, or `.qmd` if you're working on your own computer). I recommend you try a Kaggle notebook because we will be using them throughout the quarter. But it's your choice.
   - If you're working with a notebook on Kaggle: Sign in, start a new notebook (use the *Notebooks* tab in the competition), and make sure the folder `house-price-advanced-regression-techniques` shows up in your `input` folder. You access the `input` directory using `"../input"`.
   - If you want to work on your own computer: [Download the data](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data) (Search the page for "Download All").
3. Load `train.csv` and `test.csv` datasets into R. Remember that the competition's [website describes variables](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data).

## Cross validation and model selection

4. Choose your best two models from last time. If you don't like your old ones, it's find to come up with new ones.
5. Use 5-fold cross validation to estimate the out-of-sample performance (RMSE) of your two models. *Remember:* [Kaggle is using root mean squared error](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/overview/evaluation) of the logged prices.
6. Use a model-selection approach (e.g., forward stepwise selection) to "pick" a model. Give it a bunch of variables and see what happens! 
7. Use 5-fold cross validation to choose the right penalty for a lasso model.
8. [Submit your predictions](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/submit) from your models in 5 (the best model), 6, and 7.
   - *Remember:* Your submission should be a CSV with only an `Id` column and a `SalePrice` column that has your predicted sale price.
   - *Hint:* You can see an example submission file (1) on Kaggle and (2) in the files you downloaded to get the training and testing data.

## Reflection

9. How did you do? For each model, report your (1) TeamName, (2) Rank (#), and (3) Score.
10. How did your predicted out-of-sample MSE (from cross validation) compare to the models' actual performances on the test data?
11. Do you think we are violating any of the "assumptions" of cross validation? Briefly explain your answer.
12. What do you think would improve your models at this point? Explain.

**Each person** should submit (electronically on Canvas) a document with their `R` code for 3–8 and the written answers for 9–12.

Even if you worked in a group, I want you to write your **individual reflections** (questions 8–10). Don't be lazy. Don't copy other people's work.
