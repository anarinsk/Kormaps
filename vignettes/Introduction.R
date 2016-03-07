## ----eval=FALSE----------------------------------------------------------
#  install.packages("devtools")  # 한번 설치한 경우에는 다시 설치할 필요 없습니다.
#  devtools::install_github("cardiomoon/Kormaps")

## ----message=FALSE,fig.height=5,fig.width=5------------------------------
require(Kormaps)
require(Kormapsdata)
require(tmap)

qtm(kormap1)

## ------------------------------------------------------------------------
qtm(korpopmap1,"총인구_명",text="name")

## ------------------------------------------------------------------------
colnames(korpopmap1@data)

## ------------------------------------------------------------------------
qtm(korpopmap2,"총인구_명")

## ------------------------------------------------------------------------
Seoul2=submap(korpopmap2,"서울")
qtm(Seoul2,"외국인_계_명")

## ------------------------------------------------------------------------
qtm(submap(korpopmap3,"대구"),"아파트_호")

## ----results='asis'------------------------------------------------------
require(leaflet)
myleaflet(korpopmap1,"총인구_명")

## ----results='asis'------------------------------------------------------
require(leaflet)
myleaflet(submap(korpopmap3,"광주"),choices=c("남자_명","여자_명","주택_계_호"))

