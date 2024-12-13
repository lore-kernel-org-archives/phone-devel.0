Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4E1C07F0
	for <phone-devel@vger.kernel.org>; Fri, 13 Dec 2024 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087027; cv=none; b=PtcvUAgyqSxkQ+ItzmCkEG2AobIPFxpdBUoBe/p8ztNBNoTFHoEggRjlGljHkgiwVyGWdAvjT9vc8pkvg4OaVlDe2gsn0RciksITsNLrocSKD0m79zW7u15Z4jP6yLWCcgcITVNG9l/hQxkrzuDTcR4tFihg5e4YuBKhze4+ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087027; c=relaxed/simple;
	bh=gA3Q4ub77tN7sCgmbLmkx712qJth2K3MCOGVKBn36q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSGj7MhfTCKW7V0S+61kCz6UFzCvimAQYcnXc9Y6HxTUZqenn+M9TWF7FuATKkMvGL++k/yALqnKXSYsvJrTzaMrs2MGuUWS2GIhgu4AwRToTg4k2/MaxoWu0TivNZVSFncINEMRT5UZqK8SE5CBgJFKNDkrntIFhm0Y8YI5Xv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vratCu3Z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vratCu3Z"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso213752e87.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Dec 2024 02:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734087024; x=1734691824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsMZoEd++TbxWw8duLL2sE2JWkwl2EC+I98Ex9pn+ng=;
        b=vratCu3ZOK2VjDZsyyhZXVv9HNetkP/G4PvP+34XY1/d+M2FUCE7vzT1LnnU2g6+Fl
         IOTvH5GXU/PjR8LtEF4LsaM1hQd5p7EFaIHDjNWmaHcZ4zdLjZDYR9mVgm8KbXwWiMLy
         m0NTcUV7sj8tLlFzUrKU3vyd6rJH9ESvg4Zb7uSfRcNJdYux600bygK421n5ybWhpZF1
         YIOeLHaILcPxIQ15A4Pa5G1QfbCZDIqTzkOMdGhrCvJHQY/wxXo/0AYkqNrRE6SwJ4ti
         IS7AnupvBIzj/Rw5sr1BB6Lj0lvBSUDy1K7xdfUqJP7BIIJyBVlMf+aw/nO8PpuelNJ1
         KqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087024; x=1734691824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsMZoEd++TbxWw8duLL2sE2JWkwl2EC+I98Ex9pn+ng=;
        b=i4viH5eTZoikmCtNmjzdUARoBrzt5OlkfUP+leFHLl+C2Tu0AuO+QMAkH7L8Ng+4Oo
         CFUzYCNM+ze58uynPmS544/Zm8D3NdUrvDiR5MCuqYhP8bxltFN4CLt68fXz+0+vyfxf
         2hvC/GjW/JnHWgnYzkuEWeswSy/pDDJoipllWMeqC5yI9E118tBdkkwWp/T1QT7iraFm
         3r12lVpUSSlnFTQEeQhXR1ZLLyCBELHuyJ3s6eMenaU0YMuPuvn8kFMwc5odgdPUS3zm
         7Y33r49lF9HVNGXoHON+HrcuZp1APf/n3wRspr9kYEmcNEV3yA72CHRwK+ttZnADm4V4
         WdDA==
X-Forwarded-Encrypted: i=1; AJvYcCVEmH+PD0ElJ0EZUoULFrJ5Q00dDz9cxj6qxFKybiVzG7uSJPS3qlmIJnLcU5BQLQgpD78WWU2kYitDgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYNXPP9BKGlBjdyld/st+yVfY1NmMf5wQvhxkVMz3YWfPJ0Zv
	Ks4pk89yppJcLvTWkO+FFczMxPUd16fyOaGYjzNMCjDUHrF46wProApmPDw+rys=
X-Gm-Gg: ASbGncvpks760RPb9Z0V5CXQw+hL/EQ8pbfTY6nLScwLIn59urvpM6nhI7jSW3UW79k
	W7d0E4yEdYAX5zwqHWq5hPGh/DT7ufeJVHhNcIOHA4jiSdIFDqAjy/IT1JAnAH0Gs2pCJnnxDKw
	/0QOVMCCptjTevnynOomDtgL7FM2OyQYBCPR64OSwKli+Uw5C9dODMDt4ZmkVNUCWGuwYKF78H3
	mq3CZdmazHOhr6tcckKRtWxWKzpgnoP4ZzyFGwJxwdRavWnNroi80jHuyGEjlbcFZSnTG3DDFyn
	LEz0xtpvia40y8aS0UJnj4+VqZEV9FHWED0=
X-Google-Smtp-Source: AGHT+IGw9a1uX5hBegI8/sPSllQufUgfjzOPxBgUy3/5ZZqbN7RuVYinY4oCJlX1bIMH1dO35Vhc1Q==
X-Received: by 2002:a05:6512:1594:b0:540:1b7e:c8ee with SMTP id 2adb3069b0e04-54090557f27mr229332e87.4.1734087023952;
        Fri, 13 Dec 2024 02:50:23 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54016a1cea6sm1888692e87.41.2024.12.13.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:50:22 -0800 (PST)
Message-ID: <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
Date: Fri, 13 Dec 2024 12:50:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 11:34, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 01:01:05PM +0100, Luca Weiss wrote:
>> The CSIPHY of Qualcomm SoCs support both D-PHY and C-PHY standards for
>> CSI-2, but not any others so restrict the bus-type property describing
>> this to the supported values.
>>
>> The only exception here is MSM8916 which only supports D-PHY. C-PHY was
>> introduced with newer SoCs.
>>
>> Do note, that currently the Linux driver only supports D-PHY.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>>   .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>>   .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>>   .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>>   .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>>   .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>>   .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++++++++
>>   7 files changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> index 9cc0a968a401836814560c1af3ee84d946500b4f..3de2a3d2b5b761106975aab65ff614b2ef579ef5 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>> @@ -94,6 +94,10 @@ properties:
>>                   minItems: 1
>>                   maxItems: 4
>>   
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>>               required:
>>                 - data-lanes
>>   
>> @@ -113,6 +117,10 @@ properties:
>>                   minItems: 1
>>                   maxItems: 4
>>   
>> +              bus-type:
>> +                enum:
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +

But is it really needed to specify the single supported bus-type?

I believe it is not, at least it's not ever done for other media devices
like sensors.

Here I would prefer to get a comment from Linux Media and/or DTB experts.

--
Best wishes,
Vladimir
