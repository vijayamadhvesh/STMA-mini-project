using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STMA
{
    public class ServiceStruct
    {
        private string sname;
        private int sid;
        public string name
        {
            get { return sname; }
            set { sname = value; }
        }
        public int id
        {
            get { return sid; }
            set { sid = value; }
        }
    }
}