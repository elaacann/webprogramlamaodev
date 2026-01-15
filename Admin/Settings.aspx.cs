using System;
using System.Data;
using System.Data.SqlClient;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSettings();
            }
        }

        private void LoadSettings()
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Settings");
            foreach (DataRow dr in dt.Rows)
            {
                string key = dr["Key"].ToString();
                string value = dr["Value"].ToString();

                switch (key)
                {
                    case "SiteTitle": txtSiteTitle.Text = value; break;
                    case "HeroTitle": txtHeroTitle.Text = value; break;
                    case "HeroSubtitle": txtHeroSubtitle.Text = value; break;
                    case "AboutText": txtAboutText.Text = value; break;
                    case "FooterText": txtFooterText.Text = value; break;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            UpdateSetting("SiteTitle", txtSiteTitle.Text);
            UpdateSetting("HeroTitle", txtHeroTitle.Text);
            UpdateSetting("HeroSubtitle", txtHeroSubtitle.Text);
            UpdateSetting("AboutText", txtAboutText.Text);
            UpdateSetting("FooterText", txtFooterText.Text);

            lblMessage.Text = "Settings saved successfully.";
        }

        private void UpdateSetting(string key, string value)
        {
            string query = "IF EXISTS (SELECT 1 FROM Settings WHERE [Key] = @Key) " +
                           "UPDATE Settings SET [Value] = @Value WHERE [Key] = @Key " +
                           "ELSE INSERT INTO Settings ([Key], [Value]) VALUES (@Key, @Value)";
            
            SqlParameter[] p = {
                new SqlParameter("@Key", key),
                new SqlParameter("@Value", value)
            };
            SqlHelper.ExecuteNonQuery(query, p);
        }
    }
}
