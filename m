Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D6A4C92
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760926; cv=none; b=KzuP+RHiV0qWUYDZS0qjg3j7Nh1Tzy/fku0TJoImy8IODhJjapFUCXfPTvsuHVlVBtJG2OqzO24e3xAzM7t2D+9vbsUlrTZp3D35uYV3Rng/i7txdrldflxBxvNNfHRi/zwAdTigDZ3lBXNQyfCPLjuF0m3gd/uW0Vh5tK1Sx7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760926; c=relaxed/simple;
	bh=G+lJppHttUXeF/evLjii3rbMw6q86usTSMy6wwMLUz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1NreluAV7d5qhMd1gLEwxRRzy+jTAXzMrE5bkYNm0M2Mro7fyfrhmiBlDsBWnI/HZWi0kbWt5cmGyHQTyDZ0FvYCzhLurxS6B+SzvLT9qj5KpRcErdPWB+mqhVamga71ou0GLoG2ZDwSk17eZV4AWsN0AvACZ0rV4UINT4kCig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRIG66WO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRIG66WO"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-382fc524cf3so1409741fa.0
        for <phone-devel@vger.kernel.org>; Tue, 06 Jan 2026 20:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760923; x=1768365723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkfCVyd53/ucNy9M3nl2k9rQ6JcMrMCnqE4mBt0wduk=;
        b=cRIG66WOs+/PB1MILgK+JM+FyyIqfnRFld+voZ2EWjUV28RABeJpWd8oA/Cs3R91bo
         r5FJTbfUYoea97SQsYQ+oWPH7FkWCAsBW7oFDID6QlmzRxMGFZTZkQFSqk56OxJkSq+f
         ob3mF+EWopRyaGnV8G0WeiWZn2I5cr1DtUgmPGdXVVi9KvvcbBkzoyUMk5KQH6lOCf4L
         Y8Mj02u0rY/jzzuwyRbrteo2myffJxrghiXUbBjkuIlicZmE1zw9DQUnFQQfUD10JURH
         bvBQe2Kyl4F4XI/3y39C0O+c4B92McD0NtD34QJr1GYVFRD4LHga3IDujmV47Eeh1hOp
         ByQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760923; x=1768365723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkfCVyd53/ucNy9M3nl2k9rQ6JcMrMCnqE4mBt0wduk=;
        b=Qw6lHr/OP/JwZNNM18+M8jPd1p1SkldmxdVGXkqlj0xfQ1GKW6d64JGkPqg2HI6wgA
         tJ6sRsOkUoy2zDmO0wnb2Jyt0wutMGe7IFKkUt9rSHQRPYqC6V+7EWjR0K+iZ5wCfXCv
         W3lqjcvZmWPAbBh7X2ZdZz3fvR4CdKkTyx90xZsMc3AWTHU1WWhQyNgmTHw7eplgcgN2
         f2AMrQbWaEVNpY5mWCjupq8g8Ij5a2YxGBMWPTFZMMH9bMDiuZWMT7uv5MRW7eOZ0kgn
         ekVteqyXsNGd6mgEZzlnLEPo5llXHmL8p3fNSq8s4CnQNjBvoLQpXR/wo67HD9MPy5Tx
         +PHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMqU2Z/Wv3F4q1bbbaj+ABU5Be9v8j9PoS4aovSpA/YXUgI3P93It4se8KsgRnpx3DTlfEzrjWsrQGQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymqw0JFp2e12AbM+Z3lrkRiZD6FcaqofRSYg1Q7/SkFiy6Jyxj
	uYDVWQGfH5OD7+8I79ngqQQucaH3NDkmjYPORT0+PYyCprca6rji5/QCkWLjg6lIcJo=
X-Gm-Gg: AY/fxX6T53Bfi2KxUwzJa86+rBZiz6csG7IAf9YOXEvZ0TirEEn4KJhH069HoF3O2st
	ao5T8tqgFXJLl4mzZaqY1MsCopKPfMsG84i6u3a4trx3LEazYeprOnWkok+xMQF0LcDyP3MNMLw
	H/eFLR18cIDrgQIy3NtzVsz0Me1kEJ2j0NVROyvnli3qcrwqAiSisWriATH0G/f2A+Sr+kF+Lek
	FFrjPrKpsQ+dBG5zwBWjUWckSSLN1cJ75wAsJQ9HzBPAo+7R4u/wGph++6JC34j40AAqOxxYf1T
	yTgMaqfwG8lUOj1UYnwQYknJsigUOcSJynKfrY33k0Ff5sdU7UsvCyVCIfc6dTdeh4mNL+KiKfr
	qGeLTzpzb9EDGm1vC6UPVF3yRV3/YZQzRjy9EXcT5avIHTVVs0YC2+7Ix+lPNdUFceaDLDvDhYA
	dxC8kfhry13Uz4D6WdkA5CFTSk3Vj2LC4tI9evDhtM59/amlKXynIgXEpWSdCCdT437Q==
X-Google-Smtp-Source: AGHT+IFuxyEOJSsVILPAwetJUmHD+jF6p5U6vU9/JjiGrP44p16/Cr5nFrGos/EVs9geMZQAqG0x9Q==
X-Received: by 2002:a2e:b8c8:0:b0:37f:c5ca:7428 with SMTP id 38308e7fff4ca-382ff5ae8a2mr1609001fa.0.1767760922695;
        Tue, 06 Jan 2026 20:42:02 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8f146bsm8786921fa.36.2026.01.06.20.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:42:01 -0800 (PST)
Message-ID: <e5c52f0c-a5bb-49d9-a673-9dbaffe3e689@linaro.org>
Date: Wed, 7 Jan 2026 06:41:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:30, Richard Acayan wrote:
> The IMX355 camera sensor is a camera sensor that can be found as the
> front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> 3a, and Pixel 3a XL. It already has a driver, but needs support for
> device tree. Document the IMX355 to support defining it in device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/i2c/sony,imx355.yaml       | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> new file mode 100644
> index 000000000000..33d253ca0e4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX355 Sensor
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
> +  camera in smartphones.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx355
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +  dovdd-supply:
> +    description: Interface power supply.
> +
> +  reset-gpios:
> +    description: Reset GPIO (active low).
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx355";
> +            reg = <0x1a>;
> +
> +            clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +            assigned-clock-rates = <24000000>;
> +
> +            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&cam_front_ldo>;
> +            dvdd-supply = <&cam_front_ldo>;
> +            dovdd-supply = <&cam_vio_ldo>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam_front_default>;
> +
> +            rotation = <270>;
> +            orientation = <0>;
> +
> +            port {
> +                cam_front_endpoint: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <360000000>;
> +                    remote-endpoint = <&camss_endpoint1>;
> +                };
> +            };
> +        };
> +    };

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
