<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="Backend_customer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                            Add Customer</h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                            </li>
                        </ul>
                    </div>
                                <div class="panel-body">                                    
                                    <div class="row">
                            <div class="col-md-6">              
                                                                
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">First Name:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtfirstname" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtfirstname" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Last Name:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtlastname" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtlastname" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Address:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtaddress" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtaddress" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Zip Code:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtzipcode" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtzipcode" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Font-Size="Small" runat="server" ControlToValidate="txtzipcode" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Mobile Number:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtmobile" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtmobile" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Font-Size="Small" runat="server" ControlToValidate="txtmobile" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>
                                        
                                <div class="form-group">
                                            <label class="col-md-3 control-label">Email:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtemail" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtemail" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Shipping Address:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtshipping" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtshipping" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Paid through Credit Card:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddlcard" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">False</asp:ListItem>
                                                    <asp:ListItem Value="1">True</asp:ListItem>
                                                </asp:DropDownList>

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
                                    Customer Details</h3>
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
                                                                  
                                                                     <asp:TemplateField HeaderText="Edit">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btn_edit" class="btn btn-default btn-rounded btn-condensed btn-sm"
                                                                                CommandName="edit" CommandArgument='<%#Eval("Customer_ID") %>' ToolTip='<%#Eval("Customer_ID") %>'
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
