xtable2
=======
There are a lot of R functions that could be used to generate latex tables. There is even a package **xtable** which concentrate on this. But things get complicated when one tries to generate cross tables. There are existing R packages that can produce cross tables with certain type (mainly on parsing lm/glm result). What I present here is a small function that could generate tables with given style/layout.

The usage is very easy simple:
```{r}
data <- matrix(c("var", "Statement", "", "", "", "", "Stat", " ", "Comments", 
    " ", "Var1", 14, 1, "no", "C1", "Var1", 8, 2, "no", "C2"), byrow = T, ncol = 5)

xmerges <- data.frame(x = c(1, 1, 2, 2, 2, 2), y = c(2, 5, 2, 3, 4, 5))
ymerges <- NULL
xtable2(data, xmerges)
```
where x,y are the location of non NA element in data. Now it is unfinished, other functionals are unfinished:

- digits/option control is needed
- multirow is needed
- toprule/crule/midrule is needed
- other styles (such as back-ground color) are needed

I hope this function can have some tk/tcl GUI option in future. But this is of little concern as we already have a good enough GUI: gnumeric.
