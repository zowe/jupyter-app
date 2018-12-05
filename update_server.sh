#!/bin/sh
# This program and the accompanying materials are
# made available under the terms of the Eclipse Public License v2.0 which accompanies
# this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
# 
# SPDX-License-Identifier: EPL-2.0
# 
# Copyright Contributors to the Zowe Project.
if [ -z $JUP_SERVER ]; then
  echo "Please set JUP_SERVER to the appropriate jupyter server link"
else
  echo "Setting the server to $JUP_SERVER"
  sed -r -e "s|iframe src=\".*\"|iframe src=\"$JUP_SERVER\"|" web/html/index.html > web/html/index_tmp.html
  cp web/html/index_tmp.html web/html/index.html
  rm web/html/index_tmp.html
  echo "Successfully updated the server in the jupyter application"

# This program and the accompanying materials are
# made available under the terms of the Eclipse Public License v2.0 which accompanies
# this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
# 
# SPDX-License-Identifier: EPL-2.0
# 
# Copyright Contributors to the Zowe Project.
