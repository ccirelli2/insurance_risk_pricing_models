'Ref: https://towardsdatascience.com/insurance-risk-pricing-tweedie-approach-1d71207268fc

'

#######################################################################
# Import Libraries
#######################################################################

library(statmod)
library(insuranceData)
library(tweedie)
data("dataCar")

######################################################################
# Inspect Data
######################################################################
str(dataCar)
head(dataCar)
hist(dataCar$clm)
hist(dataCar$numclaims)

# Create Train - Test Dataset
num_train = round(0.7 * nrow(dataCar), 0)
train_index <- sample(seq_len(nrow(dataCar)), size=num_train)
train <- dataCar[train_index, ]
test <- dataCar[-train_index, ]
print(paste('Dimensions, train =>', dim(train), 'test => ', dim(test)))


######################################################################
# Select the Optimal Variance Power
######################################################################
'
link.power - Index of power link function, link.power=0 produces a log-link
do.smooth - logical flag. If TRUE (the default), a spline is fitted to 
            the data to smooth the profile likelihood plot. If FALSE, no 
            smoothing is used (and the function is quicker)
do.plot - logical flag. If TRUE, a plot of the profile likelihood is produce. 
           If FALSE (the default), no plot is produced
'
est_p <- tweedie.profile(clm ~ veh_value + veh_body + veh_age + gender + agecat + area,
                         data=train, link.power = 0, do.smooth=TRUE, do.plot=TRUE)

