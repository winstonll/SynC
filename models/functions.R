library(mvtnorm)
library(fitdistrplus)
library(dplyr)
library(keras)

file_dir = ''
data_dir = ''

sample_data = function(d, n = 1000){
  m = ncol(d)
  x = mvrnorm(n, mu = rep(0, m), Sigma = cor(d, use = 'complete.obs'), empirical = TRUE)
  u = pnorm(x)
  data = matrix(0, nrow = n, ncol = m)
  d[is.na(d)] = 0.00001
  for(i in 1:m){
    range = range(d[,i], na.rm=TRUE)
    if(range[2] - range[1] < 1){
      #dist = 'beta'
      estimates = fitdist(d[,i], 'beta', method = 'mme')$estimate
      #data[,i] = scaleRange(qbeta(u[,i], estimates[1], estimates[2]))
      data[,i] = qbeta(u[,i], estimates[1], estimates[2])
    } else if (range[2]  - range[1] == 1){
      d[,i] = ifelse(d[,i] == 0, 0.00001, d[,i])
      d[,i] = ifelse(d[,i] == 1, 0.99999, d[,i])
      estimates = fitdist(d[,i], 'beta', method = 'mme', na.rm  =   T)$estimate
      data[,i] = qbeta(u[,i], estimates[1], estimates[2])
    } else{
      dist = 'lnorm'
      estimates = fitdist(d[,i], 'lnorm', method = 'mme')$estimate
      data[,i] = qlnorm(u[,i], estimates[1], estimates[2])
    }
  }
  return(data)
}

toDummy = function(vec, names){
 vec = unlist(vec)
 output = matrix(0, nrow = length(vec), ncol = length(names))
 for(i in 1:length(vec))
   output[i, which(names == unname(vec[i]))] = 1
 return(output)
}

powerTwo = function(num){
  power = 1
  while(2^power <= num){
    power = power + 1
  }
  return(2^(power-1))
}

model_to_pop = function(core, target, input){
  ind = sample(1:nrow(core), round(0.3*nrow(core)))
  train_x = core[-ind, ]
  train_y = target[-ind, ]
  val_x = core[ind, ]
  val_y = target[ind, ]
  test_y = matrix(0, nrow = nrow(test_x), ncol = ncol(train_y))
  model <- keras_model_sequential()
  if(all(train_y <= 1)){
    model %>%
      layer_dense(units = max(powerTwo(ncol(train_x))/2, 4), 
                  input_shape = ncol(train_x), activation = 'relu') %>%
      layer_dense(units = max(powerTwo(ncol(train_x))/4, 2), activation = 'relu') %>%
      layer_dense(units = ncol(train_y), activation = 'softmax') %>%
      compile(
        optimizer = 'adam',
        loss = 'categorical_crossentropy',
        metrics = list('mae')
      )
  } else{
    model %>%
      layer_dense(units = max(powerTwo(ncol(train_x))/2, 4), 
                  input_shape = ncol(train_x), activation = 'relu') %>%
      layer_dense(units = max(powerTwo(ncol(train_x))/4, 2), activation = 'relu') %>%
      layer_dense(units = ind) %>%
      compile(
        optimizer = 'adam',
        loss = "mse",
        metrics = list("mae")
      )
  }
  
  model %>% fit(
    train_x,
    train_y,
    epochs = 5,
    batch_size = 512,
    validation_data = list(val_x, val_y)
  )
  
  test_y = model %>% predict(as.matrix(test_x), batch_size = 32)
  return(test_y)
}

match_marginal = function(output, marginals, varnames){
  matched = matrix(0, nrow = nrow(output), ncol = ncol(output))
  colnames(matched) = varnames
  for(i in 1:nrow(output)){
    prob = output[i,]/sum(output[i,])
    matched[i, which(output[i,] == max(output[i,]))] = 1
  }
  empirical_marginals = apply(matched, 2, sum)
  while(!all(empirical_marginals == marginals)){
    diff = empirical_marginals - marginals
    over_indexed = which(diff > 0)
    under_indexed = which(diff < 0)
    for(i in over_indexed){
      ind = which(matched[,i] == 1)
      ind = ind[order(output[ind, i], decreasing = FALSE)]
      matched[ind[1:diff[1,i]], ] = 0
    }
    
    for(j in 1:nrow(matched)){
      if(all(matched[j,] == 0)){
        prob = output[j, under_indexed]/sum(output[j, under_indexed])
        new_max_ind = which(output[j, under_indexed] == max(output[j, under_indexed]))
        matched[j, under_indexed[new_max_ind]] = 1
      }
    }
    empirical_marginals = apply(matched, 2, sum)
  }
  out = rep('', nrow(matched))
  for(i in 1:nrow(matched)){
    if(sum(matched[i, ]) == 1)
      out[i] = colnames(matched)[which(matched[i,] == 1)]
    else
      out[i] = ""
  }
  return(out)
}

