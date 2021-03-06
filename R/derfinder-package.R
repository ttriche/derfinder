#' Fast differential expression analysis of RNA-seq data at base-pair resolution
#'
#' Fast differential expression analysis of RNA-seq data at base-pair 
#' resolution from multiple samples. The analysis pipeline involves loading the 
#' sample BAM files using \link{makeBamList} and \link{loadCoverage}, 
#' pre-processing the data by using \link{preprocessCoverage}, calculating the 
#' F-statistics (while adjusting for some confounders) using \link{makeModels} 
#' and \link{calculateStats}, calculating the p-values and finding the regions 
#' of interest using \link{calculatePvalues}, and finally annotating them using 
#' \link[bumphunter]{annotateNearest} from the bumphunter package.
#'
#' @name derfinder-package
#' @aliases derfinder-package
#' @docType package
#' @author Leonardo Collado-Torres <lcollado@@jhsph.edu>
#' @references Frazee, A. C., Sabunciyan, S., Hansen, K. D., Irizarry, R. A. & 
#' Leek, J. T. Differential expression analysis of RNA-seq data at single-base 
#' resolution. Biostatistics (2014). doi:10.1093/biostatistics/kxt053

#'
#' Rafael A. Irizarry, Martin Aryee, Hector Corrada Bravo, Kasper D. Hansen and 
#' Harris A. Jaffee. bumphunter: Bump Hunter. R package version 1.1.10.
#' @keywords package
NULL 
