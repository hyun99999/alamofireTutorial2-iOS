# alamofireTutorial2-iOS
GET,POST 의 http 통신을 활용한 alamofire 튜토리얼

- GET: JSON 샘플 데이터를 제공하는 사이트를 활용할 것.
  - https://jsonplaceholder.typicode.com/todos/1
- POST: 테스트 사이트를 하나 들어가겠습니다. http upload test server 라고 검색해서 제일 상단에 나오는 사이트 활용할 것.
  - https://ptsv2.com/
- Alamofire 와 SwiftyJSON 을 활용해 통신해보자.
  >- https://github.com/Alamofire/Alamofire
  >- https://github.com/SwiftyJSON/SwiftyJSON

### GET
```swift
AF.request(url).responseJSON { (response) in
  switch response.result {
  case .success(let value):
    print("GET success!")
  case .failure(let err):
    print("err.localizedDescription)
  }
}
```
### POST
```swift
AF.request(url,
          method: .post,
          parameters: param,
          encoding: JSONEncoding.default,
          headers: header)
          .responseJson{ (response) in
  switch response.result{
  case .success:
    print("POST success!")
  case .failure(let err):
    print(err.localizedDescription)
  }
}
```
## 오류1
- nw_protocol_get_quic_image_block_invoke dlopen libquic failed
<img src="https://user-images.githubusercontent.com/69136340/107330308-ba97b100-6af4-11eb-8512-4009451a2461.png" width="500">
- 시뮬레이터 오류에 불과하며 stackoverflow에서는 무시해도 된다고 한다.

## 오류2
- JSON could not be serialized because of error:
The data couldn’t be read because it isn’t in the correct format.
- (responseSerializationFailed)
<img src ="https://user-images.githubusercontent.com/69136340/107330633-2ed25480-6af5-11eb-89db-18e113ed6bad.png" width="500">

- AF.request(request).responseJson 을 AF.request(request).responseString 으로 바꾸어서 해결.
## 완성
- GET
<img src ="https://user-images.githubusercontent.com/69136340/107332902-17e13180-6af8-11eb-8ed7-31a6f6c6e68f.png" width="250">
- POST 
<img src = "https://user-images.githubusercontent.com/69136340/107332709-d9e40d80-6af7-11eb-964e-d80ae4509c22.png" width="500">

### 출처
>- https://gonslab.tistory.com/14
