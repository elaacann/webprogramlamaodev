using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class ManageSocial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM SocialMedia");
            gvSocial.DataSource = dt;
            gvSocial.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClearForm();
            mvSocial.SetActiveView(vEdit);
            lblTitle.Text = "Add New Social Link";
        }

        protected void gvSocial_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSocial")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                LoadSocial(id);
                mvSocial.SetActiveView(vEdit);
                lblTitle.Text = "Edit Social Link";
            }
            else if (e.CommandName == "DeleteSocial")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                SqlHelper.ExecuteNonQuery("DELETE FROM SocialMedia WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
                BindGrid();
            }
        }

        private void LoadSocial(int id)
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM SocialMedia WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                hfId.Value = dr["Id"].ToString();
                txtPlatform.Text = dr["PlatformName"].ToString();
                txtUrl.Text = dr["Url"].ToString();
                txtIcon.Text = dr["IconClass"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query;
            if (string.IsNullOrEmpty(hfId.Value))
            {
                query = "INSERT INTO SocialMedia (PlatformName, Url, IconClass) VALUES (@PlatformName, @Url, @IconClass)";
            }
            else
            {
                query = "UPDATE SocialMedia SET PlatformName = @PlatformName, Url = @Url, IconClass = @IconClass WHERE Id = @Id";
            }

            SqlParameter[] p = {
                new SqlParameter("@PlatformName", txtPlatform.Text),
                new SqlParameter("@Url", txtUrl.Text),
                new SqlParameter("@IconClass", txtIcon.Text)
            };

             if (!string.IsNullOrEmpty(hfId.Value))
            {
               var list = new System.Collections.Generic.List<SqlParameter>(p);
               list.Add(new SqlParameter("@Id", hfId.Value));
               p = list.ToArray();
            }

            SqlHelper.ExecuteNonQuery(query, p);
            mvSocial.SetActiveView(vList);
            BindGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mvSocial.SetActiveView(vList);
        }

        private void ClearForm()
        {
            hfId.Value = "";
            txtPlatform.Text = "";
            txtUrl.Text = "";
            txtIcon.Text = "";
        }
    }
}
