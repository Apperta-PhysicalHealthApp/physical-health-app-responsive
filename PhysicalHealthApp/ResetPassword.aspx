﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="PhysicalHealthApp.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">

        <div class="row" style="margin-top: 40px;">
            <div class="col-md-4"></div>

            <div class="col-md-4 login-container">

                <div class="login-form">
                    <div>

                        <div style="text-align: center;">
                            <h2 style="color: #2a9fd6; font-weight: bolder;">Reset Password</h2>
                            <asp:Label ID="lblError" runat="server" CssClass="contentAlertDanger"></asp:Label>
                        </div>

                        <asp:Panel ID="fgtxtEmail" runat="server" class="form-group">
                            <label class="control-label" for="txtEmail">Please enter your email address</label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control input-lg"></asp:TextBox>
                        </asp:Panel>



                        <asp:Button ID="btnResetPassword" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Reset Password" OnClick="btnResetPassword_Click" />

                        <br />
                        <br />

                        <div id="divThankYou" runat="server" class="alert alert-success">
                            <h3>Thank you</h3>
                            If the email address entered matches an account in our system then you will receive and email with a link to reset your password
                        </div>

                        <div id="divError" runat="server" class="alert alert-danger">
                            <h3>Error</h3>
                            Sorry, something went wrong sending the email. <br /><br />
                            Details:
                            <br /><br />
                            <asp:Label ID="lblEmailError" runat="server"></asp:Label>
                        </div>


                        <div class="form-links">
                            <br />
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-md-4"></div>


        </div>


        <div class="row" style="margin-top: 15px;">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <div class="login-form">
                    <div>
                        <a class="btn btn-default" href="Login.aspx">Back to Login</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4"></div>
        </div>




    </div>
</asp:Content>
