explore: parameters {}


view: parameters {
  derived_table: {
    sql:
      SELECT
        '1' AS id
      ;;

  }

  parameter: reporting_timezone {

    default_value: "Europe/London"

    allowed_value: {
      value: "US/Eastern"
    }
    allowed_value: {
      value: "US/Pacific"
    }
    allowed_value: {
      value: "Europe/London"
    }
    allowed_value: {
      value: "UTC"
    }
    allowed_value: {
      value: "Japan"
    }

  }


dimension: user_attribute_partner_name {
  type: string
  # sql: {{_user_attributes['partner_name']}} ;;
  sql: {% if _user_attributes['partner_name'] == 'brand' %} 'USD'
        {% elsif _user_attributes['partner_name'] == 'multitenant' %} 'GBP'
        {% else %} 'EUR'
        {% endif %} ;;

}

dimension: currency_liquid_constant {
  sql: @{currency_liquid} ;;

}

  parameter: reporting_currency {
    type: unquoted

    # default_value: "{% if _user_attributes['partner_name'] == 'brand' %} 'USD'
    #     {% elsif _user_attributes['partner_name'] == 'multitenant' %} 'GBP'
    #     {% else %} 'EUR'
    #     {% endif %}"

    # default_value: "${user_attribute_partner_name}"

    default_value: "@{currency_liquid}"


    allowed_value: {
      value: "USD"
    }
    allowed_value: {
      value: "GBP"
    }

    allowed_value: {
      value: "EUR"
    }

  }




  parameter: taxes_type {

    default_value: "With Taxes"

    allowed_value: {
      value: "With Taxes"
    }
    allowed_value: {
      value: "Without Taxes"
    }

  }

}
