Create Database Union_Bank

--------------------------------------
Use Union_Bank
---------------------------------------------------
Create Table Borrower (
BorrowerID Int Not Null,
BorrowerFirstName Varchar (10) Not Null,
BorrowerMiddelInitial Char (1) Not Null,
BorrowerLastName Varchar (10) Not Null,
DoB datetime Not Null,
Gender Char (1) Null,
TaxPayerID_SSN Varchar (9) Not Null,
PhoneNumber varchar (10) Not Null,
Email Varchar (25) Not Null,
Citizenship Varchar (25) Null,
BenefinicaryName Varchar (25) Null,
IsUScitizen bit Null,
CreateDate Datetime Null)

Alter Table Borrower
Add Constraint CH_CreateDate
Check (CreateDate = GetDate())

Alter Table Borrower
Add Constraint PK_BorrowerID Primary Key (BorrowerID)

Alter Table Borrower
Add Constraint CK_DoB
Check (DoB < =Dateadd (Year, 18, Getdate()))

Alter Table Borrower 
Add Constraint UN_TaxPayerID_SSN Unique (TaxPayerID_SSN)


--------------------------------------------------------
Create Table BorrowerAddress (
AddressID int Not Null,
BorrowerID int Not Null,
StreetAddress Varchar (25) Not Null,
ZIP Varchar (5) Not Null,
CreateDate Datetime)

Alter Table BorrowerAddress
Add Constraint CH_CreateDateBA
Check (CreateDate = GetDate())

Alter Table BorrowerAddress
Add Constraint FK_BorrowerID Foreign Key (BorrowerID) References Borrower (BorrowerID)
--------------------------------
Create Table Calender (
CalenderDate Datetime Null)

---------------------------------------------------
Create Table [State] (
StateID Char (2) Not Null,
StateName Varchar (26) Not Null,
CreateDate Datetime Not Null)

Alter Table Borrower
Add Constraint CH_CreateDateS
default GetDate() for 

--------------------------------------
Create Table US_ZipCodes (
IsSurrogateKey int Not Null,
ZIP Varchar (5) Not Null,
Latitude Float Null,
Longitube Float Null,
City Varchar (20) Null,
State_ID Char (2) Null,
[Population] int Null,
Density Decimal (18, 0) Null,
County_Fips Varchar (10) Null,
County_Name Varchar (20) Null,
County_Names_All Varchar (20) Null,
County_Fips_All Varchar (20) Null,
Timezone Varchar (10) Null,
CreateDate Datetime Not Null)

-------------------------------------------------

Create Table LoanSetupInformation (
IsSurrogateKey int Not Null,
LoanNumber Varchar (10) Not Null,
PurchaseAmount Numeric Not Null,
PurchaseDate Datetime Not Null,
LoanTerm int Not Null,
BorrowerID int Not Null,
UnderwriterID int Not Null,
ProductID Char (2) Not Null,
InterestRate Decimal Not Null,
PaymentFrequency int Not Null,
AppraisalValue Numeric Not Null,
CreateDate Datetime Not Null,
LTV Decimal Not Null,
FristInterestPaymentDate Datetime Null,
MaturityDate Datetime Not Null)

-------------------------------------------------------
Create Table Loanperiodic (
Issurrogatekey int Not Null,
Loannumber Varchar (10) Not Null,
Cycledate Datetime Not Null,
Extramonthlypayment Numeric Not Null,
Unpaidprincipalbalance Numeric Not Null,
Beginningsschedulebalance Numeric Not Null,
Paidinstallment Numeric Not Null,
Interestportion Numeric Not Null, 
PrincipalPortion Numeric Not Null,
Endschedulebalance Numeric Not Null,
Actualendschedulebalance Numeric Not Null,
Totalinterestaccrued Numeric Not Null,
Totalprincipalaccrued Numeric Not Null,
DEFAULTPENALTY Numeric Not Null,
Delinquencycode int Not Null,
Createdate Datetime Not Null)
-----------------------------------------------------

Create Table LU_Delinquency (
DelinquencyCode int Not Null,
Delinquency Varchar (25) Not NUll)

------------------------------------------------

Create Table LU_PaymentFrequency (
PaymentFrequency int Not Null,
PaymentIsMadeEvery int Not Null,
PaymentFrequency_Description Varchar (30) Not Null)

-------------------------------------------------------------

Create Table Underwriter (
UnderwriterID int Not Null,
UnderwriterFristName Varchar (25) Null,
UnderwriterMiddleInitial Char (1) Null,
UnderwriterLastName Varchar (25) Not Null,
PhoneNumber Varchar (20) Null,
Email Varchar (25) Not Null,
CreateDate Datetime Not Null)

-----------------------------------------------------------------