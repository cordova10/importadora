using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Site.Helpers
{
    public static class PagingHelper
    {
        public static MvcHtmlString Paginar(this HtmlHelper html, PagingInfo pagingInfo, Func<int, string> pageUrl)
        {
            int totalS = pagingInfo.CurrentPage * pagingInfo.ItemsPerPage;
            if (totalS > pagingInfo.TotalItems)
                totalS = pagingInfo.TotalItems;

            TagBuilder tagContent = new TagBuilder("div");

            TagBuilder tagSpan1 = new TagBuilder("span"); //contenedor del drop down de numeros de elementos por pagina
            tagSpan1.AddCssClass("span2");
            TagBuilder tagSpan2 = new TagBuilder("span"); //contenedor de la informacion de cuantos elementos son en total
            tagSpan2.AddCssClass("span3");
            TagBuilder tagSpan3 = new TagBuilder("span"); //contenedor de la paginaciion
            tagSpan3.AddCssClass("span7");

            //setTagSpan1(tagSpan1, pagingInfo.ItemsPerPage, pageUrl(pagingInfo.CurrentPage));
            //setTagSpan2(tagSpan2, pagingInfo.ItemsPerPage, pagingInfo.CurrentPage, pagingInfo.TotalItems);
            setTagSpan3(tagSpan3, pagingInfo, pageUrl);

            tagContent.InnerHtml = tagSpan1.ToString();
            tagContent.InnerHtml += tagSpan2.ToString();
            tagContent.InnerHtml += tagSpan3.ToString();

            return MvcHtmlString.Create(tagContent.ToString());
        }


        private static void setTagSpan1(TagBuilder tagSpan1, int pageSize, string url)
        {
            tagSpan1.InnerHtml = "Registros: ";
            TagBuilder tagDropDown = new TagBuilder("select");
            tagDropDown.AddCssClass("dev-select-page");
            tagDropDown.Attributes.Add("data-url", url);
            tagDropDown.Attributes.Add("style", "width: 60px;");
            if (pageSize == 10)
            {
                tagDropDown.InnerHtml += "<option value='10' selected='selected'>10</option>";
            }
            else
            {
                tagDropDown.InnerHtml += "<option value='10'>10</option>";
            }
            if (pageSize == 20)
            {
                tagDropDown.InnerHtml += "<option value='20' selected='selected'>20</option>";
            }
            else
            {
                tagDropDown.InnerHtml += "<option value='20' >20</option>";
            }
            if (pageSize == 30)
            {
                tagDropDown.InnerHtml += "<option value='30' selected='selected'>30</option>";
            }
            else
            {
                tagDropDown.InnerHtml += "<option value='30'>30</option>";
            }
            if (pageSize == 40)
            {
                tagDropDown.InnerHtml += "<option value='40' selected='selected'>40</option>";
            }
            else
            {
                tagDropDown.InnerHtml += "<option value='40' >40</option>";
            }
            if (pageSize == 50)
            {
                tagDropDown.InnerHtml += "<option value='50' selected='selected'>50</option>";
            }
            else
            {
                tagDropDown.InnerHtml += "<option value='50' >50</option>";
            }
            if (pageSize == 100)
            {
                tagDropDown.InnerHtml += "<option value='100' selected='selected'>100</option>";
            }
            else
            {
                tagDropDown.InnerHtml += "<option value='100'>100</option>";
            }
            tagSpan1.InnerHtml = tagDropDown.ToString();
        }

        private static void setTagSpan2(TagBuilder tagSpan2, int pageSize, int page, int total)
        {
            string mostrando = "Mostrando {0} al {1} de {2}";
            tagSpan2.InnerHtml = String.Format(mostrando, ((pageSize * page) - pageSize + 1), (page * pageSize), total);
        }

        private static void setTagSpan3(TagBuilder tagSpan3, PagingInfo pagingInfo, Func<int, string> pageUrl)
        {
            TagBuilder tagC = new TagBuilder("div");
            tagC.AddCssClass("pagination");
            //tagC.AddCssClass("pagination-right");

            TagBuilder tagUl = new TagBuilder("ul");
            tagUl.AddCssClass("pagination");
            tagUl.Attributes.Add("style", "list-style: none;width:auto !important;");



            //pagina anterior  
            if (pagingInfo.CurrentPage > 1)
            {
                TagBuilder tagLi = new TagBuilder("li");
                tagLi.InnerHtml = "<a href='" + pageUrl(pagingInfo.CurrentPage - 1) + "' class='prev dev-a-page'>Anterior</a>";
                tagUl.InnerHtml += tagLi.ToString();
            }
            else
            {
                TagBuilder tagLi = new TagBuilder("li");
                tagLi.InnerHtml = "<span class='prev disabled' >Anterior</span>";
                tagUl.InnerHtml += tagLi.ToString();
            }


            int totalP = 10;
            int ipage = 1;


            if (totalP > pagingInfo.TotalPages)
                totalP = pagingInfo.TotalPages;

            if (pagingInfo.CurrentPage > 6)
            {
                totalP = pagingInfo.CurrentPage + 4;
                ipage = pagingInfo.CurrentPage - 5;

                if (totalP > pagingInfo.TotalPages)
                {
                    totalP = pagingInfo.TotalPages;
                    ipage = pagingInfo.TotalPages - 9;
                    if (ipage < 1)
                    {
                        ipage = 1;
                    }

                }
            }

            for (int i = ipage; i <= totalP; i++)
            {

                TagBuilder tagLi = new TagBuilder("li");
                // tagLi.InnerHtml = i.ToString();

                if (i == pagingInfo.CurrentPage)
                {
                    tagLi.AddCssClass("active");
                    tagLi.InnerHtml = "<a href='#' >" + i + "</a>";
                }
                else
                {
                    tagLi.InnerHtml = "<a href='" + pageUrl(i) + "' class='dev-a-page'>" + i + "</a>";
                }

                tagUl.InnerHtml += tagLi.ToString();
            }

            //pagina siguiente
            if (pagingInfo.CurrentPage < pagingInfo.TotalPages)
            {
                TagBuilder tagLi = new TagBuilder("li");
                tagLi.InnerHtml = "<a href='" + pageUrl(pagingInfo.CurrentPage + 1) + "' class='next dev-a-page'>Siguiente</a>";
                tagUl.InnerHtml += tagLi.ToString();
            }
            else
            {
                TagBuilder tagLi = new TagBuilder("li");
                tagLi.InnerHtml = "<span class='next disabled' >Siguiente</span>";
                tagUl.InnerHtml += tagLi.ToString();
            }

            //ultima pagina


            tagC.InnerHtml = tagUl.ToString();
            tagSpan3.InnerHtml = tagC.ToString();
        }
    }
}