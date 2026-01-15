using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webtabanliproje;

namespace webtabanliproje.Admin
{
    public partial class Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        private void LoadMessages()
        {
            DataTable dt = SqlHelper.GetDataTable("SELECT * FROM Messages ORDER BY SentDate DESC");
            gvMessages.DataSource = dt;
            gvMessages.DataBind();
        }

        protected void gvMessages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMessage")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                SqlParameter[] p = { new SqlParameter("@Id", id) };
                SqlHelper.ExecuteNonQuery("DELETE FROM Messages WHERE Id = @Id", p);
                LoadMessages();
            }
        }
    }
}
