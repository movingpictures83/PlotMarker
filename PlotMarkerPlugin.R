library(SINCERA)
library(cluster)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
	## first iteration


sc <- readRDS(paste(pfix, parameters["genes", 2], sep="/"))
markers <- readSequential(paste(pfix, parameters["markers", 2], sep="/"))
pdf(outputfile)
# different display of the dendrogram tree
plotMarkers(sc, genes=markers)
}
