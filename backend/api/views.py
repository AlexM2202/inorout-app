from django.shortcuts import render
from django.http import JsonResponse
from django.db import connection, OperationalError

# Create your views here.

def health_check(request):
    try:
        connection.ensure_connection()
        return JsonResponse({"status": "ok", "database": "connected"})
    except OperationalError:
        return JsonResponse({"status": "error", "database": "disconnected"})