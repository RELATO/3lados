_meH=1;  // keyword for milonic

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);


_menuCloseDelay=500           // The time delay for menus to remain visible on mouse out
_menuOpenDelay=150            // The time delay before menus open on mouse over
_followSpeed=5                // Follow scrolling speed
_followRate=50                // Follow scrolling Rate
_subOffsetTop=10               // Sub menu top offset
_subOffsetLeft=-10             // Sub menu left offset
_scrollAmount=3               // Only needed for Netscape 4.x
_scrollDelay=20               // Only needed for Netcsape 4.x

with(BigTransparent=new mm_style()){
oncolor="#FFFFFF"; //#
offcolor="#FFFFFF";
borderstyle="solid";
borderwidth=0;
bordercolor="#00009C"; // 
separatorcolor="#00009C";
separatorsize="0";
pagecolor="#000080"; // #fbbea8
padding=4;
fontsize="11";
fontstyle="normal";
fontweight="bolder";
fontfamily="Verdana, Arial, Tahoma";
subimage="/img/arrow-white.gif";
menubgimage="/img/menu.jpg";
subimagepadding="2";
}