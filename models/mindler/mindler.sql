with leads as (

	select * from {{ source('mindler', 'cart_page_leads') }}
),

final as (

	select id, name as lead_name, email as lead_email, mobile as lead_mobile, package as lead_package, user_id as lead_user_id, created_on as lead_created_on, updated_on as lead_updated_on from leads
)

select * from final