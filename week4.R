##1
fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl1, destfile = "~/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week4/housing.csv")
housing <- read.csv("housing.csv")
results<- strsplit(names(housing), "wgtp")
results[123]

##2
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl2, destfile = "~/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week4/GDP.csv")
GDP <- read.csv("GDP.csv")[5:194, c(1,2,4,5)]
GDP1<- gsub(",","", GDP$X.3)
GDP2<- as.integer(GDP1)
mean(GDP2)

##3
names(GDP)<-c ("CountryCode", "rank","fullnames","gdp")
countryNames <- as.character(GDP$fullnames)
grep("^United",countryNames)

##4
fileurl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl3, destfile = "~/R.Studio/Getting_and_Cleaning_Data/Getting_and_cleaning_data_week4/country.csv")
mergedDT<-merge(GDP, country, by = "CountryCode")
Notes <- as.character(mergedDT$Special.Notes)
endinjune <- grep("Fiscal year end: June 30;", Notes)
length(endinjune)

##5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
in2012 <- grep("2012-", sampleTimes)
length(in2012)
timein2012 <- sampleTimes[in2012]
library(lubridate)
whichday <- sapply(timein2012, weekdays)
sum(whichday=="Monday")