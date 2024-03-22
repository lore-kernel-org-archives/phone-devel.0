Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74F63D977
	for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711105132; cv=none; b=htiF+ISHHNNTfLqJyBUa6X04dr0M5nB3Om2ENV3t8Fd1yCklkotUMq3RLwfhukEXM6MrTu8Y05AC4+ZCBNFpTrA1QbV1Lzj5QXMPzfelb49n0uEFmWK+cYRuxk5rAbZ3amACzQA6T3lqUUd4r9Af30DxxSD36/So8OlqjLnrG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711105132; c=relaxed/simple;
	bh=E+QRJbbDXgOnG+F7y9VJSSIz2tXSZacnuTn39fmlItM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+62my8cQKc8sSWYV5KMnbos1w6aMY+6XEBL9kNsQInPqj3zk0LYtkxYf6shAuItmeSkkVapHvZ4W6w3e43xu+rGl9mu47jpJiUFOBiqTG7k9MMWI3McYQ15qAylqH/kyvgFYfA42izNbX010K+5SOuniFTgrL30jDb1E+wWns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCppqF3l; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCppqF3l"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513d212f818so2348665e87.2
        for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711105127; x=1711709927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5J6hKaN1QOoxxXz1T+5CFRE6tdsrp4JJET9C/glDPY0=;
        b=YCppqF3ltq357pitHV0u324fMPt7ZhDR35D83/zE5U3Wl9X2jnbj0mhlvtGjjZ8+s1
         PzLPo44lDvNvoZqKcwBcZq7KyIaNiGe5x1NwIJ5B2WxXDZmXGWYAj75orbj+5nmNOYqE
         YMgRNSYokBJzrWSN3LC2CTHL94q2gG0sKeLKCX4U6FHBB+tY3XwIR5DSXRuIdm1h+HuC
         ccWVxyMpnejRioSQeevDD8fzYWFt4eolAgT5Ge61jJyoutsRZuZ44s85Qgu/qKTavyD7
         UkelL3CfTweWXlGwOooztCvGFz/dZw/225V4zMjSAjPjqCt1qaAEOIq4pS0Vc+k5aA+J
         Ib1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711105127; x=1711709927;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5J6hKaN1QOoxxXz1T+5CFRE6tdsrp4JJET9C/glDPY0=;
        b=KfomNtHdwO3OlctMq3D9nqwHM4u1Z8o6ecJkGPVthrqJuoJpAR5IrMZRxAHPtFJPoQ
         QapuafGmbWkOa4pYkzYmEy73HCbEj8XuCA0OgEt3srr0kkaABYVGGmtyVyYns6GJy9eY
         7BwsOv+gWBJgXA1ZXM655aDG24eqQ7l+0ZiHXW8q8xbTAO7fFJGo781JJa5Iv0DNy1SE
         dNjkMwr5u8e+UeBcS8JsmpZ8XAwKQxwGrjcKWrljZk9JvPhm/KUHjL66KsZdVDM2ED0J
         cuuTHTkf10RSzkb5dByoHjeMcR2poWHujO/bELQ/j0OusbkAV8XOIF0MG6WunNrdNHA2
         3CAw==
X-Forwarded-Encrypted: i=1; AJvYcCVArA6iws/nHxY1dNXZWanVPfLsuQXYgr30vZ5ffP20G08Wng7BIVVd83O9W8nlyl+C26PxdpApxe7TOXPiPuUA5RNh8TjR/ZDOf84=
X-Gm-Message-State: AOJu0Yyln9ixOcpJ8v42QK459n9y7OlRtHnMTx+lbtfvFC25Zev3n/wm
	+Vb3Ohy5apyKMjFCcp1FF/w1+6/7G18PZcPqAWi+zYOBDMv2lxk9DdL5E6GeEK8=
