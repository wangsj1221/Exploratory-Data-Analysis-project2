# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot6.png', width = 640, height = 480, units='px')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)

library(ggplot2)

# plot figure
NEI_SUB <- subset(NEI, fips=="24510"|fips=="06037"&type=="ON-ROAD")
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year+fips, NEI_SUB, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles"

g <- ggplot(aggregatedTotalByYearAndFips, aes(as.factor(year), Emissions))
g <- g + facet_grid(. ~ fips) + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions from motor vehicle in Baltimore City vs Los Angeles 1999-2008")
print(g)
# close device
dev.off()
