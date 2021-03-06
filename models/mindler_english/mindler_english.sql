with leads as (

	select * from {{ source('mindler_english', 'cart_page_leads') }}
),

final as (

	select id, name as lead_name, email as lead_email, mobile as lead_mobile, package as lead_package, CONCAT('mindler_', user_id) as lead_user_id, created_on as lead_created_on, updated_on as lead_updated_on from leads
)

select * from final

{{ config(
   post_hook="UPDATE cart_page_leads SET name='Savinay' where email='vishal.yadav@mindler.com'"
) }}

{{ config(
   post_hook="DELETE FROM cart_page_leads WHERE email='mbarve1976@gmail.com'"
) }}