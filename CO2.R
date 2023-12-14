# CO2
# ggplot2のインストール
install.packages("tidyverse")
library(ggplot2)

data = CO2
head(data)

# 折れ線グラフ
ggplot(data, aes(x = conc, y = uptake)) + geom_line()
ggplot(data, aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant))
ggplot(data, aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant), nrow = 4)

levels(data$Plant)
levels(data$Plant) <- c("Qn1", "Qn2", "Qn3", "Qc1", "Qc2", "Qc3", "Mn1", "Mn2", "Mn3", "Mc1", "Mc2", "Mc3")
levels(data$Plant)
ggplot(data, aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant), nrow = 4)

ggplot(data[1:42,], aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant))
ggplot(data[43:84,], aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant))

ggplot(data[1:42,], aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant)) + scale_y_continuous(limits = c(9, 46))
ggplot(data[43:84,], aes(x = conc, y = uptake)) + geom_line() + facet_wrap(vars(Plant)) + scale_y_continuous(limits = c(9, 46))

ggplot(data[1:42,], aes(x = conc, y = uptake)) + geom_line() + 
  facet_wrap(vars(Plant)) + 
  scale_y_continuous(limits = c(9, 46))

install.packages("dplyr")
library(dplyr)

data2 <- data %>%
  mutate(Plant = gsub("(Qn|Qc|Mn|Mc)[1-3]", "\\1", Plant),
         Plant = factor(Plant, levels = c("Qn", "Qc", "Mn", "Mc"))) %>%
  group_by(Plant, Type, Treatment, conc) %>%
  summarize(mean_uptake = mean(uptake), sd_uptake = sd(uptake))

data2 = as.data.frame(data2)

head(data2)

ggplot(data2, aes(x = conc, y = mean_uptake)) + geom_line() + 
  facet_wrap(vars(Plant))

library(ggplot2)

ggplot(data2, aes(x = conc, y = mean_uptake)) + 
  geom_ribbon(aes(ymin = mean_uptake - sd_uptake, ymax = mean_uptake + sd_uptake), fill = "grey70") +
  geom_line() + 
  facet_wrap(vars(Plant))
