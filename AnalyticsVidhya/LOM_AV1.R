train_Lom = read.csv('./data/train_HFxi8kT/train.csv', header = T, na.strings = c(""))
campaign = read.csv('./data/train_HFxi8kT/campaign_data.csv', header = T, na.strings = c(""))
test_Lom = read.csv('./data/test_BDIfz5B.csv', header = T, na.strings = c(""))
str(train_Lom)
str(campaign)
str(test_Lom)
comboset = merge(campaign,train_Lom, by= "campaign_id", all.y = T)
comboset2 = merge(campaign,test_Lom, by = "campaign_id", all.y = T)
as.data.frame(colSums(is.na(comboset)))
as.data.frame(colSums(is.na(comboset2)))
str(comboset)
comboset$send_date = NULL
comboset$user_id = NULL
comboset$campaign_id = NULL
comboset$id = NULL
comboset2$send_date = NULL
comboset2$user_id = NULL
comboset2$campaign_id = NULL
comboset2$id = NULL
str(comboset)
str(comboset2)
comboset$is_open = as.factor(comboset$is_open)
comboset$is_click = as.factor(comboset$is_click)
Click = comboset$is_click
comboset$is_click = NULL
library(e1071)
library(mlr)
Model1 = naiveBayes(is_open ~ communication_type + total_links + no_of_internal_links + no_of_images + no_of_sections + email_body + subject + email_url, data = comboset)
summary(Model1)
IS_open = predict(Model1, newdata = comboset2)
summary(IS_open)
comboset2$is_open = IS_open
str(comboset2)
Model2 = naiveBayes(Click ~ is_open + communication_type + total_links + no_of_internal_links + no_of_images + no_of_sections + email_body + subject + email_url, data = comboset)
summary(Model2)
pred1 = predict(Model2, newdata = comboset2)
summary(pred1)
sample.submission = read.csv('./data/sample_submission_4fcZwvQ.csv', header = T, na.strings = c(""))
Solution = data.frame(id = sample.submission$id, is_click = pred1, check.rows = F)
write.csv(Solution,file = "LOM1.csv", row.names = F)
