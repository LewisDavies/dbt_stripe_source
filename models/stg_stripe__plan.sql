{{ config(enabled=var('stripe__using_subscriptions', True)) }}

{% if var('stripe__pricing', does_table_exist('plan')) %}

with base as (

    select * 
    from {{ ref('stg_stripe__plan_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_stripe__plan_tmp')),
                staging_columns=get_plan_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as plan_id,
        active as is_active,
        amount,
        currency,
        plan_interval, -- Field is aliased within get_plan_columns macro
        interval_count,
        metadata,
        nickname,
        product_id

        {% if var('stripe__plan_metadata',[]) %}
        , {{ fivetran_utils.pivot_json_extract(string = 'metadata', list_of_properties = var('stripe__plan_metadata')) }}
        {% endif %}

    from fields
)

select * 
from final
