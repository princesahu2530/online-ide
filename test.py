import urllib.request as r, json;
req = r.Request(
    'http://localhost:5000/get-output', 
    data=json.dumps({
        'language': 'java', 
        'code': 'import java.util.Scanner; public class Main { public static void main(String[] args) { Scanner sc = new Scanner(System.in); System.out.println("Enter:"); int i = sc.nextInt(); System.out.println(i); } }'
    }).encode(), 
    headers={'Content-Type': 'application/json'}
);
print(r.urlopen(req).read().decode())
