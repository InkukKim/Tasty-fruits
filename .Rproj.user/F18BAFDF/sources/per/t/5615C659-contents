library(readr)
library(car)
library(effsize)
library(psych)
library(Hmisc)

df <- read_csv("Data/Test1.csv")

df$Class <- factor(df$Class, levels = c("0","1"),labels = c("A","B"))

t.test(df$Math, mu = 80)

leveneTest(df$Math, df$Class)
leveneTest(df$Math, df$Class, mean)
t.test(df$Math ~ df$Class, var = TRUE)
cohen.d(df$Math ~ df$Class)

t.test(df$English1, df$English2, paired = TRUE)

describe(df$English1)
describe(df$English2)

rcorr(as.matrix(df[c("Math","English1","English2")]))
cor.test(df$Math, df$English1)
