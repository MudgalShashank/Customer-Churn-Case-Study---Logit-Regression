# Clear environment
rm(list = ls())

library(readxl)

Log_Reg <- read.csv(choose.files(), header = T, ",")

# user written function for creating descriptive statistics
mystats <- function(x) {
  nmiss<-sum(is.na(x))
  a <- x[!is.na(x)]
  m <- mean(a)
  md <- median(a)
  n <- length(a)
  s <- sd(a)
  min <- min(a)
  p1<-quantile(a,0.01)
  p5<-quantile(a,0.05)
  p10<-quantile(a,0.10)
  q1<-quantile(a,0.25)
  q2<-quantile(a,0.5)
  q3<-quantile(a,0.75)
  p90<-quantile(a,0.90)
  p95<-quantile(a,0.95)
  p99<-quantile(a,0.99)
  max <- max(a)
  UC <- m+3*s
  LC <- m-3*s
  outlier_flag<- max>UC | min<LC
  return(c(n=n, nmiss=nmiss, outlier_flag=outlier_flag,mean=m,median=md,stdev=s,min = min, p1=p1,p5=p5,p10=p10,q1=q1,q2=q2,q3=q3,p90=p90,p95=p95,p99=p99,max=max, UC=UC, LC=LC ))
}


vars <- c("REVENUE",	"MOU",	"RECCHRGE",	"DIRECTAS",	"OVERAGE",	"ROAM",	"CHANGEM",	"CHANGER",	"DROPVCE",
          "BLCKVCE",	"UNANSVCE",	"CUSTCARE",	"THREEWAY",	"MOUREC",	"OUTCALLS",	"INCALLS",	"PEAKVCE",	
          "OPEAKVCE",	"DROPBLK",	"CALLFWDV",	"CALLWAIT",	"CHURN",	"MONTHS",	"UNIQSUBS",	"ACTVSUBS",	
          "PHONES",	"MODELS",	"EQPDAYS", "CUSTOMER",	"AGE1",	"AGE2",	"CHILDREN",	"CREDITA",	"CREDITAA",	
          "CREDITB",	"CREDITC",	"CREDITDE",	"CREDITGY",	"CREDITZ",	"PRIZMRUR",	"PRIZMUB",	"PRIZMTWN",	
          "REFURB",	"WEBCAP",	"TRUCK",	"RV",	"OCCPROF",	"OCCCLER",	"OCCCRFT",	"OCCSTUD",	"OCCHMKR",	
          "OCCRET",	"OCCSELF",	"OWNRENT",	"MARRYUN",	"MARRYYES",	"MARRYNO",	"MAILORD",	"MAILRES",	
          "MAILFLAG",	"TRAVEL",	"PCOWN",	"CREDITCD",	"RETCALLS",	"RETACCPT",	"NEWCELLY",	"NEWCELLN",	
          "REFER",	"INCMISS",	"INCOME",	"MCYCLE",	"CREDITAD",	"SETPRCM",	"SETPRC",	"RETCALL",	"CALIBRAT")

diag_stats<-t(data.frame(apply(Log_Reg[vars], 2, mystats)))

# Writing Summary stats to external file

write.csv(diag_stats, "C:/Users/shashank/Documents/diag_stats_logit_1.csv")

# Missing Value Imputation
require(Hmisc)
Log_Reg<-data.frame(apply(Log_Reg[vars],2, function(x) impute(x, mean))) #Imputing missings with mean for IV's


#Outliers Treatment

