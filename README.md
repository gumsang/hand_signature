# flutter_signature

필압이 감지 가능한 메모 및 사인 라이브러리 두가지

- syncfusion_flutter_signaturepad
- hand_signature

## 참고사항

- syncfusion_flutter_signaturepad 는 갤럭시 노트 환경에서 너무 느린 반응으로 글씨 쓰기가 힘듭니다.
라이브러리 내부를 보니 gesture_detector_arena를 사용해서 0.3초의 딜레이가 있어서 그런듯.

- hand_signature 는 곡선의 부드러움, 속도에 따른 두께조절을 double 값으로 조절 가능합니다.
갤럭시에서 필기감이 네이티브앱과 비슷하지만 S펜 사용시 시작시에만 얇게 나오고 거의 대부분의 경우 최대 스트로크로 필기됩니다. 손으로 써보면 속도에 따라 다른 두께로 잘 나옵니다.
