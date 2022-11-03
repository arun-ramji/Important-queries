SELECT distinct A.cin,
	A.company_id,
	news.news_pub_date,
	news.news_pub_date_formatted,
	news.news_sentiment,
	news.news_description,
	news.news_title,
	news.source_title,
	news.news_sector
FROM "dataengg_corpository"."corp_company_cin_details" as A
	left join (
		select distinct r.company_id,
			r.news_pub_date,
			r.news_pub_date_formatted,
			r.news_sentiment,
			r.news_title,
			r.news_description,
			r.source_title,
			r.news_sector
		from (
				select *,
					rank() over (
						partition by company_id
						order by news_pub_date desc
					) as rank
				from "dataengg_corpository"."corp_news"
			) r
		where r.rank <= 5
	) as news on A.company_id = news.company_id
where A.cin in (
	kkkkk
	)
order by A.cin;
