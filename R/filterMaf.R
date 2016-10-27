
filterMaf <- function(x) {
	## mutation_order copied from waterfall_hierarchyTRV.R
	mutation_order <- c("Nonsense_Mutation", "Frame_Shift_Ins","Frame_Shift_Del", "Translation_Start_Site","Splice_Site", "Nonstop_Mutation","In_Frame_Ins", "In_Frame_Del","Missense_Mutation", "5\'Flank","3\'Flank", "5\'UTR", "3\'UTR", "RNA", "Intron","IGR", "Silent", "Targeted_Region", NA)
	if (is.data.frame(x) || data.table::is.data.table(x)) {
		maf = subset(x, Variant_Classification %in% mutation_order)
	} else {  ## x = maftools::read.maf(...)
		maf = subset(x@data, Variant_Classification %in% mutation_order)
	}
	return(maf)
}


