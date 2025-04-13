mat<-matrix(0,5,6)
for (x in 1:5) {#this for loop right is a whole jahan pe sari cheezen rhengi aur ye row ke liye h
  for(y in 1:6){#ye wala column k liye h
    if(x%%2 ==0 ){ #then ye if row ke liye,
      #iske andr ek if else column ke liye
      if(y%%2 ==0 ){
        mat[x,y]=3
      }
      else{
        mat[x,y]=4
      }
    }
    else{#ye else row k liye
      #aur iske andr ek if else ye bhi column k liye
      if(y%%2 ==0 ){
        mat[x,y]=7
      }
      else{
        mat[x,y]=8
      }
    }
  }
  print(mat)
}


marks_out_of_50 <- c(45, 32, 28, 50, 40, 35, 29, 31, 48, 22, 15, 44, 38, 20, 25, 30, 27, 36, 33,  37) 
convertm<-(marks_out_of_50/50)*20
convertm
toppermarks<-max(convertm)
toppermarks
top3<-sort(marks_out_of_20,decreasing = TRUE )[1:3]
top3
