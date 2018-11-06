from OpenGLContext.loaders.loader import Loader
from generate_minions1 import get_minion

minion = get_minion()

with open("minion_template.wrl", "r") as file:
    minion_template = file.read()

this_minion = "{} \n {}".format(minion_template, minion)

from vrml import vrml97
vrml97.load(this_minion)
# myurl = "minion_sample.wrl"
# scenegraph = Loader.loads( this_minion )