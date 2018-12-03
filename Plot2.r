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
}
{
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


#2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimorenei <- (NEI[NEI$fips == "24510",])
aggdatabaltimore <- aggregate(Emissions~year,data = baltimorenei,FUN = sum)

## Create BarPlot and Export as PNG file

png(filename = "plot2.png",width = 480, height = 480,units = "px")

barplot(aggdatabaltimore$Emissions,
        names.arg = aggdatabaltimore$year,
        col = "blue",
        xlab = "Years",
        ylab = "PM2.5 Emissions by Ton",
        main = "PM2.5 Emissions for Baltimore (Total)"
        )

dev.off()

}
