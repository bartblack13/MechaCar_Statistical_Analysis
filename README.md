# MechaCar_Statistical_Analysis
R, R-studio, R-statistics, ggplot

## Linear Regression to Predict MPG (Deliverable 1):
<br>
Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

<br><br>![This is an image]()<br>
**Figure 1: multiple linear regression summary on MechaCar_mpg.csv** 

**1) Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?**

Assuming a 95% significance level, vehicle_length and ground_clearance are the only 2 variables that yield a p-value (Pr(>|t|)) less than 0.05 (2.60e-12 and 5.21e-08, respectively) and therefore, are the only two variables that can definitively reject the null hypothesis that mpg is randomly effected by the variables.  Vehicle_weight is only slightly more than 0.05, falling between low significance (alpha = 0.1) and normal significance (alpha = 0.05), and might be worth including in the prediction model, especially if a higher sample size can be obtained.

**2) Is the slope of the linear model considered to be zero? Why or why not?**

No, the slope of the linear model is not considered to be zero.  The overall p-value of the linear regression analysis, located at the bottom of the summary output, is 5.35e-11, which is much smaller than our assumed significance level of 0.05. Therefore, there is sufficient evidence to reject the null hypothesis (H0), where the H0 is: the slope of the linear model is zero. Rejecting the H0 means that the slope of our linear model is not zero.


**3) Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?**

Yes, the model predicts mpg well.  This is based on the R-squared value of the linear regression analysis, Multiple R-squared:  0.7149.  An R-squared value greater than or equal to 0.7 is considered strong.  However, coming out of medical research, I am used to seeing R-squared values, closer to 1.0 (ex- 0.98), and would like to see a stronger R-squared value.
<br>
I also re-ran the analysis using only vehicle_length, vehicle_weight, and ground_clearance, since those were the variables mentioned above to have low p-values, and the R-squared value dropped to 0.6936, worsening the model.  Therefore the model works better with the other two variables (spoiler_angle and AWD) in use, despite their high p-values.


## Summary Statistics on Suspension Coils (Deliverable 2):

<br><br>![This is an image]()<br>
**Figure 2: total_summary dataframe on Suspension_Coil.csv, with calculated mean, median, variance, and std_dev values**

<br><br>![This is an image]()<br>
**Figure 3: lot_summary dataframe on Suspension_Coil.csv, with calculated mean, median, variance, and std_dev values, and counts of sample per lot (added to show weight of each lot in statistical analysis)**
<br><br>

**The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?**

Across all manufacturing lots, the suspension coils data meets the design specification, with a total variance of 62.3psi (See Figure 2).  However, when looking at the lot specific dataframe (See Figure 3), it is obvious that Lot 3 does not meet the design specification, since it has a variance of 170.3psi, 70% higher than the specification.  Lot 1 and Lot 2 are both well under the 100PSI spec, and therefore, both meet the specification with their variances of 1.0psi and 7.5psi, respectively.

