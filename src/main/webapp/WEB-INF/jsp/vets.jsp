<%@ page import="org.springframework.samples.petclinic.Vet" %>
<%@ page import="org.springframework.samples.petclinic.Vets" %>
<%@ page import="org.springframework.samples.petclinic.Specialty" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<%@ include file="/WEB-INF/jsp/includes.jsp" %>
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<h2>Veterinarians:</h2>

<table>
  <thead>
    <th>Name</th>
    <th>Specialties</th>
  </thead>
  
<%
    Vets vets = (Vets)request.getAttribute("vets");
    for(Vet vet : vets.getVetList()){
%>
    <tr>
    	<td>
    		<%=vet.getLastName()%>
    	<td>
       	<%
       	List<Specialty> specs = vet.getSpecialties();
       	Iterator<Specialty> it = specs.iterator();
       	while(it.hasNext()){
       	%>
		<td>
			<%=it.next().getName()%>
		</td>
       	<%
       	}
		%>
     </tr>
   <%
   	}
   %>
</table>
<table class="table-buttons">
  <tr>
    <td>
      <a href="<spring:url value="/vets.xml" htmlEscape="true" />">View as XML</a>
    </td>
  </tr>
</table>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>
