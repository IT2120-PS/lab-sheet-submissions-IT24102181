# 1. Calculate population mean and variance of the dataset.
laptop_bag_weights <- read.table("LaptopsWeights.txt", header = TRUE)
names(laptop_bag_weights)[names(laptop_bag_weights) == "Weight.kg."] <- "Weight"

laptop_bag_weights_mean <- mean(laptop_bag_weights$Weight)
laptop_bag_weights_variance <- var(laptop_bag_weights$Weight)
cat("The population mean of laptop bag weights is:", laptop_bag_weights_mean, "kg\n")
cat("The population variance of laptop bag weights is:", laptop_bag_weights_variance, "kg²\n")

# 2. Draw 25 random samples of size 6 (with replacement) and calculate the sample mean and sample standard deviation for each sample.
laptop_bag_weights_samples <- matrix(nrow = 6, ncol = 25)

for (i in 1:25) {
  laptop_bag_weights_samples[, i] <- sample(laptop_bag_weights$Weight, 6, replace = TRUE)
}

colnames(laptop_bag_weights_samples) <- paste0(1:25)
laptop_bag_weights_samples_summary <- data.frame(
  Sample = 1:25,
  Mean = apply(laptop_bag_weights_samples, 2, mean),
  Standard_Deviation = apply(laptop_bag_weights_samples, 2, sd)
)
View(laptop_bag_weights_samples_summary)

# 3. Calculate the mean and standard deviation of the 25 sample means
sample_means <- laptop_bag_weights_samples_summary$Mean
sample_means_mean <- mean(sample_means)
sample_means_sd <- sd(sample_means)

cat("The mean of the 25 sample means is:", sample_means_mean, "kg\n")
cat("The standard deviation of the 25 sample means is:", sample_means_sd, "kg\n")

# Interpretation
cat("Interpretation:\n")
cat("The mean of the sample means is close to the population mean (", laptop_bag_weights_mean, "kg),\n",
    "which illustrates the Law of Large Numbers — sample means tend to converge to the population mean.\n")
cat("The standard deviation of the sample means is smaller than the population standard deviation,\n",
    "reflecting the Central Limit Theorem — variability decreases as we average over samples.\n")
