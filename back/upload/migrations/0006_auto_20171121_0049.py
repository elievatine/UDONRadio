# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-11-21 00:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('upload', '0005_auto_20171114_2046'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fileupload',
            name='audio',
            field=models.FileField(blank=True, max_length=1024, upload_to='file/'),
        ),
    ]