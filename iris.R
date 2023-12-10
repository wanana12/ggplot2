# iris
# ggplot2のインストール
install.packages("tidyverse")
library(ggplot2)

data = iris

# 棒グラフ
ggplot(data, aes(x = Species)) + geom_bar()
# ggplot(data, aes(x = factor(Species))) + geom_bar()
ggplot(data, aes(x = Species, fill = Species)) + geom_bar()

# 散布図
ggplot(data, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
ggplot(data, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + geom_point()

# ヒストグラム
ggplot(data, aes(x = Sepal.Length)) + geom_histogram()
ggplot(data, aes(x = Sepal.Length)) + geom_histogram(bins = 10)
ggplot(data, aes(x = Sepal.Length, fill = Species)) + geom_histogram(bins = 10)
ggplot(data, aes(x = Sepal.Length, fill = Species)) + geom_histogram(position = "identity", alpha = 0.5, bins = 10)

# 密度曲線
ggplot(data, aes(x = Sepal.Length, fill = Species)) + geom_density()
ggplot(data, aes(x = Sepal.Length, fill = Species)) + geom_density(alpha = 0.5)

# 箱ひげ図
ggplot(data, aes(x = Species, y = Sepal.Length)) + geom_boxplot()
# ggplot(data, aes(x = Species, y = Sepal.Length)) + geom_boxplot() + stat_summary(fun.y = "mean", shape = 23, fill = "white")
ggplot(data, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_boxplot()

# バイオリンプロット
ggplot(data, aes(x = Species, y = Sepal.Length)) + geom_violin()
# ggplot(data, aes(x = Species, y = Sepal.Length)) + geom_violin() + geom_boxplot(width = .1, fill = "black", outlier.color = NA) + stat_summary(fun.y = "median", shape = 21, fill = "white")
ggplot(data, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_violin()

# 密度プロット
ggplot(data, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + stat_density2d()
ggplot(data, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + geom_point() + stat_density2d()
