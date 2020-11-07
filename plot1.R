library(dplyr)



SMR <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- SMR %>%
  group_by(year) %>%
  summarize(total_emissions = sum(Emissions))

with(emissions_by_year, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from All Sources"))

dev.copy(png,'plot1.png')
dev.off()