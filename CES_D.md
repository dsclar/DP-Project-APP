Testing the power of predictive modeling on stuctured measures of clinical depression
========================================================
author: ACRL
date: Tue Jun 16 17:45:47 2015

First Slide
========================================================

For more details on authoring R presentations click the
**Help** button on the toolbar.

- Bullet 1
- Bullet 2
- Bullet 3

Slide 1: Building the simulated dataset.
========================================================

 
No dataset with real data from patients was available even on Center for Disease control.
The Questionnaire used was CES-D (Radloff, 1977).
The random binomial function was used to build the simulated dataset. 
Negative values were entered for the positive attributes (questions 4, 8, 12, and 16) of the questionnaire. 



```r
setwd("C:/Users/Anne-Catherine/Documents/Data Products/DP-Project")
library(dplyr)
set.seed(100)
Questions=c("bother", "poor_appetite", "get_off_blue", "good_as_others", "pb_focusing", "depressed",
            "effortful", "hopeful", "failure", "fearful", "restless_sleep", "happy", "less_talk", "lonely",
            "unfriendly_people", "enjoy_life", "crying", "sad", "disliked", "no_get_going")

a=lapply(Questions, function(x) x=rbinom(1000, size= 3, prob=.45))
df_CES_D=data.frame(a)
colnames(df_CES_D)= c(Questions)
df_CES_D[c(4, 8, 12, 16)]=df_CES_D[c(4, 8, 12, 16)]-3
```
Creating new variable "Score_D": "Score_D" results from the sum of the 20 questions. 
If Score_D is greater than 16 total points, the individual was categorized as "depressed" (1).Less than 16, "non-depressed" (0). A new variable "Status" was created.   

```r
sumB=apply(df_CES_D, 1, sum)
df_CES_D=mutate(df_CES_D, Score_D=sumB)
Status=ifelse(df_CES_D$Score_D > 16, 1, 0)
df_CES_D=mutate(df_CES_D, Status=Status)
ndep=sum(df_CES_D$Status)
```
Testing the difference in score between the two groups "depressed" and "non-depressed" in "Status" variable using t-test.

```r
Mean_Status=t.test(Score_D~Status, data=df_CES_D)$estimate[2] - t.test(Score_D~Status, data=df_CES_D)$estimate[1]
P_value_Status=t.test(Score_D~Status, data=df_CES_D)$p.value
```











```
Error in eval(expr, envir, enclos) : object 'P_value' not found
```
