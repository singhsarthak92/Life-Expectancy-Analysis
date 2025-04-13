#Find the total charges for all female persons who are non-smokers and have a BMI below 25.0.
data<-read.csv("C:/rdata/insurance1.csv")
data1<-subset(data,sex=="female"&bmi<25&smoker=="no")
data2<-sum(data1$charges)
print(data2)
#Q.2 Count the Number of Individuals:
#How many males from the region "northeast" have children and are smokers?
maled<-subset(data,region=="northeast"&children>0&sex=="male"&smoker=="yes")
malec<-nrow(maled)
print(malec)


#Calculate the total charges for each region and determine which  region has the highest total insurance charges. 
reg<-unique(data$region)
totalreg<-length(reg)
for (x in 1:totalreg) {
     totalc<-subset(data,region==reg[x])
     totals<-sum(totalc$charges)
     print(totals)
}
print(max(totals))

