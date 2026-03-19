Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D5377EC6
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927003; cv=none; b=t1DBDch8YYyHarJkw+iyyzMIIYpiC+WCqkoA8AZbidGYqqwjUX8ZijMadHYDtG7PcffnPID130e8zXIXgnndG+EdeEy1x4ylGyD7wyCRrc6MjO52zx3AK5OY9B/RiC7kM9dwJQT/FHRaZmlVigyc1ZsO5nBt+oftjQhbohyTPZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927003; c=relaxed/simple;
	bh=ncx0G9KktBPLHIhyw+YjWyFz4qKn+uPH0Uh5irzi8U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRvwj2rdHZPs7p06HF/opPjdbbb1rBn4hwABpDsx9pDD+VLugkouNUbcUmLU23XNF9L03a6xNJ46Evg9Nrw1PYT5rvCxeG85+CMvvnX10gFOjLOmWAn7wuvZ5aBl/W9EdteiNs+OhJb73OC4CfFbKjJfwpJ+9OfHG6YXqR8Zmew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRXwXbt9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRXwXbt9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38be58eb01dso1158101fa.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773927001; x=1774531801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USMz5MsHqxDaHUDz4ZLBPX/cfdLXEt4o+4zZ81T5/Dw=;
        b=NRXwXbt9QXF5ymZXpjwF6QjFjXBg5V+2edCvEFLnDJuvph+Auc3lCt7ooCAnp5vh51
         eoOktc1KjbeViRHgF07peiAmnPlfTebqPra33mTef25ejzmKYfcywztFM6pzWv2yYsTc
         XiwDbJJPERadIsOEbkJ+Ml75izAH9Jq0pefI1T86uALVuMwSliul4IE5sf/xSBQMbOyj
         JeKUm1StzCruEk+he3s7MbkyIlAS+LFCwo5egSYeWcU9/GiFrtgxCyiOBV+TKMWoNN8z
         sZANz43vWVgawe1rzDIZ4QH7tq9TZsFgtIWcBVsYMSx6gBMq9blH5BhzgbOL8Yrcz5eo
         WULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773927001; x=1774531801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USMz5MsHqxDaHUDz4ZLBPX/cfdLXEt4o+4zZ81T5/Dw=;
        b=KWJgBpPdOBUQCQw0z+pKeEiV+eIboN1dNDQfAb89ST7q0e0bWBmCeiSksifshAdK7r
         zpPLbUJrKYhmjMrp1CSsEdUfZjs0Ptb7h4ReqIMXnhR5DCfqiMJbRmLdzRWHaZSXc/9p
         UTiDzXLA/UniWDi8iqmomAIQCMG+hsAZLJfpe1vt58ZLJio9UOVG978fhCi9PerhzrN3
         QQtKV5uSHsxLoLb9G+x4c+gEYpCiZ03YWBbNgg7Sk7OOfWNXadQTtrn30/VxHg2yNcXU
         0iiFVbueV+AKivlyU5yJbt/U9GbSUsdhTelGETt1DIAtFBKY7Yd6W7gNh8ASNzpRek4S
         gCGg==
X-Forwarded-Encrypted: i=1; AJvYcCUorvOgRlXZjDc0DMuuLFOnEgArTOoWB0qBSXwQPGGx5pqwBDIkJgm6rQj1ygjzAM11dm2CgeuiUdAiZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0pPgZav7PLw1Xb8oq/LhgodRhPoiz5MZo06hk+zMWSU5ZmJU
	f0T4OYnTiGJkBfBZRFA6Csogk0z8dW+uQkH0mEQyc5vv+C4BRJTPYL9ZDU6iPnczoBo=
X-Gm-Gg: ATEYQzx94kAPX0uEL24BXREk0rgVFsm9ZpKLmbBeHm6nHgwq2w4jGmQO0JMqTYoM97Z
	DUE9SJM9AfUZaiyOpfG7V0y1i6XXdI908KMJcvxfucNe3w4S0JMTamG+a/F1ef0rHJq9VXIDSYm
	wiFIxyJpoHRc/b8ZLE5aiYdi32tg2zorGZeAdkp5Ufpo8m9oSrM5ryd00CxLjs4a8ECMPNwTRe1
	QwhO1cLscvBhsbCs2NLQCJoQelBPe/fHsdP2iuJ47gn/wpUCctO8t/bzfQae1Vqg7zTPhpIAHQD
	/PkLiBdwq3XHCuK+VMmCqDgK3vIGZiHCYqHQd1tnpR/nD36kgDv4V/wsCvr0DRsAo4hInFsKtaT
	kXGNqI8Q5JA+wVNcGgr8Ky0uz6ooq+PtaIQ3DTvJoYr0PDdVU/nywLDSK+sO0+uMKLewahWHlhT
	jr5yBTLmtMPtNxm0xTONn0a3Rb6rOFsnT4qjTZFElWcrd0ErIKEiQR1CEUfGkt4FriXwlREELhM
	7sfbu7xczQwR8Ri
X-Received: by 2002:a05:651c:19a6:b0:38a:f5a6:9190 with SMTP id 38308e7fff4ca-38bd586daeemr13196791fa.4.1773927000489;
        Thu, 19 Mar 2026 06:30:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54ba2afsm12098711fa.28.2026.03.19.06.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:29:59 -0700 (PDT)
Message-ID: <2ad1a60e-43a8-4d89-a04c-b3e3c3afdc42@linaro.org>
Date: Thu, 19 Mar 2026 15:29:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260319-fp5-s5kjn1-v2-0-6840da94c574@fairphone.com>
 <20260319-fp5-s5kjn1-v2-2-6840da94c574@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260319-fp5-s5kjn1-v2-2-6840da94c574@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca!

On 3/19/26 10:12, Luca Weiss wrote:
> Add and configure the necessary nodes to enable the front camera
> (Samsung S5KJN1), connected to CSIPHY 3.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 ++++
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 47 +++++++++++++++++++++-
>   2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 343da1b18095..6cbf6ba5fbc0 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5774,6 +5774,13 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 175>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio67";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci0_default: cci0-default-state {
>   				pins = "gpio69", "gpio70";
>   				function = "cci_i2c";
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index c9c24c36ba7e..aaba40478891 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -626,6 +627,24 @@ vreg_bob: bob {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c>;
> +	vdda-pll-supply = <&vreg_l6b>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@3 {
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;

Please remove this notorious and kind of senseless under the CAMSS context
'clock-lanes' property, unfortunately it gets copied over a lot...

> +				data-lanes = <0 1 2 3>;
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				remote-endpoint = <&camera_s5kjn1_ep>;
> +			};
> +		};
> +	};
> +};
> +
>   &cci0 {
>   	status = "okay";
>   };
> @@ -666,7 +685,33 @@ &cci1 {
>   };
>   
>   &cci1_i2c1 {
> -	/* S5KJN1SQ03 @ 10 */
> +	camera@10 {
> +		compatible = "samsung,s5kjn1";
> +		reg = <0x10>;
> +
> +		vddio-supply = <&vreg_l6p>;
> +		vddd-supply = <&vreg_l2p>;
> +		vdda-supply = <&vreg_l3p>;

The list of supplies could be beautified by applying the alphanumerical sorting.

> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk3_default>;
> +		pinctrl-names = "default";
> +
> +		orientation = <0>; /* Front facing */
> +		rotation = <270>;
> +
> +		port {
> +			camera_s5kjn1_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <700000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
>   
>   	eeprom@51 {
>   		compatible = "giantec,gt24p128f", "atmel,24c128";
> 

Nice to see that the sensor driver works for you!

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
