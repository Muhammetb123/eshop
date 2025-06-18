# from rest_framework import viewsets, generics, status
# from rest_framework.decorators import action
# from rest_framework.response import Response
# from .models import Category, Product, Order, OrderItem
# from .serializers import CategorySerializer, ProductSerializer, OrderSerializer, OrderItemSerializer
# from django.shortcuts import get_object_or_404
# from rest_framework.permissions import IsAuthenticated, IsAdminUser
# from rest_framework.decorators import api_view, permission_classes
# from django.db.models import Sum
# from drf_yasg.utils import swagger_auto_schema
# from drf_yasg import openapi

# class CategoryViewSet(viewsets.ModelViewSet):
#     """
#     ViewSet for managing categories.
#     """
#     queryset = Category.objects.all()
#     serializer_class = CategorySerializer
#     # permission_classes = [IsAdminUser] # Only admin users can create, update, delete categories
#     @swagger_auto_schema(
#         operation_description="Retrieve a list of all categories",
#         responses={200: CategorySerializer(many=True)}
#     )
#     def list(self, request, *args, **kwargs):
#         return super().list(request, *args, **kwargs)

#     @swagger_auto_schema(
#         operation_description="Create a new category",
#         request_body=CategorySerializer,
#         responses={201: CategorySerializer}
#     )
    
#     @action(detail=True, methods=['GET'])
#     def products(self, request, pk=None):
#         """
#         Endpoint to retrieve products for a specific category.
#         """
#         category = self.get_object()
#         products = category.products.all()
#         serializer = ProductSerializer(products, many=True, context={'request': request})
#         return Response(serializer.data)

# class ProductViewSet(viewsets.ModelViewSet):
#     """
#     ViewSet for managing products.
#     """
#     queryset = Product.objects.all()
#     serializer_class = ProductSerializer
#     #permission_classes = [IsAdminUser] # Only admin can do all
#     @swagger_auto_schema(
#         operation_description="Retrieve all products",
#         responses={200: ProductSerializer(many=True)}
#     )
#     def list(self, request, *args, **kwargs):
#         return super().list(request, *args, **kwargs)

#     @swagger_auto_schema(
#         operation_description="Create a new product",
#         request_body=ProductSerializer,
#         responses={201: ProductSerializer}
#     )
    
#     def get_permissions(self):
#         """
#         Instantiates and returns the list of permissions that this view requires.
#         """
#         if self.action in ['create', 'update', 'partial_update', 'destroy']:
#             permission_classes = [IsAdminUser]
#         else:
#             permission_classes = []
#         return [permission() for permission in permission_classes]

# class OrderViewSet(viewsets.ModelViewSet):
#     """
#     ViewSet for managing orders.
#     """
#     queryset = Order.objects.all()
#     serializer_class = OrderSerializer
#     # permission_classes = [IsAuthenticated]  # Only authenticated users can view their orders
#     @swagger_auto_schema(
#         operation_description="Retrieve all orders",
#         responses={200: OrderSerializer(many=True)}
#     )
#     def list(self, request, *args, **kwargs):
#         return super().list(request, *args, **kwargs)

#     @swagger_auto_schema(
#         operation_description="Create a new order",
#         request_body=OrderSerializer,
#         responses={201: OrderSerializer}
#     )
#     def get_queryset(self):
#         # This is the crucial part for Swagger schema generation
#         if getattr(self, 'swagger_fake_view', False):
#             # Return an empty queryset or a queryset for a dummy user for schema generation.
#             # This allows Swagger to inspect the serializer and fields without triggering the user filter.
#             return Order.objects.none() # Or Order.objects.all() if you want to expose all order fields

#         # For actual requests, ensure the user is authenticated
#         user = self.request.user
#         if not user.is_authenticated:
#             # This should ideally be caught by IsAuthenticated permission,
#             # but it's a good safeguard or for unauthenticated (but allowed) views.
#             return Order.objects.none()

#         # For authenticated users, filter orders by the current user
#         return Order.objects.filter(user=user)
#     # def get_queryset(self):
#     #     """
#     #     Override to return only the current user's orders.
#     #     """
#     #     user = self.request.user
#     #     if user.is_staff:
#     #         return Order.objects.all()
#     #     return Order.objects.filter(user=user)

#     def create(self, request, *args, **kwargs):
#         """
#         Override to add user to the order and handle order items creation.
#         """
#         serializer = self.get_serializer(data=request.data, context={'request': request})
#         serializer.is_valid(raise_exception=True)
#         order = serializer.save()
#         return Response(serializer.data, status=status.HTTP_201_CREATED)
    
#     @action(detail=True, methods=['POST'])
#     def add_item(self, request, pk=None):
#         """
#         Endpoint to add an item to an order.
#         """
#         order = self.get_object()
#         product_id = request.data.get('product_id')
#         quantity = request.data.get('quantity')
#         price = request.data.get('price')

