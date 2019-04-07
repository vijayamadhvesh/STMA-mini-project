<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeBehind="ReceptionistHome.aspx.cs" Inherits="STMA.Secured.ReceptionistHome" MasterPageFile="STMAUserMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <%-- <form id="form1" runat="server">--%>
        <%Response.Write(ddlservices.ClientID); %>
        
        <div>
            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
            <button id="btnShow" >Show Users</button>
            <asp:DropDownList ID="ddlservices" runat="server">
            </asp:DropDownList>
            <button id="btnGenToken" >Generate Token</button>
        </div>
        <div id="UserDetailsPanel">
            <span id="msgEdit"></span>
            <div id="UserDetails" >

            </div>
            </br>
            <button id='btnEditUserDetails' >Edit Details</button>
        </div>
        <div id="UserEditPanel">
            <div id="UserEditForm"></div></br><button id='btnSaveUserDetails' >Save Details</button>
        </div>
        <div id="AddUserPanel">
            <div id="UserAddForm"></div></br><button id='btnAddNew' >Add New Patient</button>
        </div>
        <div id="ServiceDetailsPanel">
        </div>
        <div id="ServiceTokenPanel">
        </div>
    <%--</form>--%>
</asp:Content>