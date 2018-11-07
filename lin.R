
mod1=lm(overallCustSat~.-freeText,data=hotelData)
mod1
summary(mod1)

mod2=lm(overallCustSat~guestAge,data=hotelData)
summary(mod2)
