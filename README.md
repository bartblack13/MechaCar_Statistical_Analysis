# MechaCar_Statistical_Analysis
R, R-studio, R-statistics, ggplot

## Purpose:
The purpose of this project was to begin learning how to use R and R-Studio to graph data and carry out statistical analysis.  This project required that I perform the following:

* Load, clean up, and reshape datasets using tidyverse in R.
* Visualize datasets with basic plots such as line, bar, and scatter plots using ggplot2.
* Generate and interpret more complex plots such as boxplots and heatmaps using ggplot2.
* Plot and identify distribution characteristics of a given dataset.
* Formulate null and alternative hypothesis tests for a given data problem.
* Implement and evaluate simple linear regression and multiple linear regression models for a given dataset.
* Implement and evaluate the one-sample t-Tests, two-sample t-Tests, and analysis of variance (ANOVA) models for a given dataset.
* Implement and evaluate a chi-squared test for a given dataset.
* Identify key characteristics of A/B and A/A testing.
* Determine the most appropriate statistical test for a given hypothesis and dataset.

In order to do this, I focussed my efforts on various datasets from the auto industry.

## Analysis and Results:
### Linear Regression to Predict MPG (Deliverable 1):

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_1.png)<br>
**Figure 1: multiple linear regression summary on MechaCar_mpg.csv.** 

**1) Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?**

Assuming a 95% significance level, vehicle_length and ground_clearance are the only 2 variables that yield a p-value (Pr(>|t|)) less than 0.05 (2.60e-12 and 5.21e-08, respectively) and therefore, are the only two variables that can definitively reject the null hypothesis that mpg is randomly effected by the variables.  Vehicle_weight is only slightly more than 0.05, falling between low significance (alpha = 0.1) and normal significance (alpha = 0.05), and might be worth including in the prediction model, especially if a higher sample size can be obtained.

**2) Is the slope of the linear model considered to be zero? Why or why not?**

No, the slope of the linear model is not considered to be zero.  The overall p-value of the linear regression analysis, located at the bottom of the summary output, is 5.35e-11, which is much smaller than our assumed significance level of 0.05. Therefore, there is sufficient evidence to reject the null hypothesis (H0), where the H0 is: the slope of the linear model is zero. Rejecting the H0 means that the slope of our linear model is not zero.


**3) Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?**

Yes, the model predicts mpg well.  This is based on the R-squared value of the linear regression analysis, Multiple R-squared:  0.7149.  An R-squared value greater than or equal to 0.7 is considered strong.  However, coming out of medical research, I am used to seeing R-squared values, closer to 1.0 (ex- 0.98), and would like to see a stronger R-squared value.
<br>
I also re-ran the analysis using only vehicle_length, vehicle_weight, and ground_clearance, since those were the variables mentioned above to have low p-values, and the R-squared value dropped to 0.6936, worsening the model.  Therefore the model works better with the other two variables (spoiler_angle and AWD) in use, despite their high p-values.


### Summary Statistics on Suspension Coils (Deliverable 2):

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_2_1.png)<br>
**Figure 2: total_summary dataframe on Suspension_Coil.csv, with calculated mean, median, variance, and std_dev values.**

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_2_2.png)<br>
**Figure 3: lot_summary dataframe on Suspension_Coil.csv, with calculated mean, median, variance, and std_dev values, and counts of sample per lot (added to show weight of each lot in statistical analysis).**
<br><br>

**The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?**

Across all manufacturing lots, the suspension coils data meets the design specification, with a total variance of 62.3psi (See Figure 2).  However, when looking at the lot specific dataframe (See Figure 3), it is obvious that Lot 3 does not meet the design specification, since it has a variance of 170.3psi, 70% higher than the specification.  Lot 1 and Lot 2 are both well under the 100PSI spec, and therefore, both meet the specification with their variances of 1.0psi and 7.5psi, respectively.

### T-Tests on Suspension Coils (Deliverable 3):

One-sample t-tests were performed on the entire Suspension_Coil sample set to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.  Then, using the subset() function, I selected only samples from each lot: Lot1, Lot2, and Lot3, and compared each lot's PSI datapoints to the population mean of 1,500 pounds per square inch, as above.  In each t-test script, mu is set to 1500 as the defined population mean.

