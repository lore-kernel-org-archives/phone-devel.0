Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB351327798
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729381; cv=none; b=Gpek6RmQSvC13YFaObVMPCR5/V4ad6hCTHIp3KzbH1EHpYB2T88n4ptz47z0iot2xBqcJVlsGmHQGDc7Eo6q25kmYq9BpIIc55i7kSpSiRMNLDLba9iBK2l1M2gKTqLt8vGDWlmSlIHPQr8O9Ox7J6lDseEgqRwA53X3BydET+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729381; c=relaxed/simple;
	bh=47lTU55/gykUcjRt+xxtWjYlJLvvJMCfBp+RED1uTkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTq5lPz/ONutbEGTeEYyDc6ArVqxM37DaKmkr5RTLC6D8cx3qF/d6CywlpTz1gmrScIA/iuUx+vEDuLhgBwYsGg5Nn6XMo4nA4iDu3vX8zhe22HOWb0PjZ1dkKLlTgxs9A91zOvEqcxcRyIfou7vjD/RuZXjdpCvf5uDCgYGmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/R5cJsn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/R5cJsn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so9825955e9.2
        for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 05:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770729378; x=1771334178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYSe1+CAiybXtDZ7qn+sljqCDCmOWnnVyECoc1AwnJs=;
        b=h/R5cJsnrDi94NyDn/J7FIOCfsNM7gozZyxaObjI+6X6rB9sprwsX7pR9y3pGMv0YA
         woI2CgwbvOFDzBR1swB+bHKpWYNCCNW4C1Hr16Of/A47BheUb9P3UEcd9Bl7pLYG/Trq
         +fzdixSUZzv8T583rW3eFf4bdw1PXeDjh57Az0TS8Lu5jcVm0aZNauPwfC6C2pCvObKx
         PBqkJJWnFfAlJ3Zt019Y/9umAIfIJTghqZGrZ/+IPlk8nxN2baChBKUCnWB6Ib0TqK4N
         bJ90s0aQKX637GvW61zgznta3ae1S7neoNeTKWzZ1X0TlEo0icLZd3rgRazdVnWuEkPK
         8lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729378; x=1771334178;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYSe1+CAiybXtDZ7qn+sljqCDCmOWnnVyECoc1AwnJs=;
        b=uKKd09HVAsUVd/hW1vTxm46ddvpp+DPQpaF9NQMVId0Hdtm32ncG2FzxfffrYtZla5
         RBcBtVTt3unORt/K/0DYfC6AFHoM90qzWfGDSholom5LIf8CpwtofU+95m5bzN5B4scE
         HAsiqc3ECJWCBKhsClbuZOx6m51bhnXJWuFLKqAFztK8Mt1FfGjM/y6yZTmrXPPK9ka7
         b41hRiioJuAswgYUg21jiX+QMcO0bm/aibXG7K0OSJW++f1rWhQqMt5aPcM2htZymb9e
         NOmS+6OS5Jid1EaCgToo+PEn2jpN64LJvKDircEuOCLBxJX/u6hGo4oTBt28fWRTEL2H
         JgKw==
X-Forwarded-Encrypted: i=1; AJvYcCXFnoekMJhTB+iSIV+lwmF0YO3qcQbSGiN3WhJu9vj9ZdAPaFktb94jfPfsHYl9tvMeQr4P/CT0gdMxzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYErEOYEanem6TOg6fuj6ebZIOKPccXkxGBcPr5Kj4XzJ8vwz
	fpcZe0t30cc8Mv575eb0uyaon3f/ZX05Nw4mHm0+LL/QQJJ8oMQA8xxMTYopWzlU4zg=
X-Gm-Gg: AZuq6aKl8k+gUlZfXt3Fg623meo9m2+/f3Zh+7YUYVtP2PScEOqkdKXrbC025oPuf+g
	NtB76Nqcgx3/hu6n4bGpJH5anVhuyapY9uK5AqKuxnYisumgjfkoI1G1sASPmVoe3B4388Y1VWi
	knesj0HLfEBh5pP2pEEUZBfC7wLO6Rv3W4fRYcfG7dtGynwXd3159kvxZl7jE4umIEF6N3o18t9
	BO1j2zHqHAADkBokNOnSU6iSqeRScKlxAgP9MaBSE5n0XvS3m+aQ3RwiKXvniAhEmMlzYZHafUC
	fbFZgov7E2F9IY+pKaubNZdvn/1Zn3U9Y8Aej+PbD7wUiUGxDyAvAgUSZZuE4YfyRtozMg2O+IP
	6MomdEnc8TDTA2JkNnL0+NTgznCTrbw0P8atI8+lsO32qFjHTijm592k0a+O6YN83Fz5KXDlGtl
	JO29vRnQR/IVwHG27cjtrWZAGMXkiy5cnI9mD62+ZkQ9ZR4zXMh3NTBDxWzULDjTUS
X-Received: by 2002:a05:600c:3552:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-48320339137mr232607865e9.34.1770729378123;
        Tue, 10 Feb 2026 05:16:18 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e64b0sm72637865e9.11.2026.02.10.05.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:16:17 -0800 (PST)
Message-ID: <416e2f12-92c1-4e41-bf08-860443710035@linaro.org>
Date: Tue, 10 Feb 2026 13:16:15 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes property
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <20260210020207.10246-2-mailingradian@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260210020207.10246-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2026 02:02, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
> property"). Remove the clock-lanes property.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml           | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe22376..78b9e03da06b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -116,15 +116,11 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>         port@1:
> @@ -139,15 +135,11 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>         port@2:
> @@ -162,15 +154,11 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>   required:
> @@ -308,7 +296,6 @@ examples:
>                       reg = <0>;
>   
>                       csiphy_ep0: endpoint {
> -                        clock-lanes = <7>;
>                           data-lanes = <0 1 2 3>;
>                           remote-endpoint = <&front_sensor_ep>;
>                       };

I think the ask was to have clock-lanes in the board dts rather than 
dropping the clock-lanes from the yaml.

We want to keep clock-lanes in general as some SoCs support changing the 
lane assignment.

---
bod
