<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Backend_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">
            <div class="col-md-12">
                <br /><br />
                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">Registred users</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>

                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">External Sources Users</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>
                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">List of Payments Today</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>
            </div>
        <div class="col-md-12">
                <br /><br />
                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">Items Running Low Stock</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>

                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">Recent Shipment Received</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>
                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">Best Selling Item</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>
            </div>
        <div class="col-md-12">
                <br /><br />
                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">Credit Card Users</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>

                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">User with Maximum Purchase</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>
                <div class="col-md-4">

                    <!-- START WIDGET REGISTRED -->
                    <div class="widget widget-default widget-item-icon" onclick="location.href='pages-address-book.html';">
                        <div class="widget-item-left">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="widget-data">
                            <div class="widget-int num-count">
                                <asp:LinkButton ID="LinkButton9" runat="server" OnClick="LinkButton9_Click">LinkButton</asp:LinkButton>
                            </div>
                            <div class="widget-title">Inventory Items</div>
                        </div>
                    </div>
                    <!-- END WIDGET REGISTRED -->

                </div>
            </div>
        </div>

</asp:Content>

