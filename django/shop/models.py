from django.db import models
from django.contrib.auth.models import User

class Category(models.Model):
    name = models.CharField(max_length=255, unique=True, verbose_name="Category Name")
    description = models.TextField(blank=True, verbose_name="Description")
  
    
    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"

    def __str__(self):
        return self.name



class SubCategory(models.Model):
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='category', verbose_name="Category",)
    name = models.CharField(max_length=255, unique=True, verbose_name="SubCategory Name")
    description = models.TextField(blank=True, verbose_name="Description")
  
    
    class Meta:
        verbose_name = "SubCategory"
        verbose_name_plural = "SubCategories"

    def __str__(self):
        return self.name

class Product(models.Model):
    sub_category = models.ForeignKey(SubCategory,blank=True, null=True, on_delete=models.CASCADE, related_name='products', verbose_name="Sub Category")
    name = models.CharField(max_length=255, verbose_name="Product Name")
    description = models.TextField(verbose_name="Description")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Price")
    stock = models.IntegerField(default=0, verbose_name="Stock")
    image = models.ImageField(upload_to='products/', blank=True, null=True, verbose_name="Image")  # Consider using a storage service
    
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Product"
        verbose_name_plural = "Products"

    def __str__(self):
        return self.name

class Order(models.Model):
    """
    Represents an order placed by a user.
    """
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='orders', verbose_name="User")
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Total Amount")
    order_date = models.DateTimeField(auto_now_add=True, verbose_name="Order Date")
    is_paid = models.BooleanField(default=False, verbose_name="Is Paid")
    
    STATUS_CHOICES = (
        ('pending', 'Pending'),
        ('processing', 'Processing'),
        ('shipped', 'Shipped'),
        ('completed', 'Completed'),
        ('cancelled', 'Cancelled'),
    )
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name="Status")

    class Meta:
        verbose_name = "Order"
        verbose_name_plural = "Orders"

    def __str__(self):
        return f"Order #{self.id} - {self.user.username} - {self.order_date}"

class OrderItem(models.Model):
    """
    Represents an item within an order.  This is a separate model to handle
    quantity and price at the time of order, which might differ from the
    current product price.
    """
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items', verbose_name="Order")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="Product")
    quantity = models.PositiveIntegerField(verbose_name="Quantity")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Price")  # Price at the time of order

    class Meta:
        verbose_name = "Order Item"
        verbose_name_plural = "Order Items"

    def __str__(self):
        return f"{self.quantity} x {self.product.name} in Order #{self.order.id}"
