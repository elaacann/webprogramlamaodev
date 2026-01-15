using System;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStats();
            }
        }

        private void LoadStats()
        {
            lblProjectCount.Text = SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM Projects").ToString();
            lblSkillCount.Text = SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM Skills").ToString();
            lblPageCount.Text = SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM Pages").ToString();
            lblSocialCount.Text = SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM SocialMedia").ToString();
        }
    }
}
