<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Events.aspx.cs" Inherits="OneBase.Events" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body
        {
        position: fixed;
        overflow-y: scroll;
        width: 100%;
        }

        .FixedHeader {
            position:absolute;
        }
    </style>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="gridviewScroll.min.js"></script>
    <link href="GridviewScroll.css" rel="stylesheet" />

    <script type="text/javascript">
       function triggerFileUpload()
       {
          document.getElementById("File1").click();
       }

       function setHiddenValue()
       {
           document.getElementById("Hidden1").value = document.getElementById("File1").value;
           this.form1.submit();
       }

      /*
       function noBack() {
           //required to disable back button afer logout
           window.history.forward()
       }
       noBack();
       window.onload = noBack;
       window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
       window.onunload = function () { void (0); }
      */
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height:30%">
        <asp:Table ID="Table2" runat="server" Style="margin-left:5px" GridLines="Both" BorderStyle="Solid" Width="98%">
            <asp:TableRow Height="10px">
                <%--                
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Label runat="server" ID="lblUserId"></asp:Label>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" ColumnSpan="3">
                    <asp:LinkButton runat="server" ID="btnLinkLogout" Text="Log Out" OnClick="btnLinkLogout_Click" ></asp:LinkButton>
                </asp:TableCell>
                --%>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell Width="50%" HorizontalAlign="Right">
                    <div id="DataListFollowUpComments" style="height:300px;overflow:auto">
                    <asp:DataList ID="DataList4" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
                        BorderWidth="1px" CellPadding="3" DataKeyField="numRow" GridLines="Horizontal" RepeatDirection="Vertical"
                        OnEditCommand="DataList4_EditCommand" OnCancelCommand="DataList4_CancelCommand"
                        OnDeleteCommand="DataList4_DeleteCommand" OnUpdateCommand="DataList4_UpdateCommand" > <%-- OnItemDataBound=" --%>
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <HeaderTemplate>
                                <table style="border-collapse:collapse">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDatComment" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "datComment").ToString().Split()[0] %>' />,  
                                    </td>
                                </tr>
                                <tr style="border-bottom:2px solid grey">
                                    <td>
                                        <asp:LinkButton id="LinkButton1" runat="server" Text="Edit" CommandName="edit" />
                                        <asp:LinkButton id="LinkButton2" runat="server" Text="Delete" CommandName="delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDatComment" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "datComment").ToString().Split()[0] %>' />,  
                                    </td>
                                </tr>
                                <tr style="border-bottom:2px solid grey">
                                    <td>
                                        <asp:LinkButton id="LinkButton1" runat="server" CommandName="Update" Text="update" />
                                        <asp:LinkButton id="LinkButton2" runat="server" Text="Cancel" CommandName="cancel" />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                    </div>
                </asp:TableCell>

                <asp:TableCell Width="50%">
                    <br />
                    <table style="margin-left:10px; margin-right:5px">
                        <tr>
                            <td>
                                <asp:ListBox ID="listboxInsStatus_Clients" runat="server" Height="100px" Width="150px">
                                    <asp:ListItem Value="Pending - Maximus">Pending - Maximus</asp:ListItem>
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAppendFollowUp" runat="server" Text="Append <=" OnClick="btnAppendFollowUp_Click" /><br />
                            </td>
                        </tr>
                    </table>

                    <asp:TextBox ID="txtNumRow" runat="server" onkeydown = "return (event.keyCode!=13);" visible="false" />

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            EnableModelValidation="True" ForeColor="#333333" DataKeyNames="numRow"
            OnRowEditing="GridView2_RowEditing" OnRowCancelingEdit="GridView2_RowCancelling"
            OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating">
            <RowStyle VerticalAlign="Top" Font-Size="15px" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <div style="width:40px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div style="width:40px">
                        <asp:LinkButton ID="eEditButton" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                        <asp:LinkButton ID="eDeleteButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </div>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_id" runat="server" Text='<%# Bind ("_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="sDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSDate" runat="server" Text='<%# Bind ("sDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSDate" runat="server" Text='<%# Eval("sDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iLongDatetime">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtILongDatetime" runat="server" Text='<%# Bind ("iLongDatetime") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblILongDatetime" runat="server" Text='<%# Eval("iLongDatetime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="sName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSName" runat="server" Text='<%# Bind ("sName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSName" runat="server" Text='<%# Eval("sName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iTimDur">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtITimDur" runat="server" Text='<%# Bind ("iTimDur") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblITimDur" runat="server" Text='<%# Eval("iTimDur") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iPtsVal">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIPtsVal" runat="server" Text='<%# Bind ("iPtsVal") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIPtsVal" runat="server" Text='<%# Eval("iPtsVal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iImp">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIImp" runat="server" Text='<%# Bind ("iImp") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIImp" runat="server" Text='<%# Eval("iImp") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
                </asp:TableCell></asp:TableRow></asp:Table><br />&nbsp; <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><asp:Button ID="btnPreview" runat="server" Text="View" OnClick="btnPreview_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
            <asp:Button ID="BtnDemo" runat="server" Text="Demo" OnClick="btnDemo_Click" />
            &nbsp;&nbsp;&nbsp; <input runat="server" id="Hidden1" type="hidden" />
            <input runat="server" id="File1" type="file" onchange="setHiddenValue()" style="display:none" />
            <input id="Button2" type="button" name="btn2" onclick="triggerFileUpload()" value="Up" />
            <asp:Button id="Button3" runat="server" text="Down" OnClick="ExportToExcel_Click" /> 
            &nbsp; <asp:Button id="btnShowAll" runat="server" text="Show All" OnClick="ShowAll_Click" />
      <asp:Button id="btnHide" runat="server" text="Hide" OnClick="Hide_Click" Visible="false" />
        <%-- added later--%>
        &nbsp;&nbsp;<asp:Label ID ="lblIndex" runat="server" Text="Per ">
                     </asp:Label><asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed">
            <asp:ListItem Text="10" Value="10" />
            <asp:ListItem Text="50" Value="50" />
            <asp:ListItem Text="100" Value="100" />
        </asp:DropDownList>
       <%-- added later--%>     
        &nbsp; <asp:Repeater ID="rptPager" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="lnkPage" runat="server" Text = '<%#Eval("Text") %>' CommandArgument = '<%# Eval("Value") %>' Enabled = '<%# Eval("Enabled") %>' OnClick = "Page_Changed">
                </asp:LinkButton></ItemTemplate></asp:Repeater><div style="float:right; max-height:5%; margin-right:10px">
            <a href="SearchHelp.aspx" target="popup" onclick="window.open('SearchHelp.aspx','popup','width=800,height=800'); return false;"><img src="Img/help_icon.jpg" style="height:15px" /></a>
            <asp:Label ID="lblCustomSQL" runat="server" Text="Sort / Filter:"/>
            <asp:TextBox ID="txtCustomSQL" runat="server" Width="350px"></asp:TextBox><asp:Button ID="btnQuery" runat="server" Text="Run" OnClick="btnCustomSQL_Click" />
        </div>        
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            EnableModelValidation="True" ForeColor="#333333" ShowFooter="True" DataKeyNames="numRow" 
            OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelling"
            OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnSorting="GridView1_Sorting">
            <RowStyle Font-Size="15px"/>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Size="15px" />
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <div style="width:50px">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div style="width:50px">
                        <asp:LinkButton ID="eEditButton" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                        <asp:LinkButton ID="eDeleteButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </div>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FollowUpComments" SortExpression="FollowUpComments">
                    <ItemTemplate>
                        <div style="width:200px;height:50px;overflow:auto">
                        <asp:Label ID="lblFollowUpComments" runat="server" Text='
                            <%# Convert.ToString(Eval("FollowUpComments")).Replace("||","<br /><br />").Replace("|","<br />&emsp;") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                    <FooterStyle backcolor="White" horizontalalign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2_id" runat="server" Text='<%# Bind ("_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2_id" runat="server" Text='<%# Eval("_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="sDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2SDate" runat="server" Text='<%# Bind ("sDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2SDate" runat="server" Text='<%# Eval("sDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iLongDatetime">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2ILongDatetime" runat="server" Text='<%# Bind ("iLongDatetime") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2ILongDatetime" runat="server" Text='<%# Eval("iLongDatetime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="sName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2SName" runat="server" Text='<%# Bind ("sName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2SName" runat="server" Text='<%# Eval("sName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iTimDur">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2ITimDur" runat="server" Text='<%# Bind ("iTimDur") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2ITimDur" runat="server" Text='<%# Eval("iTimDur") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iPtsVal">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2IPtsVal" runat="server" Text='<%# Bind ("iPtsVal") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2IPtsVal" runat="server" Text='<%# Eval("iPtsVal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="iImp">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt2IImp" runat="server" Text='<%# Bind ("iImp") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl2IImp" runat="server" Text='<%# Eval("iImp") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </form>

    <script type="text/javascript">

        $(document).ready(function () {
            gridviewScroll('#GridView1', $(window).height() / 2.4, 2);
            gridviewScroll('#GridView2', 200, 5);
        });

        $(window).on('resize', function () {
            gridviewScroll('#GridView1', $(window).height() / 2.4, 2);
            gridviewScroll('#GridView2', 200, 5);
        });

	    function gridviewScroll(sId, iHeight, iFreezeSize) {
	        gridView1 = $(sId).gridviewScroll({
                width: "99.5%",
                height: iHeight,
                railcolor: "#F0F0F0",
                barcolor: "#CDCDCD",
                barhovercolor: "#606060",
                bgcolor: "#F0F0F0",
                freezesize: iFreezeSize,
                arrowsize: 30,
                varrowtopimg: "Img/arrowvt.png",
                varrowbottomimg: "Img/arrowvb.png",
                harrowleftimg: "Img/arrowhl.png",
                harrowrightimg: "Img/arrowhr.png",
                headerrowcount: 1,
                railsize: 16,
                barsize: 8
            });

        }
	</script>
</body>
</html>
