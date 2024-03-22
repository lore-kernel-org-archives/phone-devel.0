Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695004C79
	for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103075; cv=none; b=YZZfTNYSYcUUQOHixengCxYhn74FW9yFoysPlfJRUeiJdFrDjut781tC9P9e2o4QmodJCKQWfLqzi0UT0wFZPYuUVIS6zH8w5Z6ULFlPcxS4H2Ce6pUw5P3IEumio3a8egH8L7yAisIdn6OqDD30BanZeTqvgcW5He0TpKCF9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103075; c=relaxed/simple;
	bh=LdraHFKkYxsoFAQsnK5xaReIIh1bnT+H6G/1KbOLhyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhJ3+4oZUq3YJD0iTuf895fpDqEDNFLsE3Cdu1SV75FwfBjq8hBtAXTkZH5E1t5OLEKUjvFYkPStqyR2AE2TMdPGsJH434FfeFCZBKmZjT98YyIHD++efKEfYwvC+i8VfhDD5kNPrYxaljDo8RdZXBky71mmUuJJ7AC9SKGq320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lg/BHtze; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg/BHtze"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512b3b04995so1279906e87.3
        for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103071; x=1711707871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbU84KSOwnLxXUjDH60L4m12voWSvWaFGV7NZhED0mY=;
        b=lg/BHtzeA/KHPPcljScts4CsixnZl76gpq9JZj5ZkU7bzJMm48s/26GhY+Pvxjsv9P
         1tnYDHbd61gxMDnNQI6t32TRhzk8CquEZLI2gN1UKMAfqISTcVavL/8Xx7ro88AuXa5e
         TmlThLO2fHWouenruEgoqBR1DIAAYlFwpM55wIWw8DD7YI2xXD1E0Uy9dSslNU82WeFR
         yjEU00t7wecaQ0057KzvvJcawdRbHH6oDtADJxnhBoNrGk6ib7jwuaoZPExJF3+Z+Un8
         DfvESBDX6UjwDtK/0wnb5SNjFl91CyxxH4WxcYBhhaP3d90hSYHsSPTLqVVMfv1KCxtk
         j8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103071; x=1711707871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbU84KSOwnLxXUjDH60L4m12voWSvWaFGV7NZhED0mY=;
        b=HUXRtlrUqeOtZMG0yYqOGi7EadIdZ+LeofjTtVD11EvcLVkmMlGTKtFGDFcOYtGZGD
         y/eoGTMvqSe72yZzU23W2rcYmTCeCg54lL/vksIcJzlMLd746EIUH1oGMkvekiDXu3+Z
         PhLu9ToJPk8vEMp0CKRBoWitaLERQMyVoGSRwZB+AbOR+2QH9kWcfmexoCo7e66V80sy
         ICxIQ1Jw9KmrQVk0S4+RRxiuIeFngc5ZRzqNXfJcJ/PL1U7R+R7VsmUCn+vQqb2bmfAZ
         0NhyVNSoY+eFdIDCIe1Y83g/cvarP9MFWPXeZwIENjGVSKGJ7IZtklJbcHVqq0kQtFAs
         OlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOhy5B/uRJDmyxLqBXD65TaZ6eZoboYJwqz1HH+6sL0YK4sTtp5UNEU3JQskq0JjTfzjf4gQZxrF8ZQAe+kmSUVkc8oYV0B3Cgnhk=
X-Gm-Message-State: AOJu0YxoV52hdIHe0k47d1WqkcMdSRTswV3FPhP91tf++VVEXci5BX9y
	HLtpTUDqlcmCF3+AAtQMUekoXV7tGovBkpR+sJNISfcaGyjlhuik6YhtgHJDmL4=
X-Google-Smtp-Source: AGHT+IEIVG8bh+X4Ju2UJR3vnr0XfmzR3ZjVuy71x8WHH0+8JMVoyLDvz2/SChZ+zaLCYvb5BdxISA==
X-Received: by 2002:ac2:44cf:0:b0:513:eba9:46c8 with SMTP id d15-20020ac244cf000000b00513eba946c8mr1213314lfm.35.1711103071691;
        Fri, 22 Mar 2024 03:24:31 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b0041468961233sm8440421wmq.35.2024.03.22.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:24:31 -0700 (PDT)
Message-ID: <f5dafde0-03d6-4693-b263-adf19984fa64@linaro.org>
Date: Fri, 22 Mar 2024 10:24:30 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: regulator: qcom,usb-vbus-regulator: Add
 PM7250B compatible
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
 <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> The VBUS register block on the PM6150 PMIC shares the design with the
> PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index 33ae1f786802..fcefc722ee2a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -26,6 +26,7 @@ properties:
>             - enum:
>                 - qcom,pm4125-vbus-reg
>                 - qcom,pm6150-vbus-reg
> +              - qcom,pm7250b-vbus-reg
>                 - qcom,pmi632-vbus-reg
>             - const: qcom,pm8150b-vbus-reg
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
