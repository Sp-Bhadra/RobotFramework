from robot.api.deco import library, keyword


@library
class Shop:

    #def __int__(self):
    @keyword
    def hello_world(self):
        print("hello")