Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5163FE2D
	for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103570; cv=none; b=UEADirBj86gBjdRdDb9M2Opq93jpeXe4vZE+FacgUKy2avtABMl+rH2WCQFfaCvtEPSFe4LifqElaDFcj9V6/WSRA3J7QS2EuCDSN9/ytnj1vYO5lV1+yXUkAKesJZhXzp3YtKD46ylY/UKaDWYJSzRIMweqg40vlp84P5mvbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103570; c=relaxed/simple;
	bh=IeeeFvZPihvjkO9rkI+cnfWH8mStNkDQXAroPXkgklQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlAMhGGhDMpjxeo1cPV8sdjnPxoUeDdJ+wUxxVccQBPsJW1AbPqiwNVpAr0sNsqW0bm1JI/N+T7vU7+Z+ngklVWJMOmHP6VTk4DJYhwJOZHOyu5IxiRutGOgewALhEI5Y6jLStBtzCbWTVr225koSMV1csw/TLvVT3YJpou8zZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNxkBRAk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNxkBRAk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4147e135f4dso1309765e9.2
        for <phone-devel@vger.kernel.org>; Fri, 22 Mar 2024 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103566; x=1711708366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cLlbtwhTjL1jxvTL4CgsNlJM2USa8MoHtGm1QbNL5M=;
        b=zNxkBRAkF6ZaYFjq9jedqze7FNApSHYuISz3kR1vMgmawlNaBZMvEEE2YfaTY5rYM6
         j+U5mZPWFouQqgS7cHAPyDH7zi34LeOoepuIKXBe5GkW+cgOofyPoRCjFTDBdC1iISuy
         bwjx/Pid3sNlFd/D1Vg7K4y/Yz2QMPAVQIOPQMVxEDH9+xgrkFZ3ex+HWZtEIAfbZ5NQ
         +a7xcb6fyITm1xfvoBhtRZqLMnDdOwkCI+0exqz0xd3uQ1TMF6sEGfpUvdBqOpRIvwT+
         gnuqRy4HFQLsfzFthNncY5fWI94satFJ34wyohvAL/SuI+7DdVT3e7Qr/rUkH3ZysXvQ
         DXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103566; x=1711708366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cLlbtwhTjL1jxvTL4CgsNlJM2USa8MoHtGm1QbNL5M=;
        b=DZOzui5o2JU7xh5csYPUWH3qG7VLWKAAgNrFYkTTcKRIqDP8f03J6HjXeAOQTItbZm
         wlrABo8yRxhZrbYLcKBX3ZyPOGAJ8tc2pxvR/qZwhWq7HId3+3il7fTG4G+PDQiETZM/
         uxc27UrEQoBnuETZqJR+b83sQbe+agalf7ERlN0I0CYLzjKlMTlj3wIM9HAks37ZcW/m
         dR52lr0sM1o619FNj0x7KfW3eCxL6xd3IkZOjn8Ujm/Zwj7t9CVttFjBJcrwx9j2wScp
         /27MXs4TU4+sP7X/aeakS8bdhDib5QzlvLJRifenFcJ1C1UhOd+73sUT15BL4icgRuEy
         IbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR09ozXIy2wJcjrqId7paMgDJMCrM3/qzHB7ZXmdu2PoL4XqT86rvG9l0vZZshJtIqu3N7RUtVWZL7zcmDVbrRWQk1XgdOOwv8Nkk=
X-Gm-Message-State: AOJu0YylkA0E5O4rDH4jxY44VUp4X2kfKamYCfZKrPcgZ+LGzRgeE94+
	1a9pJSY6PYe+KBoLQl5DpbsMNxSxTBLUpCOI/73Tc1p/5URZNd/d+cUfmB0VOqM=
X-Google-Smtp-Source: AGHT+IG2NsJwJn4mQZLhTfufZL9LbdScYyZRHQheGp2Pdz05wMVc2kyw7Og64VHUf6sgmyIEwndVRQ==
X-Received: by 2002:a05:6000:1243:b0:33e:4d34:f40f with SMTP id j3-20020a056000124300b0033e4d34f40fmr1103056wrx.46.1711103566118;
        Fri, 22 Mar 2024 03:32:46 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d60cf000000b0033cf4e47496sm1759496wrt.51.2024.03.22.03.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:32:45 -0700 (PDT)
Message-ID: <a4ff04e9-794b-4afd-920e-a2b2d5bf687e@linaro.org>
Date: Fri, 22 Mar 2024 10:32:45 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: pm7250b: Add a TCPM description
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
 <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-4-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> Type-C port management functionality lives inside of the PMIC block on
> pm7250b.
> 
> The Type-C port management logic controls orientation detection,
> vbus/vconn sense and to send/receive Type-C Power Domain messages.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 39 +++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 91a046b3529c..d9abac052afe 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -51,6 +51,45 @@ pm7250b_vbus: usb-vbus-regulator@1100 {
>   			reg = <0x1100>;
>   		};
>   
> +		pm7250b_typec: typec@1500 {
> +			compatible = "qcom,pm7250b-typec", "qcom,pm8150b-typec";
> +			reg = <0x1500>,
> +			      <0x1700>;
> +			interrupts = <PM7250B_SID 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +			vdd-vbus-supply = <&pm7250b_vbus>;
> +		};
> +
>   		pm7250b_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
