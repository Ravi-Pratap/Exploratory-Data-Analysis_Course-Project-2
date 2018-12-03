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

# aggdata <- aggregate(Emissions~year,data = NEI,FUN = sum)

# str(NEI)
# dim(NEI)
# head(NEI)

# str(SCC)
# dim(SCC)
# head(SCC)

## Create BarPlot and Export as PNG file

# dir()

## Load the Libraries
library(ggplot2)

## Load the data
## Filter SCC dataset for Vehicle Entries

vehicles <- grepl(pattern = "vehicle",x = SCC$SCC.Level.Two,ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

## Filter vehicles based Baltimore and LA County and update the observations name

filteredvehicles <- (vehiclesNEI[vehiclesNEI$fips == "24510" | vehiclesNEI$fips == "06037",])
filteredvehicles[,1] <- as.factor(x = filteredvehicles[,1])
filteredvehicles <- filteredvehicles
        levels(filteredvehicles$fips)[levels(filteredvehicles$fips)=="06037"] <- "Los Angele County"
        levels(filteredvehicles$fips)[levels(filteredvehicles$fips)=="24510"] <- "Baltimore City"
      
## Create BarPlot and Export as PNG file

png(filename = "plot6.png",width = 480, height = 480,units = "px",)

g <- ggplot(data = filteredvehicles, aes(factor(year), Emissions)) +
        geom_bar(stat = "identity",fill = "grey", width = 0.75) + 
        facet_grid(facets = .~fips,scales = "free", space = "free") +
        theme_grey(base_size = 14,base_family = "") +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Vehicle Emissions, LA County and Baltimore"))

print(g)
dev.off()

}