age_groups = c(32:34, 36:45, 47:50, 52:55, 60:62, 64:73, 75:78, 80:83)
gender_groups = c()
ethno_groups = c(3, 43, 44, 52, 61, 66, 77, 84, 100, 119, 125, 146, 172, 241, 270, 288, 
                 289, 291, 292, 294, 296, 299, 302, 306)
relig_groups = c(3,4,14:20)
ed_groups = c(3:4, 6, 9, 12, 15, 16)

groups = list(age_groups, gender_groups, ethno_groups, relig_groups, ed_groups)

age_names = c('PP_AVG')
gender_names = c('PP_MALE')
ethno_names = c("ET_ABO", "ET_AME", "ET_CAN", "ET_BRIO", "ET_FREO", "ET_WEUO", "ET_NEUO", 
                "ET_EEUO", "ET_SEUO", "ET_OEUO", "ET_CARO", "ET_LAMO", "ET_AFRO", "ET_WASIAO", 
                "ET_SA",  "ET_CHIN", "ET_FIL", "ET_INDO", "ET_JAP", "ET_KOR", "ET_MALAY",
                "ET_TAIW", "ET_VTN", "ET_OCEO")
relig_names = c("RL_BUD", "RL_CHRI", "RL_HIND", "RL_JEW", "RL_MUSL", "RL_SIKH", "RL_ABOR", 
                "RL_OTRL", "RL_NON")
ed_names = c("ED_15NC", "ED_15HSC", "ED_15TRC", "ED_15COL", "ED_15BD", "ED_15MAS", "ED_15DOC")

names = list(age_names, gender_groups, ethno_names, relig_names, ed_names)

postal = ''

process_file = function(file_path, var_name, postal, index, ref_age = 18,
                        ref_col = 2, write = TRUE){
  if(!missing(file_path)){
    raw = read_csv(file_path)
    core = read_csv(paste(file_dir, 'core.csv', sep = ''))
  }
  
  individual = read_csv(paste(file_dir, 'individual.csv', sep = ''))
  if(ref_col == 0)
   target = raw[, index]
  else
    target = raw[, index]/unlist(raw[, ref_col])
  individual = individual[order(individual$Age),]
  print('Done file reading')
  
  input = cbind(individual[, 1], ifelse(individual[,2] == 'M', 1, 0))
  for(i in 3:ncol(individual)){
    input = cbind(input, toDummy(individual[, colnames(individual)[i]], names[[i]]))
  }
  
  output = model_to_pop(core, target, input)
  print('Done Model to Pop')
  marginals = raw[raw$PostCode == postal, index]
  marginals = round(marginals/sum(marginals)*nrow(individual[individual$Age >= ref_age, ]))
  diff = abs(sum(marginals) - nrow(individual[individual$Age >= ref_age, ]))
  if(sum(marginals) >= nrow(individual[individual$Age >= ref_age, ])){
    marginals = marginals - rmultinom(1, diff, marginals/sum(marginals))
  } else if(sum(marginals) < nrow(individual[individual$Age >= ref_age, ])){
    marginals = marginals + rmultinom(1, diff, marginals/sum(marginals))
  }
  matched = match_marginal(output = output[individual$Age >= ref_age, 
                                           (ncol(output) - length(marginals) + 1):ncol(output)], 
                           marginals = marginals, varnames = colnames(raw)[index])
  matched = c(rep('', sum(individual$Age < ref_age)), matched)
  individual = cbind(individual, matched)
  if(!missing(var_name))
    colnames(individual)[ncol(individual)] = var_name
  print('Done matching')
  if(write){
    write_csv(data_raw, paste(file_dir, 'core.csv', sep = ''))
    write_csv(individual, paste(file_dir, 'individual.csv', sep = ''))
    return(individual)
  } else{
    return(matched)
  }
}