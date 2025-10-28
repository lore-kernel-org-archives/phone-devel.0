Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CF030149C
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643567; cv=none; b=IXP1/bgOpdVBNwqKROFOxC8OJMnhwVYhQeNsHQGsdpCXlKCGY4VP50tbPM2x3EKMQC2bR7JQImUvZfaitNnP3TxOJNI2++NoIgRFe2bPhT6dsq8B96stSXH1/M3L0CJw6XjWKN6AnVeFkbtb5kgEUH+HfvUQtZUnlRPHo17Wkag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643567; c=relaxed/simple;
	bh=G3fa4DEKYJsrbjpYbG8l1S+0+U7oaIpFhApn3v9mVok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGQZ/4ZEYTQtyJxBlal43k6aR40NzqmfaRDJpFXIKjcX78NFltLtFQ/B8kRMCecWsWMthA0uxrUfHtNbOwOIugiMeRQCf0q1XAaILUnAuM18TC/57iFRwVsvza3VSfb/2YjuWPEkVvoOJLaFUt4L/+0kQ5FjVYzHYoaMwGm63bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4wEuk65; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4wEuk65"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso41620155e9.1
        for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761643564; x=1762248364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WIhNUyRI0kZl2LUkLnytvQqzIt3iG3+keT/4POrd5A=;
        b=i4wEuk65Uva9JyllG5C3QAYlNH4CN9Ckyf3TnlnzuwawRg/lQIuwBvSboDw89RtB8j
         DrRkpo+XKGbDGzW342mx807zqrdPXxbPl3z150+96RbmE+VMnaxftxuNVg69bmCcKDHi
         b5MQV3sUliY/GOUPsn7/sXQtEs9CwwJEAzWHlzrUFPZW8vF14WGE2emLog1az3rmohVU
         4QC8GTHe2vqw2Oa31KkhnoqLCdx68gXonYBuJFuJG5Nwihqfn8dXj3p4ZH2kMSJ70jFD
         gOpOLdDhOWqGtvUfdawcU1sHQsTLLZaq9w1c7FzAqVU3CLuQgHkt7pn+VjWNOyXIcSTq
         MCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643564; x=1762248364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WIhNUyRI0kZl2LUkLnytvQqzIt3iG3+keT/4POrd5A=;
        b=WY7MXkF1wEeP8m/SI7DDyUv25M8ei1ws6sSOT5tARK4QqY2sFKIwQ+EjQqpFhle3ZO
         QfNI+y1K3YU8W2CzUb9fFJzghNkQYhIvnVsEKMVq2O+GjQmJIoCBISjKM55Sm4sPLePD
         7dLUxYaEtG7Cy5UW7e24AnqkhP4nOvaqxziNZ8EvH/4jmXamMEmeJ1hue0ELiIP1eCQF
         JcQlLgwSamD02m3dVJb1OXm+YBLPDnfvnIlHNhxCzabUk9tW11H88UI/ZQptuFwxjF7E
         lOehZeibB4rIZXcIiclSArVmhmAauezx0h+dHUpQjsO5kdkz5o9WzFSH5glPF6XfLavW
         TxWg==
X-Forwarded-Encrypted: i=1; AJvYcCXCz2gqFSWBl5WSRaMaEcFlUdTDhm3WCK1y6XCIwhfKQAFzZama5AGNX/3rN6viiH4Ht+hTJ3+ONMMYgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIrsacRqvParypm8T1+yW33kzqnCHJcn3vy11E2GxKlrYRzQ/
	A/9KjKS0fpYIDGYmrUw8sfZ9ev+jxt8YzwXzy0pAXPdr4A1e6cUiQRHbd7BUZHasrrs=
X-Gm-Gg: ASbGncurYQpbaC0bkCJX2pDjJGSBsmicdfppmOmzdA4/cIYicueOicSQAVlqxV2CDdu
	iSPJuALlXBe7rxka0Y7HKoMwHYOoTOW5tRUvUKjoYebjyAbL1jwuAoNf9qxTBsWXH4rOn+hDRnE
	egngOL9zypX7zPqb4Jn8gC5W746FHzTuG/Jf7s81+xqqQ1RCwoTHcJIthFLacQ1rB4mTSqZGuWG
	wuE9t5iWMES62bcSr2g4xmD4gu4HwwG+OLvQyJISFOjhJp6izMM9kD6aQ6PYtO+PwUTHgg8kPCm
	NfZSM5hHwcT//IO8rAijHqMAN0X17lECQZGY+O4Imt2nC7jO9DRdtTri4CyZmu8FKGfJdOfZOLY
	MLfvTqjahTiJ5w3Ssv5BimsPh7CyokZuQrmShYV+pRvhVZSOjz7qIquxHvnPW1Q15XbpvdYBm3E
	2vXFqxD8DGxlllBanjBNCMKx6HOi6rTlNgMHySuTMs08WLfr6Vio5xbQ==
X-Google-Smtp-Source: AGHT+IG7SGjSk8s/DTqkizgYBNEXizsx92+JaKgr3Y3fQprN5gLYg9kJPcLa3kFS/x+7fFwVaMqF7g==
X-Received: by 2002:a05:600c:470b:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-47717df9dc0mr25845305e9.3.1761643564349;
        Tue, 28 Oct 2025 02:26:04 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd035dc2sm188343505e9.5.2025.10.28.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:26:03 -0700 (PDT)
Message-ID: <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>
Date: Tue, 28 Oct 2025 09:26:02 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2025 13:24, Luca Weiss wrote:
> +		.regulators = { "vdda-0.9", "vdda-1.25" },

I'd like a little bit more consistency with the regulator names.

0p9 1p2 instead of 0.9 and 1.25

---
bod
