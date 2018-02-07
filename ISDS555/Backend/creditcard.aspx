<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="creditcard.aspx.cs" Inherits="Backend_creditcard" %>
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
                            Add Credit Card</h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                            </li>
                        </ul>
                    </div>
                                <div class="panel-body">                                    
                                    <div class="row">
                            <div class="col-md-6">              
                                                                
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Credit Card Number:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtcreditcard" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtcreditcard" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Font-Size="Small" runat="server" ControlToValidate="txtcreditcard" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Customer:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:DropDownList ID="ddlcustomer" runat="server" class="form-control"></asp:DropDownList>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Cvv:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtcvv" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtcvv" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Font-Size="Small" runat="server" ControlToValidate="txtcvv" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Expiry Date:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtedate" runat="server" class="form-control datepicker"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtedate" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Card Holder Name:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtholdername" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtholdername" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
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
                                    Credit Card Details</h3>
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
                                                                    <asp:TemplateField HeaderText="Credit Card">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcard" runat="server" Text='<%#Eval("Credit_Card_No")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Customer First Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblfname" runat="server" Text='<%#Eval("First_Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Customer Last Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbllname" runat="server" Text='<%#Eval("Last_Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cvv">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcvv" runat="server" Text='<%#Eval("Cvv")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Expiry Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbledate" runat="server" Text='<%#Eval("Expiry_Date")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Card Holder Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblholdername" runat="server" Text='<%#Eval("Cardholder_Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                  
                                                                     <asp:TemplateField HeaderText="Edit">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btn_edit" class="btn btn-default btn-rounded btn-condensed btn-sm"
                                                                                CommandName="edit" CommandArgument='<%#Eval("Credit_ID") %>' ToolTip='<%#Eval("Credit_ID") %>'
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


