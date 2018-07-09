setwd("/Users/wangxiaoweipku/Desktop/Stanford PhD/Kaggle/Santander")
library(gbm)
train=read.csv("train.csv")

set.seed(2018)
gbm0<-gbm(target~.,data=train[,2:4993],train.fraction=1,interaction.depth=4,shrinkage=.05,
          n.trees=5000,bag.fraction=0.5,cv.folds=5,
          distribution="gaussian",verbose=F)

best.iter_cv<-gbm.perf(gbm0,method="cv")

test=read.csv("test.csv")
gbm0.predict<-predict(gbm0,test[2:4992],n.trees=best.iter_cv)
