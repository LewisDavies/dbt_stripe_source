# Stripe 

This package models Stripe data from [Fivetran's connector](https://fivetran.com/docs/applications/stripe). It uses data in the format described by [this ERD](https://docs.google.com/presentation/d/1DgcGgNNcH8KPiAjaFNkvT6nEpY6hJd6DZ7ux_CdIF8A/edit).

This package is designed to do the following:
* Add descriptions to tables and columns that are synced using Fivetran
* Add freshness tests to source data
* Add column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Model staging tables, which will be used in our transform package

### Models

This package contains staging models, designed to work simultaneously with our [Stripe modeling package](https://github.com/fivetran/dbt_stripe).  The staging models are designed to:
* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
    * Boolean fields are prefixed with `is_` or `has_`
    * Timestamps are appended with `_at`
    * ID primary keys are prefixed with the name of the table.  For example, the user table's ID column is renamed user_id.


## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
The [variables](https://docs.getdbt.com/docs/using-variables) needed to configure this package are as follows:

TBD

### Contributions ###

Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

### Resources:
- Learn more about Fivetran [here](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

