
/*
MAKING THE LINKS UNDRAGGABLE
============================
*/
var x = document.getElementsByTagName("A");
var i;
for (i = 0; i < x.length; i++) {
  document.body.innerHTML = document.body.innerHTML.replace(/<a href/, '<a onmousedown="return false" href');
}

/*
// FOR TESTING
var x = document.getElementsByTagName("A");
var i;
for (i = 0; i < x.length; i++) {
   console.log(x[i]);
}
*/


/*
<!--
//Disable right mouse click Script
//By Oscar Frank
//For full source code, visit http://www.oscarmini.com
var message="Function Disabled!";
///////////////////////////////////
function clickIE4(){
  if (event.button==2){
    return false;
  }
}

function clickNS4(e){
  if (document.layers||document.getElementById&&!document.all){
    if (e.which==2||e.which==3){
      return false;
    }
  }
}

if (document.layers){
  document.captureEvents(Event.MOUSEDOWN);
  document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
  document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("return false");
*/


// disable right click on certain classes and tags
// ===============================================
// TO REPEAT THE SAME FOR AN ID USE: $("#id").bind...

//$("body").on("contextmenu",function(e){
//   return false;
//});
    
$('.col-sm-4').bind('contextmenu', function(e) {
    return false;
}); 

//Disable mouse right click on 'NAV' tag
$("nav").on("contextmenu",function(e){
   return false;
});

$("img").on("contextmenu",function(e){
   return true;
});


//close the app when the browser is closed
session$onSessionEnded(function() {
    stopApp()
})
  
  
