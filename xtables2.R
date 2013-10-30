xtable2 <- function(data, xmergers, ymerges, caption = "Tables", label = "Tablab") {
    m = dim(data)[1]
    n = dim(data)[2]
    xtypes <- table(xmerges$x)
    xtypes.n <- as.numeric(names(xtypes))
    cli.1 <- rep("\\multicolumn", dim(xmergers)[1]/2)
    i = 1
    f.st <- function(x) {
        re <- matrix(x, byrow = T, ncol = 2)
        re
    }
    recordy = list()
    for (x in xtypes.n) {
        recordy[[i]] = xmerges$y[xmerges$x == x]
        cli.tmp <- f.st(recordy[[i]])
        if (is.matrix(cli.tmp)) {
            for (jj in 1:(dim(cli.tmp)[1])) {
                cli.1[i] = paste(cli.1[i], "{", 1 - cli.tmp[jj, 1] + cli.tmp[jj, 
                  2], "}{c}", sep = "")
                i = i + 1
            }
        } else {
            cli.1[i] = paste(cli.1[i], "{", 1 - cli.tmp[1] + cli.tmp[2], "}{c}", 
                sep = "")
            i = i + 1
        }
    }
    cat("\\begin{table}\n", "\\caption{", caption, "}\\label{", label, 
        "}\n\\centering\n", "\\begin{tabular}{", rep("r", n + 1), "}\n\\toprule\n")
    ii = 1
    for (i in 1:m) {

        for (j in 1:n) {
            if (i %in% xtypes.n) {
                op <- as.numeric()
                dd = matrix(recordy[[i]], byrow = T, ncol = 2)
                for (iii in 1:(dim(dd)[1])) op <- c(op, dd[iii, 1]:dd[iii, 2])
                if (j %in% dd[, 1]) {
                  cat(cli.1[ii], "{", data[i, j], "}&")
                  ii = ii + 1
                } else {
                  if ((j %in% dd[, 2])) {
                    cat(data[i, j])
                  } else {


                    if (!(j %in% op)) 
                      cat(data[i, j], "&")
                  }
                }
            } else {
                cat(data[i, j], "&")
            }
        }
        cat("\\\\\n")
        if (i == 1) 
            cat("\\midrule\n")
    }
    cat("\\bottomrule\n", "\\end{tabular}\n\\end{table}\n")
    cat("%Please include \\usepackage{booktabs} before document statement")
}
