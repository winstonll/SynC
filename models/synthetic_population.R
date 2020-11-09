library(readr)
file_dir = ''
data_dir = ''
source(paste(file_dir, 'functions.R', sep = ''))
set.seed(123)

postal = ''

#####Generating Age, Gender and Ethnicity#########
pp = read_csv(paste(file_dir, "PP.csv", sep = ''))
pp_sub = pp[pp$PostCode == postal, ]

age_sample_prob = pp_sub[, age_gender_groups]/sum(pp_sub[, age_gender_groups])
individual = data.frame(sample(names[[1]], pp_sub$PP_TOT, replace = TRUE, prob = age_sample_prob))
colnames(individual) = 'Demographics'

core = pp[, age_gender_groups]/pp$PP_TOT
write_csv(core, paste(file_dir, 'core.csv', sep = ''))
write_csv(individual, paste(file_dir, 'individual.csv', sep = ''))

##########Generate Ethnicity
process_file(file_path = paste(path, 'ET.csv', sep = ''), var_name = 'Ethnicity', postal = postal, 
             index = groups[[2]])

##########Generate Religion
process_file(file_path = paste(path, 'RL.csv', sep = ''), var_name = 'Religion', postal = postal, 
             index = groups[[3]])

##########Generate Education
process_file(file_path = paste(path, 'ED.csv', sep = ''), var_name = 'Education', postal = postal, 
             index = groups[[4]])