Log_Reg$REVENUE[Log_Reg$REVENUE>225.2108]<-225.2108
Log_Reg$MOU[Log_Reg$MOU>2447.05999999999]<-2447.05999999999
Log_Reg$RECCHRGE[Log_Reg$RECCHRGE>119.99]<-119.99
Log_Reg$DIRECTAS[Log_Reg$DIRECTAS>9.65]<-9.65
Log_Reg$OVERAGE[Log_Reg$OVERAGE>426.884999999998]<-426.884999999998
Log_Reg$ROAM[Log_Reg$ROAM>21.5115999999997]<-21.5115999999997
Log_Reg$CHANGEM[Log_Reg$CHANGEM>736.884999999998]<-736.884999999998
Log_Reg$CHANGER[Log_Reg$CHANGER>117.8354]<-117.8354
Log_Reg$DROPVCE[Log_Reg$DROPVCE>42]<-42
Log_Reg$BLCKVCE[Log_Reg$BLCKVCE>47]<-47
Log_Reg$UNANSVCE[Log_Reg$UNANSVCE>179.33]<-179.33
Log_Reg$CUSTCARE[Log_Reg$CUSTCARE>21]<-21
Log_Reg$THREEWAY[Log_Reg$THREEWAY>4]<-4
Log_Reg$MOUREC[Log_Reg$MOUREC>772.654799999999]<-772.654799999999
Log_Reg$OUTCALLS[Log_Reg$OUTCALLS>164.33]<-164.33
Log_Reg$INCALLS[Log_Reg$INCALLS>77]<-77
Log_Reg$PEAKVCE[Log_Reg$PEAKVCE>500]<-500
Log_Reg$OPEAKVCE[Log_Reg$OPEAKVCE>437]<-437
Log_Reg$DROPBLK[Log_Reg$DROPBLK>71.33]<-71.33
Log_Reg$CALLFWDV[Log_Reg$CALLFWDV>0]<-0
Log_Reg$CALLWAIT[Log_Reg$CALLWAIT>23.33]<-23.33
Log_Reg$CHURN[Log_Reg$CHURN>1]<-1
Log_Reg$MONTHS[Log_Reg$MONTHS>49]<-49
Log_Reg$UNIQSUBS[Log_Reg$UNIQSUBS>5]<-5
Log_Reg$ACTVSUBS[Log_Reg$ACTVSUBS>4]<-4
Log_Reg$PHONES[Log_Reg$PHONES>7]<-7
Log_Reg$MODELS[Log_Reg$MODELS>5]<-5
Log_Reg$EQPDAYS[Log_Reg$EQPDAYS>1150]<-1150
Log_Reg$CUSTOMER[Log_Reg$CUSTOMER>1098984.54]<-1098984.54
Log_Reg$AGE1[Log_Reg$AGE1>74]<-74
Log_Reg$AGE2[Log_Reg$AGE2>76]<-76
Log_Reg$CHILDREN[Log_Reg$CHILDREN>1]<-1
Log_Reg$CREDITA[Log_Reg$CREDITA>1]<-1
Log_Reg$CREDITAA[Log_Reg$CREDITAA>1]<-1
Log_Reg$CREDITB[Log_Reg$CREDITB>1]<-1
Log_Reg$CREDITC[Log_Reg$CREDITC>1]<-1
Log_Reg$CREDITDE[Log_Reg$CREDITDE>1]<-1
Log_Reg$CREDITGY[Log_Reg$CREDITGY>1]<-1
Log_Reg$CREDITZ[Log_Reg$CREDITZ>1]<-1
Log_Reg$PRIZMRUR[Log_Reg$PRIZMRUR>1]<-1
Log_Reg$PRIZMUB[Log_Reg$PRIZMUB>1]<-1
Log_Reg$PRIZMTWN[Log_Reg$PRIZMTWN>1]<-1
Log_Reg$REFURB[Log_Reg$REFURB>1]<-1
Log_Reg$WEBCAP[Log_Reg$WEBCAP>1]<-1
Log_Reg$TRUCK[Log_Reg$TRUCK>1]<-1
Log_Reg$RV[Log_Reg$RV>1]<-1
Log_Reg$OCCPROF[Log_Reg$OCCPROF>1]<-1
Log_Reg$OCCCLER[Log_Reg$OCCCLER>1]<-1
Log_Reg$OCCCRFT[Log_Reg$OCCCRFT>1]<-1
Log_Reg$OCCSTUD[Log_Reg$OCCSTUD>0]<-0
Log_Reg$OCCHMKR[Log_Reg$OCCHMKR>0]<-0
Log_Reg$OCCRET[Log_Reg$OCCRET>1]<-1
Log_Reg$OCCSELF[Log_Reg$OCCSELF>1]<-1
Log_Reg$OWNRENT[Log_Reg$OWNRENT>1]<-1
Log_Reg$MARRYUN[Log_Reg$MARRYUN>1]<-1
Log_Reg$MARRYYES[Log_Reg$MARRYYES>1]<-1
Log_Reg$MARRYNO[Log_Reg$MARRYNO>1]<-1
Log_Reg$MAILORD[Log_Reg$MAILORD>1]<-1
Log_Reg$MAILRES[Log_Reg$MAILRES>1]<-1
Log_Reg$MAILFLAG[Log_Reg$MAILFLAG>1]<-1
Log_Reg$TRAVEL[Log_Reg$TRAVEL>1]<-1
Log_Reg$PCOWN[Log_Reg$PCOWN>1]<-1
Log_Reg$CREDITCD[Log_Reg$CREDITCD>1]<-1
Log_Reg$RETCALLS[Log_Reg$RETCALLS>1]<-1
Log_Reg$RETACCPT[Log_Reg$RETACCPT>1]<-1
Log_Reg$NEWCELLY[Log_Reg$NEWCELLY>1]<-1
Log_Reg$NEWCELLN[Log_Reg$NEWCELLN>1]<-1
Log_Reg$REFER[Log_Reg$REFER>1]<-1
Log_Reg$INCMISS[Log_Reg$INCMISS>1]<-1
Log_Reg$INCOME[Log_Reg$INCOME>9]<-9
Log_Reg$MCYCLE[Log_Reg$MCYCLE>1]<-1
Log_Reg$CREDITAD[Log_Reg$CREDITAD>1]<-1
Log_Reg$SETPRCM[Log_Reg$SETPRCM>1]<-1
Log_Reg$SETPRC[Log_Reg$SETPRC>199.99]<-199.99
Log_Reg$RETCALL[Log_Reg$RETCALL>1]<-1
Log_Reg$CALIBRAT[Log_Reg$CALIBRAT>1]<-1
Log_Reg$REVENUE[Log_Reg$REVENUE<10]<-10
Log_Reg$MOU[Log_Reg$MOU<0]<-0
Log_Reg$RECCHRGE[Log_Reg$RECCHRGE<9.19]<-9.19
Log_Reg$DIRECTAS[Log_Reg$DIRECTAS<0]<-0
Log_Reg$OVERAGE[Log_Reg$OVERAGE<0]<-0
Log_Reg$ROAM[Log_Reg$ROAM<0]<-0
Log_Reg$CHANGEM[Log_Reg$CHANGEM< -829.655]<- -829.655
Log_Reg$CHANGER[Log_Reg$CHANGER< -104.1362]<- -104.1362
Log_Reg$DROPVCE[Log_Reg$DROPVCE<0]<-0
Log_Reg$BLCKVCE[Log_Reg$BLCKVCE<0]<-0
Log_Reg$UNANSVCE[Log_Reg$UNANSVCE<0]<-0
Log_Reg$CUSTCARE[Log_Reg$CUSTCARE<0]<-0
Log_Reg$THREEWAY[Log_Reg$THREEWAY<0]<-0
Log_Reg$MOUREC[Log_Reg$MOUREC<0]<-0
Log_Reg$OUTCALLS[Log_Reg$OUTCALLS<0]<-0
Log_Reg$INCALLS[Log_Reg$INCALLS<0]<-0
Log_Reg$PEAKVCE[Log_Reg$PEAKVCE<0]<-0
Log_Reg$OPEAKVCE[Log_Reg$OPEAKVCE<0]<-0
Log_Reg$DROPBLK[Log_Reg$DROPBLK<0]<-0
Log_Reg$CALLFWDV[Log_Reg$CALLFWDV<0]<-0
Log_Reg$CALLWAIT[Log_Reg$CALLWAIT<0]<-0
Log_Reg$CHURN[Log_Reg$CHURN<0]<-0
Log_Reg$MONTHS[Log_Reg$MONTHS<6]<-6
Log_Reg$UNIQSUBS[Log_Reg$UNIQSUBS<1]<-1
Log_Reg$ACTVSUBS[Log_Reg$ACTVSUBS<1]<-1
Log_Reg$PHONES[Log_Reg$PHONES<1]<-1
Log_Reg$MODELS[Log_Reg$MODELS<1]<-1
Log_Reg$EQPDAYS[Log_Reg$EQPDAYS<7]<-7
Log_Reg$CUSTOMER[Log_Reg$CUSTOMER<1001007.46]<-1001007.46
Log_Reg$AGE1[Log_Reg$AGE1<0]<-0
Log_Reg$AGE2[Log_Reg$AGE2<0]<-0
Log_Reg$CHILDREN[Log_Reg$CHILDREN<0]<-0
Log_Reg$CREDITA[Log_Reg$CREDITA<0]<-0
Log_Reg$CREDITAA[Log_Reg$CREDITAA<0]<-0
Log_Reg$CREDITB[Log_Reg$CREDITB<0]<-0
Log_Reg$CREDITC[Log_Reg$CREDITC<0]<-0
Log_Reg$CREDITDE[Log_Reg$CREDITDE<0]<-0
Log_Reg$CREDITGY[Log_Reg$CREDITGY<0]<-0
Log_Reg$CREDITZ[Log_Reg$CREDITZ<0]<-0
Log_Reg$PRIZMRUR[Log_Reg$PRIZMRUR<0]<-0
Log_Reg$PRIZMUB[Log_Reg$PRIZMUB<0]<-0
Log_Reg$PRIZMTWN[Log_Reg$PRIZMTWN<0]<-0
Log_Reg$REFURB[Log_Reg$REFURB<0]<-0
Log_Reg$WEBCAP[Log_Reg$WEBCAP<0]<-0
Log_Reg$TRUCK[Log_Reg$TRUCK<0]<-0
Log_Reg$RV[Log_Reg$RV<0]<-0
Log_Reg$OCCPROF[Log_Reg$OCCPROF<0]<-0
Log_Reg$OCCCLER[Log_Reg$OCCCLER<0]<-0
Log_Reg$OCCCRFT[Log_Reg$OCCCRFT<0]<-0
Log_Reg$OCCSTUD[Log_Reg$OCCSTUD<0]<-0
Log_Reg$OCCHMKR[Log_Reg$OCCHMKR<0]<-0
Log_Reg$OCCRET[Log_Reg$OCCRET<0]<-0
Log_Reg$OCCSELF[Log_Reg$OCCSELF<0]<-0
Log_Reg$OWNRENT[Log_Reg$OWNRENT<0]<-0
Log_Reg$MARRYUN[Log_Reg$MARRYUN<0]<-0
Log_Reg$MARRYYES[Log_Reg$MARRYYES<0]<-0
Log_Reg$MARRYNO[Log_Reg$MARRYNO<0]<-0
Log_Reg$MAILORD[Log_Reg$MAILORD<0]<-0
Log_Reg$MAILRES[Log_Reg$MAILRES<0]<-0
Log_Reg$MAILFLAG[Log_Reg$MAILFLAG<0]<-0
Log_Reg$TRAVEL[Log_Reg$TRAVEL<0]<-0
Log_Reg$PCOWN[Log_Reg$PCOWN<0]<-0
Log_Reg$CREDITCD[Log_Reg$CREDITCD<0]<-0
Log_Reg$RETCALLS[Log_Reg$RETCALLS<0]<-0
Log_Reg$RETACCPT[Log_Reg$RETACCPT<0]<-0
Log_Reg$NEWCELLY[Log_Reg$NEWCELLY<0]<-0
Log_Reg$NEWCELLN[Log_Reg$NEWCELLN<0]<-0
Log_Reg$REFER[Log_Reg$REFER<0]<-0
Log_Reg$INCMISS[Log_Reg$INCMISS<0]<-0
Log_Reg$INCOME[Log_Reg$INCOME<0]<-0
Log_Reg$MCYCLE[Log_Reg$MCYCLE<0]<-0
Log_Reg$CREDITAD[Log_Reg$CREDITAD<0]<-0
Log_Reg$SETPRCM[Log_Reg$SETPRCM<0]<-0
Log_Reg$SETPRC[Log_Reg$SETPRC<0]<-0
Log_Reg$RETCALL[Log_Reg$RETCALL<0]<-0
Log_Reg$CALIBRAT[Log_Reg$CALIBRAT<0]<-0


