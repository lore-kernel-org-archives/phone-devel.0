Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236C13B78A
	for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706221538; cv=none; b=cenhN1SuOr7Ys5CHlptPqW4yfAgdz0f7cT0GJWhscwAgLIaix8qJ/8tEP3nRaSCHlR8wMbK+j5kD+bxD//O4S16uZxzb4GE4mJ+ot1D2KeTw9hvZEaIUPb7Qp/y5LBE0TxmtGBQE6977Hjio+0RdaimU6JN1nHAo0JBQcS7o+9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706221538; c=relaxed/simple;
	bh=QttQygQdo7pOZKGzvwTMezGVWdOihA0j7oTU2gKSb0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXpqwosD6IdJmUqC/3Mh2pNd3qEe9IGWHir0bQ18ZfpZfFHh86Z/APpjEdnGYcSdKcDPj0ObZqGF64cXS/vinuWkg1UV5+bjfzkDamAFWTMd8NoaqhCv/WfIMvumSS5SzgvoMVOHS2OkXXM3ZxXz6qleDAjEjTkmGg0rdxLcREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzggMAON; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzggMAON"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50eab4bf47aso1323744e87.0
        for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706221533; x=1706826333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KiOZjOrG5Dv/gAk5/b+HZFzoBKoxQ5QJzGApcdLCas=;
        b=jzggMAONnKcnQs5EN5O5Jy/+XhG51WD1Qe5EPoU9yE1xKNnXIvSrec7/VQIqefTMwp
         oglv7SM4ooqCLJz6iG2ko361BLSCU17IcFkqvpbd/INZNppl1CQajM5iYoxiAb7YsUnN
         7j5oQwWWKUiXbDga2+d2ZMfQhnBleFL8K/lg/IvBvqUiF/9TmHRvBN1PBiIUEj9NxCRc
         /qHfuwJt+qnGPxU3JnQQHQHL4hWzRrFTOHyQh32El6BfvJuNau4/VlkCgs6/23AysN72
         kQCRv4BIEjgD1mE6BC6jbrKGFmz7hgeYXPWLTx8cGuzJyRMW/RKCQqAijM7WzCTsfLLr
         f2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706221533; x=1706826333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KiOZjOrG5Dv/gAk5/b+HZFzoBKoxQ5QJzGApcdLCas=;
        b=myWXQeekPXhfQAnDILyINZtkn69p9FWb000b+oBiDO4fca7cOIq2p7xnir9w/sgM/b
         NT6F4ByCCizdE+aFBOSa5OHHUhfEXoqAcknDTHAvdF/gNdxlHmczP0xRZHnLwZXksRzc
         3IIwxDUlYBlgvEM7+OpCXCyS/FXFt/ft4U4yEGFvukp0SsiN9RF89K4P+1L6a8oe1vn4
         z2PDYdoJVTg4S+kYxXtLefAQOuaKGCr1BPhgD8DPCFiBwyZ11bF0FgRT/04h/s9gos16
         GcCI+wp7WUMbaPxYVbbC8u8uO39NncnTWHWHeUXutl/JYtU+TaJucEvQIPh9ZvbZHFJF
         +dVQ==
X-Gm-Message-State: AOJu0Yyw1nOQ75Hc/MAyBt0f4THdiAKABRAEGHL2HJU+kNXcX/abBbs3
	uP/s+QvHJgL2EQMmqyNQJ7hHGwB8Vu8DR64NHdiHKvRcJCiB1PuSASJMd9XoNMWPBzsHplHBRFO
	N
X-Google-Smtp-Source: AGHT+IHqsh+U8A2CY/6REXUe0YOPeKMZR1c3NhEvX0eKiRnqxaHtd16+71a1kqL0RUXl3lS0fgU3vA==
X-Received: by 2002:ac2:504a:0:b0:510:198e:6ee7 with SMTP id a10-20020ac2504a000000b00510198e6ee7mr121722lfm.18.1706221533341;
        Thu, 25 Jan 2024 14:25:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi28-20020a0565120e9c00b00510220e251csm111794lfb.47.2024.01.25.14.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 14:25:32 -0800 (PST)
Message-ID: <485e5e2a-840d-40f9-a5d3-cfd9bf322e64@linaro.org>
Date: Fri, 26 Jan 2024 00:25:32 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: msm8953: Add GPU
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240125-msm8953-gpu-v1-0-f6493a5951f3@z3ntu.xyz>
 <20240125-msm8953-gpu-v1-2-f6493a5951f3@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125-msm8953-gpu-v1-2-f6493a5951f3@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 23:56, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the GPU node for the Adreno 506 found on this family of SoCs. The
> clock speeds are a bit different per SoC variant, SDM450 maxes out at
> 600MHz while MSM8953 (= SDM625) goes up to 650MHz and SDM632 goes up to
> 725MHz.
> 
> To achieve this, create a new sdm450.dtsi to hold the 600MHz OPP and
> use the new dtsi for sdm450-motorola-ali.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Co-developed-by: Luca Weiss <luca@z3ntu.xyz>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm64/boot/dts/qcom/msm8953.dtsi            | 115 +++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts |   2 +-
>   arch/arm64/boot/dts/qcom/sdm450.dtsi             |  14 +++
>   arch/arm64/boot/dts/qcom/sdm632.dtsi             |   8 ++
>   4 files changed, 138 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

