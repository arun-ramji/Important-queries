/* company financial for given year */
select A.company_master_id,
A.cin,
A.is_consolidated_standalone_stmt,
A.financial_year,
A.tot_rev_curr as net_revenue,
A.t_editda_curr as ebitda,
B.lng_term_borrow_curr as total_debt,
B.t_tot_assets_curr as total_assets,
B.t_tot_curr_liability_curr as total_liabilities,
(B.t_tot_assets_curr - B.t_tot_curr_liability_curr) as networth
from corp_etl_etl_data.accord_mca_profit_loss A
inner join corp_etl_etl_data.accord_mca_balance_sheet B on A.cin = B.cin
and A.financial_year = B.financial_year
where A.company_master_id = 1757898
and A.is_consolidated_standalone_stmt = 'Standalone'
and A.financial_year = '2020-2021'
