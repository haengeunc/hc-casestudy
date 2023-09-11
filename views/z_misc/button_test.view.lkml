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

# <!-- Button trigger modal -->
# <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
#   Launch demo modal
# </button>

# <!-- Modal -->
# <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
#   <div class="modal-dialog modal-dialog-centered" role="document">
#     <div class="modal-content">
#       <div class="modal-header">
#         <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
#         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
#           <span aria-hidden="true">&times;</span>
#         </button>
#       </div>
#       <div class="modal-body">
#           Lorem ipsum dolor sit amet. Et labore nesciunt eum quasi eius ut velit nihil qui quod amet
#           est deserunt inventore est modi ipsam. Est nesciunt quidem vel libero reprehenderit et voluptatem
#           enihil ut cupiditate perferendis qui laborum reprehenderit. Est deserunt esse eos sint voluptatum
#           ead natus consequatur sit maxime sint ut explicabo neque.
#       </div>
#       <div class="modal-footer">
#         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
#         <button type="button" class="btn btn-primary">Save changes</button>
#       </div>
#     </div>
#   </div>
# </div>


  }
