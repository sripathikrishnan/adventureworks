#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    
	CREATE TABLE DimAccount(
		AccountKey int PRIMARY KEY NOT NULL,
		ParentAccountKey int NULL,
		AccountCodeAlternateKey int NULL,
		ParentAccountCodeAlternateKey int NULL,
		AccountDescription varchar(50) NULL,
		AccountType varchar(50) NULL,
		Operator varchar(50) NULL,
		CustomMembers varchar(300) NULL,
		ValueType varchar(50) NULL,
		CustomMemberOptions varchar(200) NULL 
	) ;

	CREATE TABLE DimCurrency(
		CurrencyKey int PRIMARY KEY NOT NULL,
		CurrencyAlternateKey nchar(3) NOT NULL,
		CurrencyName varchar(50) NOT NULL
	) ;

	CREATE TABLE DimCustomer(
		CustomerKey int PRIMARY KEY NOT NULL,
		GeographyKey int NULL,
		CustomerAlternateKey varchar(15) NOT NULL,
		Title varchar(8) NULL,
		FirstName varchar(50) NULL,
		MiddleName varchar(50) NULL,
		LastName varchar(50) NULL,
		NameStyle bit NULL,
		BirthDate date NULL,
		MaritalStatus nchar(1) NULL,
		Suffix varchar(10) NULL,
		Gender varchar(1) NULL,
		EmailAddress varchar(50) NULL,
		YearlyIncome money NULL,
		TotalChildren int NULL,
		NumberChildrenAtHome int NULL,
		EnglishEducation varchar(40) NULL,
		SpanishEducation varchar(40) NULL,
		FrenchEducation varchar(40) NULL,
		EnglishOccupation varchar(100) NULL,
		SpanishOccupation varchar(100) NULL,
		FrenchOccupation varchar(100) NULL,
		HouseOwnerFlag nchar(1) NULL,
		NumberCarsOwned int NULL,
		AddressLine1 varchar(120) NULL,
		AddressLine2 varchar(120) NULL,
		Phone varchar(20) NULL,
		DateFirstPurchase date NULL,
		CommuteDistance varchar(15) NULL
	) ;

	CREATE TABLE DimDate(
		DateKey int NOT NULL,
		FullDateAlternateKey date NOT NULL,
		DayNumberOfWeek int NOT NULL,
		EnglishDayNameOfWeek varchar(10) NOT NULL,
		SpanishDayNameOfWeek varchar(10) NOT NULL,
		FrenchDayNameOfWeek varchar(10) NOT NULL,
		DayNumberOfMonth int NOT NULL,
		DayNumberOfYear smallint NOT NULL,
		WeekNumberOfYear int NOT NULL,
		EnglishMonthName varchar(10) NOT NULL,
		SpanishMonthName varchar(10) NOT NULL,
		FrenchMonthName varchar(10) NOT NULL,
		MonthNumberOfYear int NOT NULL,
		CalendarQuarter int NOT NULL,
		CalendarYear smallint NOT NULL,
		CalendarSemester int NOT NULL,
		FiscalQuarter int NOT NULL,
		FiscalYear smallint NOT NULL,
		FiscalSemester int NOT NULL
	) ;

	CREATE TABLE DimDepartmentGroup(
		DepartmentGroupKey int PRIMARY KEY NOT NULL,
		ParentDepartmentGroupKey int NULL,
		DepartmentGroupName varchar(50) NULL
	) ;

	CREATE TABLE DimEmployee(
		EmployeeKey int PRIMARY KEY NOT NULL,
		ParentEmployeeKey int NULL,
		EmployeeNationalIDAlternateKey varchar(15) NULL,
		ParentEmployeeNationalIDAlternateKey varchar(15) NULL,
		SalesTerritoryKey int NULL,
		FirstName varchar(50) NOT NULL,
		LastName varchar(50) NOT NULL,
		MiddleName varchar(50) NULL,
		NameStyle bit NOT NULL,
		Title varchar(50) NULL,
		HireDate date NULL,
		BirthDate date NULL,
		LoginID varchar(256) NULL,
		EmailAddress varchar(50) NULL,
		Phone varchar(25) NULL,
		MaritalStatus nchar(1) NULL,
		EmergencyContactName varchar(50) NULL,
		EmergencyContactPhone varchar(25) NULL,
		SalariedFlag bit NULL,
		Gender nchar(1) NULL,
		PayFrequency int NULL,
		BaseRate money NULL,
		VacationHours smallint NULL,
		SickLeaveHours smallint NULL,
		CurrentFlag bit NOT NULL,
		SalesPersonFlag bit NOT NULL,
		DepartmentName varchar(50) NULL,
		StartDate date NULL,
		EndDate date NULL,
		Status varchar(50) NULL,
		EmployeePhoto BYTEA NULL
	) ;

	CREATE TABLE DimGeography(
		GeographyKey int PRIMARY KEY NOT NULL,
		City varchar(30) NULL,
		StateProvinceCode varchar(3) NULL,
		StateProvinceName varchar(50) NULL,
		CountryRegionCode varchar(3) NULL,
		EnglishCountryRegionName varchar(50) NULL,
		SpanishCountryRegionName varchar(50) NULL,
		FrenchCountryRegionName varchar(50) NULL,
		PostalCode varchar(15) NULL,
		SalesTerritoryKey int NULL,
		IpAddressLocator varchar(15) NULL
	) ;

	CREATE TABLE DimOrganization(
		OrganizationKey int PRIMARY KEY NOT NULL,
		ParentOrganizationKey int NULL,
		PercentageOfOwnership varchar(16) NULL,
		OrganizationName varchar(50) NULL,
		CurrencyKey int NULL
	) ;

	CREATE TABLE DimProduct(
		ProductKey int PRIMARY KEY NOT NULL,
		ProductAlternateKey varchar(25) NULL,
		ProductSubcategoryKey int NULL,
		WeightUnitMeasureCode nchar(3) NULL,
		SizeUnitMeasureCode nchar(3) NULL,
		EnglishProductName varchar(100) NOT NULL,
		SpanishProductName varchar(100) NULL,
		FrenchProductName varchar(100) NULL,
		StandardCost money NULL,
		FinishedGoodsFlag bit NOT NULL,
		Color varchar(15) NOT NULL,
		SafetyStockLevel smallint NULL,
		ReorderPoint smallint NULL,
		ListPrice money NULL,
		Size varchar(50) NULL,
		SizeRange varchar(50) NULL,
		Weight float NULL,
		DaysToManufacture int NULL,
		ProductLine nchar(2) NULL,
		DealerPrice money NULL,
		Class nchar(2) NULL,
		Style nchar(2) NULL,
		ModelName varchar(50) NULL,
		LargePhoto BYTEA NULL,
		EnglishDescription text NULL,
		FrenchDescription text NULL,
		ChineseDescription text NULL,
		ArabicDescription text NULL,
		HebrewDescription text NULL,
		ThaiDescription text NULL,
		GermanDescription text NULL,
		JapaneseDescription text NULL,
		TurkishDescription text NULL,
		StartDate timestamp NULL,
		EndDate timestamp NULL,
		Status varchar(7) NULL
	) ;

	CREATE TABLE DimProductCategory(
		ProductCategoryKey int PRIMARY KEY NOT NULL,
		ProductCategoryAlternateKey int NULL,
		EnglishProductCategoryName varchar(50) NOT NULL,
		SpanishProductCategoryName varchar(50) NOT NULL,
		FrenchProductCategoryName varchar(50) NOT NULL
	) ;

	CREATE TABLE DimProductSubcategory(
		ProductSubcategoryKey int PRIMARY KEY NOT NULL,
		ProductSubcategoryAlternateKey int NULL,
		EnglishProductSubcategoryName varchar(50) NOT NULL,
		SpanishProductSubcategoryName varchar(50) NOT NULL,
		FrenchProductSubcategoryName varchar(50) NOT NULL,
		ProductCategoryKey int NULL
	) ;

	CREATE TABLE DimPromotion(
		PromotionKey int PRIMARY KEY NOT NULL,
		PromotionAlternateKey int NULL,
		EnglishPromotionName varchar(255) NULL,
		SpanishPromotionName varchar(255) NULL,
		FrenchPromotionName varchar(255) NULL,
		DiscountPct float NULL,
		EnglishPromotionType varchar(50) NULL,
		SpanishPromotionType varchar(50) NULL,
		FrenchPromotionType varchar(50) NULL,
		EnglishPromotionCategory varchar(50) NULL,
		SpanishPromotionCategory varchar(50) NULL,
		FrenchPromotionCategory varchar(50) NULL,
		StartDate timestamp NOT NULL,
		EndDate timestamp NULL,
		MinQty int NULL,
		MaxQty int NULL
	) ;

	CREATE TABLE DimReseller(
		ResellerKey int PRIMARY KEY NOT NULL,
		GeographyKey int NULL,
		ResellerAlternateKey varchar(15) NULL,
		Phone varchar(25) NULL,
		BusinessType varchar(20) NOT NULL,
		ResellerName varchar(50) NOT NULL,
		NumberEmployees int NULL,
		OrderFrequency char(1) NULL,
		OrderMonth int NULL,
		FirstOrderYear int NULL,
		LastOrderYear int NULL,
		ProductLine varchar(50) NULL,
		AddressLine1 varchar(60) NULL,
		AddressLine2 varchar(60) NULL,
		AnnualSales money NULL,
		BankName varchar(50) NULL,
		MinPaymentType int NULL,
		MinPaymentAmount money NULL,
		AnnualRevenue money NULL,
		YearOpened int NULL
	) ;

	CREATE TABLE DimSalesReason(
		SalesReasonKey int PRIMARY KEY NOT NULL,
		SalesReasonAlternateKey int NOT NULL,
		SalesReasonName varchar(50) NOT NULL,
		SalesReasonReasonType varchar(50) NOT NULL
	) ;

	CREATE TABLE DimSalesTerritory(
		SalesTerritoryKey int PRIMARY KEY NOT NULL,
		SalesTerritoryAlternateKey int NULL,
		SalesTerritoryRegion varchar(50) NOT NULL,
		SalesTerritoryCountry varchar(50) NOT NULL,
		SalesTerritoryGroup varchar(50) NULL,
		SalesTerritoryImage BYTEA NULL
	) ;

	CREATE TABLE DimScenario(
		ScenarioKey int PRIMARY KEY NOT NULL,
		ScenarioName varchar(50) NULL
	) ;

	CREATE TABLE FactAdditionalInternationalProductDescription(
		ProductKey int NOT NULL,
		CultureName varchar(50) NOT NULL,
		ProductDescription text NOT NULL
	) ;

	CREATE TABLE FactCallCenter(
		FactCallCenterID int PRIMARY KEY NOT NULL,
		DateKey int NOT NULL,
		WageType varchar(15) NOT NULL,
		Shift varchar(20) NOT NULL,
		LevelOneOperators smallint NOT NULL,
		LevelTwoOperators smallint NOT NULL,
		TotalOperators smallint NOT NULL,
		Calls int NOT NULL,
		AutomaticResponses int NOT NULL,
		Orders int NOT NULL,
		IssuesRaised smallint NOT NULL,
		AverageTimePerIssue smallint NOT NULL,
		ServiceGrade float NOT NULL,
		Date timestamp NULL
	) ;

	CREATE TABLE FactCurrencyRate(
		CurrencyKey int NOT NULL,
		DateKey int NOT NULL,
		AverageRate float NOT NULL,
		EndOfDayRate float NOT NULL,
		Date timestamp NULL
	) ;

	CREATE TABLE FactFinance(
		FinanceKey int PRIMARY KEY NOT NULL,
		DateKey int NOT NULL,
		OrganizationKey int NOT NULL,
		DepartmentGroupKey int NOT NULL,
		ScenarioKey int NOT NULL,
		AccountKey int NOT NULL,
		Amount float NOT NULL,
		Date timestamp NULL
	) ;

	CREATE TABLE FactInternetSales(
		ProductKey int NOT NULL,
		OrderDateKey int NOT NULL,
		DueDateKey int NOT NULL,
		ShipDateKey int NOT NULL,
		CustomerKey int NOT NULL,
		PromotionKey int NOT NULL,
		CurrencyKey int NOT NULL,
		SalesTerritoryKey int NOT NULL,
		SalesOrderNumber varchar(20) NOT NULL,
		SalesOrderLineNumber int NOT NULL,
		RevisionNumber int NOT NULL,
		OrderQuantity smallint NOT NULL,
		UnitPrice money NOT NULL,
		ExtendedAmount money NOT NULL,
		UnitPriceDiscountPct float NOT NULL,
		DiscountAmount float NOT NULL,
		ProductStandardCost money NOT NULL,
		TotalProductCost money NOT NULL,
		SalesAmount money NOT NULL,
		TaxAmt money NOT NULL,
		Freight money NOT NULL,
		CarrierTrackingNumber varchar(25) NULL,
		CustomerPONumber varchar(25) NULL,
		OrderDate timestamp NULL,
		DueDate timestamp NULL,
		ShipDate timestamp NULL
	) ;

	CREATE TABLE FactInternetSalesReason(
		SalesOrderNumber varchar(20) NOT NULL,
		SalesOrderLineNumber int NOT NULL,
		SalesReasonKey int NOT NULL
	) ;

	CREATE TABLE FactProductInventory(
		ProductKey int NOT NULL,
		DateKey int NOT NULL,
		MovementDate date NOT NULL,
		UnitCost money NOT NULL,
		UnitsIn int NOT NULL,
		UnitsOut int NOT NULL,
		UnitsBalance int NOT NULL
	) ;

	CREATE TABLE FactResellerSales(
		ProductKey int NOT NULL,
		OrderDateKey int NOT NULL,
		DueDateKey int NOT NULL,
		ShipDateKey int NOT NULL,
		ResellerKey int NOT NULL,
		EmployeeKey int NOT NULL,
		PromotionKey int NOT NULL,
		CurrencyKey int NOT NULL,
		SalesTerritoryKey int NOT NULL,
		SalesOrderNumber varchar(20) NOT NULL,
		SalesOrderLineNumber int NOT NULL,
		RevisionNumber int NULL,
		OrderQuantity smallint NULL,
		UnitPrice money NULL,
		ExtendedAmount money NULL,
		UnitPriceDiscountPct float NULL,
		DiscountAmount float NULL,
		ProductStandardCost money NULL,
		TotalProductCost money NULL,
		SalesAmount money NULL,
		TaxAmt money NULL,
		Freight money NULL,
		CarrierTrackingNumber varchar(25) NULL,
		CustomerPONumber varchar(25) NULL,
		OrderDate timestamp NULL,
		DueDate timestamp NULL,
		ShipDate timestamp NULL
	) ;

	CREATE TABLE FactSalesQuota(
		SalesQuotaKey int PRIMARY KEY NOT NULL,
		EmployeeKey int NOT NULL,
		DateKey int NOT NULL,
		CalendarYear smallint NOT NULL,
		CalendarQuarter int NOT NULL,
		SalesAmountQuota money NOT NULL,
		Date timestamp NULL
	) ;

	CREATE TABLE FactSurveyResponse(
		SurveyResponseKey int PRIMARY KEY NOT NULL,
		DateKey int NOT NULL,
		CustomerKey int NOT NULL,
		ProductCategoryKey int NOT NULL,
		EnglishProductCategoryName varchar(50) NOT NULL,
		ProductSubcategoryKey int NOT NULL,
		EnglishProductSubcategoryName varchar(50) NOT NULL,
		Date timestamp NULL
	) ;

	CREATE TABLE NewFactCurrencyRate(
		AverageRate real NULL,
		CurrencyID varchar(3) NULL,
		CurrencyDate date NULL,
		EndOfDayRate real NULL,
		CurrencyKey int NULL,
		DateKey int NULL
	) ;

	CREATE TABLE ProspectiveBuyer(
		ProspectiveBuyerKey int PRIMARY KEY NOT NULL,
		ProspectAlternateKey varchar(15) NULL,
		FirstName varchar(50) NULL,
		MiddleName varchar(50) NULL,
		LastName varchar(50) NULL,
		BirthDate timestamp NULL,
		MaritalStatus nchar(1) NULL,
		Gender varchar(1) NULL,
		EmailAddress varchar(50) NULL,
		YearlyIncome money NULL,
		TotalChildren int NULL,
		NumberChildrenAtHome int NULL,
		Education varchar(40) NULL,
		Occupation varchar(100) NULL,
		HouseOwnerFlag nchar(1) NULL,
		NumberCarsOwned int NULL,
		AddressLine1 varchar(120) NULL,
		AddressLine2 varchar(120) NULL,
		City varchar(30) NULL,
		StateProvinceCode varchar(3) NULL,
		PostalCode varchar(15) NULL,
		Phone varchar(20) NULL,
		Salutation varchar(8) NULL,
		Unknown int NULL
	) ;

	COPY dimaccount from '/docker-entrypoint-initdb.d/DimAccount.csv' DELIMITERS '|' CSV;
	COPY dimcurrency from '/docker-entrypoint-initdb.d/DimCurrency.csv' DELIMITERS '|' CSV;
	COPY dimcustomer from '/docker-entrypoint-initdb.d/DimCustomer.csv' DELIMITERS '|' CSV;
	COPY dimdate from '/docker-entrypoint-initdb.d/DimDate.csv' DELIMITERS '|' CSV;
	COPY dimdepartmentgroup from '/docker-entrypoint-initdb.d/DimDepartmentGroup.csv' DELIMITERS '|' CSV;
	COPY dimemployee from '/docker-entrypoint-initdb.d/DimEmployee.csv' DELIMITERS '|' CSV;
	COPY dimgeography from '/docker-entrypoint-initdb.d/DimGeography.csv' DELIMITERS '|' CSV;
	COPY dimorganization from '/docker-entrypoint-initdb.d/DimOrganization.csv' DELIMITERS '|' CSV;
	COPY dimproduct from '/docker-entrypoint-initdb.d/DimProduct.csv' DELIMITERS '|' CSV;
	COPY dimproductcategory from '/docker-entrypoint-initdb.d/DimProductCategory.csv' DELIMITERS '|' CSV;
	COPY dimproductsubcategory from '/docker-entrypoint-initdb.d/DimProductSubcategory.csv' DELIMITERS '|' CSV;
	COPY dimpromotion from '/docker-entrypoint-initdb.d/DimPromotion.csv' DELIMITERS '|' CSV;
	COPY dimreseller from '/docker-entrypoint-initdb.d/DimReseller.csv' DELIMITERS '|' CSV;
	COPY dimsalesreason from '/docker-entrypoint-initdb.d/DimSalesReason.csv' DELIMITERS '|' CSV;
	COPY dimsalesterritory from '/docker-entrypoint-initdb.d/DimSalesTerritory.csv' DELIMITERS '|' CSV;
	COPY dimscenario from '/docker-entrypoint-initdb.d/DimScenario.csv' DELIMITERS '|' CSV;
	COPY factadditionalinternationalproductdescription from '/docker-entrypoint-initdb.d/FactAdditionalInternationalProductDescription.csv' DELIMITERS '|' CSV;
	COPY factcallcenter from '/docker-entrypoint-initdb.d/FactCallCenter.csv' DELIMITERS '|' CSV;
	COPY factcurrencyrate from '/docker-entrypoint-initdb.d/FactCurrencyRate.csv' DELIMITERS '|' CSV;
	COPY factfinance from '/docker-entrypoint-initdb.d/FactFinance.csv' DELIMITERS '|' CSV;
	COPY factinternetsales from '/docker-entrypoint-initdb.d/FactInternetSales.csv' DELIMITERS '|' CSV;
	COPY factinternetsalesreason from '/docker-entrypoint-initdb.d/FactInternetSalesReason.csv' DELIMITERS '|' CSV;
	COPY factproductinventory from '/docker-entrypoint-initdb.d/FactProductInventory.csv' DELIMITERS '|' CSV;
	COPY factresellersales from '/docker-entrypoint-initdb.d/FactResellerSales.csv' DELIMITERS '|' CSV;
	COPY factsalesquota from '/docker-entrypoint-initdb.d/FactSalesQuota.csv' DELIMITERS '|' CSV;
	COPY factsurveyresponse from '/docker-entrypoint-initdb.d/FactSurveyResponse.csv' DELIMITERS '|' CSV;
	COPY newfactcurrencyrate from '/docker-entrypoint-initdb.d/NewFactCurrencyRate.csv' DELIMITERS '|' CSV;
	COPY prospectivebuyer from '/docker-entrypoint-initdb.d/ProspectiveBuyer.csv' DELIMITERS '|' CSV;

EOSQL