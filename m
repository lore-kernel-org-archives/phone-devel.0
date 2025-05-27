Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E070E2475C3
	for <phone-devel@vger.kernel.org>; Tue, 27 May 2025 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333974; cv=none; b=uKhSY1Mk2DJFUou15TLM98qNc0rBhamGK0CRpNB5pSBU1BnoenSw3kA88Y6Kr1+Wqim9+Zff8YtWVCeTG1W8diPHBlrQcPN4ZJT9dSe3iOw/v18c1L2vmBr4JyQTECfSgBwIIsaV1wRG3aWNf/wj7DnvKyVW5K2i6073GNkupBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333974; c=relaxed/simple;
	bh=ia8kZdP0HFoJkRuqfb9xYK3PP1X9WFdfCow4Ewno8P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP6QtXdnHBoEPHzlexrampZaNF7/ldwE9V1YM2YRpKg2XvK0lPgg4y83OBsTGXNcGX1jKSV4WV3/7rFX71FmFbo3Zesf1LPOkAXBF4Z6r6esG3mGGRI9ivpXzj5yLy9OuhX2QJGE1ZTu98kA6s7wr29VvZtVGNnlyHepWxJpB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVTYCAhX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVTYCAhX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so36295275e9.1
        for <phone-devel@vger.kernel.org>; Tue, 27 May 2025 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748333971; x=1748938771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMOUzI+Rl9kCd96v3bJcE+T2pFM5Ij46/8q1c510Oug=;
        b=pVTYCAhXK0P46qJjOhOoNjEwGWdy7Z6CbVLokeqZf5mbK9vDAB/ep6MskK6VIrTfQM
         EcTNKvJs+jSB34M0oV7Na+ujMXdhffd4tDC/8qp063d2j4XOksNeFdgISMj/X30xiJty
         gM+/hTM8P4rLkgm6gk2IOrhD/j7Ci+M7BfWzfv9DnF6kAqPTK2xRO1y0N6Ys3TGzHWo0
         jvogReYJOQsXzrxW+qlqyBAHShL3nJ0lctCRC0DL2X8DM5+R6m5IQS9P03ZJenMhK1Zd
         Uw4mVOIF5+8jAq/hpmbzULXJXPlhDQVhVoIvDYV/IacmYptdI0gtYpQbDqi5O1XyNlnJ
         3w6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333971; x=1748938771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMOUzI+Rl9kCd96v3bJcE+T2pFM5Ij46/8q1c510Oug=;
        b=JPYR/gjlnVokiq42Nw270e9qNSbYTCEuPYCeDenM7een9zsmfpk8G2fcDyaWLE/f/q
         l1oKzmAIfUIBvpdA1aWiTgNnxqPf7nWGk+2oFPtXG+13hSWbXP+cPOsYtfxmPtNnhVkk
         3PZPmchjJD1Ja/4ryhD+oZi3vLONH+ZcvUaiF60X4TJIaWLGvQNJKATQnbBb+V00PBHG
         Eporxk7sVFEkXefyiqsR3RGyYFDPNeCW0lJd+LPridMo976LtCoZsop9P2A3Ob7ub1MB
         sES00UPYHu0pE8oe8AcsBXc9Q/LeE+iJ3lF3QskoLElO5Fa0ucy6yhmcwBO5/+ZyM8Rb
         4gmg==
X-Forwarded-Encrypted: i=1; AJvYcCWQTJQOg04Fb30uSPe8i04YHE802mbzds94JU9axqYrX9+ubC+5ppwDFWTMLYBvfaSC7J/SpPuIyP8xhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsK2j6yc1CQXMoBJQ0DzHlHeasEAJX+/bnVNRocir3SPuou65/
	gMbEu3tCtwGLfCdhUy09K3W8ysHsGCiqAqOfov7LHUD2xqz4LUIUSYxFJRhzFz/7JxQ=
X-Gm-Gg: ASbGncuIH8Mqa2odxyRnWVsRABP8gSOWWsJHDHPF0id7y/YRkvXw4jBrJGglCeKZm1r
	sIuj/B643BZ9F4s5YeeE+zZTrtfxBGAuxIFTHUuagiHR0QZlPCdAAZsVTSnlwS1jWcvY7CKgYDd
	IKRYOKxcAJmm0hmE5ekUycIOz6M/DVofwXhYfbZcZhzHid+OfY+WQC77cgBF3N9t6MLQ++oZzdD
	E+XHlv0jCSuwEQ3wCzsf0cmf1DzTtpM6I+G9e5dxRs7La1mGwAByN70efdw/g6tmNyBjsIOYX7L
	esoW3rYj5tnY9uONl/vFxKu9tk7kRfd1jWxTHpMo/XaFTsf5qv+LNaQ5aNoJp1x9xhNAzcLP9Ut
	2kWNSJIE+4ouIqC0W
X-Google-Smtp-Source: AGHT+IFjTsGVi2CK4OkLJrI3Smdv4M+APjpCmrgDiR1D6zlgPXvjVIxxpzIlokGl7A7BbOpPT/vmFw==
X-Received: by 2002:a05:600c:a13:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-44c91dd151amr132439605e9.10.1748333971167;
        Tue, 27 May 2025 01:19:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d53ce0b4sm6807921f8f.37.2025.05.27.01.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:19:30 -0700 (PDT)
Message-ID: <b3d4b080-5a9e-4af0-bce7-41c06d1d27f0@linaro.org>
Date: Tue, 27 May 2025 09:19:29 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <f2162241-6423-43b3-a6b5-74e373cd8834@linaro.org>
 <10c45ae1d2453f7c81dadeb132b6c2911ab7d95c.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <10c45ae1d2453f7c81dadeb132b6c2911ab7d95c.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/05/2025 17:20, Vincent Knecht wrote:
>> You have both
>>
>> if (vfe->res->has_vbif) {
>>
>> and the above switch, there's no point in checking this twice in two
>> different ways.
>>
>> Choose one, suggest has_vbif is enough.
> I think the switch is still needed, so that distinct settings
> can be applied for different SoCs.
> 
> Or should I just apply the 8939 settings unconditionally, and keep it
> as an exercice for the next dev who need other settings for another SoC
> to deal with ? 🙂
> 
> Thanks

The flag should be enough.

---
bod
