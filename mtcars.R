install.packages("tidyverse")
library(ggplot2)

data = mtcars
head(data)

# mpgとcyl
# ヒストグラム
ggplot(data, aes(x = mpg, fill = factor(cyl))) + geom_histogram(position = "identity", alpha = 0.5, bins = 10)

# 密度曲線
ggplot(data, aes(x = mpg, fill = factor(cyl))) + geom_density(alpha = 0.5)

# 箱ひげ図
ggplot(data, aes(x = cyl, y = mpg, fill = factor(cyl))) + geom_boxplot()

# mpgとdisp
# 散布図
ggplot(data, aes(x = mpg, y = disp, label = rownames(data))) + geom_point() + geom_label() + scale_x_continuous(limits = c(10, 35))
ggsave("mtcars.png", width = 900, height = 600, units = "px", dpi = 100)

data$name <- rownames(data)
x <- data$name %in% c("Mazda RX4","Mazda RX4 Wag" , "Honda Civic", "Toyota Corolla", "Toyota Corona")
data$name[!x] <- NA

ggplot(data, aes(x = mpg, y = disp, label = name)) + geom_point() + geom_label() + scale_x_continuous(limits = c(10, 35))
ggsave("mtcars.png", width = 900, height = 600, units = "px", dpi = 100)

# mpgとhp
# 散布図
ggplot(data, aes(x = mpg, y = hp, label = rownames(data))) + geom_point() + geom_label() + scale_x_continuous(limits = c(10, 35))
ggsave("mtcars.png", width = 900, height = 600, units = "px", dpi = 100)

data$name <- rownames(data)
x <- data$name %in% c("Mazda RX4","Mazda RX4 Wag" , "Honda Civic", "Toyota Corolla", "Toyota Corona")
data$name[!x] <- NA

ggplot(data, aes(x = mpg, y = hp, label = name)) + geom_point() + geom_label() + scale_x_continuous(limits = c(10, 35))
ggsave("mtcars.png", width = 900, height = 600, units = "px", dpi = 100)

# mpgとqsec
# 散布図
ggplot(data, aes(x = mpg, y = qsec, label = rownames(data))) + geom_point() + geom_label() + scale_x_continuous(limits = c(10, 35))
ggsave("mtcars.png", width = 900, height = 600, units = "px", dpi = 100)

data$name <- rownames(data)
x <- data$name %in% c("Mazda RX4","Mazda RX4 Wag" , "Honda Civic", "Toyota Corolla", "Toyota Corona")
data$name[!x] <- NA

ggplot(data, aes(x = mpg, y = qsec, label = name)) + geom_point() + geom_label() + scale_x_continuous(limits = c(10, 35))
ggsave("mtcars.png", width = 900, height = 600, units = "px", dpi = 100)
