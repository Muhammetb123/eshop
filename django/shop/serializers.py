from rest_framework import serializers
from .models import Category, SubCategory, Product, Order, OrderItem
from django.contrib.auth.models import User
from django.contrib.auth import authenticate



class RegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    
    phone_number = serializers.CharField(required=True)

    class Meta:
        model = User
        fields = ['id','username', 'email', 'password', 'first_name', 'last_name', 'phone_number']



    def create(self, validated_data):
        
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'],
            first_name=validated_data.get('first_name', ''),
            last_name=validated_data.get('last_name', ''),
        )
        return user



# Login Serializer
class LoginSerializer(serializers.Serializer):
    phone_number = serializers.CharField()
    password = serializers.CharField(write_only=True)
    
    def validate(self, data):
        username = data.get("username", "")
        password = data.get("password", "")
        user = authenticate(username=username, password=password)
        if user and user.is_active:
            return user
        raise serializers.ValidationError("Invalid credentials")

# Custom User Serializer
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email',  'first_name', 'last_name']
        
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name', 'description']
        
class SubCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = ['id', 'category', 'name', 'description']
        

class ProductSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)  # Use the CategorySerializer
    category_id = serializers.PrimaryKeyRelatedField( # Allow setting category by ID
        queryset=Category.objects.all(), source='category', write_only=True
    )
    class Meta:
        model = Product
        fields = ['id', 'category', 'category_id', 'name', 'description', 'price', 'stock', 'image',  'created_at', 'updated_at']
        read_only_fields = [ 'created_at', 'updated_at']
        
    def create(self, validated_data):
        #  Populate the slug field if it's not in validated_data.
        if 'slug' not in validated_data:
            validated_data['slug'] = slugify(validated_data['name'])
        return super().create(validated_data)

from django.utils.text import slugify

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']

class OrderItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)
    product_id = serializers.PrimaryKeyRelatedField(
        queryset=Product.objects.all(), source='product', write_only=True
    )

    class Meta:
        model = OrderItem
        fields = ['id', 'product', 'product_id', 'quantity', 'price']
        
class OrderSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    items = OrderItemSerializer(many=True, read_only=True)  # Use OrderItemSerializer
    user_id = serializers.PrimaryKeyRelatedField(
        queryset=User.objects.all(), source='user', write_only=True
    )
    class Meta:
        model = Order
        fields = ['id', 'user', 'user_id', 'total_amount', 'order_date', 'is_paid', 'status', 'items']
        read_only_fields = ['order_date', 'user']

    def create(self, validated_data):
        # Remove items from validated data, as we'll handle them separately.
        items_data = validated_data.pop('items', [])
        user = self.context['request'].user
        # Create the order.
        order = Order.objects.create(user=user, **validated_data)

        # Create the order items.
        for item_data in items_data:
            OrderItem.objects.create(order=order, **item_data)
        order.total_amount = 0
        for item in order.items.all():
            order.total_amount += item.price * item.quantity
        order.save()
        return order
        
    def update(self, instance, validated_data):
        # Update the order instance with the validated data.
        instance.is_paid = validated_data.get('is_paid', instance.is_paid)
        instance.status = validated_data.get('status', instance.status)
        instance.save()
        return instance
