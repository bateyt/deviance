## Load packages
library(ggplot2); library(dplyr); library(googlesheets); library(scales)

## Authorize the googlsheets package
gs_auth()

## Check Google Sheets user and authentication (auth) status
gs_user()

## List my Google sheets
mysheets <- gs_ls()

## Grab the sheet 'deviance'
deviance <- gs_title('deviance')

## Read in as a dataframe (also as 'tbl_df' and 'tbl')
deviance_df <- gs_read(deviance)

## Plot a behavior variables for all students, separate for age
parents <- ggplot(data = deviance_df, aes(x = defy.parents, fill=gender)) + geom_bar(aes(y=..count../sum(..count..)), position = position_dodge(), alpha = 0.8) + scale_y_continuous(labels = percent, limits = c(0,1)) + theme_bw()
parents + facet_grid(.~class)
