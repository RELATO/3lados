<%@page import="br.com.relato.portal.ControlPortal"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

		
			<!--  div nao mostrado para alinhar as imagens -->
				<div style="height:112px;display:none;">
					<div id="hpage_slider">
						<div class="item">
							<a href="<%=checkNull(map, "link1", lingua)%>"> <img src="<%=checkNull(map, "foto1", 1)%>" alt="" /></a>
						</div>
					</div>
					<div id="hpage_slider">
						<div class="item">
							<a href="<%=checkNull(map, "link2", lingua)%>"> <img src="<%=checkNull(map, "foto2", 1)%>" alt=""/></a>
						</div>
					</div>
					<div id="hpage_slider">
						<div class="item">
							<a href="<%=checkNull(map, "link3", lingua)%>"> <img src="<%=checkNull(map, "foto3", 1)%>" alt="" /></a>
						</div>
					</div>
				</div>	
	
			<div id="imgportal">
				<div id="hpage_slider">
					<div class="item">
						<a href="<%=checkNull(map, "link1", lingua)%>"> <img
							src="<%=checkNull(map, "foto1", 1)%>" alt="" width="150"
							height="104" /></a>
					</div>
				</div>
				<div id="hpage_slider">
					<div class="item">
						<a href="<%=checkNull(map, "link2", lingua)%>"> <img
							src="<%=checkNull(map, "foto2", 1)%>" alt="" width="150"
							height="104" /></a>
					</div>
				</div>
				<div id="hpage_slider">
					<div class="item">
						<a href="<%=checkNull(map, "link3", lingua)%>"> <img
							src="<%=checkNull(map, "foto3", 1)%>" alt="" width="150"
							height="104" /></a>
					</div>
				</div>
			</div>	
			<div id="pesquerda1">
				<h2><%=checkNull(map, "titulo1", lingua)%></h2>
				<!--         <p><strong>Project Type:</strong> <a href="#">Wedding Photography</a></p> -->
				<p><a href="<%=checkNull(map, "link1", lingua)%>"><%=checkNull(map, "texto1", lingua)%></a></p>
				<!--         <p class="readmore"><a href="#"><strong>View The Full Project &raquo;</strong></a></p> -->
			</div>
			<div id="pesquerda2">
				<h2><%=checkNull(map, "titulo2", lingua)%></h2>
				<!--         <p><strong>Project Type:</strong> <a href="#">Wedding Photography</a></p> -->
				<p><a href="<%=checkNull(map, "link2", lingua)%>"><%=checkNull(map, "texto2", lingua)%></a></p>
				<!--         <p class="readmore"><a href="#"><strong>View The Full Project &raquo;</strong></a></p> -->
			</div>	
	
		