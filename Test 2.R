library(haven)
library(car)
library(psych)
library(userfriendlyscience)
library(Hmisc)

df <- read_sav("Data/climate study 1.sav")

df$liking_1 <- car::recode(df$liking_1,"1=7; 2=6; 3=5; 5=3; 6=2; 7=1")
df$gend <- factor(df$gend, levels = c("1","2"),labels = c("male","female"))

df$gend <- factor(df$gend, levels = c("male","female"),labels = c("1","2"))


df$likingM <- rowMeans(df[paste0("liking_", c(1,2,3,4,5))])
df$envattM <- rowMeans(df[paste0("envatt_", c(5:10))])

df$le <- rowMeans(df[c("liking_1","envatt_5")])

df$le2 <- (df$liking_1 + df$envatt_5)/2

psych::describe(df[c("pol","likingM", "envattM")])

Hmisc::rcorr(as.matrix(df[c("pol","likingM","envattM")]))

Hmisc::rcorr(df[c("pol","likingM","envattM")])


userfriendlyscience::reliability(df[paste0("liking_", c(1:5))])


