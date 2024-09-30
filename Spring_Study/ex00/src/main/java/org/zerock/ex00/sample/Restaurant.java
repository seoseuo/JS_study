package org.zerock.ex00.sample;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Component;

@Component
@ToString
@RequiredArgsConstructor // 매개변수가 있는 생성자로 들어오겠다.
public class Restaurant {

    private final Chef chef;
}
