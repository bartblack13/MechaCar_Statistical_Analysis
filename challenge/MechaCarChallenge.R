library(dplyr)

# Deliverable 1
# ------------------------
mechacar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names = F, stringsAsFactors = F)

# multiple linear regression
# lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg)
# summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg))
summary(lm(mpg ~ vehicle_length + vehicle_weight + ground_clearance, data=mechacar_mpg))


# Deliverable 2
# ------------------------
susp_coil <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
total_summary <- susp_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI),lot_count=n())


# Deliverable 3
# ------------------------

# test if PSI across all manufacturing lots is statistically different from the population mean of 1500psi (mu)  
t.test(susp_coil$PSI,mu=1500)

# test Lot1 against population mean of mu=1500
t.test(subset(susp_coil$PSI,susp_coil$Manufacturing_Lot == 'Lot1'), mu=1500)

# test Lot2 against population mean of mu=1500
t.test(subset(susp_coil$PSI,susp_coil$Manufacturing_Lot == 'Lot2'), mu=1500)

# test Lot3 against population mean of mu=1500
t.test(subset(susp_coil$PSI,susp_coil$Manufacturing_Lot == 'Lot3'), mu=1500)