# CHI_SQ TEST

mychisqfunction <- lapply(Log_Reg[,c("CREDITA",	"CREDITAA",	"CREDITB",	"CREDITC",	"CREDITDE",	"PRIZMRUR",	
                                     "PRIZMUB",	"PRIZMTWN",	"REFURB",	"WEBCAP",	"OCCRET",	"OWNRENT",	
                                     "MARRYUN",	"MAILORD",	"MAILRES",	"CREDITCD",	"NEWCELLY",	"REFER",	
                                     "CREDITAD",	"CHILDREN",	"CREDITGY",	"CREDITZ",	"TRUCK",	"RV",	
                                     "OCCPROF",	"OCCCLER",	"OCCCRFT",	"OCCSTUD",	"OCCHMKR",	"OCCSELF",	
                                     "MARRYYES",	"MAILFLAG",	"TRAVEL",	"PCOWN",	"MCYCLE")],
                          function (x) chisq.test(table(x, Log_Reg$CHURN)))


print(mychisqfunction)


# REGRESSION for Variable Reduction

fit <- lm(CHURN ~ REVENUE+	MOU+	RECCHRGE+	DIRECTAS+	OVERAGE+	ROAM+	CHANGEM+	CHANGER+	DROPVCE+	BLCKVCE+
                  UNANSVCE+	CUSTCARE+	THREEWAY+	MOUREC+	OUTCALLS+	INCALLS+	PEAKVCE+	OPEAKVCE+	DROPBLK+	
                  CALLWAIT+	MONTHS+	UNIQSUBS+	ACTVSUBS+	PHONES+	MODELS+	EQPDAYS+	AGE1+	AGE2+	
                  INCOME+	SETPRC+	CREDITA+	CREDITAA+	CREDITB+	CREDITC+	CREDITDE+	PRIZMRUR+	PRIZMUB+	
                  PRIZMTWN+	REFURB+	WEBCAP+	OCCRET+	OWNRENT+	MARRYUN+	MAILORD+	MAILRES+	CREDITCD+	
                  NEWCELLY+	REFER+	CREDITAD, data = Log_Reg)

