<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="creditcardusers.aspx.cs" Inherits="Backend_creditcardusers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    </h3>
                                <ul class="panel-controls">
                                    <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="panel-body panel-body-table">
                                <div class="table-responsive">
                                            <table class="table table-bordered table-striped table-actions">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                                Width="100%" CellPadding="5" BorderStyle="None" BorderColor="White" CellSpacing="5"
                                                                GridLines="None" Font-Size="Small">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="First Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblfname" runat="server" Text='<%#Eval("First_Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Last Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbllname" runat="server" Text='<%#Eval("Last_Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Address">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Zip Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcode" runat="server" Text='<%#Eval("ZipCode")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Mobile">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("Mobile_Number")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Email">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Email_Address")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipping_Address">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblshipping" runat="server" Text='<%#Eval("Shipping_Address")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Credit Card?">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcard" runat="server" Text='<%#Eval("Is_Using_Credit_Card")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                  
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>

