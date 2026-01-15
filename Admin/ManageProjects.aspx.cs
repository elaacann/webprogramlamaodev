using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class ManageProjects : System.Web.UI.Page
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
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Projects ORDER BY DisplayOrder");
            gvProjects.DataSource = dt;
            gvProjects.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClearForm();
            mvProjects.SetActiveView(vEdit);
            lblTitle.Text = "Add New Project";
        }

        protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditProject")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                LoadProject(id);
                mvProjects.SetActiveView(vEdit);
                lblTitle.Text = "Edit Project";
            }
            else if (e.CommandName == "DeleteProject")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                SqlHelper.ExecuteNonQuery("DELETE FROM Projects WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
                BindGrid();
            }
        }

        private void LoadProject(int id)
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Projects WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                hfId.Value = dr["Id"].ToString();
                txtTitle.Text = dr["Title"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                txtImageUrl.Text = dr["ImageUrl"].ToString();
                txtLink.Text = dr["Link"].ToString();
                txtOrder.Text = dr["DisplayOrder"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query;
            if (string.IsNullOrEmpty(hfId.Value))
            {
                query = "INSERT INTO Projects (Title, Description, ImageUrl, Link, DisplayOrder) VALUES (@Title, @Description, @ImageUrl, @Link, @DisplayOrder)";
            }
            else
            {
                query = "UPDATE Projects SET Title = @Title, Description = @Description, ImageUrl = @ImageUrl, Link = @Link, DisplayOrder = @DisplayOrder WHERE Id = @Id";
            }

            SqlParameter[] p = {
                new SqlParameter("@Title", txtTitle.Text),
                new SqlParameter("@Description", txtDescription.Text),
                new SqlParameter("@ImageUrl", txtImageUrl.Text),
                new SqlParameter("@Link", txtLink.Text),
                new SqlParameter("@DisplayOrder", int.Parse(string.IsNullOrEmpty(txtOrder.Text) ? "0" : txtOrder.Text))
            };

            if (!string.IsNullOrEmpty(hfId.Value))
            {
               // Add Id parameter for Update
               var list = new System.Collections.Generic.List<SqlParameter>(p);
               list.Add(new SqlParameter("@Id", hfId.Value));
               p = list.ToArray();
            }

            SqlHelper.ExecuteNonQuery(query, p);
            mvProjects.SetActiveView(vList);
            BindGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mvProjects.SetActiveView(vList);
        }

        private void ClearForm()
        {
            hfId.Value = "";
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtImageUrl.Text = "";
            txtLink.Text = "";
            txtOrder.Text = "0";
        }
    }
}
