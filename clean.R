
library(jsonlite)

hotelData=fromJSON("hotelSurveySherison.json")

hotelData=data.frame(hotelData)

str(hotelData)

hotelData

# ggplot2 package
library(ggplot2)


# overallCustSat is on y-axis
#explonatory/indipendent variables are on the x-axis


#hotelsize vs customer satisfaction
p1=ggplot(hData,aes(jitter(hotelSize),overallCustSat))+ geom_point()
p1

#the range is between 4-10
#there are few outliers

# check-in satisfaction vs customer satisfaction
p2=ggplot(hData,aes(jitter(checkInSat),overallCustSat))+ geom_point()
p2
#it's almost similar as above
#the range is between 4-10
#there are few outliers



#the plot has to be made to represent states
#hence create a map
#it should be based on the states

#hotelState vs overallCustSat
hData$hotelState <- tolower(hData$hotelState)
us=map_data("state")
p3=ggplot(hData, aes(map_id = hotelState))
p3=p3 + geom_map(map = us, aes(fill = factor(hData$overallCustSat)))
p3=p3+ expand_limits(x = us$long, y = us$lat) + coord_map()
p3=p3+ ggtitle("USA Map")
p3

#most of the states lie between 7-10
#only 2 states have a value of 10 being the strongest

#hotelClean vs customer satisfaction
p4=ggplot(hData,aes(jitter(hotelClean),overallCustSat))+geom_point()
p4

#spread too much
#many outliers

#hotelFriendly vs customer satisfaction
p5=ggplot(hData,aes(jitter(hotelFriendly),overallCustSat))+geom_point()
p5

#the plot has:
#positive slope
#increasing trend

#to usethe library of dplyr
#for data manipuations
#here to calculate the average and then draw the plot based on that
#this is because the gender is a categorical variable
library(dplyr)
genMean= hData %>% group_by(gender) %>% summarize(m1 = mean(overallCustSat))
genMean=as.data.frame(genMean)
#mean of gender vs customer satisfaction
p6=ggplot(genMean,aes(gender,m1)) 
p6=p6+geom_point()

#males have higher rating

#guestAge vs customer satisfaction
p7=ggplot(hData,aes(jitter(guestAge),overallCustSat))+ geom_point()
p7

#range of the plot when is 40-60 then ratig is 5-10

#lengthOfStay vs customer satisfaction
p8=ggplot(hData,aes(jitter(lengthOfStay),overallCustSat))+ geom_point()
p8

#mean stay is 1-4 nights

#booking time vs customer satisfaction
p9=ggplot(hData,aes(jitter(whenBookedTrip),overallCustSat))+ geom_point()
p9
#bad independent variable because of the unusual patter
