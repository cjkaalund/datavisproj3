# Explore airline data for final project, d3 visualization
# ArrDelay vs ArrTime for different airports

suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(GGally))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(stringr))

dat = read.csv('/Users/christopherkaalund/Documents/Study/Udacity Data Science/Data Visualization and D3/Final Project/Charts/data/2008_airline_Jan_only.csv')

#dat2 = dat[dat$DayOfWeek==1,]
dat2 = dat

# The format of ArrTime is hhmm, so extract the hour
hourFun = function(hhmm) {
  hhmm = paste('0',hhmm,sep='') # add 0 to the front, converts to char
  hhmm = as.numeric(substr(hhmm,1,nchar(hhmm)-2)) # remove last two char and convert to integer
  return(as.numeric(as.character(hhmm),1,2)) # take first two characters
}

hourFun2 = function(hhmm) {
  hhmm = as.numeric(substr(as.character(hhmm),1,nchar(hhmm)-2)) # remove last two char and convert to integer
  return(paste(hhmm,'am',sep='')) # will later change some am's to pm's using gsub
}

dat2 = mutate(dat2,ArrHour = hourFun2(ArrTime))

# Note: hourFun2 adds 'am' to everything
dat2$ArrHour = gsub('12am','12pm',dat2$ArrHour) # Midday
dat2$ArrHour = gsub("NAam",'12am',dat2$ArrHour) # Midnight
dat2$ArrHour = gsub("13am",'1pm',dat2$ArrHour)
dat2$ArrHour = gsub("14am",'2pm',dat2$ArrHour)
dat2$ArrHour = gsub("15am",'3pm',dat2$ArrHour)
dat2$ArrHour = gsub("16am",'4pm',dat2$ArrHour)
dat2$ArrHour = gsub("17am",'5pm',dat2$ArrHour)
dat2$ArrHour = gsub("18am",'6pm',dat2$ArrHour)
dat2$ArrHour = gsub("19am",'7pm',dat2$ArrHour)
dat2$ArrHour = gsub("20am",'8pm',dat2$ArrHour)
dat2$ArrHour = gsub("21am",'9pm',dat2$ArrHour)
dat2$ArrHour = gsub("22am",'10pm',dat2$ArrHour)
dat2$ArrHour = gsub("23am",'11pm',dat2$ArrHour)
dat2$ArrHour = gsub("24am",'12am',dat2$ArrHour) # Midnight

dat3 = dat2[complete.cases(dat2),]

# I will now group by hour, and the variables will be arrival delay
# and the count
dat4 = dat3 %>%
  group_by(ArrHour) %>%
  summarize(All_Causes=mean(ArrDelay),
            Carrier=mean(CarrierDelay),
            Weather=mean(WeatherDelay),
            NAS=mean(NASDelay),
            Security=mean(SecurityDelay),
            Late_Aircraft=mean(LateAircraftDelay),
            n=n()
  )

# Put into long format
dat5 = gather(dat4,"reason","avg_delay",2:7)
dat5 = dat5[complete.cases(dat5),]

# Plot
ggplot(dat5,aes(x=ArrHour,y=avg_delay,color=reason))+
  geom_point()

# Write to file
datwrite = write.csv(dat5,
                     '/Users/christopherkaalund/Documents/Study/Udacity Data Science/Data Visualization and D3/Final Project/Charts/data/2008_delay_causes.csv',
                     row.names=TRUE)
