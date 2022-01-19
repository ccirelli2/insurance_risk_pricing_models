
library(insuranceData)
library(tweedie)
data("dataCar")

# Create Train - Test Dataset
num_train = round(0.7 * nrow(dataCar), 0)
train_index <- sample(seq_len(nrow(dataCar)), size=num_train)
train <- dataCar[train_index, ]
test <- dataCar[-train_index, ]
