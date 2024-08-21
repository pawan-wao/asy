import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  double percent = 0.5;
  Color selectedColor = Colors.green;
  int totalBars = 4;
  int barsPerRow = 2;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  void _showColorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.circle, color: Colors.red),
                title: Text("Red"),
                onTap: () {
                  _changeColor(Colors.red);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.circle, color: Colors.blue),
                title: Text("Blue"),
                onTap: () {
                  _changeColor(Colors.blue);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.circle, color: Colors.yellow),
                title: Text("Yellow"),
                onTap: () {
                  _changeColor(Colors.yellow);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.circle, color: Colors.green),
                title: Text("Green"),
                onTap: () {
                  _changeColor(Colors.green);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // colors
    final colorMap = {
      Colors.red: "Red",
      Colors.blue: "Blue",
      Colors.yellow: "Yellow",
      Colors.green: "Green",
    };

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top image
            Image.network('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEhMVFRUXFxUVFRcWFRUVFRUVFRUXFxgXFxUYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGi0lICUtLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS8tLS0tLS0tLf/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAADAAECBAUGBwj/xAA/EAACAgECAwYEAwUHBAIDAAABAgARAwQhEjFBBRMiUWFxBoGRoTJCsVLB0eHwBxQjYnKCojOSsvGD0hYkNP/EABsBAAMBAQEBAQAAAAAAAAAAAAECAwQABQYH/8QALREAAgICAgEDAwIGAwAAAAAAAAECEQMhEjEEIkFREzJhcbEFgaHB0fAUI5H/2gAMAwEAAhEDEQA/APMwsmBHAicNW0mfZ8aRJVhFTa/63/8AUbFuAYcLttCmPWrIBIXC7KSVJU0y2KunUq1X5gkfOS2HMge5jpR5EGOhJJdAgkl3AsN1Ar5GHGOEGOURlyIq5NMG538iR+kdMNCtz7m5b4I/dxrZCldlUY4LUAhSQLPQesuZ8fhNXtv4aJ+hlbHpL4XYseRAahR9h1gCyGPGaF86394hiJugdtz6e8tFIwZgCAaDVY86nBRU4Y+NFslr/CaqvxV4bvpe/wAoUrIMJwUBYbfuiCwhWBHeb7D0EBROifDHCyOLC12zX6dIaoCsdkQsJjA3vyNe/S/TnEqwqrBY6iQVYRUk1SFVYLH4kFSEVIRVhVxw2LKANUhFxwqY4ZccdGacSuMcTacGrANGxYuj6S4uKEXDKxMsij3UXdTQGCOcE0xiZpyMw4pBsU02wQT4pTiRcjMOOKXDiinUCzlFWFVY6rCLiueFZ9coiVYfHjjLQYLvZutttvWFbT5LtXAHkVv7wWBr4EcAbYgH3hUwAcgB7SzjxtwqGqxdkWAbN9fSoDXZxiALAniNbV095SNkZ0lyY645MY4fAoKB9qIDXYoD1PLbl8pXwa5GbhxIz7+JlXwDzJY85oSMGWSTCDFEcU0BgjHFHoi2ZuXCSCAaJ2vy9YPHgKqASWIG5PMzQRlbiAO6mmHIg+okNdhZLBQ8Qq12B394PwC/cojGCQCaF7nnQ86HOVmQ8XoRv6EH+Z+kuawMFtF4m8uUqY8eRkHGeFrJNeW4r5gxXoZbIMsjwy0yQZWcOiupB5eZHzEVR8OIgEHzJ+pkjjvaBlI9Asz8IvbmBv6n+Fn5Sai9xuDyPn7Sl2hQ4UHQf1+n3htBktWUkABQFZifBbM3hA6Eseh3MAym1Ki4FhVWD06+FQRRCgHe9x/QhUcXXPdQK3svYH3BERmqPSsLiAsWLHXpfpcKqRIkPjxybkXURkxxajIiDxnhBPDe/M+o5e8tJjhW04YFWWwdiDOUgSg60UezNKyBlL8agjhPUA71fXpNJMUD2Rou7Upx8YViB5qP2SfSamHGCLBBHpvLRlsxzjUQCYodMEtYsMJofGobhZbvZhRoEi66XV/Oa8as83K6ALpo7aWaa4ZJsE1RPOnMw8mnlbJhm+2CVs+njk1kRgHHFL74N486ilnBKss4kkMay5hSfNtn3CiPiT+csoklg04skDc1Z86l7Fptricjq+SnkUhGYcwrEe4BM5LIS5LMbJ6/ynoWPB5jbr7Tz/gHEQLIBNedDr9Jr8d2zzfO0kaWixHULi029KWZz/ku69dz9SJ2eDRhQFUAAcgBQEp/CelRVyKFIyI/Bk4gAboGh5L/AD5Tdx6PO24bGp6Lws4+bWPsBNsIqT7o81ypWzMxg96cRxsKAIbbhPn7eX19LO2jm7hwPwqWx+JiFITcDnuWobUL+0sZdKQKI2Hpyv1l3jrowPylbRxus0F7ilb9oKvHVHbiI3Xe65XJDswsmXUO5FKoXi3Dspqh1uj/AMZuZ9OL3Fixdc661A/EOq7wqi/9NBSCgOY3JA6/11k5QLRyNtJHKshge0HVQrAMS3FxKq7IwO1f5SCPYqfSaGRJVyJJNGhMokfKDZYXUarGvhJIbrY8NbVR+vPyiz4ypKsKIJUg7EEcx7iTZSLKzCMBDthO1b2SPmK2/wCS/WBEU0RRldp/9Q+y/wDiP33I9nY7ceQ8R+XL71J9qYir79dx7DavtLnZeMd3xdSzA+lBa/Ux5JLpk8acp017l3GaKk8uJL9i4B+0qnKAFoiwF4hztlzZDX0IPzhc6EowHl+hDV/xmWsklZqyOmdLpHDrxDkSQPYGgT67S5p8Z6m9z6bXsJjdg5czAWFGIcVH8xN35+ZM6rRaVsm/Mkhb+QqZsjUWa8MripMhiQS7h4KNg30ixaF2zdwgt+IqB7H+AudxpPghQtPlPF14VWh9dz9pOPJvRPyvMwYEub7PPdPoh3mU0OBwu3m3iDGvUFZPsXsvuAV7xnW/CCKCCydvMm9zN7trsV9M4DEMp/C1UDXMEdDA6jT8HD6qG+olscneybnjyRTg9PoWJZcwpKmLHRJ4ieKjR5L0oDpymhgE9LEeL5WguPBcuJoSRF2fi8V771zYkbeQJofKdTo8C8MrPLwR4GVylKkchn0dCZ2fFOx7XxqJzGsqWxz5qycJOMqMN8e8eEc7xShts87wJNDBjlXTrNXRKL3ny02foaDYcU0dae4xozo/C1+IKSo9z84fA2NPF3Yc/lDE8IPqv5vadN2N2Q+pcPqGNMpK0a2UgUF5AbzO5vlSRi8nyVi9UtRX/r/Q5XQajEytkVlKorO29GlBY7H0E8+7GxceoxKfz5EB/wBzD+M9l+NfhHS4NNm1GJSuQLwg3seMhTtyuiZ5T8PgDVacUL75Te90KoeXOzPR8VOLaZgy5o+RieTHddb+TrtHp8uLWZXyL4M4DFl/CMqGthzHEput97585vprMaZFxknjfdVAJJANFq8oQYbblNnQaYCiRN2BrtnmeZPima3ZGiUiyAYXtTRJw3UxO1O110xwafEyjNmzLwobYnG2S8pA6AAt7Td1OSxUL5crPn3L8HFazGLO0xtYk6XtDDvPPu3u18+PKyEIBvw1uCtnxcXntRHQgzROSSPV8R8uh+0yVxuw5hWI9wDM3Q5S+JGbmRvLeHV4s+Pg4iTw04Jpj57irHtH0uiBrGlKqgkkk8KKObMT0F/u6yD3s9Ba7M3W6dXHj2W6v9R+kqa3WO7Mzc2JZj1JYkk/O5pdpZ1b/DxA8AIon8Tt+0fLmaHlK7oAAK3F2b2O/SRey8fSD0WZipJ5IcZ3POkKIoH/AHEn/KIFTRuEYSOHC2TL3WMByAWYhgAqggXZoUSR9RFaKKeyn8RFbSjdcQJ5b0jHbpRYj3BjdiG1db3tSB52Gv8AQSfxFpHx92Mi0bfyN1wDmNjKfZGJe8uvEo40/wBSFW5ddg20NekDk1ks28HMe4/WZWfExZlTduJgPkTym7oFTK68BCniF42Nep4G/MPQ7+/OZXZLXlBPkx+qn+MnHTbNeSppRNvQluBeMANW4HIegnUdimsGTejxij5EgVOXR94tZ2nkxisf4b4n5NXlxLzC+omPJBz0jZNLhV/B3nwZlCdocGVgchGQA87fY3fqAfrPTAZ8+fD/AMRJhytlZO8yEWveMAquNwSwFkcqB5evMdVo/wC0/LRV+7DdPAWJ3/Lwnf6fWPBuGmjxP4j4M/IyKeOuku/2Ot/tF1SJgXiNEMX9lVSD9yBOC0Xa2LK5RGLcITxHYEuL4Re9iiK9D5TmviX4ny6niLsWLZDVgCkQAAV0sm69JS+FsRy50H5UJzN6kUF+9fVpaEHJuTL4ILxsUcd2/wDJ6QhlzC0w/wC8ZlcjuldfysHCn2YEfcTTwZDQLDh+dj6zdiMXlK7NbT5qmlj7Qqt5gq3WM2eauKfZ4WbBbtGnn17eLjK8PMHewN/xdPpMDP25pyXHegcCqz2CKDUBzHmy7eohdblY43CVxFGC3y4iPD96nk2u15yImcnxMhwZtubYyGViB5r3Z90MLahpDYfG5bZ6gSDuDt0inFdm/GWPHiRHR2ZQFscNEDYcz5VHjfViX/48wGmXkes1tGJl4WC0Ty2H12gz8QonJGPSzsL9PMT5iUW+j7x5Ix7Z1WBDxDyrcfoZ632fg/6TLXCMQA87NH90+em+LXtQAij81WWAvpvtOq+Hv7T82IHHk4HRQeCwVPPkWB8r6HeCGNxlcl/tnj/xLx5+TFfTate36no39oFNpTj4grOQFvbiI3AvkLIHOeJ9hBf7zgB/Gcqgg8wQ3KunKdP8Y/2gY9Zp1x90cbBw/wCLjBFMNuXmDOU+Dzx6/Abs8bE3zvgc2fnNkVylZPxoT8XxnCa2713X5PXsaC5yPx58T5MTjTYrQgBncEg73SijsOu/pOn1OhxZSpyY1cqbUsoJU3dqeYOw5eU8o+OMK4dV3a5Dk4caBmZuJ+Le+M/tcvqJpVKKMMIqeR38Ef8A8i1V/wD9GYf/AC5OnzndfBPxYWPdZnduMgIznip99mbmAdq57zzfsfGmRm7y6Cltj1uE7O7UOJkbGVrwsyneyhDUd7jqbf8AIXNghKoNfd710ev6rtPE7d2ro3HxpjZXDBnUeJDw8iAQb9eh5+V6vhC902NhqVcq4rwkb2QPUkenXrH7jWdwdQmRMaYshz4xvj4+8AsY3NcdLjAKg/rOwwjHrsKaoAYsjKQxxkMVIP4WJXxV5EdZpjU+9GTFH6Da9jgNGpTUJYIPEFr/AFeHl8503bzd2Bph+IENnP8An6Y/ZL3/AM1+QnLdtaTLp8pXISTfEr7+MXswPQ/oRLi6vj8RJ3C8V1u55m/U7/OZ5JW66PRTugei1nG7BduHY2DZuxt5cpcZDw8XSwvMcyCeXPkDD6zCEPDQFKt7VZI4iT58zvKGu1fcrTFvFTjHdA0CFYj5tvz3g6OtjkzT7Y1Ax6fEi4lXKykPk27woGLcPnVn+qnHL2vlDBvCaINVtsbrzr5zT1vap1WR8x4qrGtEKQlLwgWoF8udXyG/OJJFMU1yKvaWVmROI3TP1/aC/wD1+0F2ZlC5FLGgQyk+XGjLf/KVta9sD6foYAsYyjoSeT1s6fs9SHLA1w48zA7cxhevvUq9j5kGQcQIXheyACdkJ2HXlJ67H3WMgb2igG+VOlnlz8JHzmRhyHiG/p9dv3xON9ml5aar3OuyDhXjBDpuQy8jQsg3+FvQ0Zj6rtTA/iQuMlbMBVejb7ysczqmQKSFYBWHRhfX2qUsONQLMWGJdj5vKnqKNjDozl8ffYQbCnjdcRBI5lSAK9Re8tarszLp2VnAIJBBQkg77U1THABHKafZvbATS58Dn8pOE86Y2GX0Bu/cHzhcX7CLJT2YJb1ubPZXaS4NPlZD/jO4xr5qgWy31J+deUxFyrwMCtuSnC1kBVHFxDh6kkrv04T5waP18pdRVGL6r5WdAnxNlTCuJHa9y2RvE9k3wrd0Byvn5VMnLmLm3JY+bEsfqZVY9el7Rg8tGvYhkk79Ro6TWZMR4sTsh/yki/cDYj0M7f4c+K+//wALNQyV4WGwyVz26NW/rvy5TzjjksWVlYMpIKkMCOhBsGVTM8qPUe2e3l0/dl1Yq5ILDkldSOvPkPIzzz4n0/danIB+Fz3grkQ1kfS2E6jtxv7xo+Mc+Fco9CBbD6cQnD6rUtkCljZVQg/0rdfrFyjQaQG4pXLRTNY/M7PTs/CLI4l/N5t1I8ufPzgO1tcUxhGNgAUCovlQ/fLmLb5b+12bnOdv6os/D0H6+Z9Z58YWz6LyM/0sTa76Ka5Osn38qhog008EeKvIkl2aOPNfMwfeEGweR2I2II6iVkaFwmNGK6KSzSl2dd2H/aFqsFLkrOg6Oaf5ZBufncofEuvx6jO2dLUuAzq1Ahqo1WxGw+u8yNRwMqcIAYAhiLtjxEgnerogbeW8qhl3DcQNbUOvkbO0ZxFhk4O/ktrlIvhNXsSPLyhNHp2fImNeblVF7C2IA+VmZuPLRnW/Aen/ALxrEJqsY7wjqeE0oA6+IrFpp6KRzQlFuT6PVMemTBhxqE7w4cYVKC8ZKrXhLVRJHmOc5XsMuz58YwHSombjUqCO8PEwYMH/ABKVrkKAqq2nQ9o9rYMIJy5saVzBYFv+wW32gcOvx5U48bBl5dQQfIg7g+82po8lKVNmF8Y9n99p3YDxYv8AEHnw2Fce1EH/AGCcH2XqQjFX/C9Bj+yR+F/le/oTO+0eoy97mTKp4Q142/K2NlA4f1v3M8/7U0nd5HT9liPcdD8xR+cjNbs3YHrizY1vbL3WRARjUrtuykHYOxPiUmyD/m2nN9oax8znI5sn+qHoBt7ATWbUBtI7MPGOHFfmB+E+4Hh9gJgZGsk+ZJ+sjGVt/g0Zo8Ix/Kv+tf2FctabUDHkV+a/mA9QQa8mHMHzAlMGJjGvVGZSp2WNYgWgDfP2I2o/eAV5FjsPnH4tiNt/62nKzpzTlaN9NWc2O8hJIRwCeZKqSOnU7TH463l3SapVRRxEvsAANqNg212CPQH3mdiK8Q4r4bHFw1xcN71e11DFdj5Mmo/oaj51GIjisnmK5EXVG6IO3kZVo3uK9D7eUmyl0YqPApobCwB+EEjmaI+kBkzF65k0F+gCj7ATlSbHc3KMb/kHU785Uz5eI+nSPqMnD4ev5j+6VuKBO9iZZ16S92bpDlfhugN2PkP4mQ1eApanmDXuCCQR6bTuPhXslf7mWBUs1u5FFlIB4VB5g0Dt/mM5Lt3MC/D1A3PrzH7/AKwxncmjp4ksKnewOt1ZOLFj2pQT62WbnKQaT1LeHGN9lN+/G3L7QAMfHSjozZ5uU9/C/YLfrJJkIMCzcv184lskACydgPWWsg37Hc/D+f8A/WQf6/p3jTG7R7CticJAB/ITVf6T5ek1NH4Map+yAPfzP1uRyZZR7KUcVlUqSGFEGiPIxTqs2nxsSzIpJ5kiKR+mLxZb70KhZuQH2nF6jOXYses3PiDVlUCD83P2H85zq77TFGNHoedn5SUF7EwYiZEseUYRjDyDq0u42HdX+YuR8gF/jM4GHXJ4a6WT9QB+6dH7kXjkpP8AQdTUt9oapciJYp0UICPzAFiOLzoMB7KJnl6giZRutE3Mlcu9m6psbEqT4lKmiRYPtz3A2lFFs1LAWiItnY03s08+TiXhA8v1mx2FrVx5ULuy4xZIUkKSFPDars29c/Oc4uSFxvz359JWPdovJ2tnaaz4txFWBXIhIpeEqW975D7zD7fVCylc7ZSR4iQNqqqNC+o5dBMs0SDJYsLMwA3JOw6m+g840rfYsOKei32owXTY0APiJY/KhufmZhXNr4hNcCXyB/Xn9bHsomLUz416bL+VJ80vhJDXJPyobjnBmR7w+cJmciRMjcjcVxkScg2LlUlleySepJ89zvB499vWWNfpu7IF3zU1y4gd69P4RrQ1PjZDFnK2ATR5i9jXK4XC/dr3n5msYx5dGf8AcPW/KU0FkDzIEnrc/E234RSr/pXYfx9yZOW3Q8cnFX8dDBhsTv5jl94ymzBS7oHRfEyBzewYkAD2HM++23KFaETcnR0vZ/bOPBpGCsDlcDw14lq64m6rzIHryF78s7FiSbJPPqSYXLq28XLfYihXyFUPlKuTOx5knavl5QLuymXJ6VB+wQgspP7NX50T99/1le46mM5lUzLJ2kPxCvWaXZWnVgWJPED4QDRqvLmZlpXWEzNtUPLZ0erZ12LJtIZWnN6fW5AKDn9f1lte1slVS3sb4bJrpvYrfoOkty0MppmpxxSti7cUCm0+Jj1YnIt/JWAH0jReaHB/EWO1VqO219KMwQaNidhqEOTHwE7blR0DHhN1/tEwNf2WUBfkPL18gesxtUVz43J80Z2RrNiMDImIGcYuWw6gVdyIySIjGdZRt0PHEa4RBOOSsLjWpNzIIDDkUN+c7jZsh9tEMcs6JO8dUHNiBv0syu03/hvu0KOassyEnmGocNeVgzRji7onOVIsZewBjUs+YAAX+Hy8rbeU9T2hixJWAs7muLIylQF/ZQXe/IkzD1erbK7O5sk37DoB5AQJMefqVEIZHHaLGfVM5JY7n93Ie0GG2kU85cxLhOByzP34deBaHdtjo8dnnxA8PyuR/CK8m9vspEwdybGDMFE5S2ODIxRrnCWXuyMgXKhY8IDg3tsRuOe3OpZ1+6t1N38/6Mq6PT2rOy2o8Pza6P2P2jLkUBhZ3G3v5RGzZidY2n0ysDIx5NEvlz/WMZUr0iBhcbbSLYiN6jKNoWgxbTJO20DJOZC4gJytjsY3FGcxlMYjewkgTckTtILCmGT9giGEVt4JTUcHeVTOQfiig4oND8mb+DtJS5Q2vQXtf8JHt3XIqcFBnPIfs+p9fIRajSLk57HzHP8AnOc1N8bAkmiRZ57bSMrXZozZZRjXyQuKRjiIYSamTkFk1k5M0QREiEwtI1GQ0YYyClTLQicmQJkxcrRa/YQPnvDaPLTqfJlP0IMrlZKqr6y0eiTdMfX4wuV1BsB2A+RgIXXn/Fybg+NtwbG5PIwSmEgE6SJMePwirHz/AK6xOy4NmixgE7mQdakRDaaI3T2GzZL6f0IIDpETC6QW6+4/WTqhnJzkWsDsEYXsxUkeq8YF/UwHD1IqvvC43JH+4/ff+MHkbmIKNT+1WCYfeNcXFsJFns3Gsythlznkd/1kkTi2WyT0AJOws7dZWuWOz3p+KytBjY5gkcIP1InNhjPewWYjavnBQud+JmbzYn6m/wB8EBcQWW2MYwMm6ESBWFMnJNMdjGjGIQoDZMSZGwNj26j3gwY8dM5BbikOKKPaGs6VDOe7UThyt6m/rNxWmT2xiPHxUaIFnoCNv4RMi0aM+4mfFGikTIEUydwIMlxRHErGdINx7VBtEpiaKlTKSlyQdGsQvFsBK2n5Syi+H5zVG2gxlaHDDkZDLsPOPwnzgczdJW6iJNgxJKZC4pOyVlji/ryjMf6/lBg7SYissmM52goTIbgrgRPI9jySNRkLihexU62aAG3qCB/5fygcv3j4XtST5qPqDv8A8Ysuwv1oefK79BFb0a7TiV3Mjca4oDM2Pcnjbn6gj9/7hBRwZwLJHkJEGJzI3AFumOWjXGjrGE7HaMDHaQgTOemTuPciI8dAFFJBYp1BN4GD1WIuvCDXKR4j8oRWl6vRpeznwtxoTULTsPU/SDmRmViiiigASUyxp0DGia8pWWTBiyRfFJJq1YVVKOQ0sd4tc4LXj8LftDf5V/GU5XHkpByf9c3FF5sy+fyEr5Ml+0EDHjubZJybJgbRhIxxFsUIJIyAjmcUTETBXCAwbQCyHuKNFDYpZ0Qs0aHUkmthG1OWyft7DlQEAjUb/UXJNA1bsqsno4jRiYojAIKKNEJwB2kLk2kTFR0hrk1G0hCQnRHVbvcChe/X0HrBGTEi85BkKODIx4wpYQ7RSCHaKV5DmmGkg0UUsWKPaY3B8xX0/wDcpRRTJk+5mefY611iPpFFEBYlkooorHj0H1D2oHUfvlWKKGHQ2Z3K2KSqNFHJIM+KkDdSftvBKIoo81XQ1bonHiii+wyEJHJziigA+hiJGKKFisUkDGinIAooopxwjGEUUDCO0jFFFA+x1kzGihGj0NE8UU5A9iMUUUKFJBoooobDZ//Z'),

            // Row with dynamic color name and dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    colorMap[selectedColor]!,
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedColor,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    onPressed: _showColorDialog,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Slider --> controlling SPEED
            Slider(
              value: percent,
              min: 0,
              max: 1,
              divisions: 100,
              activeColor: selectedColor,
              label: percent < 0.3
                  ? 'Slow'
                  : percent < 0.5
                  ? 'Medium'
                  : 'Fast',
              onChanged: (double value) {
                setState(() {
                  percent = value;
                  _animationController.duration = Duration(
                    milliseconds: (1000 * (1 - value)).toInt().clamp(200, 1000),
                  );
                });
              },
            ),

            SizedBox(height: 20),

            // Text Fields -->  Total Bars & Bars Per Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  TextField(
                    cursorColor: selectedColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: selectedColor),
                      ),
                      labelStyle: TextStyle(color: selectedColor),
                      hintStyle: TextStyle(color: selectedColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: selectedColor),
                      ),
                      labelText: "Total Items",
                    ),
                    onChanged: (value) {
                      setState(() {
                        totalBars = int.tryParse(value) ?? totalBars;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: selectedColor),
                      ),
                      labelStyle: TextStyle(color: selectedColor),
                      hintStyle: TextStyle(color: selectedColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: selectedColor),
                      ),
                      labelText: "Items in line",
                    ),
                    onChanged: (value) {
                      setState(() {
                        barsPerRow = int.tryParse(value) ?? barsPerRow;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Dynamic Grid --> LinearPercentIndicator
            Wrap(
              spacing: 10.0,
              runSpacing: 16.0,
              children: List.generate(totalBars, (index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  width: MediaQuery.of(context).size.width / barsPerRow - 20,
                  child: LinearPercentIndicator(
                    lineHeight: 14.0,
                    percent: percent,
                    backgroundColor: Colors.white,
                    linearGradient: LinearGradient(
                      colors: [selectedColor.withOpacity(0.5), selectedColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    animation: true,
                    animationDuration: 1000,
                    restartAnimation: true,
                    barRadius: Radius.circular(10),
                    padding: EdgeInsets.all(0),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

}
