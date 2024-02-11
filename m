Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C125A7A1
	for <phone-devel@vger.kernel.org>; Sun, 11 Feb 2024 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707654367; cv=none; b=j+FZDKPh7mQpDbd43JTXomxEOEPtdG/MilCBawMjd0gx4oZjfEBy21sAATc9WsRHMpKWbd8m3V3SmPXlqCagoFcBQvLQSOjeB5h+VDz3ds+xqrbD5iu83vINgmqFAdoWZsd+jmrIaxpo6GdPM/6owu++9HyLIdcxPlRSmgFHsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707654367; c=relaxed/simple;
	bh=qdn9MQpOhl+Nuf6F+VlkgC1kABe+Kd22BxjdRuYBvcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkMvpkSWw2h3kbxxVzDAYzlk6IcwUZqc9rN/eiu/OjjR2xo230b0INmTZFq1mA0htl2DHtfVXLxM3VwOiuABVfQVDnn6MHn485i9QYlAUNwS4SPg6tc5hd5NqyxvsR7crWPX8XCBfsjA0W/40v6qhS5efyCfeRLXnZHz9NkbkiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ddj5zgkd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ddj5zgkd"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-337d05b8942so1920695f8f.3
        for <phone-devel@vger.kernel.org>; Sun, 11 Feb 2024 04:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707654364; x=1708259164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P70/flCA4j9pIAfUZf5I0mKryf3NlizBRilGJs1ZF6Y=;
        b=Ddj5zgkdTvOWkfyD1e1lxsIenkuQlo7ZjOqIZJu9Q+eK0jKaH7NeYEMIOSQ1DiTQjC
         cFaCD5hHs3aiE3R/3LiSE7a1O/2hQPWF0snNhRsVaRgKfnkmVL+eJEM2/1RhIGmujRJ2
         Kz9iObNLEdK8ESI2ggaJwfobY9SFkPg8pUvEG0wUaObhurxWV0Ngb0e8u3fK5ThnzwYd
         /mXakcJlHl+EdvZ0uUKnz+mvycmRmVsjiIX+C0r/DcB7Bl04d3eznIFkMZT52t02qsY5
         FaqbBmthtAAp6JePgYmuzfxOSN1s+W6gav6mxzcyxJLSYuHII8T02atTbPCb8yyYoK/j
         Yq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707654364; x=1708259164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P70/flCA4j9pIAfUZf5I0mKryf3NlizBRilGJs1ZF6Y=;
        b=c/M/Ck1CeZP7Jz4wi/fjdk+7UDCu3vM1uDgsNqHlz6quKONrkQkeKOII1u4NDetczS
         DscAvbEIskLH3jBy434D5dKLU90JNtYPK7Ry0D6BoQfouiindV37UAtQEcWiaFfy6RNK
         2Y+xzV6iKmiBRoyqCcRL2hdLfWi0ctUgLRUhDkIp2ZxTxhQ6p1niU7Z72X2LoLe8YVzB
         STJmjyEqpuEDvdltL4GG9L2Le0nfzhhU0tu3bS0c7dd8Z/VaGbYILMfSLSRjXQ44PxBJ
         Ou+7jliFx1JC06gX9X1NJbOnHVXTSSV4YSm5AogbHBBVzRbTyozK0nicTswcwqdDrhG7
         WStA==
X-Gm-Message-State: AOJu0YxqvlHQ8DD0Fwtdxy3Q9qnTJtbqafuGHY2YiKU1kmxXRn/gOqsG
	7AheR5tiDXrH7Tg/mRkO8QU3uhyM2hmHMlwenHWTMI8X0UR9QRSutCV0JBBeTXPKpWi94BU9rbM
	E
X-Google-Smtp-Source: AGHT+IGmAw/ckiNAHqUe4mlELga9sHgYOJg5qIAtPJP3hgW+Uj+1/zi9VZULFhY6+/ZVeVUWi/w+jA==
X-Received: by 2002:a05:600c:198d:b0:410:72e0:d391 with SMTP id t13-20020a05600c198d00b0041072e0d391mr3959420wmq.6.1707654364049;
        Sun, 11 Feb 2024 04:26:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRuiM6CsHuEG3tqu4xUTvGAsbvinkhjs3ySLWAbwd6jM43+sWlTY9iOAypKLkMmtc+0Hw3qwXYlI9zA9OL8VIZLQBZvTgyNG0Gzx79spoEUi71vszNVT+ZHmL5D2oE7Gvm8q9iHN4gSQyY79922IEURJFTXL7EodqOs67U/nI63vMVnvonQdE3MtKxFi+LEsP8zpQNg1GXOkiOPNc3zVLky3Fj8hvQ5XbpkgCmPTG2hWg1vUyPzTj7CR1SI15n2m0MAOwnu3pwQH6UUFxwiwBWva7PYMUUvZ4x+Nh3RQAkuo8qyRW/axStfbHJU2qFIU7V4uyvBuEgqPRIxJppBtCQ6BWYY0OZxIhj36Z747zTDAsptj0wFnqFYyQMt5Oljom5pseS7tC2Gr/IAWPpDrE1kIbflB67dRJMJZU=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c204f00b0041044e130bfsm5650185wmg.33.2024.02.11.04.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 04:26:03 -0800 (PST)
Message-ID: <cfd81e2f-886f-4e86-ac88-f6a62a8de324@linaro.org>
Date: Sun, 11 Feb 2024 13:26:01 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: qcom: qcom,saw2: add msm8226 l2
 compatible
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240210-msm8226-cpu-v2-0-5d9cb4c35204@z3ntu.xyz>
 <20240210-msm8226-cpu-v2-1-5d9cb4c35204@z3ntu.xyz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240210-msm8226-cpu-v2-1-5d9cb4c35204@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2024 17:28, Luca Weiss wrote:
> Add the compatible for the SAW2 for L2 cache found on MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

