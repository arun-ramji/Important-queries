select
email.analyticspageid
,email.primaryemailcampaignid
,email.name
,campaigns.id as campaignid
,events.events_devicetype
,events.events_location_city
,events.events_location_country
,events.events_recipient
,events.events_type
,company2.final_cin
,company2.hubspot_disposition
from
(select * from hubspot_mkt_emails where state = 'PUBLISHED' and analyticspageid in ('84180899968',
'84183368194','84168319258','84180898072','84183680411','84183363425',
'84175884122','83103572282','83300581028','83304505601','83296794381',
'83305488142','83287715488','83304398863')) as email
--Email details and analyticspageid is the one that you see on the hubspot link addresss of an email
join
(select * from hubspot_mkt_campaigns) as campaigns
--Campaign ID and also the basic stats of the emails (one analyticspageid can have multiple campaignids)
on email.analyticspageid = cast(campaigns.contentid as varchar)
join
(select * from hubspot_mkt_events ) as events
--Has evnts data for a given campaign how many clicks and opens are available
on events.events_emailcampaignid = campaigns.id
join
(select * from hubspot_crm_contacts_processed ) as company
--Has company data 
on company.email = events.events_recipient
join
(select * from companies_to_contacts_association ) as contact
--Has company data 
on contact.contacts_id = company.id
join
(select * from hubspot_crm_companies_processed ) as company2
--Has company data 
on company2.id = contact.companies_id