#         if not product_id or not quantity or not price:
#             return Response({'error': 'product_id, quantity and price are required'}, status=status.HTTP_400_BAD_REQUEST)

#         try:
#             product = Product.objects.get(pk=product_id)
#         except Product.DoesNotExist:
#             return Response({'error': 'Product not found'}, status=status.HTTP_404_NOT_FOUND)
        
#         # removed check for order.status == 'pending'
#         order_item = OrderItem.objects.create(order=order, product=product, quantity=quantity, price=price)
#         order.total_amount += order_item.price * order_item.quantity
#         order.save()
#         serializer = OrderSerializer(order, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_201_CREATED)
    
#     @action(detail=True, methods=['DELETE'])
#     def remove_item(self, request, pk=None, item_id=None):
#         """
#         Endpoint to remove an item from an order.
#         """
#         order = self.get_object()
        
#         if item_id is None:
#             return Response({'error': 'item_id is required'}, status=status.HTTP_400_BAD_REQUEST)
        
#         try:
#             item = OrderItem.objects.get(pk=item_id, order=order)
#         except OrderItem.DoesNotExist:
#             return Response({'error': 'Item not found in this order'}, status=status.HTTP_404_NOT_FOUND)
        
#         # removed check for order.status == 'pending'
#         order.total_amount -= item.price * item.quantity
#         order.save()
#         item.delete()
        
#         serializer = OrderSerializer(order, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_200_OK)

#     @action(detail=True, methods=['GET'])
#     def order_summary(self, request, pk=None):
#         """
#         Endpoint to get the order summary.
#         """
#         order = self.get_object()
#         serializer = OrderSerializer(order, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_200_OK)
    
# # Other views

# # @api_view(['GET'])
# # @permission_classes([IsAdminUser])
# # def dashboard_view(request):
# #     """
# #     Dashboard view for admin users.
# #     """
# #     total_orders = Order.objects.count()
# #     total_products = Product.objects.count()
# #     total_categories = Category.objects.count()
# #     total_revenue = Order.objects.filter(is_paid=True).aggregate(Sum('total_amount'))['total_amount__sum'] or 0

# #     return Response({
# #         'total_orders': total_orders,
# #         'total_products': total_products,
# #         'total_categories': total_categories,
# #         'total_revenue': total_revenue,
# #     })


from rest_framework import viewsets, generics, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Category, Product, Order, OrderItem
from .serializers import CategorySerializer, ProductSerializer, OrderSerializer, OrderItemSerializer
from django.shortcuts import get_object_or_404
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.decorators import api_view, permission_classes
from django.db.models import Sum

# Import swagger_auto_schema for function-based views from drf_yasg
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi # Often needed for openapi.Response, openapi.Schema, etc.


