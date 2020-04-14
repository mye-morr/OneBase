using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

// todo: add these fields and switch over tables: Clients2 -> Client
//,[datAdded]
//,[vcHow]
//,[vcComment]
//,[vcInsStatus]
//,[vcMcdNo]
//,[vcMltc]
//,[vcName]
//,[vcP]
//,[vcPR]
//,[vcP2]
//,[vcP2R]
//,[vcLang]
//,[vcSSN]
//,[vcSex]
//,[datDOB]
//,[vcMobil]
//,[vcTransp]
//,[vcAuthNo]
//,[datAuth]
//,[datEffectiv]
//,[datExp]
//,[bHHA_Sun]
//,[bHHA_Mon]
//,[bHHA_Tue]
//,[bHHA_Wed]
//,[bHHA_Thu]
//,[bHHA_Fri]
//,[bHHA_Sat]

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