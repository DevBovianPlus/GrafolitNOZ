﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Popup.Master" AutoEventWireup="true" CodeBehind="MainProductProducts_popup.aspx.cs" Inherits="GrafolitNOZ.Pages.OptimalStockOrder.MainProductProducts_popup" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ MasterType VirtualPath="~/Popup.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var hasStartEditing = false;
        var postbackInitiated = false;

        function ActionButton_Click(s, e) {
            var process = true;

            if (process) {
                e.processOnServer = !postbackInitiated;
                postbackInitiated = true;
            }
            else
                e.processOnServer = false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <div class="row m-0 pb-3 pt-3">
        <div class="col-lg-12 mb-2 mb-lg-0">
            <dx:ASPxGridView ID="ASPxGridViewChildProducts" runat="server" Width="100%" KeyFieldName="IDENT" OnDataBinding="ASPxGridViewChildProducts_DataBinding"
                CssClass="gridview-no-header-padding mw-100" EnableRowsCache="false" AutoGenerateColumns="False" ClientInstanceName="gridProducts"
                OnDataBound="ASPxGridViewChildProducts_DataBound">
                <%--<ClientSideEvents BatchEditEndEditing="gridDevices_EndEditing" />--%>
                <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" AllowOnlyOneAdaptiveDetailExpanded="true" HideDataCellsAtWindowInnerWidth="800"
                    AllowHideDataCellsByColumnMinWidth="true">
                </SettingsAdaptivity>
                <SettingsBehavior AllowEllipsisInText="true" />
                <Paddings Padding="0" />
                <Settings ShowVerticalScrollBar="True"
                    ShowFilterBar="Auto" ShowFilterRow="True" VerticalScrollableHeight="250"
                    ShowFilterRowMenu="True" VerticalScrollBarStyle="Standard" VerticalScrollBarMode="Auto" ShowFooter="true" />
                <SettingsPager PageSize="50" ShowNumericButtons="true" NumericButtonCount="6">
                    <PageSizeItemSettings Visible="true" Items="50" Caption="Zapisi na stran : " AllItemText="Vsi">
                    </PageSizeItemSettings>
                    <Summary Visible="true" Text="Vseh zapisov : {2}" EmptyText="Ni zapisov" />
                </SettingsPager>
                <SettingsBehavior AllowFocusedRow="true" AllowEllipsisInText="true" />
                <Styles>
                    <Header Paddings-PaddingTop="5" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></Header>
                    <FocusedRow BackColor="#d1e6fe" Font-Bold="true" ForeColor="#606060"></FocusedRow>
                    <Cell Wrap="False" />
                </Styles>
                <SettingsText EmptyDataRow="Trenutno ni podatka o artiklih." />
                
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="true" Width="90px" SelectAllCheckboxMode="None" Caption="Izberi" ShowClearFilterButton="true" />
                    <dx:GridViewDataTextColumn Caption="Ident Pantheon" FieldName="IDENT" AdaptivePriority="2" MinWidth="130" MaxWidth="200" Width="30%" />
                    <dx:GridViewDataTextColumn Caption="Naziv" FieldName="NAZIV" AdaptivePriority="1" MinWidth="150" MaxWidth="350" Width="50%" />
                    <dx:GridViewDataTextColumn Caption="Trenutna zaloga" FieldName="TrenutnaZaloga" AdaptivePriority="2" MinWidth="100" MaxWidth="180" Width="20%" />
                </Columns>
            </dx:ASPxGridView>
        </div>
    </div>

    <div class="row m-0">
        <div class="col-lg-12 mb-2 mb-lg-0">
            <div class="row m-0 align-items-center justify-content-end">
                <div class="col-0 p-0 pr-2">
                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Prekliči" AutoPostBack="false"
                        Height="25" Width="110" UseSubmitBehavior="false" OnClick="btnCancel_Click">
                        <Paddings PaddingLeft="10" PaddingRight="10" />
                        <Image Url="../../Images/cancelPopup.png" />
                    </dx:ASPxButton>
                </div>
                <div class="col-0 p-0">
                    <dx:ASPxButton ID="btnConfirm" runat="server" Text="Potrdi" AutoPostBack="false"
                        Height="25" Width="110" UseSubmitBehavior="false" OnClick="btnConfirm_Click" ClientInstanceName="btnConfirm">
                        <Paddings PaddingLeft="10" PaddingRight="10" />
                        <Image Url="../../Images/addPopup.png" />
                        <ClientSideEvents Click="ActionButton_Click" />
                    </dx:ASPxButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
