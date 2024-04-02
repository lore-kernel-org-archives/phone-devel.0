Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1625F870
	for <phone-devel@vger.kernel.org>; Tue,  2 Apr 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053624; cv=none; b=VLXyVlQ0Ps69dwAQIavxLn57JrlO1WwQ0jfffM2FdYLrOv4KPegwCKHDkHl6kxKMrFBuslb/716ex2ySS5m4fWl0NbzsdcOHxwqVdVCZVDUlKAvK8oayNhoS58EKbRCSkd4TskZtR7Ut2omV0K5ihk2AwoGkXj+tzGBfKs9IF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053624; c=relaxed/simple;
	bh=2lcDfu4xW0bculdHZpac3g3St6ttxpCAMyiLiPfvz8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7JKY5nZbN9oHr7HHj1+XcAFwuIYjmczG+2eIb70nid9pYPUXBn0eyVqsGU37g2kJA/ME6562vYJbuEza18TpzhmAHtdChgalwFU3+KjudwCetRopCN3pJtPpXvs/OOgB8MC+Zgo8d0xKl4Os7k+g8dzNx4RrnZO3pBjfJOV0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVsEhz5X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVsEhz5X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41551639550so21760245e9.2
        for <phone-devel@vger.kernel.org>; Tue, 02 Apr 2024 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712053620; x=1712658420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOBZ55ixLA4dTfJhYr54OdUB1MaemoFEDKwq8GCXVLI=;
        b=uVsEhz5XacY3RYea9PvmYx/oTz3KUTCz8u7FvA7LXnsaRHtGxCUsLSYCitbHlM9EHp
         gSgAuZ5m1UG1TMdaS6XUjIE4gcBIp3aqdIu5w2qACLTn59b4V8rcU/NzSzPp448KOAsh
         UOjVNOPSUc08797K7jucOhxsboprQzqzv1SU3tTgklixn2Hj05ajsLP+whD2jArOuBOE
         GIyTsMkeGC1h4bvMm/EYcWMc0m+m7IUEwEfFOo7GK3aYy/9WDzFnJlUPrs1RCKy1gCSC
         Zsg5qL9RJBK+Q7STrxNh64Cz40pfnSAIKTdLKUccO1N/ioMLtQ9HRkD8MZeU31XQMPCp
         57iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712053620; x=1712658420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOBZ55ixLA4dTfJhYr54OdUB1MaemoFEDKwq8GCXVLI=;
        b=d+bBbWs9SAgC0WU+fv5flQ8Rdq5uvIGwG/FKUMBu2mYLBBX3GuNBA1sbvsDZD3eFdH
         i5+garm67o2nVJANaOyy04pv0p1P3wtqohcaywSXAnWzaFQAAFIxGe5Yg/66nXzwM7qi
         h+oRg/ghu9LReDlbdEEEuzKWnLLFS2G/Vj2V02xJHY3Ry7bWxOjZpsvJtqeKz5Nsk5gn
         LNWqMcBJfFGzl6qPaH9Zy7EPnZXj0LA5puca6KA5OX3cAGc8VLu8Zg/cPcdaW77zXykw
         ur18RhecwiJ/zpQNko4BJeY2shPdQZDNo2dRTIQG6CgzqvsluyGVaxVfooN7IsNIzSs0
         liQw==
X-Gm-Message-State: AOJu0Ywtk+puvMe0YQtCItdhhKnQvL5QkfzbxDMWO95nrz2GXCRkUz7c
	xraoE6JQlfSjEtIr935tL2Csg1+Yt1ZFCeCsuqgpubynQlG/GykD3p25dcg+370=
X-Google-Smtp-Source: AGHT+IFfOeEwE73Mr8ZZizbJEWLfCXdGOlKeaDZvpcz6sDnmAoZebGN8m3vt0uWalY87R2DUD/pxoA==
X-Received: by 2002:a05:600c:3549:b0:414:113b:36a6 with SMTP id i9-20020a05600c354900b00414113b36a6mr9267396wmq.25.1712053620231;
        Tue, 02 Apr 2024 03:27:00 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v28-20020a5d591c000000b00341d4722a9asm13734949wrd.21.2024.04.02.03.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 03:26:59 -0700 (PDT)
Message-ID: <c4b34be0-ac1a-4816-8ad9-7091b2834762@linaro.org>
Date: Tue, 2 Apr 2024 11:26:58 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8976: Add WCNSS node
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240401172153.9231-1-a39.skl@gmail.com>
 <20240401172153.9231-5-a39.skl@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240401172153.9231-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2024 18:21, Adam Skladowski wrote:
> Add node describing wireless connectivity subsystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/msm8976.dtsi | 104 ++++++++++++++++++++++++++
>   1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 77670fce9b8f..41c748c78347 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -771,6 +771,36 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>   				drive-strength = <2>;
>   				bias-disable;
>   			};
> +
> +			wcss_wlan_default: wcss-wlan-default-state  {
> +				wcss-wlan2-pins {
> +					pins = "gpio40";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +
> +				wcss-wlan1-pins {
> +					pins = "gpio41";
> +					function = "wcss_wlan1";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +
> +				wcss-wlan0-pins {
> +					pins = "gpio42";
> +					function = "wcss_wlan0";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +
> +				wcss-wlan-pins {
> +					pins = "gpio43", "gpio44";
> +					function = "wcss_wlan";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +				};
> +			};
>   		};

Doesn't look right

arch/arm64/boot/dts/qcom/msm8916.dtsi
arch/arm64/boot/dts/qcom/msm8939.dtsi

wcss_wlan_default: wcss-wlan-default-state {
	pins = "gpio40", "gpio41", "gpio42", "gpio43", "gpio44";
	function = "wcss_wlan";
	drive-strength = <6>;
	bias-pull-up;
};


>   
>   		gcc: clock-controller@1800000 {
> @@ -1446,6 +1476,80 @@ blsp2_i2c4: i2c@7af8000 {
>   			status = "disabled";
>   		};
>   
> +		wcnss: remoteproc@a204000 {
> +			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
> +			reg = <0x0a204000 0x2000>,
> +			      <0x0a202000 0x1000>,
> +			      <0x0a21b000 0x3000>;
> +			reg-names = "ccu",
> +				    "dxe",
> +				    "pmu";
> +
> +			memory-region = <&wcnss_fw_mem>;

For preference and consistency "wcnss_fw_mem" should be "wcnss_mem"

The ordering of the compatible/reg/interrupt is different to 8916/8939 too.

I'm not sure which is currently the preferred order of declaration but 
for V3 of this series would appreciate if you could find out and add the 
comment to your cover letter.

Otherwise LGTM.

Please CC me on V3.

---
bod
