getwd()
data<-read.csv("C:/rdata/insurance1.csv")
reg<-unique(data$region)
totalregion<-length(reg)
for (i in 1:totalregion) {
  regiondata<-mean(subset(data,region==reg[i]&children==0)$charges)
 
  print(regiondata)
}
#like see this thing both codes are same and with just few lines we get a lot
smokers<-unique(data$smoker)
totalsmoke<-length(smokers)
for (x in 1:totalsmoke) {
  smokermean<-mean(subset(data,smoker==smokers[x]&bmi>30)$charges)
  print(smokermean)
}
