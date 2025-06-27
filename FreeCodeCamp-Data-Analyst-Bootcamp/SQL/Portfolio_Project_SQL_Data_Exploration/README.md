Retrieved CSV file from https://ourworldindata.org/covid-deaths
Cut(CTRL X) column population and place into column E
went to AA, CTRL,Shift, Right key and deleted extra un-needed information
Saved as CSV(Comma delimited)(*.csv)
Delted E-Z(Population onward)

imported the 2 csvs as excel into MSSQL
destination: Microsoft OLE DB Provider for SQL Server
Tables:
    dbo.CovidDeaths
    dbo.CovidVaccinations