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
from
(select * from hubspot_mkt_emails where state = 'PUBLISHED' and analyticspageid = '71966526117' ) as email
--Email details and analyticspageid is the one that you see on the hubspot link addresss of an email
join
(select * from hubspot_mkt_campaigns) as campaigns
--Campaign ID and also the basic stats of the emails (one analyticspageid can have multiple campaignids)
on email.analyticspageid = cast(campaigns.contentid as varchar)
join
(select * from hubspot_mkt_events ) as events
--Has evnts data for a given campaign how many clicks and opens are available
on events.events_emailcampaignid = campaigns.id
