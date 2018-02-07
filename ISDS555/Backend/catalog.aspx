<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="catalog.aspx.cs" Inherits="Backend_catalog" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="page-content-wrap">      
                 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>          
                 <div class="row">
            <div class="col-md-12">

                             <!-- START VALIDATIONENGINE PLUGIN -->
                            <div class="panel panel-default">
                             <div class="panel-heading">
                        <h3 class="panel-title">
                            Add Catalogs</h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                            </li>
                        </ul>
                    </div>
                                <div class="panel-body">                                    
                                    <div class="row">
                            <div class="col-md-6">              
                                                   

                                <div class="form-group">
                                            <div class="col-md-9">
                                              
                                                <asp:Button ID="Button1" runat="server" Text="Click Here to Add New Customer Details" class="btn btn-primary" OnClick="Button1_Click" AutoPostBack="true" />

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                

                                </div>
                                        <div class="col-md-6">              
                                                   

                                <div class="form-group">
                                            <label class="col-md-6 control-label">Get Customer Data From External Sources?:</label>
                                            <div class="col-md-6">
                                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="FileUpload1" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Font-Size="Small" runat="server" ControlToValidate="FileUpload1" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.csv)$" ErrorMessage="Please upload only .csv files" Text="Please upload only .csv files"></asp:RegularExpressionValidator>
                                                

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                            <div class="form-group">
                                <asp:Button ID="Button2" runat="server" Text="Click Here to Submit the Details from External Sources" class="btn btn-primary" ValidationGroup="r" OnClick="Button2_Click" AutoPostBack="true" />
                                                </div>
                                </div>
                            </div>    

                        </div>
                    
                        </div>                 


                              <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Catalog Details</h3>
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
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                                Width="100%" CellPadding="5" BorderStyle="None" BorderColor="White" CellSpacing="5"
                                                                GridLines="None" Font-Size="Small">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Customer ID">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("Customer_ID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
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

    <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-datepicker.js'></script>        
        <script type='text/javascript' src='js/plugins/bootstrap/bootstrap-select.js'></script>        

        <script type='text/javascript' src='js/plugins/validationengine/languages/jquery.validationEngine-en.js'></script>
        <script type='text/javascript' src='js/plugins/validationengine/jquery.validationEngine.js'></script>        

        <script type='text/javascript' src='js/plugins/jquery-validation/jquery.validate.js'></script>                

        <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput.min.js'></script>        
    <!-- END SCRIPTS -->
</asp:Content>









