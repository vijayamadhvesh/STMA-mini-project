<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="STMA.Login" MasterPageFile="~/STMAMaster.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
           
            <table align="center" width="80%" border="0" cellpadding="2" cellspacing="0" bordercolor="blue" style="background-color:#77a3f3">
                <tr>
                    <td>
            <table>
                <tr>
                     <td width="20%">
            &nbsp;
            </td>
                    <td >
                    <asp:Label ID="lblLogin" runat="server" ></asp:Label>
                    </td>

                </tr>
                  <tr>
                    <td colspan="2">
                    &nbsp;
                    </td>

                </tr>
                
                <tr>
                     <td width="20%">
            &nbsp;
            </td>

                    <td>
            <asp:TextBox ID="txtLoginid" runat="server" placeholder="Login ID"></asp:TextBox>
            </td>
           
                </tr>
                 <tr>
                      <td width="20%">
            &nbsp;
            </td>
                    <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<font color='red'>Please enter Loginid</font>" ControlToValidate="txtLoginid"></asp:RequiredFieldValidator>
                    </td>

                </tr>
            <tr>
                   <td width="20%">
            &nbsp;
            </td>
                <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                </td>
              
                </tr>
                 <tr>
                      <td width="20%">
            &nbsp;
            </td>
                    <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<font color='red'>Please enter Password</font>" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </td>

                </tr>
            <tr>
                   <td width="30%">
            &nbsp;
            </td>
                <td ><table border="0" width="100%"><tr><td  width="20%">&nbsp;</td>
                    <td>
            <asp:Button ID="btnSignin" runat="server" Text="Sign In" OnClick="btnSignin_Click" CssClass="btnNormal" />
                        </td>
                </tr></table>
                    </td><td>&nbsp;</td>
                </tr> 
                 <tr>
                    <td colspan="2">
                    &nbsp;
                    </td>

                </tr>
            </table>
            </td>
            </tr>
            </table>
     
        </div>
    </form>
</asp:Content>