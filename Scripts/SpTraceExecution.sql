use [sincoabr]
go

set ansi_nulls on
go
set quoted_identifier on
go
if exists (select * from sys.objects where type = 'p' and name = 'sptraceexecution') 
	drop procedure [dbo].[sptraceexecution]  
go 

create procedure [dbo].[sptraceexecution] 
@dbname    nvarchar(256),
@procname  nvarchar(256)
as
begin
if (isnull(@dbname, '') = '') or (isnull(@dbname, 0) = 0)
begin
    raiserror('parametro invalido: @dbname no puede ser null o cero', 18, 0)
    return
end

if (isnull(@procname, '') = '') or (isnull(@procname, 0) = 0)
begin
    raiserror('parametro invalido: @procname no puede ser null o cero', 18, 0)
    return
end

; with basedata as (
   select qs.statement_start_offset/2    as stmt_start,
          qs.statement_end_offset/2      as stmt_end,
          est.encrypted                  as isencrypted, 
		  est.text                       as sqltext,
          epa.value                      as set_options, 
		  qp.query_plan                  as query_plan,    
	      qs.last_execution_time         as last_execution_time,
		  est.objectid                   as objectid,
          charindex('<parameterlist>', qp.query_plan) + len('<parameterlist>') as paramstart,
          charindex('</parameterlist>', qp.query_plan) as paramend
   from   sys.dm_exec_query_stats qs
   cross  apply sys.dm_exec_sql_text(qs.sql_handle) est
   cross  apply sys.dm_exec_text_query_plan(qs.plan_handle,
                                            qs.statement_start_offset,
                                            qs.statement_end_offset) qp
   cross  apply sys.dm_exec_plan_attributes(qs.plan_handle) epa
   where  est.objectid  = object_id (@procname)
     and  est.dbid      = db_id(@dbname)
     and  epa.attribute = 'set_options'
), next_level as (
   select stmt_start, set_options, query_plan, last_execution_time, objectid,
          case when isencrypted = 1 then '-- encrypted'
               when stmt_start >= 0
               then substring(sqltext, stmt_start + 1,
                              case stmt_end
                                   when 0 then datalength(sqltext)
                                   else stmt_end - stmt_start + 1
                              end)
          end as statement,
          case when paramend > paramstart
               then cast (substring(query_plan, paramstart,
                                   paramend - paramstart) as xml)
          end as params
   from   basedata
)
select n.objectid as id,
	   cr.c.value('@column', 'nvarchar(128)') as parametro,
       cr.c.value('@parametercompiledvalue', 'nvarchar(128)') as valor,
	   n.last_execution_time as fecha_de_transacción
from   next_level n
cross  apply   n.params.nodes('columnreference') as cr(c)
order  by parametro desc

end


