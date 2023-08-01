import pandas as pd


def transformProduct(productFile):
    schema = {"id","gender","masterCategory","subCategory","articleType","baseColour","season","year","usage","productDisplayName"}
    schema_transform = {"PRODUCTKEY", "SKUNUMBER", "PRODUCTDESCRIPTION","BRAND", "BRANDDESCRIPTION", "CATEGORYDESCRIPTION"}

