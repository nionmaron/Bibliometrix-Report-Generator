

library(bibliometrix)
library(bib2df)

getwd()


WSS01<-bib2df("Database/FS by ML WoS.bib")
names(WSS01)
WSS02<-bib2df("Database/WoS nion select.bib")
names(WSS02)
WSS03<-bib2df("Database/FSM by ML WoS.bib")
WSS04<-bib2df("Database/teste2.bib")
class(WSS03)

WSS01$ABSTRACT[2]

paste(WSS01$TITLE[1], "\n",WSS01$ABSTRACT[2])

WoS<-rbind(WSS01,WSS02,WSS03)

TESTE02<-bib2df("Database/FSM by ML scopus.bib")

UNIR<-rbind(TESTE01,TESTE02)

# UNIFICAR BANCO DE DADOS
##########################################################################################################
db_WoS01<-convert2df("Database/FS by ML WoS.bib",dbsource = "wos",format="bibtex")
db_WoS02<-convert2df("Database/WoS nion select.bib",dbsource = "wos",format="bibtex")
db_WoS03<-convert2df("Database/FSM by ML WoS.bib",dbsource = "wos",format="bibtex")

db_scopus<-convert2df("Database/FSM by ML scopus.bib",dbsource = "scopus",format="bibtex")
db_All<-mergeDbSources(db_WoS01,db_WoS02,db_WoS03,db_scopus,remove.duplicated = TRUE)

missingData(db_All)


write.table(db_All,"Database/FSM by ML all rev01.csv",sep = ";",row.names = FALSE)


# SALVAR IN bIB
##########################################################################################################




# GERAR ANALISES
##########################################################################################################
Bib_analysi<-biblioAnalysis(db_All)
DS<-summary(object = Bib_analysi, k=20 )
DS

plot(Bib_analysi,K=10)


#  INTERFACE SHINY
##########################################################################################################
biblioshiny()


#  analise
##########################################################################################################




















