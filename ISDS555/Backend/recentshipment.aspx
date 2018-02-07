<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="recentshipment.aspx.cs" Inherits="Backend_recentshipment" %>

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
                                                                    <asp:TemplateField HeaderText="Item Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblfname" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Count Received">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblshipping" runat="server" Text='<%#Eval("Item_Count_Received")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Received_Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("Received_Date")%>'></asp:Label>
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

