
suppressPackageStartupMessages({
  library(clusterProfiler)
  library(enrichplot)
  library(org.Hs.eg.db)
  library(ggplot2)
  library(stringr)

  if (!requireNamespace("msigdbr", quietly=TRUE))
  install.packages("msigdbr", repos="https://cloud.r-project.org")

  library(msigdbr)
})

genes <- readLines("ora_clusterprofiler_PC2_pos_ALL/genes.txt")

run_msig <- function(collection, subcollection=NULL, label, show=15) {
  if (is.null(subcollection)) {
    m <- msigdbr(species="Homo sapiens", collection=collection)
  } else {
    m <- msigdbr(species="Homo sapiens", collection=collection, subcollection=subcollection)
  }

  term2gene <- m[, c("gs_name", "gene_symbol")]
  colnames(term2gene) <- c("term", "gene")

  enr <- enricher(gene=genes, TERM2GENE=term2gene,
                  pAdjustMethod="BH", pvalueCutoff=0.05, qvalueCutoff=0.05)

  out_csv <- file.path("ora_clusterprofiler_PC2_pos_ALL", paste0(label, "_results.csv"))
  write.csv(as.data.frame(enr), out_csv, row.names=FALSE)

  if (is.null(enr) || nrow(as.data.frame(enr)) == 0) {
    message("No hits for: ", label)
    return(invisible(NULL))
  }

  p1 <- dotplot(enr, showCategory=show) +
    ggtitle(paste0(label, " ORA")) +
    scale_y_discrete(labels=function(x) str_wrap(x, width=40)) +
    theme(axis.text.y = element_text(size=8))
  ggsave(file.path("ora_clusterprofiler_PC2_pos_ALL", paste0(label, "_dotplot.png")), p1, width=10, height=9, dpi=200)

  p2 <- barplot(enr, showCategory=show) + ggtitle(paste0(label, " ORA"))
  ggsave(file.path("ora_clusterprofiler_PC2_pos_ALL", paste0(label, "_barplot.png")), p2, width=10, height=7, dpi=200)
}

run_msig("H",  label="H_Hallmark")
run_msig("C6", label="C6_Oncogenic")
run_msig("C2", subcollection="CGP",          label="C2_CGP")
run_msig("C2", subcollection="CP:REACTOME",  label="C2_CP_REACTOME")
run_msig("C7", label="C7_Immunologic")
run_msig("C8", label="C8_CellType")
