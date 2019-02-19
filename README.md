This program and the accompanying materials are
made available under the terms of the Eclipse Public License v2.0 which accompanies
this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html

SPDX-License-Identifier: EPL-2.0

Copyright Contributors to the Zowe Project.

# Installation Guide to the Zowe Jupyter App

This jupyter app supports either jupyter lab or jupyter notebook for use in the Zowe Desktop.  
This app has jupyter as a prerequisite. It does not include jupyter, but can be used to visualize jupyter within the Zowe Desktop.

## Setting up the Jupyter Server and Config Directory

Then, set up and  start a jupyter notebook server. First, a key must be made. To do this one needs to run   
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
As the Jupyter server is a seperate server, browser security settings regarding cross domain resources applies.
To get the best experience, the jupyter server should be reached through the mediation layer. This can be done by following this guide:
https://zowe.github.io/docs-site/latest/extend/extend-apiml/api-mediation-onboard-an-existing-rest-api-service-without-code-changes.html#define-your-service-and-api-in-yaml-format



BUGS TO FIX

- The terminal -
The Jupyter object in the frontend extensions has a web socket service (wss) link
that can be found. Changing this might allow a USS terminal to be embedded.

### Developer Knowledge
Experimentation: Use jupyter notebook frontend extensions to communicate between the jupyter notebook
and other apps.  
http://jupyter-notebook.readthedocs.io/en/stable/extending/frontend_extensions.html  

Might need to somehow proxy the jupyter notebook to be available on the same host and port as the Zowe App Server in order to allow for upwards and downwards communication from the Jupyter notebook to the application in which the iframe is embedded.



This program and the accompanying materials are
made available under the terms of the Eclipse Public License v2.0 which accompanies
this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html

SPDX-License-Identifier: EPL-2.0

Copyright Contributors to the Zowe Project.
