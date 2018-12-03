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
#3.Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

## Load the data

library(ggplot2)

baltimorenei <- (NEI[NEI$fips == "24510",])
#aggdatabaltimore <- aggregate(Emissions~year,data = baltimorenei,FUN = sum)

## Create BarPlot and Export as PNG file

png(filename = "plot3.png",width = 750, height = 602,units = "px",)

g <- ggplot(data = baltimorenei, aes(factor(year), Emissions, fill = type)) +
        geom_bar(stat = "identity") +
        facet_grid(facets = .~type,scales = "free",space = "free") +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
		print(g)
dev.off()
}

