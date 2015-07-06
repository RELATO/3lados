<%@page import="br.com.relato.portal.ControlPortal" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

	
	  <div id="featured_slide">
	    <!-- ####################################################################################################### -->
	    <div id="piecemaker"> <img src="images/demo/piecemaker/960x360.gif" alt="" /> </div>
	    <!-- ####################################################################################################### -->
	  </div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper col4">
	  <div id="container" class="clear">
	    <!-- ####################################################################################################### -->
	    <div id="shout" class="clear">
	      <div class="fl_left">
	        <h2 class="shadow">Ligue agora e agende uma<br>avaliação auditiva sem custo !</h2>
	<!--         <p>Ligue agora e agende uma avaliação auditiva sem custo ! (19) 3295.08.05</p> -->
	      </div>
	      <p class="fl_right"><a href="#contact" class="shadow">(19) 3295.08.05</a></p>
	    </div>
	    <!-- ####################################################################################################### -->
	    <div id="homepage" class="clear">
      <div class="fl_left">
<!--         <h2>Latest Featured Project</h2> -->
        <div id="hpage_slider">
          <div class="item"><a href="<%=checkNull(map,"link10",lingua)%>">
            <img src="<%=checkNull(map,"foto10",1)%>" alt="" width="150" height="104" /></a></div>
        </div>
        <div id="hpage_slider">
          <div class="item"><a href="<%=checkNull(map,"link11",lingua)%>">
            <img src="<%=checkNull(map,"foto11",1)%>" alt="" width="150" height="104" /></a></div>
        </div>
        <div id="hpage_slider">
          <div class="item"><a href="<%=checkNull(map,"link12",lingua)%>">
            <img src="<%=checkNull(map,"foto12",1)%>" alt="" width="150" height="104" /></a></div>
        </div>
        
        <div id="txportal">
        <h2><%=checkNull(map,"titulo1",lingua)%></h2>
<!--         <p><strong>Project Type:</strong> <a href="#">Wedding Photography</a></p> -->
        <p><%=checkNull(map,"texto1",lingua)%></p>
<!--         <p class="readmore"><a href="#"><strong>View The Full Project &raquo;</strong></a></p> -->
        <br>
        <h2><%=checkNull(map,"titulo2",lingua)%></h2>
        <p><%=checkNull(map,"texto2",lingua)%></p>
        </div>
        <br>
<!--        Form Email -->
<!--        <form action="#" method="post">
          <fieldset>
            <legend>Newsletter Signup:</legend>
            <input type="text" id="newsletter" value="Enter Email Here&hellip;" onfocus="this.value=(this.value=='Enter Email Here&hellip;')? '' : this.value ;" />
            <input type="image" id="subscribe" src="images/sign-up.gif" alt="Submit" />
          </fieldset>
        </form>
        <p class="form_hint">* Please add name@domain.com to your trusted email list</p>  -->
        <img src="/images/logos.jpg">
      </div>
      <div class="fl_right">
        <h2>Saiba</h2>
        <ul class="testimonials">
          <li>
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link3",lingua)%>"><strong><%=checkNull(map,"titulo3",lingua)%></strong></a></p>
          </li>
          <li>
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link4",lingua)%>"><strong><%=checkNull(map,"titulo4",lingua)%></strong></a></p>
          </li>
          <li>
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link5",lingua)%>"><strong><%=checkNull(map,"titulo5",lingua)%></strong></a></p>
          </li>
          <li>
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link6",lingua)%>"><strong><%=checkNull(map,"titulo6",lingua)%></strong></a></p>
          </li>
          <li>
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link7",lingua)%>"><strong><%=checkNull(map,"titulo7",lingua)%></strong></a></p>
          </li>
          <li>
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link8",lingua)%>"><strong><%=checkNull(map,"titulo8",lingua)%></strong></a></p>
          </li>
          <li class="last">
            <p><img src="/images/seta.png" class="imgsaiba" alt="" />&nbsp;&nbsp;<a href="<%=checkNull(map,"link9",lingua)%>"><strong><%=checkNull(map,"titulo9",lingua)%></strong></a></p>
          </li>
        </ul>
<br>
        <ul><li style="float:left;">
            <img src="images/chat2.jpg" alt="" title="atendimento online"> 
        </li>
        <li  style="float:right;">
        <a href="/imprensa.jsp">
        <img src="images/imprensa.jpg" alt="" title="atendimento online"> 
        </a>
        </li>
        </ul>
      </div>
      </div>
    <!-- ####################################################################################################### -->
  </div>