**All lots**
The t-test for all lots (See Figure 4) produced a p-value of 0.06028.  Given a 95% significance level, and since 0.06028 > 0.05, we **fail to reject** the null hypothesis that there is no statistical difference between the observed sample mean and its population mean. In other words, the mean PSI across the entire sample set **is statistically similar** to the population mean.

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_3_1.png)<br>
**Figure 4: One-sample t-test on all Suspension_Coil.csv samples, where the mean PSI is tested against a defined population mean of 1,500psi.**
<br><br>

**Lot1**
The t-test for Lot1 (See Figure 5) produced a p-value of 1.0.  Given a 95% significance level, and since 1.0 > 0.05, we **fail to reject** the null hypothesis that there is no statistical difference between the observed sample mean of Lot1 and its population mean. In other words, the mean PSI across the Lot1 sample set **is statistically similar** to the population mean.  This can also be confirmed by looking at the lot_summary dataframe (See Figure 3), where the mean of Lot1 is 1500.00, the same as the defined population mean of 1500.

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_3_2.png)<br>
**Figure 5: One-sample t-test on only Lot1 Suspension_Coil.csv samples, where the mean PSI of Lot1 is tested against a defined population mean of 1,500psi.**
<br><br>

**Lot2**
The t-test for Lot2 (See Figure 6) produced a p-value of 0.6072.  Given a 95% significance level, and since 0.6072 > 0.05, we again **fail to reject** the null hypothesis that there is no statistical difference between the observed sample mean of Lot2 and its population mean. In other words, the mean PSI across the Lot2 sample set **is statistically similar** to the population mean.  This is similarly confirmed in the lot_summary dataframe (See Figure 3), where the mean of Lot2 is 1500.20, only slightly different than the defined population mean of 1500.

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_3_3.png)<br>
**Figure 6: One-sample t-test on only Lot2 Suspension_Coil.csv samples, where the mean PSI of Lot2 is tested against a defined population mean of 1,500psi.**
<br><br>

**Lot3**
The t-test for Lot3 (See Figure 7) produced a p-value of 0.04168.  Given a 95% significance level, and since 0.04168 < 0.05, we **can reject** the null hypothesis that there is no statistical difference between the observed sample mean of Lot3 and its population mean. In other words, the mean PSI across the Lot3 sample set **is not statistically similar** to the population mean.  Once again looking at the lot_summary dataframe (See Figure 3), we see that the mean of Lot3 is 1496.14, which is different than the defined population mean of 1500.  At a glance, this differnce might not seem significant, but the t-test indicates that it is statitically different.

<br><br>![This is an image](https://github.com/bartblack13/MechaCar_Statistical_Analysis/blob/main/Resources/Deliverable_3_4.png)<br>
**Figure 7: One-sample t-test on only Lot3 Suspension_Coil.csv samples, where the mean PSI of Lot3 is tested against a defined population mean of 1,500psi.**
<br><br>

### Study Design: MechaCar vs Competition (Deliverable 4):
Write a short description of a statistical study that can quantify how the MechaCar performs against the competition.

**What metric or metrics are you going to test?**<br>
Price, city fuel efficiency, highway fuel efficiency, horsepower, and safety rating<br>

**What is the null hypothesis or alternative hypothesis?**<br>
Null hypothesis (H0): There is no difference among group means.<br>
Alternate hypothesis (Ha): At least one group differs significantly from the overall mean of the dependent variable.<br>


**What statistical test would you use to test the hypothesis? And why?**<br>
A one-way ANOVA test, followed by a TukeyHSD (Tukey’s Honestly-Significant Difference) post-hoc test.  The ANOVA test would compare means of categorical independent variables (car type) against the overall means of the dependent variable (city fuel efficiency or horsepower). A significant p-value (p < 0.05) would reject the null Hypothesis and indicate that there is a significant difference between car type and fuel efficiency, for example.  The TukeyHSD test, would then perform pairwise comparisons between each group (car), and give p-values of each comparison.  This would show specifically the level of significant difference between the MechaCar prototype and each of the competition cars.  The two tests would have to be re-run for each dependent variable (price, saftey rating, etc.)<br>

**What data is needed to run the statistical test?**<br>
This set of tests would need data that has at minimum 3 different car types for the categorical independent variable, and it would also need numerical dependent values as columns.  The data for all cars across all metrics would need to be in a single dataframe.
<br>

