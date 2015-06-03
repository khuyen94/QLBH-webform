using QLBH.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.admin
{
    public partial class adm_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/login?retUrl=/admin/adm_Products");
            }

            if (CurrentContext.GetCurUser().f_Permission < 1)
            {
                Response.Redirect("~/board?msg=2");
            }

            if (IsPostBack == false)
            {
                loadCategoriesForAdding();
                loadCategoriesForEditing();
                loadTypeProForAdding();
                loadTypeProForEditing();
                loadProducts();
            }

        }

        private void loadProducts()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.Products.Include("Category").Include("TypeProduct").ToList();
                lvwProducts.DataSource = list;
                lvwProducts.DataBind();

            }
        }

        private void loadTypeProForAdding()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.TypeProducts.ToList();
                cboTypePro.DataSource = list;
                cboTypePro.DataTextField = "TypeName";
                cboTypePro.DataValueField = "TypeID";
                cboTypePro.DataBind();
            }
        }

        private void loadTypeProForEditing()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.TypeProducts.ToList();
                cboTypeProE.DataSource = list;
                cboTypeProE.DataTextField = "TypeName";
                cboTypeProE.DataValueField = "TypeID";
                cboTypeProE.DataBind();
            }
        }

        private void loadCategoriesForAdding()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.Categories.ToList();
                cboCategories.DataSource = list;
                cboCategories.DataTextField = "CatName";
                cboCategories.DataValueField = "CatID";
                cboCategories.DataBind();
            }
        }

        private void loadCategoriesForEditing()
        {
            using (QLBHEntities ctx = new QLBHEntities())
            {
                var list = ctx.Categories.ToList();
                cboCategoriesE.DataSource = list;
                cboCategoriesE.DataTextField = "CatName";
                cboCategoriesE.DataValueField = "CatID";
                cboCategoriesE.DataBind();
            }
        }



        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

            string proname = txtProName.Text;
            decimal price = Convert.ToDecimal(txtPrice.Text);
            int quantity = Convert.ToInt32(txtQ.Text);
            int catID = Convert.ToInt32(cboCategories.SelectedItem.Value);
            int typeID = Convert.ToInt32(cboTypePro.SelectedItem.Value);
            string desc = txtTinyDes.Text;
            string fulldesc = txtFullDes.Text;
            string origin = txtOrigin.Text;

            Product p = new Product
            {
                ProName = proname,
                Price = price,
                Quantity = quantity,
                CatID = catID,
                TypeID = typeID,
                TinyDes = desc,
                FullDes = fulldesc,
                Origin = origin
            };

            using (QLBHEntities ctx = new QLBHEntities())
            {
                ctx.Products.Add(p);
                ctx.SaveChanges();
            }

            if (fuMain.HasFile && fuThumbs.HasFile)
            {
                //tao folder chua hinh [~/Imgs/sp/{ID}]
                string spDirPath = Server.MapPath("~/Imgs/sp");
                string targetDirPath = Path.Combine(spDirPath, p.ProID.ToString());
                Directory.CreateDirectory(targetDirPath);

                //copy hinh len
                string mainFileName = Path.Combine(targetDirPath, "main.jpg");
                fuMain.SaveAs(mainFileName);

                string thumbsFileName = Path.Combine(targetDirPath, "main_thumbs.jpg");
                fuThumbs.SaveAs(thumbsFileName);

            }

            clearProductInfo();
            loadProducts();

        }

        private void clearProductInfo()
        {
            //lbProID.Text = string.Empty;
            txtProName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtQ.Text = string.Empty;
            txtTinyDes.Text = string.Empty;
            txtFullDes.Text = string.Empty;
        }

        protected void lvwProducts_ItemEditing(object sender, ListViewEditEventArgs e)
        {

            lvwProducts.EditIndex = e.NewEditIndex;
            loadProducts();
        }

        protected void lvwProducts_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvwProducts.EditIndex = -1;
            loadProducts();
        }

        protected void lvwProducts_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int proId = Convert.ToInt32(e.Keys["ProID"]);
            using (QLBHEntities ctx = new QLBHEntities())
            {
                Product p = ctx.Products.Where(c => c.ProID == proId).FirstOrDefault();
                if (p != null)
                {
                    // xoa thu muc chua anh
                    string spDirPath = Server.MapPath("~/Imgs/sp");
                    string targetDirPath = Path.Combine(spDirPath, proId.ToString());

                    if (Directory.Exists(targetDirPath) == true)
                    {
                        Directory.Delete(targetDirPath, true);
                    }

                    // xoa san pham
                    ctx.Products.Remove(p);
                    ctx.SaveChanges();

                    loadProducts();
                }
            }

            Response.Write(proId.ToString());
        }


        public void ShowMessage(string Content)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script language='javascript'>alert('" + Content + "');</script>");
        }

        protected void lvwProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "EditProduct")
            {
                int proId = Convert.ToInt32(e.CommandArgument);

                using (QLBHEntities ctx = new QLBHEntities())
                {
                    Product pro = ctx.Products.Where(p => p.ProID == proId).FirstOrDefault();

                    txtProIDE.Text = pro.ProID.ToString();
                    txtProNameE.Text = pro.ProName;
                    txtPriceE.Text = string.Format("{0:N0}", pro.Price);
                    txtQE.Text = pro.Quantity.ToString();
                    txtTinyDesE.Text = pro.TinyDes;
                    txtFullDesE.Text = HttpUtility.HtmlDecode(pro.FullDes);
                    cboCategoriesE.SelectedValue = pro.CatID.ToString();
                    cboTypeProE.SelectedValue = pro.TypeID.ToString();
                    txtOriginE.Text = pro.Origin.ToString();
                }

                string script = "$('#editProductModal').modal('show')";

                if (ClientScript.IsStartupScriptRegistered("editProductModal") == false)
                {
                    ClientScript.RegisterStartupScript(
               this.GetType(),
               "editProductModal",
               script,
               true
                   );
                }

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int proId = Convert.ToInt32(txtProIDE.Text);

            using (QLBHEntities ctx = new QLBHEntities())
            {
                Product pro = ctx.Products.Where(p => p.ProID == proId).FirstOrDefault();
                pro.ProName = txtProNameE.Text;
                pro.Price = Convert.ToDecimal(txtPriceE.Text);
                pro.Quantity = Convert.ToInt32(txtQE.Text);
                pro.TinyDes = txtTinyDesE.Text;
                pro.FullDes = txtFullDesE.Text;
                pro.CatID = Convert.ToInt32(cboCategoriesE.SelectedItem.Value);
                pro.TypeID = Convert.ToInt32(cboTypeProE.SelectedItem.Value);
                pro.Origin = txtOriginE.Text;

                ctx.SaveChanges();

                if (fuMainE.HasFile && fuThumbsE.HasFile)
                {
                    //tao folder chua hinh [~/Imgs/sp/{ID}]
                    string spDirPath = Server.MapPath("~/Imgs/sp");
                    string targetDirPath = Path.Combine(spDirPath, pro.ProID.ToString());

                    if (Directory.Exists(targetDirPath) == false)
                    {
                        Directory.CreateDirectory(targetDirPath);
                    }
                    //copy hinh len
                    string mainFileName = Path.Combine(targetDirPath, "main.jpg");
                    fuMainE.SaveAs(mainFileName);

                    string thumbsFileName = Path.Combine(targetDirPath, "main_thumbs.jpg");
                    fuThumbsE.SaveAs(thumbsFileName);

                }

                loadProducts();
            }
        }
    }
}