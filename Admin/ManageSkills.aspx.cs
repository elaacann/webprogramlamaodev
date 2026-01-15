using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class ManageSkills : System.Web.UI.Page
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
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Skills ORDER BY DisplayOrder");
            gvSkills.DataSource = dt;
            gvSkills.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClearForm();
            mvSkills.SetActiveView(vEdit);
            lblTitle.Text = "Add New Skill";
        }

        protected void gvSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSkill")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                LoadSkill(id);
                mvSkills.SetActiveView(vEdit);
                lblTitle.Text = "Edit Skill";
            }
            else if (e.CommandName == "DeleteSkill")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                SqlHelper.ExecuteNonQuery("DELETE FROM Skills WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
                BindGrid();
            }
        }

        private void LoadSkill(int id)
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Skills WHERE Id = @Id", new SqlParameter[] { new SqlParameter("@Id", id) });
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                hfId.Value = dr["Id"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtRate.Text = dr["Rate"].ToString();
                txtOrder.Text = dr["DisplayOrder"].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string query;
            if (string.IsNullOrEmpty(hfId.Value))
            {
                query = "INSERT INTO Skills (Name, Rate, DisplayOrder) VALUES (@Name, @Rate, @DisplayOrder)";
            }
            else
            {
                query = "UPDATE Skills SET Name = @Name, Rate = @Rate, DisplayOrder = @DisplayOrder WHERE Id = @Id";
            }

            SqlParameter[] p = {
                new SqlParameter("@Name", txtName.Text),
                new SqlParameter("@Rate", int.Parse(txtRate.Text)),
                new SqlParameter("@DisplayOrder", int.Parse(string.IsNullOrEmpty(txtOrder.Text) ? "0" : txtOrder.Text))
            };

            if (!string.IsNullOrEmpty(hfId.Value))
            {
               var list = new System.Collections.Generic.List<SqlParameter>(p);
               list.Add(new SqlParameter("@Id", hfId.Value));
               p = list.ToArray();
            }

            SqlHelper.ExecuteNonQuery(query, p);
            mvSkills.SetActiveView(vList);
            BindGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            mvSkills.SetActiveView(vList);
        }

        private void ClearForm()
        {
            hfId.Value = "";
            txtName.Text = "";
            txtRate.Text = "0";
            txtOrder.Text = "0";
        }
    }
}
