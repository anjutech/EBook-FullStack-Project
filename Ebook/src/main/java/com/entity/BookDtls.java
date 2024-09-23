package com.entity;

public class BookDtls {
    
		private int	  Id ;
		private String	  bookname ;
		private String	  author ;
		private String	  price ;
		private String	  Category ;
		private String	  status ;
		private String	  photo ;
		
		
		public BookDtls(int id) {
			super();
			Id = id;
		}

		public BookDtls(  String bookname, String author, String price, String category, String status,
				String photo) {
			super();
			this.bookname = bookname;
			this.author = author;
			this.price = price;
			this.Category = category;
			this.status = status;
			this.photo = photo;
		}
		
		public BookDtls() {
			super();
			// TODO Auto-generated constructor stub
		}

		public int getId() {
			return Id;
		}
		public void setId(int id) {
			Id = id;
		}
		public String getBookname() {
			return bookname;
		}
		public void setBookname(String bookname) {
			this.bookname = bookname;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public String getCategory() {
			return Category;
		}
		public void setCategory(String category) {
			Category = category;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getPhoto() {
			return photo;
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}

		@Override
		public String toString() {
			return "BookDtls [Id=" + Id + ", bookname=" + bookname + ", author=" + author + ", price=" + price
					+ ", Category=" + Category + ", status=" + status + ", photo=" + photo + "]";
		}
		
		
		

}
