using System;
using System.Data;
using System.Web.UI;
using webtabanliproje;

namespace webtabanliproje
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadContent();
            }
        }

        private void LoadContent()
        {
            // Load Settings
            DataTable dtSettings = SqlHelper.GetDataTable("SELECT * FROM Settings");
            foreach (DataRow dr in dtSettings.Rows)
            {
                string key = dr["Key"].ToString();
                string value = dr["Value"].ToString();
                
                if (key == "HeroTitle") heroTitle.InnerText = value;
                if (key == "HeroSubtitle") heroSubtitle.InnerText = value;
                if (key == "AboutText") aboutText.InnerText = value;
            }

            // Load Skills
            DataTable dtSkills = SqlHelper.GetDataTable("SELECT * FROM Skills ORDER BY DisplayOrder");
            rptSkills.DataSource = dtSkills;
            rptSkills.DataBind();

            // Load Projects
            DataTable dtProjects = SqlHelper.GetDataTable("SELECT * FROM Projects ORDER BY DisplayOrder");
            rptProjects.DataSource = dtProjects;
            rptProjects.DataBind();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                lblStatus.CssClass = "mt-3 d-block text-danger";
                lblStatus.Text = "Lütfen tüm alanları doldurunuz.";
                return;
            }

            string query = "INSERT INTO Messages (SenderName, SenderEmail, MessageContent) VALUES (@Name, @Email, @Message)";
            System.Data.SqlClient.SqlParameter[] parameters = {
                new System.Data.SqlClient.SqlParameter("@Name", name),
                new System.Data.SqlClient.SqlParameter("@Email", email),
                new System.Data.SqlClient.SqlParameter("@Message", message)
            };

            try
            {
                SqlHelper.ExecuteNonQuery(query, parameters);
                lblStatus.CssClass = "mt-3 d-block text-success";
                lblStatus.Text = "Mesajınız başarıyla gönderildi!";

                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblStatus.CssClass = "mt-3 d-block text-danger";
                lblStatus.Text = "Bir hata oluştu: " + ex.Message;
            }
        }
    }
}