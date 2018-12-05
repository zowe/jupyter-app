
/*
  This program and the accompanying materials are
  made available under the terms of the Eclipse Public License v2.0 which accompanies
  this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
  
  SPDX-License-Identifier: EPL-2.0
  
  Copyright Contributors to the Zowe Project.
*/

// Tests the sending of requests to other plugins. Invoked
// by the button labelled "Send App Request"

// document.getElementById("jup_frame1").addEventListener("click", function () {
//     console.log ("Inside onclick");
//     window.location = "https://www.google.com";
// }, false);


// Random print messages and an attempt to change the target of the link.
window.onclick = function(e) {console.log("CLICK REGISTERED");};
console.log(window.onclick);


function injectJS() {
        console.log("PRINTING DOCUMENT HEAD");
        console.log(window.frames.document.getElementsByTagName("head")[0]);
        var iFrameHead = window.frames["jup1"].document.getElementsByTagName("head")[0];        
        var myscript = document.createElement('script');
        console.log("injecting");
        myscript.type = 'text/javascript';
        myscript.src = 'inject.js'; // replace this with your SCRIPT
        iFrameHead.appendChild(myscript);
}


window.addEventListener("load", function () {
  console.log('JUPYTER APP HAS BEEN LOADED');
}, false);
/*
  This program and the accompanying materials are
  made available under the terms of the Eclipse Public License v2.0 which accompanies
  this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
  
  SPDX-License-Identifier: EPL-2.0
  
  Copyright Contributors to the Zowe Project.
*/