summary(fit) 


#Multicollinierity Check using VIF

library(car)
vif(fit) 


#Step-wise Regression

require(MASS)
stepwise_Reg<- stepAIC(fit,direction="both")



# Making new dataframe with significant variables for Logistic Regression

Vars <- c("REVENUE",	"MOU",	"RECCHRGE",	"OVERAGE",	"ROAM",	"CHANGEM",	"CHANGER",	"DROPVCE",	
          "UNANSVCE",	"CUSTCARE",	"THREEWAY",	"INCALLS",	"PEAKVCE",	"DROPBLK",	"MONTHS",	"UNIQSUBS",	
          "ACTVSUBS",	"PHONES",	"EQPDAYS",	"AGE1",	"SETPRC",	"CREDITAA",	"CREDITB",	"CREDITC",	
          "CREDITDE",	"PRIZMRUR",	"PRIZMUB",	"PRIZMTWN",	"REFURB",	"WEBCAP",	"MARRYUN",	"MAILRES",	
          "CREDITCD",	"NEWCELLY",	"REFER",	"CREDITAD", "CHURN", "CALIBRAT")


Logit_data <- Log_Reg[Vars]


# Using Box-Cox Transformation to transform skewed variables

library(caret)
boxcoxtrans <- preProcess(Logit_data, method = "BoxCox")
boxcoxtrans

