install.packages("MASS")

# Load MASS package
library(MASS)

file_path <- "C:\\Users\\lenovo\\Desktop\\data mining\\group_assignment\\StudentPerformanceFactors.csv"

# Read CSV file
data <- read.csv(file_path)
#View(data)
is.numeric(data$Exam_Score)
data$Access_to_Resources <- factor(data$Access_to_Resources, ordered = TRUE)


# Fitting an ordered logistic regression model
model <- polr(data$Access_to_Resources ~ data$Exam_Score, data = data, method = "logistic")

# Ensure that Access_to_Resources is an ordered factor
data$Access_to_Resources <- factor(data$Access_to_Resources, 
                                   levels = c("Low", "Medium", "High"), 
                                   ordered = TRUE)

# Check the structure
str(data$Access_to_Resources)

# Fitting an ordered logistic regression model
model <- polr(Access_to_Resources ~ Exam_Score, data = data, method = "logistic")

# View model summary
summary(model)


# Create a prediction probability map
library(ggplot2)

# Predict the probability of each level
predicted_probs <- predict(model, type = "probs")

# Merge the prediction result with the original data
data$predicted_Low <- predicted_probs[, 1]
data$predicted_Medium <- predicted_probs[, 2]
data$predicted_High <- predicted_probs[, 3]

# Draw a graph
ggplot(data, aes(x = Exam_Score)) +
  geom_line(aes(y = predicted_Low, color = "Low"), size = 1) +
  geom_line(aes(y = predicted_Medium, color = "Medium"), size = 1) +
  geom_line(aes(y = predicted_High, color = "High"), size = 1) +
  labs(title = "Prediction of Access_to_Resources based on Exam_Score",
       x = "Exam_Score", y = "Probability") +
  theme_minimal() +
  scale_color_manual(values = c("Low" = "blue", "Medium" = "orange", "High" = "green"))



library(ggplot2)

ggplot(data, aes(x = Access_to_Resources, y = Exam_Score)) +
  geom_boxplot(outlier.shape = 21, outlier.color = "red") +  # 使异常值可见并标红
    labs(title = "Distribution of test scores at different educational resource levels", x = "Level of educational resources", y = "exam result") +
  theme_minimal()

