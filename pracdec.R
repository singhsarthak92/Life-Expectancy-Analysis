library(purrr)
nums<-c(2,4,6,3,7)
#map square func
res<-map(nums,~.x^2) #it gives result in list form
res1<-map_dbl(nums,~.x^2) #it gives numeric vector
print(res)
print(res1)

result <- map_chr(nums, as.character)
print(result)  
