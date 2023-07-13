create database WhoIsDB;

Create Table dbo.SourceConfig(
Configid bigint identity (1,1),
ConvigValue nVarchar(500),
CreatedBy nVarchar(200) default user_name(),
CreatedOn datetime default getdate()
);

Select * From dbo.SourceConfig;

Insert into dbo.SourceConfig(ConfigValue)
select 'sample_com_v44_full_1000.csv.gz' UNION ALL
select 'sample_net_v44_full_1000.csv.gz' UNION ALL
select 'sample_org_v44_full_1000.csv.gz' UNION ALL
select 'sample_dev_v44_full_1000.csv.gz' UNION ALL
select 'sample_info_v44_full_1000.csv.gz'