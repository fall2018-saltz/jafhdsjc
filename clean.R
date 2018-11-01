
library(jsonlite)

hotelData=fromJSON("hotelSurveySherison.json")

hotelData=data.frame(hotelData)

str(hotelData)

hotelData

# ggplot2 package
library(ggplot2)

#1.	Create bivariate plots for each of the attributes.
#Your code should produce nine separate plots.
#Make sure the Y-axis and X-axis are labeled. Keeping in mind that the overall customer satisfaction is the outcome (or dependent) variable, which axis should it go on in your plots?

# overallCustSat is on y-axis
#explonatory/indipendent variables are on the x-axis


#hotelsize vs customer satisfaction
plot1=ggplot(hotelData,aes(jitter(hotelSize),overallCustSat))+ geom_point()
plot1



#the range is between 3 and 10 
# outliers are observed

# check-in satisfaction vs customer satisfaction
plot2=ggplot(hotelData,aes(jitter(checkInSat),overallCustSat))+ geom_point()
plot2

#the range is between 3 and 10 
# outliers are observed


 
# create a map to represent states


#hotelState vs overallCustSat
hotelData$hotelState <- tolower(hotelData$hotelState)
usa=map_data("state")
plot3=ggplot(hotelData, aes(map_id = hotelState))
plot3=plot3 + geom_map(map = usa, aes(fill = factor(hotelData$overallCustSat)))
plot3=plot3+ expand_limits(x = usa$long, y = usa$lat) + coord_map()
plot3=plot3+ ggtitle("USA Map")
plot3



#hotelClean vs customer satisfaction
plot4=ggplot(hotelData,aes(jitter(hotelClean),overallCustSat))+geom_point()
plot4

#range is between 2 and 10
# outliers are observed

#hotelFriendly vs customer satisfaction
plot5=ggplot(hotelData,aes(jitter(hotelFriendly),overallCustSat))+geom_point()
plot5

#the plot has increasing trend

#to usethe library of dplyr for data maupulation

library(dplyr)
genderMean= hotelData %>% group_by(gender) %>% summarize(mean1 = mean(overallCustSat))
genderMean=as.data.frame(genderMean)
#mean of gender vs customer satisfaction
plot6=ggplot(genderMean,aes(gender,mean1)) 
plot6=plot6+geom_point()

#males have higher rating

#guestAge vs customer satisfaction
plot7=ggplot(hotelData,aes(jitter(guestAge),overallCustSat))+ geom_point()
plot7

#range of the plot when is 40-60 then ratig is 5-10

#lengthOfStay vs customer satisfaction
plot8=ggplot(hotelData,aes(jitter(lengthOfStay),overallCustSat))+ geom_point()
plot8

#mean stay is 1-4 nights

#booking time vs customer satisfaction
plot9=ggplot(hotelData,aes(jitter(whenBookedTrip),overallCustSat))+ geom_point()
plot9
#bad independent variable because of the unusual patter

mean1=lm(overallCustSat~.-freeText,data = hotelData)
mean1

summary(mean1)
