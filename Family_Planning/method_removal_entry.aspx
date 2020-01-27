<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="method_removal_entry.aspx.cs" Inherits="Family_Planning.method_removal_entry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <style>
        /*change Color of Radio Button*/

        .textDropDownCSS {
            font-size: 1.0em;
            font-family: Calibri;
            Height: 2.3em;
            color: #16a085;
        }

        .RomanEnglish {
            color: #BE90D4;
            margin-top: 0.5em;
        }

        /* For Label CSS */
        .labelCSS {
            font-family: Calibri;
            font-size: 1.1em;
            color: #446CB3;
            /*#3A539B*/
        }

        /* For Textbox CSS */
        .textBoxCSS {
            font-size: 1em;
            font-family: Calibri;
            Height: 2.4em;
            color: #446CB3;
        }


        /* For First Column of Table (Questions)*/
        .TableColumn {
            color: black;
            font-family: Trebuchet MS;
            font-size: 1.2em;
            height: auto;
        }

        /* For Last Column of Table Row Distance*/
        .Space {
            margin-bottom: 1.5%;
        }

        /* Radio Button Space */
        .RadioSpace label {
            font-family: Calibri;
            margin-left: 10px;
            color: #486591;
            font-size: 1em;
        }



        /* For Mobile Browser*/
        @media only screen and (max-width: 40em) {

            thead th {
                display: none;
            }

            td[data-th]:before {
                content: attr(data-th);
            }



            /* own design*/
            table {
                border-collapse: collapse;
                width: 100%;
            }

            .trCSS {
                border-bottom: 1px solid #ddd;
            }

            .tdCSS {
                margin-top: 1em;
                display: block;
                font-family: Trebuchet MS;
                text-align: center;
            }

            .Mobile {
                width: 90%;
                padding-left: 7%;
            }

            .ColumTOP {
                padding-top: 2.2em;
            }

            .ColumBOTTOM {
                padding-bottom: 1em;
            }
        }







        /* For Web Browser*/

        @media only screen and (min-width: 40em) {
            .buttonWeb {
                width: 22%;
                margin-left: 38%;
            }

            /*table {
                border-collapse: collapse;
                width: 100%;
            }*/

            .tdCSS {
                width: 50%;
                padding: 7px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .Mobile {
                padding-left: 5%;
                text-align: center;
                width: 95%;
            }

            .trCSS {
                height: 50px;
            }
        }
    </style>


    <script type="text/javascript">

        window.onload = function () {
            if ($('#<%= txtq6.ClientID %> input:checked').val() == '14') {
                document.getElementById("TR_Q6").style.display = 'table-row';
            }

            if (parseInt(document.getElementById("txtq7").value) >= 1) {
                document.getElementById("TR_Q8").style.display = 'table-row';
                document.getElementById("TR_Q9").style.display = 'table-row';
                document.getElementById("TR_Q10").style.display = 'table-row';
                document.getElementById("TR_Q11").style.display = 'table-row';
                document.getElementById("TR_Q12").style.display = 'table-row';
                document.getElementById("TR_Q13_m").style.display = 'table-row';
                document.getElementById("TR_Q13_f").style.display = 'table-row';
                document.getElementById("TR_Q14_d").style.display = 'table-row';
                document.getElementById("TR_Q14_m").style.display = 'table-row';
                document.getElementById("TR_Q14_y").style.display = 'table-row';
            }

            if ($('#<%= txtq17.ClientID %> input:checked').val() == '11') {
                document.getElementById("TR_Q17").style.display = 'table-row';
            }
            if ((parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) > 1) {
                document.getElementById("TR_Q15_d").style.display = 'table-row';
                document.getElementById("TR_Q15_m").style.display = 'table-row';
                document.getElementById("TR_Q15_y").style.display = 'table-row';
            }

        }






        function enable(id) {
            var val = parseInt(document.getElementById(id).value);

            if (id == 'txtq7') {
                if (val >= 1) {
                    document.getElementById("TR_Q8").style.display = 'table-row';
                    document.getElementById("TR_Q9").style.display = 'table-row';
                    document.getElementById("TR_Q10").style.display = 'table-row';
                    document.getElementById("TR_Q11").style.display = 'table-row';
                    document.getElementById("TR_Q12").style.display = 'table-row';
                    document.getElementById("TR_Q13_m").style.display = 'table-row';
                    document.getElementById("TR_Q13_f").style.display = 'table-row';
                }
                else  {
                    document.getElementById("TR_Q8").style.display = 'none';
                    document.getElementById("TR_Q9").style.display = 'none';
                    document.getElementById("TR_Q10").style.display = 'none';
                    document.getElementById("TR_Q11").style.display = 'none';
                    document.getElementById("TR_Q12").style.display = 'none';
                    document.getElementById("TR_Q13_m").style.display = 'none';
                    document.getElementById("TR_Q13_f").style.display = 'none';

                    document.getElementById("txtq8").value = "";
                    document.getElementById("txtq9").value = "";
                    document.getElementById("txtq10").value = "";
                    document.getElementById("txtq11").value = "";
                    document.getElementById("txtq12").value = "";
                    document.getElementById("txtq13_m").value = "";
                    document.getElementById("txtq13_f").value = "";
                }
            }


            if (id == 'txtq13_m' || id == 'txtq13_f') {
                if ((parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) == 1) {
                    document.getElementById("TR_Q14_d").style.display = 'table-row';
                    document.getElementById("TR_Q14_m").style.display = 'table-row';
                    document.getElementById("TR_Q14_y").style.display = 'table-row';
                    document.getElementById("TR_Q15_d").style.display = 'none';
                    document.getElementById("TR_Q15_m").style.display = 'none';
                    document.getElementById("TR_Q15_y").style.display = 'none';
                    document.getElementById("txtq15_d").value = "";
                    document.getElementById("txtq15_m").value = "";
                    document.getElementById("txtq15_y").value = "";
                }
                else if ((parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) > 1) {
                    document.getElementById("TR_Q14_d").style.display = 'table-row';
                    document.getElementById("TR_Q14_m").style.display = 'table-row';
                    document.getElementById("TR_Q14_y").style.display = 'table-row';
                    document.getElementById("TR_Q15_d").style.display = 'table-row';
                    document.getElementById("TR_Q15_m").style.display = 'table-row';
                    document.getElementById("TR_Q15_y").style.display = 'table-row';
                }
                else
                {
                    document.getElementById("TR_Q14_d").style.display = 'none';
                    document.getElementById("TR_Q14_m").style.display = 'none';
                    document.getElementById("TR_Q14_y").style.display = 'none';
                    document.getElementById("TR_Q15_d").style.display = 'none';
                    document.getElementById("TR_Q15_m").style.display = 'none';
                    document.getElementById("TR_Q15_y").style.display = 'none';
                    document.getElementById("txtq14_d").value = "";
                    document.getElementById("txtq14_m").value = "";
                    document.getElementById("txtq14_y").value = "";
                    document.getElementById("txtq15_d").value = "";
                    document.getElementById("txtq15_m").value = "";
                    document.getElementById("txtq15_y").value = "";

                }
            }



        }







        function clearRadioButtonList_Q20() {

            var elementRef = document.getElementById('<%= txtq20.ClientID %>');
             var inputElementArray = elementRef.getElementsByTagName('input');

             for (var i = 0; i < inputElementArray.length; i++) {
                 var inputElement = inputElementArray[i];

                 inputElement.checked = false;
             }
             return false;
        }
        function clearRadioButtonList_Q21() {

            var elementRef = document.getElementById('<%= txtq21.ClientID %>');
            var inputElementArray = elementRef.getElementsByTagName('input');

            for (var i = 0; i < inputElementArray.length; i++) {
                var inputElement = inputElementArray[i];

                inputElement.checked = false;
            }
            return false;
        }




        function RadioButton(id) {


            var Q6_selectedvalue = $('#<%= txtq6.ClientID %> input:checked').val();

            var Q17_selectedvalue = $('#<%= txtq17.ClientID %> input:checked').val();
            var Q19_selectedvalue = $('#<%= txtq19.ClientID %> input:checked').val();
            var Q21_selectedvalue = $('#<%= txtq21.ClientID %> input:checked').val();

            if (id == 'txtq6') {
                if (Q6_selectedvalue != "" && Q6_selectedvalue == "14") {
                    document.getElementById("TR_Q6").style.display = 'table-row';
                }
                else if (Q6_selectedvalue == "" || Q6_selectedvalue != "14") {
                    document.getElementById("TR_Q6").style.display = 'none';
                    document.getElementById("txtq6_other").value = "";
                }
            }

            else if (id == 'txtq17') {
                if (Q17_selectedvalue != "" && Q17_selectedvalue == "11") {
                    document.getElementById("TR_Q17").style.display = 'table-row';
                }
                else if (Q17_selectedvalue == "" || Q17_selectedvalue != "11") {
                    document.getElementById("TR_Q17").style.display = 'none';
                    document.getElementById("txtq17_other").value = "";
                }
            }


            else if (id == 'txtq19') {
                if (Q19_selectedvalue == "1") {
                    document.getElementById("TR_Q19").style.display = 'table-row';
                    document.getElementById("TR_Q20").style.display = 'none';
                    document.getElementById("TR_Q21A").style.display = 'none';
                    document.getElementById("TR_Q21B").style.display = 'none';
                    clearRadioButtonList_Q20();
                    clearRadioButtonList_Q21();
                    document.getElementById("txtq21_other").value = '';
                }
                else if (Q19_selectedvalue == "2") {
                    document.getElementById("TR_Q19").style.display = 'none';
                    document.getElementById("txtq19_other").value = '';
                    document.getElementById("TR_Q20").style.display = 'table-row';
                    document.getElementById("TR_Q21A").style.display = 'table-row';
                }
            }





            else if (id == 'txtq21') {
                if (Q21_selectedvalue != "" && Q21_selectedvalue == "11") {
                    document.getElementById("TR_Q21B").style.display = 'table-row';
                }
                else if (Q21_selectedvalue == "" || Q21_selectedvalue != "11") {
                    document.getElementById("TR_Q21B").style.display = 'none';
                    document.getElementById("txtq21_other").value = "";
                }
            }

        }





        function Validate(rb) {
            var rb;
            var radio = rb.getElementsByTagName("input");
            var isChecked = false;
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            return isChecked;
        }







        function clicknext() {

            if (document.getElementById('txtq5').value == '') {
                alert("Select Date!")
                document.getElementById('txtq5').focus();
                return false;
            }
           
            else if (Validate(document.getElementById('<%=txtq6.ClientID%>')) == false) {
                alert("Select Q6 Value")
                return false;
            }
            else if ($('#<%= txtq6.ClientID %> input:checked').val() == '14' && (document.getElementById("txtq6_other").value == '' || document.getElementById("txtq6_other").value.length < 3)) {
                 alert("Enter Other Values")
                 document.getElementById("txtq6_other").focus();
                 return false;
             }

             else if (document.getElementById("txtq7").value == '' || document.getElementById("txtq7").value.length < 2) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq7").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq8").value == '' || document.getElementById("txtq8").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq8").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq9").value == '' || document.getElementById("txtq9").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq9").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq10").value == '' || document.getElementById("txtq10").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq10").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq11").value == '' || document.getElementById("txtq11").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq11").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq12").value == '' || document.getElementById("txtq12").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq12").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq13_m").value == '' || document.getElementById("txtq13_m").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq13_m").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (document.getElementById("txtq13_f").value == '' || document.getElementById("txtq13_f").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq13_f").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) >= 1 && (document.getElementById("txtq14_d").value == '' || document.getElementById("txtq14_d").value.length < 2 || document.getElementById("txtq14_d").value > 30)) {
                 alert("Enter Value less than 31, 2 digit long!")
                 document.getElementById("txtq14_d").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) >= 1 && (document.getElementById("txtq14_m").value == '' || document.getElementById("txtq14_m").value.length < 2 || document.getElementById("txtq14_m").value >= 12)) {
                 alert("Enter Value less than 12, 2 digit long!")
                 document.getElementById("txtq14_m").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) >= 1 && (document.getElementById("txtq14_y").value == '' || document.getElementById("txtq14_y").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq14_y").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) > 1 && (document.getElementById("txtq15_d").value == '' || document.getElementById("txtq15_d").value.length < 2 || document.getElementById("txtq15_d").value > 30)) {
                 alert("Enter Value less than 31, 2 digit long!")
                 document.getElementById("txtq15_d").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) > 1 && (document.getElementById("txtq15_m").value == '' || document.getElementById("txtq15_m").value.length < 2 || document.getElementById("txtq15_m").value >= 12)) {
                 alert("Enter Value less than 12, 2 digit long!")
                 document.getElementById("txtq15_m").focus();
                 return false;
             }
             else if (document.getElementById("txtq7").value >= 1 && (parseInt(document.getElementById("txtq13_m").value) + parseInt(document.getElementById("txtq13_f").value)) > 1 && (document.getElementById("txtq15_y").value == '' || document.getElementById("txtq15_y").value.length < 2)) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq15_y").focus();
                 return false;
             }
             else if (document.getElementById("txtq16_d").value == '' || document.getElementById("txtq16_d").value.length < 2 || document.getElementById("txtq16_d").value > 30) {
                 alert("Enter Value less than 31, 2 digit long!")
                 document.getElementById("txtq16_d").focus();
                 return false;
             }
             else if (document.getElementById("txtq16_m").value == '' || document.getElementById("txtq16_m").value.length < 2 || document.getElementById("txtq16_m").value >= 12) {
                 alert("Enter Value less than 12, 2 digit long!")
                 document.getElementById("txtq16_m").focus();
                 return false;
             }
             else if (document.getElementById("txtq16_y").value == '' || document.getElementById("txtq16_y").value.length < 2) {
                 alert("Enter Value, 2 digit long!")
                 document.getElementById("txtq16_y").focus();
                 return false;
             }
             else if (Validate(document.getElementById('<%=txtq17.ClientID%>')) == false) {
                alert("Select Q17 Value")
                return false;
            }
            else if ($('#<%= txtq17.ClientID %> input:checked').val() == '11' && (document.getElementById("txtq17_other").value == '' || document.getElementById("txtq17_other").value.length < 3)) {
                alert("Enter Other Values")
                document.getElementById("txtq17_other").focus();
                return false;
            }
            else if (Validate(document.getElementById('<%=txtq18.ClientID%>')) == false) {
                alert("Select Q18 Value")
                return false;
            }
            else if (Validate(document.getElementById('<%=txtq19.ClientID%>')) == false) {
                alert("Select Q19 Value")
                return false;
            }
            else if ($('#<%= txtq19.ClientID %> input:checked').val() == '1' && (document.getElementById("txtq19_other").value == '' || document.getElementById("txtq19_other").value.length < 3)) {
                alert("Enter Other Values")
                document.getElementById("txtq19_other").focus();
                return false;
            }
            else if ($('#<%= txtq19.ClientID %> input:checked').val() == '2' && Validate(document.getElementById('<%=txtq20.ClientID%>')) == false) {
                alert("Select Q20 Value")
                return false;
            }
            else if ($('#<%= txtq19.ClientID %> input:checked').val() == '2' && Validate(document.getElementById('<%=txtq21.ClientID%>')) == false) {
                alert("Select Q21 Value")
                return false;
            }
            else if ($('#<%= txtq21.ClientID %> input:checked').val() == '11' && (document.getElementById("txtq21_other").value == '' || document.getElementById("txtq21_other").value.length < 3)) {
                alert("Enter Other Values")
                document.getElementById("txtq21_other").focus();
                return false;
            }

    }

    </script>












































    <div style="padding-left: 2%; margin-top: 5px;">
        <asp:Panel ID="Panel2" runat="server">

            <%--Search Woman by DSSID--%>
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

            <div style="width: 100%; height: 440px; overflow: scroll; margin-top: 40px">
                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Record Found." AllowPaging="True" PageSize="200" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="footable" AllowSorting="false" ForeColor="#333333" AutoGenerateColumns="false" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Serial no.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle Width="2%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dssid" HeaderText="DSSID" />
                        <asp:BoundField DataField="name" HeaderText="Woman Name" />
                        <asp:BoundField DataField="husband_name" HeaderText="Husband Name" />
                        <asp:BoundField DataField="dob" HeaderText="Date of Birth" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="Link_id" OnClick="Link_OpenForm" Text='Open Form' runat="server" ToolTip="Open Entry Form" CommandArgument='<%#Eval("dssid")+","+ Eval("name")+","+ Eval("husband_name")+","+ Eval("dob")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
            </div>
        </asp:Panel>
    </div>



    <%--Entry Forms--%>


    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnNext" Visible="false">

        <div class="Mobile">
            <table style="width: 100%; font-size: 1em; color: #4f5963; text-align: left;">


                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q1. DSS Address</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq1_dssid" ReadOnly="true" ClientIDMode="Static" Font-Size="Medium" Height="2.1em" placeholder="dssid" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q2. Woman Name</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq2WomanNm" ReadOnly="true" Style="text-transform: uppercase" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" onkeypress="return onlyAlphabets()" placeholder="woman name" MaxLength="25" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q3. Husband Name</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq3HusbandNm" ReadOnly="true" Style="text-transform: uppercase" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" onkeypress="return onlyAlphabets()" placeholder="husband name" MaxLength="25" runat="server"></asp:TextBox></td>
                </tr>

                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q4. Team Code</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq4" ReadOnly="true"  ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="code" MaxLength="3" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q5. Date of Visit</td>
                    <td class="Space tdCSS">
                        <asp:TextBox ID="txtq5" Font-Bold="true" Font-Size="15px" ClientIDMode="Static" placeholder="dd-mm-yyyy" CssClass="txtboxx" Height="32px" runat="server" Width="8.2em"></asp:TextBox>
                        <asp:ImageButton ID="btnCalndrDate" ImageUrl="~/img/calendar1.png" CssClass="calanderButton" runat="server" />
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtq5" PopupButtonID="btnCalndrDate" Format="dd-MM-yyyy" />
                    </td>
                </tr>


                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q6. Who reported the adverse event?</td>
                    <td class="Space tdCSS">
                        <asp:RadioButtonList ID="txtq6" runat="server" ClientIDMode="Static" onclick="RadioButton('txtq6')">
                            <asp:ListItem Text="&nbsp Sindhi" Value="1" />
                            <asp:ListItem Text="&nbsp Punjabi" Value="2" />
                            <asp:ListItem Text="&nbsp Pashto" Value="3" />
                            <asp:ListItem Text="&nbsp Balochi" Value="4" />
                            <asp:ListItem Text="&nbsp Urdu" Value="5" />
                            <asp:ListItem Text="&nbsp Bengali" Value="6" />
                            <asp:ListItem Text="&nbsp Hindku" Value="7" />
                            <asp:ListItem Text="&nbsp Saraiki" Value="8" />
                            <asp:ListItem Text="&nbsp Kutchi" Value="9" />
                            <asp:ListItem Text="&nbsp Kashmiri" Value="10" />
                            <asp:ListItem Text="&nbsp Sheena" Value="11" />
                            <asp:ListItem Text="&nbsp Burmi" Value="12" />
                            <asp:ListItem Text="&nbsp Gujrati" Value="13" />
                            <asp:ListItem Text="&nbsp Others" Value="14" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr class="trCSS" id="TR_Q6" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq6_other" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="other" runat="server"></asp:TextBox></td>
                </tr>



                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q7. Gravida</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq7" onkeyup="enable('txtq7')" ClientIDMode="Static" placeholder="" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q8" style="display: none">
                    <td class="TableColumn tdCSS">Q8. Number of twin pregnancies</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq8" ClientIDMode="Static" placeholder="" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q9" style="display: none">
                    <td class="TableColumn tdCSS">Q9. Number of children born alive in the past</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq9" ClientIDMode="Static" placeholder="" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q10" style="display: none">
                    <td class="TableColumn tdCSS">Q10. Number of stillbirths</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq10" ClientIDMode="Static" placeholder="" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q11" style="display: none">
                    <td class="TableColumn tdCSS">Q11. Number of abortions</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq11" ClientIDMode="Static" placeholder="" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q12" style="display: none">
                    <td class="TableColumn tdCSS">Q12. Parity</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq12" ClientIDMode="Static" placeholder="" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>






                <tr class="trCSS" id="TR_Q13_m" style="display: none">
                    <td class="TableColumn tdCSS">Q13. Number of children currently alive?</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq13_m" onkeyup="enable('txtq13_m')" ClientIDMode="Static" placeholder="Male" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q13_f" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq13_f" onkeyup="enable('txtq13_f')" ClientIDMode="Static" placeholder="Female" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>



                <tr class="trCSS" id="TR_Q14_d" style="display: none">
                    <td class="TableColumn tdCSS">Q14. Age of eldest child currently alive (99 if not applicable)</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq14_d" ClientIDMode="Static" placeholder="Days" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q14_m" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq14_m" ClientIDMode="Static" placeholder="Months" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q14_y" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq14_y" ClientIDMode="Static" placeholder="Years" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>






                <tr class="trCSS" id="TR_Q15_d" style="display: none">
                    <td class="TableColumn tdCSS">Q15. Age of youngest child currently alive (99 if not applicable)
                    </td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq15_d" ClientIDMode="Static" placeholder="Days" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q15_m" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq15_m" ClientIDMode="Static" placeholder="Months" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q15_y" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq15_y" ClientIDMode="Static" placeholder="Years" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>








                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q16. Since when woman is on any modern method</td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq16_d" ClientIDMode="Static" placeholder="Days" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq16_m" ClientIDMode="Static" placeholder="Months" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq16_y" ClientIDMode="Static" placeholder="Years" onkeypress="return OnlyNumeric(event)" type="tel" Font-Size="Medium" Height="2.1em" MaxLength="2" runat="server"></asp:TextBox></td>
                </tr>

                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q17. Who reported the adverse event?</td>
                    <td class="Space tdCSS">
                        <asp:RadioButtonList ID="txtq17" runat="server" ClientIDMode="Static" onclick="RadioButton('txtq17')">
                            <asp:ListItem Text="&nbsp Green Star clinic" Value="1" />
                            <asp:ListItem Text="&nbsp Koohi Goth Hospital" Value="2" />
                            <asp:ListItem Text="&nbsp RG center /  VPT Worker" Value="3" />
                            <asp:ListItem Text="&nbsp Sindh Government Qatar" Value="4" />
                            <asp:ListItem Text="&nbsp Sindh Government IH" Value="5" />
                            <asp:ListItem Text="&nbsp Home" Value="6" />
                            <asp:ListItem Text="&nbsp AKU Kharadar" Value="7" />
                            <asp:ListItem Text="&nbsp AMAN Sukh Project" Value="8" />
                            <asp:ListItem Text="&nbsp RHC RG" Value="9" />
                            <asp:ListItem Text="&nbsp Self purchase from some store" Value="10" />
                            <asp:ListItem Text="&nbsp Other" Value="11" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr class="trCSS" id="TR_Q17" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq17_other" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="other" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q18. Woman is already which modern method?</td>
                    <td class="Space tdCSS">
                        <asp:RadioButtonList ID="txtq18" runat="server" ClientIDMode="Static" onclick="RadioButton('txtq18')">
                            <asp:ListItem Text="&nbsp Condom " Value="1" />
                            <asp:ListItem Text="&nbsp Oral pills" Value="2" />
                            <asp:ListItem Text="&nbsp Depo injection – 3 months" Value="3" />
                            <asp:ListItem Text="&nbsp PPIUCD " Value="4" />
                            <asp:ListItem Text="&nbsp IUCD" Value="5" />
                            <asp:ListItem Text="&nbsp Implant – 5 years" Value="6" />
                            <asp:ListItem Text="&nbsp Implant – 3 years" Value="7" />
                            <asp:ListItem Text="&nbsp Tubal ligation" Value="8" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr class="trCSS">
                    <td class="TableColumn tdCSS">Q19. Method removed or switched?</td>
                    <td class="Space tdCSS">
                        <asp:RadioButtonList ID="txtq19" runat="server" ClientIDMode="Static" onclick="RadioButton('txtq19')">
                            <asp:ListItem Text="&nbsp Removed only" Value="1" />
                            <asp:ListItem Text="&nbsp Removed & switched" Value="2" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr class="trCSS" id="TR_Q19" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq19_other" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="Method removal reason" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="trCSS" id="TR_Q20" style="display: none">
                    <td class="TableColumn tdCSS">Q20. If switched, which new method has been applied?</td>
                    <td class="Space tdCSS">
                        <asp:RadioButtonList ID="txtq20" runat="server" ClientIDMode="Static" onclick="RadioButton('txtq20')">
                            <asp:ListItem Text="&nbsp Condom " Value="1" />
                            <asp:ListItem Text="&nbsp Oral pills" Value="2" />
                            <asp:ListItem Text="&nbsp Depo injection – 3 months" Value="3" />
                            <asp:ListItem Text="&nbsp PPIUCD " Value="4" />
                            <asp:ListItem Text="&nbsp IUCD" Value="5" />
                            <asp:ListItem Text="&nbsp Implant – 5 years" Value="6" />
                            <asp:ListItem Text="&nbsp Implant – 3 years" Value="7" />
                            <asp:ListItem Text="&nbsp Tubal ligation" Value="8" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr class="trCSS" id="TR_Q21A" style="display: none">
                    <td class="TableColumn tdCSS">Q21. New method applied by</td>
                    <td class="Space tdCSS">
                        <asp:RadioButtonList ID="txtq21" runat="server" ClientIDMode="Static" onclick="RadioButton('txtq21')">
                            <asp:ListItem Text="&nbsp Green Star clinic" Value="1" />
                            <asp:ListItem Text="&nbsp Koohi Goth Hospital" Value="2" />
                            <asp:ListItem Text="&nbsp RG center /  VPT Worker" Value="3" />
                            <asp:ListItem Text="&nbsp Sindh Government Qatar" Value="4" />
                            <asp:ListItem Text="&nbsp Sindh Government IH" Value="5" />
                            <asp:ListItem Text="&nbsp Home" Value="6" />
                            <asp:ListItem Text="&nbsp AKU Kharadar" Value="7" />
                            <asp:ListItem Text="&nbsp AMAN Sukh Project" Value="8" />
                            <asp:ListItem Text="&nbsp RHC RG" Value="9" />
                            <asp:ListItem Text="&nbsp Self purchase from some store" Value="10" />
                            <asp:ListItem Text="&nbsp Other" Value="11" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr class="trCSS" id="TR_Q21B" style="display: none">
                    <td class="TableColumn tdCSS"></td>
                    <td class="Space tdCSS">
                        <asp:TextBox CssClass="form-control input-lg" ID="txtq21_other" ClientIDMode="Static" type="text" Font-Size="Medium" Height="2.1em" placeholder="other" runat="server"></asp:TextBox></td>
                </tr>






            </table>
            <br />
            <div style="text-align: center">
                <asp:Button ID="btnNext" runat="server" Text="Submit" class="btn btn-info btn-lg" OnClick="next_Click" OnClientClick="return clicknext();" />
            </div>
            <br />
            <br />
        </div>
    </asp:Panel>













</asp:Content>