# 7 predictors were transformed with lambda values between -2 and 1

Logit_data_1 <- predict(boxcoxtrans, Logit_data)


# Splitting into development and validation dataframes

Dev <- Logit_data_1[Logit_data_1$CALIBRAT==1,] 
Val <- Logit_data_1[Logit_data_1$CALIBRAT==0,]  


# ITERATION _ 01

fit_1 <- glm(CHURN ~ REVENUE + MOU + RECCHRGE + OVERAGE + ROAM + CHANGEM + 
              CHANGER + DROPVCE + UNANSVCE + CUSTCARE + THREEWAY + INCALLS + 
              PEAKVCE + DROPBLK + MONTHS + UNIQSUBS + ACTVSUBS + PHONES + 
              EQPDAYS + AGE1 + SETPRC + CREDITAA + CREDITB + CREDITC + 
              CREDITDE + PRIZMRUR + PRIZMUB + PRIZMTWN + REFURB + WEBCAP + 
              MARRYUN + MAILRES + CREDITCD + NEWCELLY + REFER + CREDITAD, data = Dev, family = binomial(logit))

#Output

summary(fit_1)

#Stepwise regression

step1=step(fit_1)


#ITERATION - 02

fit_2<-glm(CHURN ~ REVENUE + MOU + RECCHRGE + OVERAGE + ROAM + CHANGEM + 
             CHANGER + DROPVCE + UNANSVCE + THREEWAY+ PEAKVCE + 
             DROPBLK + MONTHS + UNIQSUBS + ACTVSUBS + EQPDAYS + 
             AGE1 + SETPRC + CREDITAA + CREDITB + CREDITC + CREDITDE + 
             REFURB + WEBCAP + MARRYUN + MAILRES + 
             NEWCELLY + CREDITAD, data = Dev, family = binomial(logit))

