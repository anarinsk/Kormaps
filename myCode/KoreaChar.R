install.packages("devtools")
devtools::install_github("cardiomoon/Kormaps", force=T)
install.packages('tmap')
install.packages("magrittr")

library(Kormaps)
library(tmap)
library(magrittr)
library(leaflet)
library(extrafont)

Sys.setlocale("LC_ALL") # See what locale used in your OS and system
Sys.setlocale("LC_ALL", "C") # Override locale
Sys.getlocale("LC_ALL") # Check

tlist <- colnames(korpopmap2@data)
tlist

# For Windows change character encoding from UTF-8 to CP949
colnames(korpopmap1@data) <- iconv(colnames(korpopmap1@data), "UTF-8", "CP949")
colnames(korpopmap1@data)[21]

colnames(korpopmap2@data) <- iconv(colnames(korpopmap2@data), "UTF-8", "CP949")
colnames(korpopmap2@data)[21]

qtm(kormap1)
qtm(korpopmap1,"총인구_명") + tm_layout(fontfamily="NanumBarunGothic")

areacode

# For Windows change character encoding from UTF-8 to CP949

korpopmap2@data[15] <- iconv(korpopmap2@data[15], "UTF-8", "CP949")
korpopmap2@data[15]

areacode$name <- iconv(areacode$name, "UTF-8", "CP949")
areacode$name2 <- iconv(areacode$name2, "UTF-8", "CP949")

str(areacode)

myarea2code("서울")

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

