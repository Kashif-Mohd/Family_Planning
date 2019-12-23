<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="duplicate_form1.aspx.cs" Inherits="Family_Planning.duplicate_form1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <div style="padding-left: 2%; margin-top: 15px;">

        <div id="divExportButton" runat="server" style="text-align: right; margin-top: -17px">
            <button type="button" id="Button1" class="btn btn-success" runat="server" style="height: 38px" onserverclick="btnExport_Click">
                Export &nbsp<span class="glyphicon glyphicon-export"></span>
            </button>
        </div>

        <%--Search Button--%>
        <div class="">
            <div id="divSearch" runat="server" class="SearchBoxx col-lg-offset-4" style="margin-bottom: 10px; margin-top: -7px;">
                <div id="imaginary_container" style="margin-top: 10px">
                    <div class="input-group stylish-input-group">
                        <asp:TextBox ID="txtdssid" CssClass="form-control txtboxx" ClientIDMode="Static" runat="server" placeholder="DSSID" MaxLength="11" ForeColor="Black"></asp:TextBox>
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary" id="btnSearch" runat="server" onserverclick="btnSearch_Click">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div style="width: 100%; height: 460px; overflow: scroll; margin-top: 20px">
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Record Found." AllowPaging="True" PageSize="200" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="footable" AllowSorting="false" ForeColor="#333333" AutoGenerateColumns="true">

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#74b9ff" ForeColor="white" Font-Bold="True" Height="40px" />
                <PagerStyle BackColor="#576574" ForeColor="White" CssClass="StylePager" />
                <PagerSettings Position="TopAndBottom" Mode="NumericFirstLast" PreviousPageText="&amp;lt;" PageButtonCount="13" />

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>


            <asp:GridView ID="GridView2" runat="server" CssClass="footable" ForeColor="#333333" AutoGenerateColumns="true">
            </asp:GridView>
        </div>


    </div>

</asp:Content>
