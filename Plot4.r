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

##aggdata <- aggregate(Emissions~year,data = NEI,FUN = sum)

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



#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
## Filter SCC dataset for Combustion Related and Coal Related Entries

combustion <- grepl(pattern = "combust",x = SCC$SCC.Level.One,ignore.case = TRUE)
coal <- grepl(pattern = "coal",x = SCC$SCC.Level.Four,ignore.case = TRUE)
combustioncoal <- (combustion & coal)
combustionSCC <- SCC[combustioncoal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

## Create BarPlot and Export as PNG file

png(filename = "plot4.png",width = 480, height = 480,units = "px",)

g <- ggplot(data = combustionNEI, aes(factor(year), Emissions/10^5)) +
        geom_bar(stat = "identity",fill = "grey", width = 0.75) +
        theme_grey(base_size = 14,base_family = "") +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions - US 1999-2008"))

print(g)
dev.off()
}

