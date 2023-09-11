
view: parameters {

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

  parameter: reporting_currency {

    default_value: "USD"

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
