using System;
using System.Data;
using System.Data.SqlClient;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Simple query - in production use hashing!
            string query = "SELECT Count(*) FROM Admins WHERE Username = @Username AND PasswordHash = @Password";
            SqlParameter[] p = {
                new SqlParameter("@Username", username),
                new SqlParameter("@Password", password)
            };

            int count = (int)SqlHelper.ExecuteScalar(query, p);

            if (count > 0)
            {
                Session["AdminUser"] = username;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}
