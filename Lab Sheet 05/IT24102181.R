

# 1. Set working directory
setwd("C://Users//User//Desktop//IT24102181//Lab 05")

# 2. Import dataset as single column (no header)
delivery_data <- read.table("C:/Users/User/Desktop/IT24102213/Lab 05/data.txt", 
                            header = FALSE, stringsAsFactors = FALSE)

# Preview first few rows
head(delivery_data)

# 3. Split the single column into Company and Time
split_data <- strsplit(delivery_data$V1, split = ",")
split_matrix <- do.call(rbind, split_data)
Delivery_Times <- data.frame(Company = split_matrix[,1], 
                             Time = as.numeric(split_matrix[,2]),
                             stringsAsFactors = FALSE)

# Check structure
str(Delivery_Times)
head(Delivery_Times)

# ================================
# 4. Define class intervals for histogram
breaks <- seq(floor(min(Delivery_Times$Time, na.rm = TRUE)),
              ceiling(max(Delivery_Times$Time, na.rm = TRUE)),
              length.out = 10)  # 9 intervals

# 5. Draw histogram
hist(Delivery_Times$Time,
     breaks = breaks,
     right = FALSE,
     main = "Histogram of Delivery Times",
     xlab = "Delivery Time",
     col = "skyblue",
     border = "black")

# ================================
# 6. Create frequency table for ogive
freq_table <- hist(Delivery_Times$Time, breaks = breaks, plot = FALSE)

# Cumulative frequencies
cum_freq <- cumsum(freq_table$counts)

# Midpoints of intervals
midpoints <- freq_table$mids

# 7. Plot cumulative frequency polygon (Ogive)
plot(midpoints, cum_freq, type = "o", col = "blue",
     main = "Cumulative Frequency Polygon (Ogive)",
     xlab = "Delivery Time", ylab = "Cumulative Frequency")

