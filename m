Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F334814D6F1
	for <phone-devel@vger.kernel.org>; Sat, 22 Jun 2024 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056849; cv=none; b=NOGh9g7V4L2QkEVy5qFGhxami8tbCkktlPgMA04KBJA4xsJCOfYIHb3chy3iJd1Dupaspc02nxzWO9kEUhaLELwRARVrHP9wrcrMMzYogKXt8snPaF1mvJh0sfTe1gBq6UxGY0087Dm4O++5WfYODbXgTJOzq59jvLSRF2sngSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056849; c=relaxed/simple;
	bh=9HW0EKBjliMtQgcjh+Q6rnR7bvgYSXhkoyU8qURuBOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EROXI5bezaFqA+vhCcAXRPiENg6k7G7vwoYbTJNBjLGi1PQ9TWCWnxfBqwz8VNwsvqkghYMjuGj+4UfcwMz5gwsYqqg4YhC3OMIqN7cUM/hmPVsDd6FhgOZIf3DPBqK4Vp7JxbBHV+zRTkAgRvOTVHBS+UXTcTsE2bNx9KVKHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSBfdw8A; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSBfdw8A"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso3123479a12.2
        for <phone-devel@vger.kernel.org>; Sat, 22 Jun 2024 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719056846; x=1719661646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GMNfILuks1dO8qewlx3Rln5wKJZKgfLBKJ/x00vmQuc=;
        b=sSBfdw8AfGuahRGAMbm8SXWucHf6auJA8XtkxFrh8Ms8oXdaeolW09cmmzS3KJqIcK
         xgeKiivaDJybl4x7nVb2qGOR6icCd5DiMpBNkD9aWqmFnvOeQi46OnjoB4sBTb3+yjHG
         CBNukBWrCtfNha1aKfQOUw/ajUQVSi13YC8LBYFruU6KAGTdErT1r78E4GDatbMoQzfJ
         HI1Jfo0A+EG0Rv7KIX13K6pdrlqOagOoCYKzo9AuzZf4Cl+UsvYy0ketu3SBA1Mfj14O
         ePSZHr8UAynQGnylLWg4/CZSWFLRDrRBEy1NMxwTrMUoD9D/8P2W/E9Seg0ZnKlliN8a
         jQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719056846; x=1719661646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMNfILuks1dO8qewlx3Rln5wKJZKgfLBKJ/x00vmQuc=;
        b=tGXoOkDqT4biFerZiwdlkxQOoymTULc1xaK9xdoUhFvCY2MbNjsyt+g0J9D2kRT75b
         n7CptpcsZjq4r01Ydu/AuEA51PIQNaR48th75gCpMy12GWFWFlgP/78TZiLSzMQZ+3Yp
         WueOD8jRMnGydH/pz+LsKQ07V2CHB56ooAiOj2//BAwKRR5DKSbkabTLqZZWdSQvdtgb
         8jyerTIE3II5DL3+mjoKyKQEBwSVNm/25Mc/BmGhs2wLsciEzEskUSXTHtbMdysSWmtv
         Q98g7GO0eGtRzJOyLBLpiBOBSBGxWt6JPGPk5URoV89XtfWhtpFt3+2cBWd0yAj0Mn5h
         5Bqg==
X-Forwarded-Encrypted: i=1; AJvYcCUhjgcltzVYdaQLp5MBrOaBNsI5awI/izCTIdooNcL+SKMB8dJ20eDFP8HDXkclCRsr8bS1jIoOidVfOIVrlzefX/itE6h8nnOE3Ws=
X-Gm-Message-State: AOJu0YyZcG6g6t25zzx+GIewO4L5oIOYXpWfgpmaFarRzLk9063BDnd3
	O3lP/pXEEhhPfs+y0A4b7s7qog+0dZl7sfzJ8niBg9prQ3eRX9pniDNMs9XTphc=
X-Google-Smtp-Source: AGHT+IGPd0yRMno5iuHp123ccFoht9qSNa3r7/hf1JIr+3S3nQAB1NpSm/qpu9dnCIwbrVTmzCgpBg==
X-Received: by 2002:a50:c014:0:b0:57c:7ce3:6cd9 with SMTP id 4fb4d7f45d1cf-57d07e6b7d8mr6880465a12.23.1719056846039;
        Sat, 22 Jun 2024 04:47:26 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d305616dfsm2243941a12.79.2024.06.22.04.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:47:25 -0700 (PDT)
Message-ID: <a7cd32a6-4689-4bb4-b211-b8dab5caa0a5@linaro.org>
Date: Sat, 22 Jun 2024 13:47:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ARM: dts: qcom: msm8226: Hook up CPU cooling
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
 <20240619-msm8226-cpufreq-v1-6-85143f5291d1@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240619-msm8226-cpufreq-v1-6-85143f5291d1@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 11:02 PM, Luca Weiss wrote:
> Add cooling-maps for the CPU thermal zones so the driver can actually do
> something when the CPU temperature rises too much.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Very cool, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
