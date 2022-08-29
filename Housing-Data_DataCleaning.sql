/****** Script for SelectTopNRows command from SSMS  ******/
--Preview data 
SELECT TOP (1000) [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [ProjectPortfolio].[dbo].[NashvilleHousing]


--Standardize date to column to DATE Format (without time)

Select CAST(Saledate AS DATE) 
FROM [ProjectPortfolio].[dbo].[NashvilleHousing];

--Update content SaleDate column to DATE fromat
Update NashvilleHousing
SET SaleDate = CAST(Saledate AS DATE)


--Alter table schema to change SaleDate column to DATE fromat
ALTER TABLE NashvilleHousing
ALTER COLUMN SaleDate DATE;


--View the SaleDate column as altered
Select Saledate
FROM [ProjectPortfolio].[dbo].[NashvilleHousing];


--Populate NULL values in PropertyAddress Column
SELECT *
FROM [ProjectPortfolio].[dbo].[NashvilleHousing]
WHERE PropertyAddress is null;


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [ProjectPortfolio].[dbo].[NashvilleHousing] a
JOIN [ProjectPortfolio].[dbo].[NashvilleHousing] b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null;


UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [ProjectPortfolio].[dbo].[NashvilleHousing] a
JOIN [ProjectPortfolio].[dbo].[NashvilleHousing] b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null;