summary(fit_2)


step2=step(fit_2)

# ITERATION - 03

fit_3 <- glm(CHURN ~ REVENUE + MOU + RECCHRGE + OVERAGE + ROAM + CHANGEM + 
               CHANGER + DROPVCE + THREEWAY + PEAKVCE + DROPBLK + 
               MONTHS + UNIQSUBS + ACTVSUBS + EQPDAYS + AGE1 + SETPRC + 
               CREDITAA + CREDITB + CREDITDE + REFURB + WEBCAP + 
               MAILRES + NEWCELLY + CREDITAD, data = Dev, family = binomial(logit))
             

summary(fit_3)


ls(fit_3)
fit_3$model


#Coefficients of model

coeff<-fit_3$coef 
write.csv(coeff, "C:/Users/Shashank/Documents/coeff.csv")


#Concordance

source("E:/SASUniversityEdition/myfolders/Linear & Logistic In R/Concordance.R")
Concordance(fit_3)



#VALIDATION


#Decile Scoring for Development dataset

Dev1<- cbind(Dev, Prob=predict(fit_3, type="response")) 
View(Dev1)

##Creating Deciles
decLocations <- quantile(Dev1$Prob, probs = seq(0.1,0.9,by=0.1))
Dev1$decile <- findInterval(Dev1$Prob,c(-Inf,decLocations, Inf))
View(Dev1)
require(dplyr)
Dev1$decile<-factor(Dev1$decile)
decile_grp<-group_by(Dev1,decile)
decile_summ_Dev<-summarize(decile_grp, total_cnt=n(), min_prob=min(p=Prob), max_prob=max(Prob), Churn_cnt=sum(CHURN), 
                             non_churn_cnt=total_cnt - Churn_cnt )
decile_summ_Dev<-arrange(decile_summ_Dev, desc(decile))
View(decile_summ_Dev)

write.csv(decile_summ_train,"C:/Users/Shashank/Documents/Development.csv",row.names = F)



#Validation dataset

Val1<- cbind(Val, Prob=predict(fit_3, Val, type="response")) 
View(Val1)

##Creating Deciles
decLocations <- quantile(Val1$Prob, probs = seq(0.1,0.9,by=0.1))
Val1$decile <- findInterval(Val1$Prob,c(-Inf,decLocations, Inf))

require(dplyr)
Val1$decile<-factor(Val1$decile)
decile_grp_Val<-group_by(Val1,decile)
decile_summ_Val<-summarize(decile_grp_Val, total_cnt=n(), min_prob=min(p=Prob), max_prob=max(Prob), Churn_cnt=sum(CHURN), 
                           non_churn_cnt=total_cnt - Churn_cnt )
decile_summ_Val<-arrange(decile_summ_Val, desc(decile))
View(decile_summ_Val)

write.csv(decile_summ_Val,"C:/Users/Shashank/Documents/Validation.csv",row.names = F)


##############################################################################################################


library(ROCR)

prob <- predict(fit_3, newdata = Val, type = "response")
pred <- prediction(prob, Val$CHURN)
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
plot(perf, colorization = "TRUE")
abline(0,1)
performance(pred, "auc")@y.values

auc <- performance(pred, measure = "auc")
auc <- auc@y.values[[1]]
auc


# Confusion matrix (Top 4 Deciles)

table(Dev1$Prob>0.53, Dev1$CHURN)
table(Val1$Prob>0.51, Val1$CHURN)


###############################################################################################