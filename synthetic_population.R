library(readr)
source('C:/Users/Zheng/Documents/GitHub/arima2/sample.R')
path = "C:/Users/Zheng/Downloads/Manifold/A003-SuperDemographics/CSV/"
set.seed(123)

postal = 'M5S3G2'

#####Generating Age, Gender and Ethnicity#########
pp = read_csv(paste(path, "PP.csv", sep = ''))
pp_sub = pp[pp$PostCode == postal, ]

age_sample_prob = pp_sub[, age_gender_groups]/sum(pp_sub[, age_gender_groups])
individual = data.frame(sample(names[[1]], pp_sub$PP_TOT, replace = TRUE, prob = age_sample_prob))
colnames(individual) = 'Demographics'

core = pp[, age_gender_groups]/pp$PP_TOT
write.csv(core, 'C:/Users/Zheng/Documents/GitHub/arima2/core.csv', row.names = F)
write.csv(individual, paste('C:/Users/Zheng/Documents/GitHub/arima2/', postal, '.csv', sep = ''), row.names = F)

##########Generate Ethnicity
process_file(file_path = paste(path, 'ET.csv', sep = ''), var_name = 'Ethnicity', postal = postal, 
             index = groups[[2]], excl_age = c())

##########Generate Religion
process_file(file_path = paste(path, 'RL.csv', sep = ''), var_name = 'Religion', postal = postal, 
             index = groups[[3]], excl_age = c())