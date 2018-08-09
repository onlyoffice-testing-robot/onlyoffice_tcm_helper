# OnlyofficeTcmHelper

This gem is using by ONLYOFFICE QA team for getting all data from rspecs "it"

For using, need to create `TcmHelper` object in spec, but before tests. 
You can do it by example:
```
    tcm_helper = OnlyofficeTcmHelper::TcmHelper.new(product: 'Product', plan: 'Plan', suite: description)
```

Attributes is not necessary, but will be good to add this.

And use method `parse` from this object:
```
result = tcm_helper.parse(example)
```
`example` is a object of `RSpec::Core::Example`

`result` is a object with all necessary data for adding result to you tcm:

* `result.product_name` - name of product

* `result.plan_name` - name of plan

* `result.suite_name` - name of suite

* `result.cases_name` - name of suite

* `result.status` - name of status. Can be `:passed, :passed_2, :failed, :aborted, :pending, :lpv, :service_unavailable`

* `result.comment` - comment of result
