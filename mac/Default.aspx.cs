using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetMACAddress()
    {
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        String sMacAddress = string.Empty;
        foreach (NetworkInterface adapter in nics)
        {
            if (sMacAddress == String.Empty)// only return MAC Address from first card  
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();
                sMacAddress = adapter.GetPhysicalAddress().ToString();
            }
        } return sMacAddress;
    }
    //public string GetMACAddress()
    //{
    //    ManagementObjectSearcher objMOS = new ManagementObjectSearcher("Win32_NetworkAdapterConfiguration");
    //    ManagementObjectCollection objMOC = objMOS.Get();
    //    string MACAddress = String.Empty;
    //    foreach (ManagementObject objMO in objMOC)
    //    {
    //        if (MACAddress == String.Empty) // only return MAC Address from first card   
    //        {
    //            MACAddress = objMO["MacAddress"].ToString();
    //        }
    //        objMO.Dispose();
    //    }
    //    MACAddress = MACAddress.Replace(":", "");
    //    return MACAddress;
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = GetMACAddress();
    }
}