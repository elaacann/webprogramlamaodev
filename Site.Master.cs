using System;
using System.Data;
using System.Web.UI;
using webtabanliproje;
using System.Text;

namespace webtabanliproje
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSettings();
                LoadDynamicPages();
                LoadSocialMedia();
            }
        }

        private void LoadSettings()
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Settings");
            foreach (DataRow dr in dt.Rows)
            {
                string key = dr["Key"].ToString();
                string value = dr["Value"].ToString();
                
                if (key == "SiteTitle") siteTitleLink.InnerText = value;
                if (key == "FooterText") footerText.InnerText = value;
            }
        }

        private void LoadDynamicPages()
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Pages WHERE IsActive = 1 ORDER BY DisplayOrder");
            StringBuilder sb = new StringBuilder();
            
            // Existing links are static in HTML, we just add dynamic ones if any
            foreach (DataRow dr in dt.Rows)
            {
                string title = dr["Title"].ToString();
                string slug = dr["Slug"].ToString();
                
                // Add to the ul. We can use LiteralControl or just modify the InnerHtml of a placeholder logic.
                // Since 'dynamicMenu' is a runat='server' generic control (ul), lets add controls.
                
                System.Web.UI.HtmlControls.HtmlGenericControl li = new System.Web.UI.HtmlControls.HtmlGenericControl("li");
                li.Attributes["class"] = "nav-item";
                li.InnerHtml = string.Format("<a class='nav-link' href='Page.aspx?slug={0}'>{1}</a>", slug, title);
                dynamicMenu.Controls.Add(li);
            }
        }

        private void LoadSocialMedia()
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM SocialMedia");
            StringBuilder sb = new StringBuilder();
            foreach (DataRow dr in dt.Rows)
            {
                sb.AppendFormat("<a href='{0}' target='_blank' class='social-link'><i class='{1}'></i></a>", 
                    dr["Url"], dr["IconClass"]);
            }
            socialLinks.InnerHtml = sb.ToString();
        }
    }
}