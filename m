Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52212E75
	for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706226603; cv=none; b=U4cvzf01IwhxTa89IP0YZgbFKML6giBL3WBeHAUrlwoYkjOSWC3O2Lb/YIZc5jVe4vdgrTMq5Glp8Tg5wx9gf+0ZhA+dbQN17tE/z4q3r9ZYhlISWLdWzlOeOaXUKgcmGMsNwGRN+pTZd3EU5hMEMgp6k8tpG3oqEkuQcqBY00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706226603; c=relaxed/simple;
	bh=zuALxgKBNdz+cz2IZmkcUCnj/b8C1xkO0iZjdzgUinY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozYxMD7apD4Ug8Ucb/aXWIM5ot7iWByiQ2hBG1jZsqhXxHVgtzWEa4Ty6ymJKNQLbGPzDPIRwWrfdymTxw1IZdHKkpMc1a9/vd5dn/yZ5kODIxuYuaohch+5jPAfPzhrzAIMLnJresUMgO7itdGzIyg1cQRFY+wk35XEnljbWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIsiumNM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIsiumNM"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51025cafb51so133925e87.2
        for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 15:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706226598; x=1706831398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84suYuoX3RAYz2xiQa2wUmKN0Xu6H16i6mQrUX9bctU=;
        b=tIsiumNMfL0iUN8MvtCecFqU5qtshFGq0vlfx7W/OQ1xSpR/SYygjYTngiITZ5I7Vt
         Uokmv0T4uNOACKHf433uGzWy8k49sQB1avUmrJCmEBnadsrc/rmxPiUGJEwZw5d5v2c5
         Zlda83u4cRSXOx14AsXz5V5CZWTVZyziN9WsYV7Abn1Dy4zsoLAqeEgAlz9uFw6TXbu9
         V2OOHv0Hc0d6tcPTjhT3b2isGqBAdd1VZBYVUHjYtw/Tsf9Vq7Y4frJ7lwGBngV79ByW
         nWq97FBai64sQxiA0XMCss7I9sWikDtQmbv6TTMS1ygfjyqyXimtLOAVbgC78YHZhwkl
         Q66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706226598; x=1706831398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84suYuoX3RAYz2xiQa2wUmKN0Xu6H16i6mQrUX9bctU=;
        b=PtEIGeziJEWY39hJIrqCAVtHWraWLcHyj+KpCvpFm/WzvSb2Jw2WEehQFlsNCrRi3q
         OopMmzZERcF0U9WhS1K43DHT3z0wKIKSuD8loX03iKXNkZZdmQxWowmYy/5LS1qLBBpr
         /YdUGO9wAx2hkxCVI8YU2XF9mzRIBYCV3oo+717/hN4yIA9TtDc9yPr98ieZ4OZOWhQx
         UHk3lx0Tl1kOLjF3sM3PBwiUK/OXAgrVzZZchoTLWcVlbriPzyqrfpdryd+k0LtjYyDa
         q3L9v6r47Fujgp2kkiTJ6L+SmBXGGrGxbAElqXutC25IFDlFvvJ8EwWub/6uL4sh2y7l
         geRA==
X-Gm-Message-State: AOJu0YxkwTOHdJAmVjWU8xo00vCvH2cKiKuimUuGlcU5zJlskRF7vNY8
	XEkAFTbzWQ5X5NPgNNdSKMGqq/b7GKyt9D0GF2DDTi7p3T5sSUJqn2piqnrPOsMS5YSPQGSXUZA
	MqBI=
X-Google-Smtp-Source: AGHT+IGlZCfDWZKPWMU55TCy+VJ2zTqmY3SNUSR/poAl1Jl1Szh+xGqeR9Bx7VhdXjmN9sTmz8nYAg==
X-Received: by 2002:a05:6512:70:b0:50e:74e2:af58 with SMTP id i16-20020a056512007000b0050e74e2af58mr288823lfo.52.1706226598453;
        Thu, 25 Jan 2024 15:49:58 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a21-20020a195f55000000b005100af37fbcsm10614lfj.166.2024.01.25.15.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 15:49:57 -0800 (PST)
Message-ID: <a75d8b2f-a55a-4087-b039-60769678a480@linaro.org>
Date: Fri, 26 Jan 2024 00:49:55 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: msm8953: Add GPU IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240125-msm8953-gpu-v1-0-f6493a5951f3@z3ntu.xyz>
 <20240125-msm8953-gpu-v1-1-f6493a5951f3@z3ntu.xyz>
 <d576e655-5d00-44ff-9405-0fceaa2d3935@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d576e655-5d00-44ff-9405-0fceaa2d3935@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/25/24 23:24, Dmitry Baryshkov wrote:
> On 25/01/2024 23:56, Luca Weiss wrote:
>> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>>
>> Add the IOMMU used for the GPU on MSM8953.
>>
>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> index dcb5c98b793c..91d083871ab0 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> @@ -1046,6 +1046,37 @@ mdss_dsi1_phy: phy@1a96400 {
>>               };
>>           };
>> +        gpu_iommu: iommu@1c48000 {
> 
> Nit: most of the platforms use the adreno_smmu label. But maybe the msm-iommu vs arm-smmu makes difference here.

Not really :)

Please keep the labels unified
> 
> Nevertheless:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> +            compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v2";
>> +            ranges = <0 0x01c48000 0x8000>;
>> +
>> +            clocks = <&gcc GCC_OXILI_AHB_CLK>,
>> +                 <&gcc GCC_BIMC_GFX_CLK>;

And align these

Konrad
