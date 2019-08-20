using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace JSONWebService
{
    [DataContract]
    public class wsClient
    {
            [DataMember]
            public long numRow { get; set; }

            [DataMember]
            public string vcName { get; set; }

            [DataMember]
            public string vcInsStatus { get; set; }
        }
    }