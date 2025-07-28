# ===============================
# 📦 Load Required Libraries
# ===============================
# Only install once:
# install.packages(c("DALEX", "caret", "ROCR", "naniar", "rpart.plot", "tidymodels", "yardstick", "randomForest"))

library(DALEX)
library(caret)
library(ROCR)
library(naniar)
library(rpart.plot)
library(tidymodels)
library(yardstick)
library(randomForest)

# ===============================
# 📊 Load and Explore the Data
# ===============================
data("titanic")
str(titanic)

# Remove unnecessary column and handle missing values
titanic <- titanic[, -5]
titanic <- titanic[complete.cases(titanic), ]

# ===============================
# 🔍 Missing Data Visualization
# ===============================
vis_miss(titanic)
gg_miss_var(titanic)
gg_miss_case(titanic)

# ===============================
# 🔄 Data Splitting (80% Train, 20% Test)
# ===============================
set.seed(123)
split <- initial_split(titanic, prop = 0.8)
train_data <- training(split)
test_data  <- testing(split)

# ===============================
# ⚙️ Logistic Regression Model
# ===============================
log_model <- glm(survived ~ ., data = train_data, family = "binomial")
summary(log_model)

# Predict probabilities & classes
log_probs <- predict(log_model, test_data[,-8], type = "response")
log_preds <- ifelse(log_probs > 0.5, "yes", "no")

# Evaluate
log_results <- data.frame(predicted = log_preds, actual = test_data$survived)

conf_mat(log_results, truth = actual, estimate = predicted)
accuracy(log_results, truth = actual, estimate = predicted)
sens(log_results, truth = actual, estimate = predicted)
spec(log_results, truth = actual, estimate = predicted)

# ===============================
# 🌲 Decision Tree with tidymodels
# ===============================
tree_model <- decision_tree() %>%
  set_engine("rpart") %>%
  set_mode("classification")

tree_fit <- tree_model %>%
  fit(survived ~ ., data = train_data)

# Plot the decision tree
rpart.plot(tree_fit$fit, type = 2, extra = 104, fallen.leaves = TRUE,
           box.palette = "Blues", shadow.col = "gray", nn = TRUE,
           main = "Titanic Decision Tree Model")

# Predict and evaluate
tree_preds <- predict(tree_fit, new_data = test_data)$.pred_class

tree_results <- data.frame(predicted = tree_preds, actual = test_data$survived)

conf_mat(tree_results, truth = actual, estimate = predicted)
accuracy(tree_results, truth = actual, estimate = predicted)
sens(tree_results, truth = actual, estimate = predicted)
spec(tree_results, truth = actual, estimate = predicted)

# ===============================
# 🌳 Random Forest Model
# ===============================
# Convert target variable to factor
train_data$survived <- as.factor(train_data$survived)
test_data$survived  <- as.factor(test_data$survived)

# Train Random Forest
set.seed(42)
rf_model <- randomForest(survived ~ ., data = train_data, importance = TRUE, ntree = 500)

# Predict
rf_preds <- predict(rf_model, newdata = test_data)

# Evaluate
rf_results <- data.frame(predicted = rf_preds, actual = test_data$survived)

conf_mat(rf_results, truth = actual, estimate = predicted)
accuracy(rf_results, truth = actual, estimate = predicted)
sens(rf_results, truth = actual, estimate = predicted)
spec(rf_results, truth = actual, estimate = predicted)

# Variable importance plot
varImpPlot(rf_model, main = "Variable Importance - Random Forest")

# ===============================
# 📌 Summary
# ===============================
cat("\n--- Logistic Regression ---\n")
print(accuracy(log_results, truth = actual, estimate = predicted))
cat("\n--- Decision Tree ---\n")
print(accuracy(tree_results, truth = actual, estimate = predicted))
cat("\n--- Random Forest ---\n")
print(accuracy(rf_results, truth = actual, estimate = predicted))
