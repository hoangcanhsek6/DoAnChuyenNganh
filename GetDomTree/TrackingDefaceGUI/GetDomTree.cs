﻿using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions; 
using System.Threading.Tasks;
using System.Web;

namespace GetDomTree
{
    public class GetDomTree
    {
        int i, j, k, loi, saiSo;      

        public String test()
        {
            string url = "http://www.hochiminhcity.gov.vn/Pages/default.aspx";

            // Call the page and get the generated HTML
            var doc = new HtmlAgilityPack.HtmlDocument();
            HtmlAgilityPack.HtmlNode.ElementsFlags["br"] = HtmlAgilityPack.HtmlElementFlag.Empty;
            doc.OptionWriteEmptyNodes = true;

            try
            {
                var webRequest = HttpWebRequest.Create(url);
                Stream stream = webRequest.GetResponse().GetResponseStream();
                doc.Load(stream);
                stream.Close();
            }
            catch (System.UriFormatException uex)
            {
                Console.WriteLine("There was an error in the format of the url", uex);
                throw;
            }
            catch (System.Net.WebException wex)
            {
                Console.WriteLine("There was an error connecting to the url: ", wex);
                throw;
            }
          
            string output = doc.DocumentNode.OuterHtml;

            Console.WriteLine("Chuoi chua bo HTML");
            Console.WriteLine(output.Length);

            String str2 = Regex.Replace(output, "<.*?>", string.Empty);

            Console.WriteLine("Chuoi da bo HTML");
            Console.WriteLine(str2.Length);

            if (!SoSanh(str2, str2))
            {
                Console.WriteLine("Hai chuoi khac nhau vi loi > sai so");
            }
            else
                Console.WriteLine("Hai chuoi giong nhau vi loi < sai so");

            // HtmlAgilityPack.HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes("<body>");
            //HtmlAgilityPack.HtmlNodeCollection nodes = doc.DocumentNode.SelectNodes("//div");
            //HtmlAgilityPack.HtmlNodeCollection nodes = doc.DocumentNode.DescendantNodes().Where(n=>n.Name == "div");
            // Console.WriteLine(nodes.Count());


            var output1 = doc.DocumentNode.SelectNodes("//a[@class='tmenu']");
            foreach (var i in output1)
            {
                var data = i.Attributes["href"].Value;
                Console.WriteLine(data);
            }


            var allLink = doc.DocumentNode.SelectNodes("//li[@class='li_item_tab']/a");
            foreach (var node in allLink)
            {
                var hrefNode = node.Attributes["href"].Value;
                Console.WriteLine(hrefNode);
            }        
            return output;
        }


        // Thuat toan
        public bool SoSanh(string s1, string s2)
        {
            saiSo = (int)Math.Round(s1.Length * 0.3);
            Console.WriteLine("Sai so la");
            Console.WriteLine(saiSo);
            if (s1.Length < (s2.Length - saiSo) || s1.Length > (s2.Length + saiSo))

                return false;

            i = j = loi = 0;

            while (i < s2.Length && j < s1.Length)
            {

                if (s2[i] != s1[j])
                {

                    loi++;

                    for (k = 1; k <= saiSo; k++)
                    {

                        if ((i + k < s2.Length) && s2[i + k] == s1[j])
                        {
                            i += k;
                            loi += k - 1;
                            break;
                        }
                        else if ((j + k < s1.Length) && s2[i] == s1[j + k])
                        {
                            j += k;
                            loi += k - 1;
                            break;
                        }
                    }
                }
                i++;
                j++;
            }
            loi += s2.Length - i + s1.Length - j;
            Console.WriteLine("Loi:");
            Console.WriteLine(loi);
            if (loi <= saiSo)
                return true;
            else return false;
        }


        // Thuat toan BoyerMood
        public string tessst()
        {
            string urlAddress = "http://google.com.vn";
            string data = "";

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlAddress);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            if (response.StatusCode == HttpStatusCode.OK)
            {
                Stream receiveStream = response.GetResponseStream();
                StreamReader readStream = null;

                if (response.CharacterSet == null)
                {
                    readStream = new StreamReader(receiveStream);
                }
                else
                {
                    readStream = new StreamReader(receiveStream, Encoding.GetEncoding(response.CharacterSet));
                }

                 data = readStream.ReadToEnd();

                response.Close();
                readStream.Close();
            }
            return data;
        }
    }
}
