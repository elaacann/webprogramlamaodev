using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using webtabanliproje;

namespace webtabanliproje
{
    public partial class Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string slug = Request.QueryString["slug"];
                if (!string.IsNullOrEmpty(slug))
                {
                    LoadPageContent(slug);
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        private void LoadPageContent(string slug)
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Pages WHERE Slug = @Slug AND IsActive = 1", 
                new SqlParameter[] { new SqlParameter("@Slug", slug) });

            if (dt.Rows.Count > 0)
            {
                this.Title = dt.Rows[0]["Title"].ToString();
                lblTitle.Text = dt.Rows[0]["Title"].ToString();
                litContent.Text = dt.Rows[0]["Content"].ToString();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}
