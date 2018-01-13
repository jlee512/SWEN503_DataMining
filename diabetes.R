# Import libraries
library(s20x)
library(lattice)
library(car)

# Set the working directory
setwd("C:/Users/julia/Documents/Wellington ICT Graduate School/SWEN503/AI and Data Mining/Data Mining")

# Import data
diabetes<-read.csv("diabetes.csv")

# Create Aggregate Object by Class (i.e. diabetes positive or negative)
aggData<-aggregate(.~diabetes$class, diabetes, mean)
print(aggData)
aggData2<-aggregate(.~diabetes$class, diabetes, sd)
print(aggData2)

# Create boxplots and carry out t-test's for all factors to assess whether there is a statistically significant differnce in the mean for those with diabetes and those without
colnames(diabetes)
boxplot(diabetes$pregnant_times~diabetes$class)
title(ylab = "No. of times pregnant", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$plasma_concentration~diabetes$class)
title(ylab = "Plasma Concentration", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$blood_pressure~diabetes$class)
title(ylab = "Blood Pressure", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$skin_fold_thickness~diabetes$class)
title(ylab = "Skin Fold Thickness", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$insulin~diabetes$class)
title(ylab = "Insulin", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$body_mass~diabetes$class)
title(ylab = "Body Mass", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$diabetes_pedigree_function~diabetes$class)
title(ylab = "Diabetes Pedigree Function", xlab = "Diabetes Occurrence", font.lab = 2)
boxplot(diabetes$age~diabetes$class)
title(ylab = "Age", xlab = "Diabetes Occurrence", font.lab = 2)

t.test(diabetes$pregnant_times~diabetes$class)
t.test(diabetes$plasma_concentration~diabetes$class)
t.test(diabetes$blood_pressure~diabetes$class)
t.test(diabetes$skin_fold_thickness~diabetes$class)
t.test(diabetes$insulin~diabetes$class)
t.test(diabetes$body_mass~diabetes$class)
t.test(diabetes$diabetes_pedigree_function~diabetes$class)
t.test(diabetes$age~diabetes$class)

# Scatterplot blood pressure with all other factors 
pairs(diabetes[1:8], main="Scatter Plot Comparing All Combinations of Diabetes Features", pch = 21, bg = c("red", "green3")[unclass(diabetes$class)])
