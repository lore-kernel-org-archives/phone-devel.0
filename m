Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F82264C0
	for <phone-devel@vger.kernel.org>; Mon,  8 Sep 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329029; cv=none; b=Vg7aLs9y3rtQ8U/gb4j6gyN2QYTWndd/wZ6vsIl46LWU7xgQlh8rkM1LaW8GMEV85oT7PlSgw+R8eIHskWkrrHJFZ6bgu1lQwAYnE4IYLQtKPdyXKTfbRgKWCFaJYeyvKYVheLhxBw0FdvIlo7JJs45ix1AJrrpheIJkZzaRsOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329029; c=relaxed/simple;
	bh=H4GKqV9vKQYnuJ8t0TV9btzVLh6ocsYYvcT3DTkijw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUPbOn18rk54JRBrXh1iatljishb20kKjeEibvSDmR217JUDP3+TRPGtJ232pPcIw5E2g+9fNrr0nQCuu2C7KaxoGBh31fRa+mN8X3A9VypxhOFU0CqLyjcfOvrTOpXBhXt1K9Gp2Ph3JM/xcEVbT7tL/OYQOJ+DpyurgM1XMfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVzGj2vO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVzGj2vO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e5190bca95so1255820f8f.0
        for <phone-devel@vger.kernel.org>; Mon, 08 Sep 2025 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757329024; x=1757933824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXcNKb7eAeUSAOD3P9kbauHvQhJ/T5mYxvtqvBukuQM=;
        b=TVzGj2vOOi0iJTRHBf+JjlEVlcLFofPEc0ysXPC92iHoIMR3ld7KIeIkcnxAY1lSI5
         EUle7uLJIyN1lJ+Bor89QzHObAQ3/zf1ibdu4FrEqn5ZeSZx4KCcQO31SdIc26BpxZVD
         2/mludSs1DYd4YtOfamP3vkfZRyoS1D/gGaD8tiprRyKvXzbtKK7TlPMcFOsmUn7hfB0
         QAK8eqhADN19p1opLcJMzpuUOwRkaaIiJb+dXK6SlN6MMDiB53Kfz3Ck53fjRaeOfr6X
         5KwR80sHC1NtRDiuuMHkiLbY+AQnvBEXAEnuwdoHUcVqGmLP8DXWerS5h2R/DOe1HC/5
         mmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329024; x=1757933824;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXcNKb7eAeUSAOD3P9kbauHvQhJ/T5mYxvtqvBukuQM=;
        b=YjbuhHm5W5him6K3WMGCl6jZr3OyXjYE3Yd3ZoK/5A0B8dxmmgLFez1zU+KL5QIN94
         5z8xGzC8S4i/ZAbHcU+Tby8F+iWD8H6gx+FbzFcDd9LjFXDSbCCR8RaFdpCmBjfBnoxh
         X8tn1IB4wug4B8swZlXcR7h93CIAbr7SgHrqGDXHyC1DHd2pReFne5fjONCmcu9ZZ8eE
         xbSxhHJd4EAKrCBaR4WgzSMAi2t5vgOOF63Jv6ZDSwVjhLGviZeB7JkxWPpv/i66/WTe
         odAA1uM77RhSwCTYRoT5MAjOszbqFqFjPcq4JEPS24jN/2rpfAIAPrYHqul4C6G1qN4a
         66CA==
X-Forwarded-Encrypted: i=1; AJvYcCVNO504dC+7y4P4iUaVm1rfv3i6PJNSOeej07UTO1wbFHQDyv7TkeQehnb3K0slW4x360oJKrbed7T1qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrGz25MOmXMM1dLTXKk2bJPhS8khlhtXkuYyFyQDW2Hkhbsxd
	QOiaaWUnH3gzAo3WVk9izxSpwJ28vGKBhoBygWtayLK9xrxFR8e/R+HTlaR7fvFAmuo=
X-Gm-Gg: ASbGncuQH4XOiDoeDipumL28qZUuU+vn3tYx2wsdJ3jjYd2pq+oqG9Qyrb/Rqg4evDP
	u0+GWBYPcran2U8MlgdIunfuKUt7rf3N6VZHik3+PkPYp17nDWOL5VISjqlM92nDFop4Rrd0wm6
	j7g3p82T1F8/cvczNNZmHenIOswh6VXI3eJQ4FL0jNXgNTvK+M0sD786I5xB3iWQql4lRK0UnuK
	Itm+clNwKGRI7bnfz8E3/INCy5sD2fhBPic1nWR2gCEMRUQT82kfMjWmWv1bX/pDdxd8VV97zUD
	1CrYl+pi/WbDe86sAkpA6zU0qWYxsiFaVm+W5tAmZbeYgKU9cXQXpxg/BFhpBmudiEAX6zNj25x
	3rLZ3ggs8Bzbrhh9UNxYCfGBdyQKVHtiptw9cRme0UWcXQMEblDX5mICIMrAMQvT7xabAJotC/E
	TnkMB4IQPMWVshYGcKrCA=
X-Google-Smtp-Source: AGHT+IHJenZkBnBqX5JJGGi8QCqzH35vWp8fn9f5als83N3CMmj4jtZhM8xY4+BhMYtweIKXzuwxjA==
X-Received: by 2002:a05:6000:24c9:b0:3e2:4a3e:d3ee with SMTP id ffacd0b85a97d-3e64ca75db9mr5387379f8f.58.1757329024396;
        Mon, 08 Sep 2025 03:57:04 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm440740795e9.12.2025.09.08.03.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 03:57:03 -0700 (PDT)
Message-ID: <bfc3838c-b2fe-40c9-a1bf-f5269b48dca9@linaro.org>
Date: Mon, 8 Sep 2025 11:56:59 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add CAMSS support for MSM8939
To: git@apitzsch.eu, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/09/2025 23:04, André Apitzsch via B4 Relay wrote:
> (This series resumes [1].)
> 
> This series adds CAMSS support for MSM8939.  It's mostly identical to
> MSM8916, except for some clocks and an additional CSI.
> 
> To fix black stripes across sensor output, and garbage in CSID TPG
> output, 2 VFE VBIF register settings are needed.  So the 2nd patch adds
> helper functions to do just that.
> 
> Patch 1: documents qcom,msm8939-camss DT bindings
> Patch 2: adds helper for VFE VBIF settings
> Patch 3: adds CAMSS_8x39 version in CAMSS driver
> Patch 4: adds camss and cci in msm8939.dtsi
> 
> Changes compared to [1]:
> - Move bindings patch to the beginning
> - Make the order of {reg, clock, interrupt} items the same as in 8916 +
>    append additional items
> - Drop R-b tags from bindings and dts patches as order of items was
>    changed
> 
> [1] https://lore.kernel.org/all/20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org/
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> [André: Apply reviewer comments]
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Vincent Knecht (4):
>        media: dt-bindings: Add qcom,msm8939-camss
>        media: qcom: camss: vfe: Add VBIF setting support
>        media: qcom: camss: Add support for MSM8939
>        arm64: dts: qcom: msm8939: Add camss and cci
> 
>   .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   4 +
>   arch/arm64/boot/dts/qcom/msm8939.dtsi              | 146 ++++++++++++
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>   drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>   drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  12 +
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.c |  31 +++
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.h |  19 ++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +
>   drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   13 files changed, 645 insertions(+), 2 deletions(-)
> ---
> base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
> change-id: 20250517-camss-8x39-vbif-975ff5819198
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

