using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class adm_Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login.aspx?retUrl=admin/adm_Categories");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board?msg=2");
            }

            if (IsPostBack == false)
            {
                loadCategories();
            }
        }

        private void loadCategories()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                List<Category> lst = ctx.Categories.ToList();
                lvwCategories.DataSource = lst;
                lvwCategories.DataBind();
            }
        }

        protected void lvwCategories_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvwCategories.EditIndex = e.NewEditIndex;
            loadCategories();
        }

        protected void lvwCategories_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvwCategories.EditIndex = -1;
            loadCategories();
        }

        protected void lvwCategories_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int catId = Convert.ToInt32(e.Keys["CatID"]);
            string catName = e.NewValues["CatName"].ToString();

            using (QLBHEntities ctx = new QLBHEntities())
            {
                Category cat = ctx.Categories.Where(c => c.CatID == catId).FirstOrDefault();
                if (cat != null)
                {
                    cat.CatName = catName;
                    ctx.SaveChanges();
                }
                lvwCategories.EditIndex = -1;
                loadCategories();
            }
        }

        protected void lvwCategories_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int catId = Convert.ToInt32(e.Keys["CatID"]);

            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.Products.Where(p => p.CatID == catId).ToList();
                foreach (Product p in list)
                {
                    ctx.Products.Remove(p);
                }
                Category cat = ctx.Categories.Where(c => c.CatID == catId).FirstOrDefault();
                if (cat != null)
                {
                    ctx.Categories.Remove(cat);
                    ctx.SaveChanges();
                    loadCategories();
                }
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string catName = txtCatName.Text;

            Category cat = new Category { CatName = catName };

            using (QLBHEntities ctx = new QLBHEntities())
            {
                ctx.Categories.Add(cat);
                ctx.SaveChanges();
            }
            loadCategories();
        }
    }
}