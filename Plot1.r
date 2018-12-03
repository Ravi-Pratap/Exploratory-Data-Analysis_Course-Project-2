#----------------------------------------------------------------
# Ravinendra Pratap
# Exploratory data Analysis
# Course Project 2
# Date: 04/12/2018
#----------------------------------------------------------------

{#---Exploratory Data Analysis : Course Project 2018
#----------------------------------------------------------------
## Load the data
getwd()
setwd("D:/LND/COURSERA_DATA_SCIENCE/COURSERA_04_Exploratory Data Analysis/WEEK4- 04EDA Case Studies")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

aggdata <- aggregate(Emissions~year,data = NEI,FUN = sum)

# str(NEI)
# dim(NEI)
# head(NEI)

# str(SCC)
# dim(SCC)
# head(SCC)

## Create BarPlot and Export as PNG file

# dir()


 #1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

png(filename = "plot1.png",width = 480, height = 480,units = "px")

barplot(
  (aggdata$Emissions)/10^6,
  names.arg = aggdata$year,
  col = "blue",
  xlab = "Year",
  ylab = "PM2.5 Emissions (10^6 Tons)",
  main = "PM2.5 Emissions for all US Sources (Total)"
  )

dev.off()
}
