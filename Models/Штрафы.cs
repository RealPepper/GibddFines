//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GIBDDFine.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Штрафы
    {
        public int NomerShtrafa { get; set; }
        public int SotrudnikTabel { get; set; }
        public string GosNomer { get; set; }
        public string MarkaAvto { get; set; }
        public string OpisanieShtrafa { get; set; }
        public System.DateTime DateFine { get; set; }
        public int SumShtrafa { get; set; }
        public string Status { get; set; }
    
        public virtual Машины Машины { get; set; }
        public virtual СотрудникиГИБДД СотрудникиГИБДД { get; set; }
    }
}
