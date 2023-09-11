explore: button_test {}

view: button_test {

  derived_table: {
    sql:
      SELECT
        '123' AS id, 'test' as text
      UNION ALL
      SELECT
        '2345' AS id, 'hello' as text
      ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }


  measure: info_icon {
    type: sum
    sql: 0 ;;
    drill_fields: [user_guide_text]
    label: "How to guide"
    html:
      <a href="#drillmenu" target="_self">
        <img src = "https://upload.wikimedia.org/wikipedia/en/thumb/3/35/Information_icon.svg/1024px-Information_icon.svg.png" style="width:2em; height:2em;">
      </a>
      ;;
    }

    measure: user_guide_text {
      label: "how to use this dashboard"
      type: string
      sql: DISTINCT '';;
      html:
     <div style="
            display: block;
            background-color: #F4F4F4;
            font-size: 8px
            width: 15em;
            border: 1px solid #333;
            box-shadow: 8px 8px 5px #444;
            padding: 8px 12px;
            background-image: linear-gradient(180deg, #fff, #ddd 40%, #ccc);
            ">
         <p class="overflow-wrap overflow-wrap--break-word">

          How to guide. <br>
          Here's a very interesting note displayed in a lovely shadowed box <br>
          Refer to https://datatonic.com/insights/creating-user-friendly-looker-dashboards<br>
          <br>

          <p>Here’s an example to have hyperlink in the text: <a href="https://www.google.com/">Go to Google search</a>.</p>

          </p>

      </div>
    ;;
    }

# <div style="">How to guide.
#           Here's a very interesting note displayed in a lovely shadowed box
#           Refer to https://datatonic.com/insights/creating-user-friendly-looker-dashboards/</div>



  }
