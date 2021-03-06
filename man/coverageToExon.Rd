% Generated by roxygen2 (4.0.1): do not edit by hand
\name{coverageToExon}
\alias{coverageToExon}
\title{Extract coverage information for exons}
\usage{
coverageToExon(fullCov, genomicState, fullOrCoding = "full", L = NULL,
  returnType = "raw", mc.cores = getOption("mc.cores", 1L),
  mc.outfile = Sys.getenv("SGE_STDERR_PATH"), chrsStyle = "UCSC",
  verbose = TRUE)
}
\arguments{
\item{fullCov}{A list where each element is the result from
\link{loadCoverage} used with \code{cutoff=NULL}. Can be generated using
\link{fullCoverage}.}

\item{genomicState}{The output from \link{makeGenomicState}.}

\item{fullOrCoding}{If \code{full} then the \code{genomicState$fullGenome}
genomic state information is used. If \code{coding}, then the
\code{genomicState$codingGenome} genomic state information is used.}

\item{L}{The width of the reads used.}

\item{returnType}{If \code{raw}, then the raw coverage information per exon
is returned. If \code{rpkm}, RPKM values are calculated for each exon.}

\item{mc.cores}{This argument is passed to \link[BiocParallel]{SnowParam}
twice. First, it is used by strand. Second, for processing the exons by
chromosome. So there is no gain in using \code{mc.cores} greater than the
maximum of the number of strands and number of chromosomes.}

\item{mc.outfile}{This argument is passed to \link[BiocParallel]{SnowParam}
to specify the \code{outfile} for any output from the workers.}

\item{chrsStyle}{The naming style of the chromosomes. By default, UCSC. See
\link[GenomeInfoDb]{seqlevelsStyle}.}

\item{verbose}{If \code{TRUE} basic status updates will be printed along the
way.}
}
\value{
A matrix (nrow = number of exons in \code{genomicState}
corresponding to the chromosomes in \code{fullCov}, ncol = number of
samples) with the number of reads (or RPKM) per exon. The row names
correspond to the row indexes of \code{genomicState$fullGenome}  (if
\code{fullOrCoding='full'}) or \code{genomicState$codingGenome} (if
\code{fullOrCoding='coding'}).
}
\description{
This function extracts the coverage information calculated by
\link{fullCoverage} for a set of exons determined by
\link{makeGenomicState}. The underlying code is similar to
\link{getRegionCoverage} with additional tweaks for calculating RPKM values.
}
\examples{
## Obtain fullCov object
fullCov <- list('21'=genomeDataRaw$coverage)

## Use only the first two exons
smallGenomicState <- genomicState
smallGenomicState$fullGenome <- smallGenomicState$fullGenome[
    which(smallGenomicState$fullGenome$theRegion == 'exon')[1:2] ]

## Finally, get the coverage information for each exon
exonCov <- coverageToExon(fullCov=fullCov, genomicState=smallGenomicState,
    L=36)
}
\author{
Andrew Jaffe, Leonardo Collado-Torres
}
\seealso{
\link{fullCoverage}, \link{getRegionCoverage}
}

