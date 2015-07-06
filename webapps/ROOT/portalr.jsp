<%@page import="br.com.relato.portal.ControlPortal" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

	<div id="portal">
	  <div id="accordion">
			<div>
				<h3><a><%=checkNull(map,"titulo1",lingua)%></a></h3>
				<div>
					<table class="tb">
						<tr>
							<td><img src="<%=checkNull(map,"foto1",1)%>" border=0 align=left></td>
							<td>
								<b><a href="<%=checkNull(map,"link1",1)%>" class="sw"></b>
								<br>&nbsp;&nbsp;<%=checkNull(map,"texto1",lingua)%></a>
								<hr color="white">
								<a href="<%=checkNull(map,"link1",1)%>"  id="botaolink">Continue Lendo &raquo;</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3><a><%=checkNull(map,"titulo2",lingua)%></a></h3>
				<div>
					<table class="tb">
						<tr>
							<td><img src="<%=checkNull(map,"foto2",1)%>" border=0 align=left ></td>
							<td>
								<b><a href="<%=checkNull(map,"link2",1)%>" class="sw"></b>
								<br>&nbsp;&nbsp;<%=checkNull(map,"texto2",lingua)%></a>
								<hr color="white">
								<a href="<%=checkNull(map,"link2",1)%>"  id="botaolink">Continue Lendo &raquo;</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3><a><%=checkNull(map,"titulo3",lingua)%></a></h3>
				<div>
					<table class="tb">
						<tr>
							<td><img src="<%=checkNull(map,"foto3",1)%>" border=0 align=left></td>
							<td>
								<b><a href="<%=checkNull(map,"link3",1)%>" class="sw"></b>
								<br>&nbsp;&nbsp;<%=checkNull(map,"texto3",lingua)%></a>
								<hr color="white">
								<a href="<%=checkNull(map,"link3",1)%>"  id="botaolink">Continue Lendo &raquo;</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		<!-- <div>
				<h3><a><%=checkNull(map,"titulo4",lingua)%></a></h3>
				<div>
					<table class="tb">
						<tr>
							<td><img src="<%=checkNull(map,"foto4",1)%>" border=0 align=left></td>
							<td>
								<b><a href="<%=checkNull(map,"link4",1)%>" class="sw"></b>
								<br><%=checkNull(map,"texto4",lingua)%></a>
								<hr color="white">
								<a href="<%=checkNull(map,"link4",1)%>"  id="botaolink">Continue Lendo &raquo;</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			 -->
		</div>
	</div>	
  			
  
   <br>
  <!-- 
   <div style="margin:0 auto 0;border:0px solid #000;width:96%;">
      <ul>
         <li>
	      <h2><img src="images/demo/60x60.gif" alt="" />Nullamlacus dui ipsum conseque loborttis</h2>
	         <p>Nullamlacus dui ipsum conseque loborttis non euisque morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque congue magnis vestibulum quismodo nulla et feugiat. Adipisciniapellentum leo ut consequam ris felit elit id nibh sociis malesuada.</p>
          <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
        </li>
       <li>
          <h2><img src="images/demo/60x60.gif" alt="" />Nullamlacus dui ipsum conseque loborttis</h2>
	         <p>Nullamlacus dui ipsum conseque loborttis non euisque morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque congue magnis vestibulum quismodo nulla et feugiat. Adipisciniapellentum leo ut consequam ris felit elit id nibh sociis malesuada.</p>
          <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
        </li>
        <li class="last">
          <h2><img src="images/demo/60x60.gif" alt="" />Nullamlacus dui ipsum conseque loborttis</h2>
          <p>Nullamlacus dui ipsum conseque loborttis non euisque morbi penas dapibulum orna. Urnaultrices quis curabitur phasellentesque congue magnis vestibulum quismodo nulla et feugiat. Adipisciniapellentum leo ut consequam ris felit elit id nibh sociis malesuada.</p>
          <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
        </li>
       </ul>
      <br class="clear" />
    </div>
   <br>
   </div>
      <div id="tabs">
				<ul>
					<li><a href="#tabs-1">First</a></li>
					<li><a href="#tabs-2">Second</a></li>
					<li><a href="#tabs-3">Third</a></li>
				</ul>
				<div id="tabs-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
				<div id="tabs-2">Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
				<div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
			</div>
		-->