class CategoryViewSet(viewsets.ModelViewSet):
    """
    ViewSet for managing categories.
    """
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    # permission_classes = [IsAdminUser] # Only admin users can create, update, delete categories
    
    @swagger_auto_schema(
        operation_description="Retrieve a list of all categories",
        responses={200: CategorySerializer(many=True)}
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    @swagger_auto_schema(
        operation_description="Create a new category",
        request_body=CategorySerializer, # Correctly applied to POST method
        responses={201: CategorySerializer}
    )
    def create(self, request, *args, **kwargs):
        return super().create(request, *args, **kwargs)

    @action(detail=True, methods=['GET'])
    @swagger_auto_schema(
        operation_description="Retrieve products for a specific category.",
        responses={200: ProductSerializer(many=True)}
    )
    def products(self, request, pk=None):
        """
        Endpoint to retrieve products for a specific category.
        """
        category = self.get_object()
        products = category.products.all()
        serializer = ProductSerializer(products, many=True, context={'request': request})
        return Response(serializer.data)

class ProductViewSet(viewsets.ModelViewSet):
    """
    ViewSet for managing products.
    """
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    #permission_classes = [IsAdminUser] # Only admin can do all
    
    @swagger_auto_schema(
        operation_description="Retrieve all products",
        responses={200: ProductSerializer(many=True)}
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    @swagger_auto_schema(
        operation_description="Create a new product",
        request_body=ProductSerializer, # Correctly applied to POST method
        responses={201: ProductSerializer}
    )
    def create(self, request, *args, **kwargs):
        return super().create(request, *args, **kwargs)

    def get_permissions(self):
        """
        Instantiates and returns the list of permissions that this view requires.
        """
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            permission_classes = [IsAdminUser]
        else:
            permission_classes = []
        return [permission() for permission in permission_classes]

class OrderViewSet(viewsets.ModelViewSet):
    """
    ViewSet for managing orders.
    """
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    # permission_classes = [IsAuthenticated]  # Only authenticated users can view their orders
    
    @swagger_auto_schema(
        operation_description="Retrieve all orders",
        responses={200: OrderSerializer(many=True)}
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    @swagger_auto_schema(
        operation_description="Create a new order",
        request_body=OrderSerializer, # Correctly applied to POST method
        responses={201: OrderSerializer}
    )
    def create(self, request, *args, **kwargs):
        """
        Override to add user to the order and handle order items creation.
        """
        serializer = self.get_serializer(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        order = serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def get_queryset(self):
        # This is the crucial part for Swagger schema generation (compatible with drf_yasg)
        if getattr(self, 'swagger_fake_view', False):
            # Return an empty queryset or a queryset for a dummy user for schema generation.
            # This allows Swagger to inspect the serializer and fields without triggering the user filter.
            return Order.objects.none() # Or Order.objects.all() if you want to expose all order fields

        # For actual requests, ensure the user is authenticated
        user = self.request.user
        if not user.is_authenticated:
            # This should ideally be caught by IsAuthenticated permission,
            # but it's a good safeguard or for unauthenticated (but allowed) views.
            return Order.objects.none()

        # For authenticated users, filter orders by the current user
        return Order.objects.filter(user=user)
    # def get_queryset(self):
    #     """
    #     Override to return only the current user's orders.
    #     """
    #     user = self.request.user
    #     if user.is_staff:
    #         return Order.objects.all()
    #     return Order.objects.filter(user=user)
    
    @action(detail=True, methods=['POST'])
    @swagger_auto_schema(
        operation_description="Add an item to an order.",
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            required=['product_id', 'quantity', 'price'],
            properties={
                'product_id': openapi.Schema(type=openapi.TYPE_INTEGER, description='ID of the product'),
                'quantity': openapi.Schema(type=openapi.TYPE_INTEGER, description='Quantity of the product'),
                'price': openapi.Schema(type=openapi.TYPE_NUMBER, format=openapi.FORMAT_FLOAT, description='Price of the product item'),
            }
        ),
        responses={201: OrderSerializer}
    )
    def add_item(self, request, pk=None):
        """
        Endpoint to add an item to an order.
        """
        order = self.get_object()
        product_id = request.data.get('product_id')
        quantity = request.data.get('quantity')
        price = request.data.get('price')

        if not product_id or not quantity or not price:
            return Response({'error': 'product_id, quantity and price are required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            product = Product.objects.get(pk=product_id)
        except Product.DoesNotExist:
            return Response({'error': 'Product not found'}, status=status.HTTP_404_NOT_FOUND)
        
        # removed check for order.status == 'pending'
        order_item = OrderItem.objects.create(order=order, product=product, quantity=quantity, price=price)
        order.total_amount += order_item.price * order_item.quantity
        order.save()
        serializer = OrderSerializer(order, context={'request': request})
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    
    @action(detail=True, methods=['DELETE'])
    @swagger_auto_schema(
        operation_description="Remove an item from an order.",
        manual_parameters=[
            openapi.Parameter(
                'item_id',
                openapi.IN_PATH, # item_id is likely part of the URL path for this action
                description="ID of the order item to remove",
                type=openapi.TYPE_INTEGER,
                required=True
            )
        ],
        responses={200: OrderSerializer, 400: 'Bad Request', 404: 'Not Found'}
    )
    def remove_item(self, request, pk=None, item_id=None):
        """
        Endpoint to remove an item from an order.
        """
        order = self.get_object()
        
        if item_id is None:
            return Response({'error': 'item_id is required'}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            item = OrderItem.objects.get(pk=item_id, order=order)
        except OrderItem.DoesNotExist:
            return Response({'error': 'Item not found in this order'}, status=status.HTTP_404_NOT_FOUND)
        
        # removed check for order.status == 'pending'
        order.total_amount -= item.price * item.quantity
        order.save()
        item.delete()
        
        serializer = OrderSerializer(order, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

    @action(detail=True, methods=['GET'])
    @swagger_auto_schema(
        operation_description="Get the order summary.",
        responses={200: OrderSerializer}
    )
    def order_summary(self, request, pk=None):
        """
        Endpoint to get the order summary.
        """
        order = self.get_object()
        serializer = OrderSerializer(order, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)
    

@swagger_auto_schema(...)
@api_view(['GET'])
@permission_classes([IsAdminUser])
def dashboard_view(request):
    """
    Dashboard view for admin users.
    """
    total_orders = Order.objects.count()
    total_products = Product.objects.count()
    total_categories = Category.objects.count()
    total_revenue = Order.objects.filter(is_paid=True).aggregate(Sum('total_amount'))['total_amount__sum'] or 0

    return Response({
        'total_orders': total_orders,
        'total_products': total_products,
        'total_categories': total_categories,
        'total_revenue': total_revenue,
    })