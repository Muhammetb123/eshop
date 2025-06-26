from django.contrib import admin
from .models import SubCategory, Category, Product,Order,OrderItem

admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(SubCategory)

