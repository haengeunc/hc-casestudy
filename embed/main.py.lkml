# # Python standard libraries
# import json
# import os

# # Third-party libraries
# from flask import Flask, redirect, request, url_for, render_template

# from looker_api import looker_create_sso_url_as_me as looker_create_sso_url_as_me, looker_search_user as looker_search_user

# LOOKER_DASHBOARD_ID = '8'
# LOOKER_THEME = 'Test'
# LOOKER_MODEL_NAME = 'sam-pitcher-playground'
# LOOKERSDK_BASE_URL = 'https://test.looker.shredr.xyz'

# # Flask app setup
# app = Flask(__name__)
# app.secret_key = os.urandom(24)

# @app.route("/")
# @app.route("/index")
# def index():
#     user_email = 'sampitcher@google.com'
#     dashboard_url = f"{LOOKERSDK_BASE_URL}/embed/dashboards/{LOOKER_DASHBOARD_ID}"
#     try:
#         user = looker_search_user(user_email)
#         user_id = user.id
#         url_response = looker_create_sso_url_as_me(dashboard_url, user_id)
#         tile_url_1 = url_response.url
#     except:
#         tile_url_1 = f"{LOOKERSDK_BASE_URL}/embed/dashboards/{LOOKER_MODEL_NAME}::redirect?allow_login_screen=true"

#     print(tile_url_1)

#     return render_template('index.html', tile_url_1=tile_url_1)

# if __name__ == "__main__":
#     app.run()
