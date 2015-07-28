import os
import sys
from werkzeug.debug import DebuggedApplication

sys.path.append(os.path.realpath(os.path.dirname(__file__) + '/../'))

from host import app
app.wsgi_app = DebuggedApplication(app.wsgi_app, True)
