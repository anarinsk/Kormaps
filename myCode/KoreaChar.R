#install.packages("devtools")
#devtools::install_github("cardiomoon/Kormaps", force=T)
#install.packages('tmap')
#install.packages("magrittr")

library(Kormaps)
library(tmap)
library(magrittr)
library(leaflet)
library(extrafont)
library(dplyr)

### [X] Override locale -> change col and change col name : Colnames are not changed
### [ ] Override locale -> change col name and change col : Colnames are not changed


### Locale adjustment
### [ ] Is this necessary?
Sys.setlocale("LC_ALL") # See what locale used in your OS and system
Sys.setlocale("LC_ALL", "C") # Override locale
Sys.getlocale("LC_ALL") # Check

### Column name transform
### [ ]

### locale 조정 필수


fuckwindows <- function(df, colnum)
{
    fres <- sapply(df[colnum], function(x){iconv(x, "UTF-8", "CP949")})
    df[colnum] <- fres
    return(df)
}

test <- korpopmap1@data


# For Windows change character encoding from UTF-8 to CP949
colnames(test) <- iconv(colnames(test), "UTF-8", "CP949")
kornames <- colnames(test)

fuckset <- which(sapply(test, is.character))

for(ii in fuckset)
{
    test <- fuckwindows(test, ii)
}

test


colnames(korpopmap2@data) <- iconv(colnames(korpopmap2@data), "UTF-8", "CP949")
colnames(korpopmap2@data)[21]

qtm(kormap1)
qtm(korpopmap1,"총인구_명") + tm_layout(fontfamily="NanumBarunGothic")

areacode

# For Windows change character encoding from UTF-8 to CP949

korpopmap2@data[15] <- iconv(korpopmap2@data[15], "UTF-8", "CP949")
korpopmap2@data[15]


str(areacode)
areacode$name <- iconv(areacode$name, "UTF-8", "CP949")
areacode$name2 <- iconv(areacode$name2, "UTF-8", "CP949")


### Check Areacode




#' @param x a numeric vector
is.integer0 <- function(x) { is.integer(x) && length(x) == 0L}

#' Paste '|' between vectors
#' @param ... one or more R objects, to be converted to character vectors.
paste_or <- function(...) {
    paste(...,sep="|")
}

myarea2code <- function(area){
    result<-c()
    for(i in 1:length(area)){
        pos<-grep(area[i],areacode[[2]])
        if(!is.integer0(pos)) temp<-areacode[pos,1]
        else {
            pos<-grep(area[i],areacode[[3]])
            if(!is.integer0(pos)) temp<-areacode[pos,1]
        }
        result=c(result,temp)
    }
    result
}

?area2code

test <- "아파트_호"
Encoding(test) <- "CP949"

Enco

iconv(test, "CP949", "UTF-8")

qtm(korpopmap2,testt)

Seoul2 <- submap(korpopmap2,"서울")
names(Seoul2@data)

Encoding("종로구")

qtm(korpopmap2, testt)


colnames(korpopmap2@data)

?Reduce

