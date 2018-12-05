This program and the accompanying materials are
made available under the terms of the Eclipse Public License v2.0 which accompanies
this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html

SPDX-License-Identifier: EPL-2.0

Copyright Contributors to the Zowe Project.

# Installation Guide to the Zowe Jupyter App

This jupyter app supports either jupyter lab or jupyter notebook for use in the Zowe Desktop.  
To install this app first untar the *jupytar.tar.gz* file using **tar -xzf jupytar.tar.gz** .  


## Setting up the Jupyter Server and Config Directory

Then, set up and  start the jupyter notebook server. To do this one needs to run   
**openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.pem**  

See http://jupyter-notebook.readthedocs.io/en/stable/public_server.html for more details.

The *JUPYTER_CONFIG_DIR* needs to be set to the .jupyter directory serving the notebook.  
i.e. **JUPYTER_CONFIG_DIR=/u/test_user/.jupyter**  
     **export JUPYTER_CONFIG_DIR**  
This allows the *.jupyter* directory to be set for all users using this app.

Now run **jupyter notebook --certfile=/path/to/certfile --keyfile=/path/to/keyfile --ip=host name --tornado_settings={'headers': {'Content-Security-Policy': "frame-ancestors localhost 'self' "}}**

Alternatively, ** jupyter notebook --generate-config ** can be used to generate a jupyter notebook configuration directory and files, and all the specified parameters can be changed within jupyter_notebook_config.py.

Set the JUP_SERVER environment variable to the given link. This could also be an https link to
a jupyter lab setup.

The final environment variable that needs to be set is ZOE.
This variable should be set to the directory that contains all of the plugins for the Zowe App Server.
i.e *~/testing/zlux*

To finally install the plugin run **./initialize.sh** and the plugin should be installed to Zowe.

## Browser
Currently Google Chrome supports this application, however, there is a chrome extension called Ignore-xframe-headers that needs to be installed.
Microsoft Edge should work without any extensions, however, it does not always.

### Bugs and Quirks
Depending on the browser being used, this application may not worked. It is recommended to use Chrome or Edge.  
When using Chrome, the extension X-frame-options needs to be enabled.  

Sometimes the jupyter notebook/jupyter lab link must be opened within a browser prior to it displaying in the application.


BUGS TO FIX

- The terminal -
Not too certain how to fix this. The Jupyter object in the frontend extensions has a web socket service (wss) link
that can be found. Potentially changing this might allow a USS terminal to be embedded.

### Developer Knowledge

Probably need to use jupyter notebook frontend extensions to communicate between the jupyter notebook
and other apps.  
http://jupyter-notebook.readthedocs.io/en/stable/extending/frontend_extensions.html  

Might need to somehow proxy the jupyter notebook to be available on the same host and port as the Zowe App Server in order to allow for upwards and downwards communication from the Jupyter notebook to the application in which the iframe is embedded.



This program and the accompanying materials are
made available under the terms of the Eclipse Public License v2.0 which accompanies
this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html

SPDX-License-Identifier: EPL-2.0

Copyright Contributors to the Zowe Project.
