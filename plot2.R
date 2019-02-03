# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot2.png', width = 640, height = 480, units='px')

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# plot figure
NEI_Baltimore <- subset(NEI, fips=="24510")
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI_Baltimore, sum)
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

# close device
dev.off()
