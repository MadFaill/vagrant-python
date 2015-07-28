import os
import flask

TEMPLATES_FOLDER = os.path.join(
    os.path.realpath(os.path.dirname(__file__) + '/../'),
    'templates'
)

app = flask.Flask(__name__, template_folder=TEMPLATES_FOLDER, static_url_path='/static/')

@app.route('/')
def index():
    return flask.render_template('index.html')

@app.route('/json')
def app_json():
    a = {
        'a': 12,
        'mid': 123
    }
    return flask.jsonify(**a)
