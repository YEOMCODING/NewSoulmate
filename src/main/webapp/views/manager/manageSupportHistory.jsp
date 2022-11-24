<%@ page import="tk.newsoulmate.domain.vo.ShelterSupportResponse" %>
<%@ page import="java.util.List" %>
<%@ page import="tk.newsoulmate.domain.vo.type.WithdrawStatus" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="tk.newsoulmate.domain.vo.SupportPage" %>
<%@ page import="tk.newsoulmate.domain.vo.ManageSupportResponse" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<ManageSupportResponse> transfers = (List<ManageSupportResponse>) request.getAttribute("transfers");

    // SupportPage pageInfo = (SupportPage) request.getAttribute("pageInfo");
    //
    // int currentPage = pageInfo.getPage();
    // int startPage = pageInfo.getStartPage();
    // int endPage = pageInfo.getEndPage();
    // int maxPage = pageInfo.getMaxPage();
%>

<html>
<head>
    <title>후원관리-후원내역 확인</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>

    <%@ include file="/views/template/styleTemplate.jsp"%>
    <link href="<%=request.getContextPath()%>/css/manager/manageSupportHistory.css" rel="stylesheet">




</head>
<body>
<header>
    <%@include file="/views/manager/managerHeader.jsp"%>
</header>






<div class="headcontainer">


    <div id="right_view">

        <div>
            <h2>보호소별 후원내역</h2>
        </div>




        <div id="user_information">
            <%--            <div class="box">--%>
            <%--                <span>보호소명</span>--%>
            <%--                <div id="supportDate">--%>
            <%--                    <span>조회기간</span>--%>
            <%--                    <span><input type="date" id="startDate" value="<%=startDate%>"></span>--%>
            <%--                    <span>~</span>--%>
            <%--                    <span><input type="date" id="endDate" value="<%=endDate%>"></span>--%>
            <%--                    <button id="searchBtn" onclick="searchByDate()">조회</button>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <div id="supportShelterList">
                <table>
                    <thead>
                    <tr>
                        <th>결제번호</th>
                        <th>후원보호소명</th>
                        <th>후원일시</th>
                        <th>후원 금액(원)</th>
                        <th>후원자</th>
                        <th>출금여부</th>
                    </tr>
                    </thead>
                    <%if(transfers == null || transfers.isEmpty()) {%>
                    <tr>
                        <td colspan = "6">존재하는 후원내역이 없습니다.</td>
                    </tr>

                    <%} else { %>
                    <%for(int i = 0; i < transfers.size(); ++i) {
                        ManageSupportResponse transfer = transfers.get(i);
                    %>
                    <tr>
                        <td><%=transfer.getMerchantUid()%></td>
                        <td><%=transfer.getShelterName()%></td>
                        <td><%=transfer.getPayTime() %></td>
                        <td><%=transfer.getAmount() %></td>
                        <td><%=transfer.getSupporterName() %></td>
                        <td>
                            <%
                                if (transfer.getStatus().equals(WithdrawStatus.DONE)) {
                            %>
                            승인완료
                            <% } else if (transfer.getStatus().equals(WithdrawStatus.REQUESTED)) { %>
                            <input type="submit" class="btn btn-primary" data-bs-toggle="modal"
                                   data-bs-target="#staticBackdrop" value="승인" onclick="test()">
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                    <% } %>
                    <tbody>
                </table>
            </div>
        </div>


        <div><br><br><br></div>



        <div>


            <div>
                <h2>전체 후원내역</h2>
            </div>

            <div id="supportAllrList">
                <table>
                    <thead>
                    <tr>
                        <th>결제번호</th>
                        <th>후원보호소명</th>
                        <th>후원일시</th>
                        <th>후원 금액(원)</th>
                        <th>후원자</th>
                        <th>출금여부</th>
                    </tr>
                    </thead>
                    <%if(transfers == null || transfers.isEmpty()) {%>
                    <tr>
                        <td colspan = "6">존재하는 후원내역이 없습니다.</td>
                    </tr>

                    <%} else { %>
                    <%for(int i = 0; i < transfers.size(); ++i) {
                        ManageSupportResponse transfer = transfers.get(i);
                    %>
                    <tr>
                        <td><%=transfer.getMerchantUid()%></td>
                        <td><%=transfer.getShelterName()%></td>
                        <td><%=transfer.getPayTime() %></td>
                        <td><%=transfer.getAmount() %></td>
                        <td><%=transfer.getSupporterName() %></td>
                        <td>
                            <%

                            %>

                        </td>
                    </tr>
                    <% } %>
                    <% } %>
                    <tbody>
                </table>
            </div>





        </div>







    </div>
</div>







</body>

</html>