<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/admin.master" AutoEventWireup="true" CodeFile="inventory.aspx.cs" Inherits="Backend_inventory" %>
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
                            Add Inventory</h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a>
                            </li>
                        </ul>
                    </div>
                                <div class="panel-body">                                    
                                    <div class="row">
                            <div class="col-md-6">              
                                                                
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Item Name:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtname" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtname" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Color:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtcolor" runat="server" class="form-control"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtcolor" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Size:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtsize" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtsize" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Desciption:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtdescription" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtdescription" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Price:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtprice" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtprice" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Font-Size="Small" runat="server" ControlToValidate="txtprice" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                 <div class="form-group">
                                            <label class="col-md-3 control-label">Available Count:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtcount" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtcount" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Font-Size="Small" runat="server" ControlToValidate="txtcount" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
                                                <span class="help-block">&nbsp;</span>
                                            </div>
                                        </div>

                                <div class="form-group">
                                            <label class="col-md-3 control-label">Threshold Limit:</label>
                                            <div class="col-md-9">
                                              
                                                <asp:TextBox ID="txtthresholdlimit" runat="server" class="form-control"></asp:TextBox>

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" Text="Required"
                                    ValidationGroup="r" ForeColor="#FF3300" ControlToValidate="txtthresholdlimit" Font-Size="Small"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Font-Size="Small" runat="server" ControlToValidate="txtthresholdlimit" ValidationGroup="r" Display="Dynamic" ForeColor="Red" ValidationExpression="^\d+$" ErrorMessage="Please enter only numbers" Text="Please enter only numbers"></asp:RegularExpressionValidator>
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
                                    Inventory Details</h3>
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
                                                                    <asp:TemplateField HeaderText="Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Color">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcolor" runat="server" Text='<%#Eval("Color")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Size">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblsize" runat="server" Text='<%#Eval("Size")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Price">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblprice" runat="server" Text='<%#Eval("Price")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Available Count">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblcount" runat="server" Text='<%#Eval("Available_Count")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Threshold Limit">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblthresholdlimit" runat="server" Text='<%#Eval("Threshold_Limit")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                  
                                                                     <asp:TemplateField HeaderText="Edit">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btn_edit" class="btn btn-default btn-rounded btn-condensed btn-sm"
                                                                                CommandName="edit" CommandArgument='<%#Eval("Item_ID") %>' ToolTip='<%#Eval("Item_ID") %>'
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



