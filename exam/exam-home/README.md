# 524/424 Final Exam: Take-Home Portion

## Admin

### Optional

As discussed in class, this portion of the exam is **optional**. If you choose not to submit this portion, your grade for the final-exam will be based solely on the in-class portion. If you submit this exam, it will count for 25% of your final-exam grade.

### Academic honesty

You **are not** allowed to work with anyone else. Working with *anyone* else will be considered cheating. You will receive a zero for **both** parts of the final exam and will fail the class.

You *can* use online materials (including ChatGPT and Copilot), books, notes, solutions, *etc*. However, you still must put all of your answers **in your own words**. Copying other people's (and chatbots') words is also considered cheating.

Ngan and Ed **will not** help you debug your code. Please do not ask.

### Instructions

**Due** Upload your answers to [Canvas](https://canvas.uoregon.edu/) *before* 10:15 **am** (Pacific) on Friday, 14 June 2024.

**Important** You **must** submit your answers as an HTML or PDF file, built from an RMarkdown (`.RMD`) or Quarto (`.qmd`) file (you can also submit a link to an HTML page if you prefer that route).

## Prompts

Let's end where we began: [predicting house prices](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/) (as we did in the first two problem sets). Specifically, let's see if you can beat your old score using all of your fancy new prediction knowledge and ML skills.

## Getting started

**[01]** (10 points) **Visualize** Make sure you remember all of the variables in the dataset. Once you understand/recall the variables: Create three visualizations of the data that show some interesting insights. These figures should be publication quality: well labeled, aesthetically pleasing, and insightful.

*Why?* Visualization is good practice—you should always visualize your data before and after analyzing it. Start the exam by making a few figures to understand the data. You can always make better figures after you finish the other steps.

**[02]** (10 points) **Better regression?** In the past we used fairly simplistic imputation approaches for missing data. This time, use a more "sophisticated" approach for imputation. Then run a your original regression model. Predict onto the test set and and report your score.

*Questions:*

- Did the fancier imputation approach improve your model?
- Why would "better" imputation matter?

**[03]** (10 points) **Better-er regression?** Repeat **[02]** but this time use a lasso regression model. Report your score.

*Questions:*

- Did this approach improve your model?
- Did the lasso model choose similar variables to your OLS model?

**[04]** (10 points) **Going nonlinear?** Now use a random forest for the prediction. You need to tune it. Also: Keep the variable importance scores.

*Questions:*

- Which hyperparameters did you tune?
- Did the random forest beat your penalized regression model? Report your score.
- Did the variable importance from the random forest match the variables chosen by your penalized regression model?

**[05]** (10 points) **Summary** Answer the following questions:

- Which model performed best?
- Would you say the "best" model is *significantly* better than the other models? Explain your answer.
- What could make your model better?

**[Bonus]** (Optional; 5 points) Use a (tuned) boosted tree model. Report your score and compare it to the other models.