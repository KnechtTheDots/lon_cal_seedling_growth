library(tidyverse)

set.seed(120414)

# filter to just germ day = 3 because roughly half the seeds germinated on this day. 
day_4 <- df %>% 
  filter(germ_day==3) %>% 
  drop_na(day_4) %>% 
  select(day_4, class)

day_4 %>% 
  group_by(class) %>% 
  slice_sample(prop = 1, replace = T) %>% 
  summarise(mean = mean(day_4))

boots_4 <- matrix(rep(NA, 1e4*4), ncol = 4)
for(i in 1:1e4){
  a <- day_4 %>% 
    group_by(class) %>% 
    slice_sample(prop = 1, replace = T) %>% 
    summarise(mean = mean(day_4))
  boots_4[i,] <- a$mean
}

colnames(boots_4) <- c("CAL", "F1", "F2", "LON")



write.csv(boots_4, "data/boots_4.csv", row.names = F)
