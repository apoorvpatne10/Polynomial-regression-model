# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting linear regression to the dataset
linReg = lm(formula = Salary ~ .,
            data = dataset)

#Fitting polynomial regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
polyReg = lm(formula = Salary ~ .,
             data = dataset)

#Visualizing the linear regression results
library(ggplot2)
ggplot() + 
    geom_point(aes(x = dataset$Level, y = dataset$Salary),
               color = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(linReg, newdata = dataset)),
              color = 'blue') +
    ggtitle('Truth or bluff (Linear regression)') +
    xlab('Level') +
    ylab('Salary')

#Visualizing the polynomial regression results 
ggplot() + 
    geom_point(aes(x = dataset$Level, y = dataset$Salary),
               color = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(polyReg, newdata = dataset)),
              color = 'blue') +
    ggtitle('Truth or bluff (Polynomial regression)') +
    xlab('Level') +
    ylab('Salary')

#Predicting a new result with linear regression 
y_pred = predict(linReg, data.frame(Level = 6.5))

#Predicting a new result with polynomial regression
y_pred = predict(polyReg, data.frame(Level = 6.5,
                                     Level2 = 6.5^2,
                                     Level3 = 6.5^3,
                                     Level4 = 6.5^4))
