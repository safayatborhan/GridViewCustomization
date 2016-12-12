using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

namespace GriedViewCustomizeInAsp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection();
        string path = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Category.mdb;";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                if (FileUpload1.HasFile)
                {
                    string str = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(HttpContext.Current.Server.MapPath("~/uploads/") + str);
                    path = "~//uploads//" + str.ToString();
                }
                string qry = "insert into AddNotice values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + path.ToString() + "','" + TextBox3.Text + "')";
                OleDbCommand cmd = new OleDbCommand(qry, connection);
                cmd.ExecuteNonQuery();
                Label1.Text = "Data has been stored";
                TextBox1.Text = String.Empty;
                TextBox2.Text = String.Empty;
                TextBox3.Text = String.Empty;
            }
            catch (Exception exp)
            {
                Response.Write(exp.ToString());
            }
            finally
            {
                connection.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
        }
    }
}