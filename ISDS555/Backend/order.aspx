<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="Backend_order" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="page-content-wrap">      
                 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>          
                 <div class="row">
            <div class="col-md-12">

                             <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>

                             <!-- START VALIDATIONENGINE PLUGIN -->
                            <div class="panel panel-default">
                             <div class="panel-heading">
                        <h3 class="panel-title">
                            Add Order</h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                            </li>
                        </ul>
                    </div>
                                <div class="panel-body">                                    
                                    <div class="row">
                            <div class="col-md-6">              
                                                                
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Customer:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddlcustomer" class="form-control" runat="server"></asp:DropDownList>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Order Type:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddlordertype" class="form-control" runat="server"></asp:DropDownList>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Payment:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddlpayment" class="form-control" runat="server"></asp:DropDownList>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Order Status:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddlstatus" class="form-control" runat="server"></asp:DropDownList>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Delivery:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddldelivery" class="form-control" runat="server"></asp:DropDownList>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Order Date:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtorderdate" runat="server" class="form-control datepicker"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtorderdate" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Payment Received Date:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtpaymentdate" runat="server" class="form-control datepicker"></asp:TextBox>
                                                
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Dispatch Date:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtdispatchdate" runat="server" class="form-control datepicker"></asp:TextBox>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                 
                                        
                                    </div>
                                    </div>

                                </div>
                            </div>                
                            <!-- END VALIDATIONENGINE PLUGIN -->


                             </ContentTemplate>
                            </asp:UpdatePanel>
                         
                                          <div class="col-md-12">
                                          
                                 <div class="col-md-3">
                                <%--<asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" ValidationGroup="r" AutoPostBack="true"
                                         onclick="Button1_Click" />--%>

                                     <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" ValidationGroup="r" OnClick="Button1_Click" AutoPostBack="true" />
                                     <br /><br />
                                </div>
                                
                               
                                </div>


                              <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Order Details</h3>
                                <ul class="panel-controls">
                                    <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="panel-body panel-body-table">
                                <div class="table-responsive">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <table class="table table-bordered table-striped table-actions">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                                                Width="100%" CellPadding="5" BorderStyle="None" BorderColor="White" CellSpacing="5"
                                                                GridLines="None" Font-Size="Small">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Order ID">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblorderid" runat="server" Text='<%#Eval("Order_ID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Customer">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Order Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblordertype" runat="server" Text='<%#Eval("OrderMode")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Payment">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblpayment" runat="server" Text='<%#Eval("PaymentMode")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Status">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivery">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbldelivery" runat="server" Text='<%#Eval("Delivery")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Order Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblorderdate" runat="server" Text='<%#Eval("Order_Date")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="Payment Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblpaymentdate" runat="server" Text='<%#Eval("Payment_Received_Date")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="Dispatch Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbldispatchdate" runat="server" Text='<%#Eval("Dispatch_Date")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="Total Price">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblprice" runat="server" Text='<%# string.Concat("R.",Eval("Total_Price"))%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                  
                                                                     <asp:TemplateField HeaderText="Edit">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btn_edit" class="btn btn-default btn-rounded btn-condensed btn-sm"
                                                                                CommandName="edit" CommandArgument='<%#Eval("Order_ID") %>' ToolTip='<%#Eval("Order_ID") %>'
                                                                                runat="server"><span class="fa fa-pencil"></span></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


               

                        </div>
                    
                        </div>
                    </div>

    <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-datepicker.js'></script>        
        <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-select.js'></script>        

        <script type='text/javascript' src='js/plugins/validationengine/languages/jquery.validationEngine-en.js'></script>
        <script type='text/javascript' src='js/plugins/validationengine/jquery.validationEngine.js'></script>        

        <script type='text/javascript' src='js/plugins/jquery-validation/jquery.validate.js'></script>                

        <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput.min.js'></script>        
    <!-- END SCRIPTS -->
</asp:Content>





