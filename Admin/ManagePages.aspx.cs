using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class ManagePages : System.Web.UI.Page
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
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Pages ORDER BY DisplayOrder");
            gvPages.DataSource = dt;
            gvPages.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClearForm();
            mvPages.SetActiveView(vEdit);
            lblTitle.Text = "Add New Page";
        }

        protected void gvPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                LoadPage(id);
                mvPages.SetActiveView(vEdit);
                lblTitle.Text = "Edit Page";
            }
            else if (e.CommandName == "DeletePage")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                SqlHelper.ExecuteNonQuery("DELETE FROM Pages WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
                BindGrid();
            }
        }

        private void LoadPage(int id)
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Pages WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                hfId.Value = dr["Id"].ToString();
                txtTitle.Text = dr["Title"].ToString();
                txtSlug.Text = dr["Slug"].ToString();
                txtContent.Text = dr["Content"].ToString();
                chkIsActive.Checked = (bool)dr["IsActive"];
                txtOrder.Text = dr["DisplayOrder"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query;
            if (string.IsNullOrEmpty(hfId.Value))
            {
                query = "INSERT INTO Pages (Title, Slug, Content, IsActive, DisplayOrder) VALUES (@Title, @Slug, @Content, @IsActive, @DisplayOrder)";
            }
            else
            {
                query = "UPDATE Pages SET Title = @Title, Slug = @Slug, Content = @Content, IsActive = @IsActive, DisplayOrder = @DisplayOrder WHERE Id = @Id";
            }

            SqlParameter[] p = {
                new SqlParameter("@Title", txtTitle.Text),
                new SqlParameter("@Slug", txtSlug.Text),
                new SqlParameter("@Content", txtContent.Text),
                new SqlParameter("@IsActive", chkIsActive.Checked),
                new SqlParameter("@DisplayOrder", int.Parse(string.IsNullOrEmpty(txtOrder.Text) ? "0" : txtOrder.Text))
            };

             if (!string.IsNullOrEmpty(hfId.Value))
            {
               var list = new System.Collections.Generic.List<SqlParameter>(p);
               list.Add(new SqlParameter("@Id", hfId.Value));
               p = list.ToArray();
            }

            SqlHelper.ExecuteNonQuery(query, p);
            mvPages.SetActiveView(vList);
            BindGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mvPages.SetActiveView(vList);
        }

        private void ClearForm()
        {
            hfId.Value = "";
            txtTitle.Text = "";
            txtSlug.Text = "";
            txtContent.Text = "";
            chkIsActive.Checked = true;
            txtOrder.Text = "0";
        }
    }
}
