using System.ComponentModel.DataAnnotations.Schema;

namespace Domain
{
    [Table("Test_Books")]
    public class Books
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string Code { get; set; }

        public int? AuthorID { get; set; }

    }
}