X-Google-Smtp-Source: AGHT+IGM3Kt2gQLYglQ72vKDBZNdU1ywAm2J5Zc15UKLNfhAkHKQE43HaGykC/84SoWzGvuuRFn+7A==
X-Received: by 2002:a19:4353:0:b0:512:be8e:79da with SMTP id m19-20020a194353000000b00512be8e79damr1302079lfj.8.1711105126886;
        Fri, 22 Mar 2024 03:58:46 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id w15-20020a05600c474f00b00414037f27a9sm2740627wmo.31.2024.03.22.03.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:58:46 -0700 (PDT)
Message-ID: <f8e4a364-a1b4-4b0e-905d-d3dde3557fe2@linaro.org>
Date: Fri, 22 Mar 2024 10:58:45 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 role switching
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
 <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-5-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> Configure the Type-C and VBUS regulator on PM7250B and wire it up to the
> USB PHY, so that USB role and orientation switching works.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> With this patch I'm not quite sure if the 'ports' are connected
> correctly, though functionally everything appears to work fine.
> 
> On some other SoCs port@1 in qmpphy and a second port in dwc3 are
> connected together also - one port of USB 2.0 HS, one for USB 3.0 SS.
> 
> Here I'm following sm8250's solution. Also checking the binding doc
> doesn't reveal anything useful.

I don't see a redriver on your schematics which appears to be the only 
big difference to the qrb5165 reference.

https://www.fairphone.com/wp-content/uploads/2022/09/FP4_Information-for-repairers-and-recyclers.pdf


> ---
>   arch/arm64/boot/dts/qcom/sm6350.dtsi              | 25 ++++++++++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 57 ++++++++++++++++++++++-
>   2 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 24bcec3366ef..b267500467f0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1686,6 +1686,27 @@ usb_1_qmpphy: phy@88e8000 {
>   			#phy-cells = <1>;
>   
>   			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_qmpphy_out: endpoint {};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_1_qmpphy_dp_in: endpoint {};
> +				};
> +			};
>   		};
>   
>   		dc_noc: interconnect@9160000 {
> @@ -1861,6 +1882,10 @@ usb_1_dwc3: usb@a600000 {
>   				snps,hird-threshold = /bits/ 8 <0x10>;
>   				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
> +
> +				port {
> +					usb_1_role_switch_out: endpoint {};
> +				};
>   			};
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index bc67e8c1fe4d..104f23ec322d 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -19,6 +19,7 @@
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>   #include "sm7225.dtsi"
>   #include "pm6150l.dtsi"
>   #include "pm6350.dtsi"
> @@ -543,6 +544,50 @@ conn-therm@1 {
>   	};
>   };
>   
> +&pm7250b_typec {
> +	vdd-pdphy-supply = <&vreg_l3a>;
> +
> +	status = "okay";
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +
> +		power-role = "source";
> +		data-role = "dual";
> +		self-powered;
> +
> +		source-pdos = <PDO_FIXED(5000, 1500,
> +					 PDO_FIXED_DUAL_ROLE |
> +					 PDO_FIXED_USB_COMM |
> +					 PDO_FIXED_DATA_SWAP)>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				pm7250b_role_switch_in: endpoint {
> +					remote-endpoint = <&usb_1_role_switch_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				pm7250b_typec_mux_in: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pm7250b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1500000>;
> +	status = "okay";
> +};
> +
>   &pmk8350_rtc {
>   	status = "okay";
>   };
> @@ -726,7 +771,12 @@ &usb_1 {
>   
>   &usb_1_dwc3 {
>   	maximum-speed = "super-speed";
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_role_switch_out {
> +	remote-endpoint = <&pm7250b_role_switch_in>;
>   };
>   
>   &usb_1_hsphy {
> @@ -740,10 +790,15 @@ &usb_1_hsphy {
>   &usb_1_qmpphy {
>   	vdda-phy-supply = <&vreg_l22a>;
>   	vdda-pll-supply = <&vreg_l16a>;
> +	orientation-switch;
>   
>   	status = "okay";
>   };
>   
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pm7250b_typec_mux_in>;
> +};
> +
>   &wifi {
>   	vdd-0.8-cx-mx-supply = <&vreg_l4a>;
>   	vdd-1.8-xo-supply = <&vreg_l7a>;
> 

This looks consistent with 8250

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
