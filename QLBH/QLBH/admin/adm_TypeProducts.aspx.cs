using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class adm_TypeProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login?retUrl=admin/adm_TypeProducts");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board?msg=2");
            }

            if (IsPostBack == false)
            {
                loadTypeProducts();
            }
        }

        private void loadTypeProducts()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                List<TypeProduct> lst = ctx.TypeProducts.ToList();
                lvwTypeProducts.DataSource = lst;
                lvwTypeProducts.DataBind();
            }
        }

        protected void lvwTypeProducts_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvwTypeProducts.EditIndex = e.NewEditIndex;
            loadTypeProducts();
        }

        protected void lvwTypeProducts_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvwTypeProducts.EditIndex = -1;
            loadTypeProducts();
        }

        protected void lvwTypeProducts_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int typeId = Convert.ToInt32(e.Keys["TypeID"]);
            string typeName = e.NewValues["TypeName"].ToString();

            using (QLBHEntities ctx = new QLBHEntities())
            {
                TypeProduct typePro = ctx.TypeProducts.Where(c => c.TypeID == typeId).FirstOrDefault();
                if (typePro != null)
                {
                    typePro.TypeName = typeName;
                    ctx.SaveChanges();
                }
                lvwTypeProducts.EditIndex = -1;
                loadTypeProducts();
            }
        }

        protected void lvwTypeProducts_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int typeId = Convert.ToInt32(e.Keys["TypeID"]);

            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.Products.Where(p => p.TypeID == typeId).ToList();
                foreach (Product p in list)
                {
                    ctx.Products.Remove(p);
                }
                TypeProduct typePro = ctx.TypeProducts.Where(c => c.TypeID == typeId).FirstOrDefault();
                if (typePro != null)
                {
                    ctx.TypeProducts.Remove(typePro);
                    ctx.SaveChanges();
                    loadTypeProducts();
                }
            }
        }

        protected void btnAddTypeProduct_Click(object sender, EventArgs e)
        {
            string typeName = txtTypeName.Text;

            TypeProduct typePro = new TypeProduct { TypeName = typeName };

            using (QLBHEntities ctx = new QLBHEntities())
            {
                ctx.TypeProducts.Add(typePro);
                ctx.SaveChanges();
            }
            loadTypeProducts();
        }
    }
}