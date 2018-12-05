#!/bin/sh
# This program and the accompanying materials are
# made available under the terms of the Eclipse Public License v2.0 which accompanies
# this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
# 
# SPDX-License-Identifier: EPL-2.0
# 
# Copyright Contributors to the Zowe Project.

echo "The script starts now"

echo "Hi, $USER!"

# Checking if the environment variable JUPYTER_CONFIG_DIR is set
if [[ -z "${JUPYTER_CONFIG_DIR}" ]]; then

	CDIR=$(jupyter --config-dir)
	echo "Custom files being placed into the jupyter --config-dir directory, which is: $CDIR"
	
	# Checking if a custom.js file already exists
	if [ -r "$CDIR/custom/custom.js" ]
	then 
		# Saves current custom.js in a backup file, and then replaces with custom.js of this project.
		touch custom.js
		cp "$CDIR/custom/custom.js" "$CDIR/custom/custom-backup.js"
		echo "Creating backup of existing custom.js file."
	else
		# Places custom.js file into appropriate folder.
		cp custom.js "$CDIR/custom/custom.js"
		echo "Copying the custom.js file into $CDIR"
	fi	
	
	# Replace the SERVER
	if [ -z $JUP_SERVER ]; then
		echo "Please set JUP_SERVER to the appropriate jupyter server link."
	else
		echo "Setting the server to $JUP_SERVER"
		sed -r -e "s|iframe src=\".*\"|iframe src=\"$JUP_SERVER\"|" web/html/index.html > web/html/index_tmp.html
		cp web/html/index_tmp.html web/html/index.html
		rm web/html/index_tmp.html

		echo "Updated the server in the jupyter application."
	fi

	# Copy the appropriate files to their correct locations.

	if [ -d $ZOE ]; then
		# Copying the app to the folder
		cp -R -p pluginDefinition.json $ZOE/jupyter-app/pluginDefinition.json
		cp -R -p web $ZOE/jupyter-app/web
		cp -R -p org.zowe.zlux.jupyter-app.json $ZOE/zlux-example-server/plugins/org.zowe.zlux.jupyter-app.json
		cp -R -p update_server.sh $ZOE/jupyter-app/update_server.sh

		cd $ZOE/zlux-build
		ant deploy
	else
		echo "Please set ZOE to an appropriate directory."
	fi
else
	echo "Please set JUPYTER_CONFIG_DIR to the appropriate .jupyter directory"
fi

# This program and the accompanying materials are
# made available under the terms of the Eclipse Public License v2.0 which accompanies
# this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
# 
# SPDX-License-Identifier: EPL-2.0
# 
# Copyright Contributors to the Zowe Project.
