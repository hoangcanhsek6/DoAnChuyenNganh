﻿using System;
using HtmlAgilityPack;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.IO;
using System.Drawing;
using System.Windows.Forms;
using TrackingDefaceDAO;
using TrackingDefaceDTO;

namespace TrackingDefaceBUS
{
    public class WebBUS 
    {

        WebDAO objectWeb = new WebDAO();      

        //public bool CheckWebSite(string url)
        //{
        //    Utils.UtilsHtmlAgility.GetContent(url);
        //    return true;
        //}

        public DataTable GetAllRecords()
        {
            return objectWeb.GetAll();
        }

        public void LoadDataTable(DataGridView dataGridViewWeb)
        {
            DataTable dtWeb = objectWeb.GetAll();
            dataGridViewWeb.DataSource = dtWeb;

            dataGridViewWeb.Columns["IPPrivate"].Visible = false;
            dataGridViewWeb.Columns["Emails"].Visible = false;
            dataGridViewWeb.Columns["Phones"].Visible = false;
            dataGridViewWeb.Columns["searchText"].Visible = false;
            dataGridViewWeb.Columns["WebStatus"].Visible = false;
            dataGridViewWeb.Columns["BanText"].Visible = false;
            dataGridViewWeb.Columns["WebStatus"].Visible = false;
            dataGridViewWeb.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
        }

        public void LoadListView(ListView listViewWeb, ImageList imageListView)
        {
            listViewWeb.Clear();
            DataTable dtWeb = objectWeb.GetWebSiteEnable(1);
            listViewWeb.LargeImageList = imageListView;
            for (int i = 0; i < dtWeb.Rows.Count; i++)
            {
                DataRow datarow = dtWeb.Rows[i];
                ListViewItem listItem = new ListViewItem(datarow["NameSite"].ToString());
                listItem.SubItems.Add(datarow["URL"].ToString());   //1
                listItem.SubItems.Add(datarow["WebStatus"].ToString()); //2
                listItem.SubItems.Add(datarow["IPPublic"].ToString()); //3
                listItem.SubItems.Add(datarow["WebPriority"].ToString()); //4
                listItem.SubItems.Add(datarow["Phones"].ToString());// 5
                listItem.SubItems.Add(datarow["Emails"].ToString()); //6
                listItem.SubItems.Add(datarow["isEnable"].ToString()); //7
                if (datarow["WebStatus"].ToString() == "Safe")
                    listItem.ImageIndex = 1;
                else
                    listItem.ImageIndex = 0;
                listViewWeb.Items.Add(listItem);
            }
        }
        
        public void InsertDataWeb (DataGridView dtGridWeb, TextBox nameSite, TextBox URL, TextBox ipPublic, TextBox priority, 
                                    TextBox phones, TextBox emails, RichTextBox findText, RichTextBox banText, CheckBox isEnable)
        {
            if (nameSite.Text != "" && URL.Text != "" && phones.Text != "" && ipPublic.Text != "")
            {
                Web web = new Web();
                web.webID = dtGridWeb.RowCount;
                web.nameSite = nameSite.Text;
                web.uRL = URL.Text;
                web.ipPulbic = ipPublic.Text;
                web.ipPrivate = " ";
                web.webPriority = Int32.Parse(priority.Text);
                web.phones = phones.Text;
                web.emails = emails.Text;
                web.searchText = findText.Text;
                web.webStatus = " ";
                web.banText = banText.Text;
                web.isEnable = isEnable.Checked;
                           
                objectWeb.Insert(web);
                LoadDataTable(dtGridWeb);
                MessageBox.Show("Add thanh cong");
            }
            else
                MessageBox.Show("Vui long nhap day du thong tin");
        }  

        public void UpdateWeb (DataGridView dtGridWeb, TextBox nameSite, TextBox URL, TextBox ipPublic, TextBox priority, 
                                    TextBox phones, TextBox emails, RichTextBox findText, RichTextBox banText, CheckBox isEnable)
        {
            if (nameSite.Text != "" && URL.Text != "" && phones.Text != "" && ipPublic.Text != "")
            {
                Web web = new Web();
                web.webID = Int32.Parse(dtGridWeb.CurrentRow.Cells[0].Value.ToString());
                web.nameSite = nameSite.Text;
                web.uRL = URL.Text;
                web.ipPulbic = ipPublic.Text;
                web.ipPrivate = " ";
                web.webPriority = Int32.Parse(priority.Text);
                web.phones = phones.Text;
                web.emails = emails.Text;
                web.searchText = findText.Text;
                web.webStatus = " ";
                web.banText = banText.Text;
                web.isEnable = isEnable.Checked;

                objectWeb.Update(web);
                LoadDataTable(dtGridWeb);
            }
        }

        public void DeleteWeb (DataGridView dtGridWeb)
        {
            int webID = Int32.Parse(dtGridWeb.CurrentRow.Cells[0].Value.ToString());
            objectWeb.Delete(webID);
            LoadDataTable(dtGridWeb);
        }

        public DataTable GetWebSiteEnable(int isEnable)
        {
            return objectWeb.GetWebSiteEnable(1);
        }
    }
}
