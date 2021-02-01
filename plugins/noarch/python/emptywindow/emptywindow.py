# Warning: this is Python 2.5

from Tkinter import *

# A minimal plugin class that just creates an empty window
class MyPlugin:
  def __init__(self):
    self.root = Tk()
    self.root.title("My Plugin Window")

# Function to start the plugin.  Must return the window handle.
def startMyPlugin():
  return MyPlugin().root

if __name__=="__main__":
  import VMD
  # Register the plugin so that it's not actually created until the
  # first request to open the window.
  VMD.registerExtensionMenu("myplugin", startMyPlugin)

  # Create the plugin now and add it to the Extensions menu.
  # VMD.addExtensionMenu("myplugin", MyPlugin().root)
