Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A03A8F7
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727102; cv=none; b=PabpGrTaPRi5UtWBtOwUBx2dd+iZ1fLcEggLmzgvaZPMKghL+LrO1F49RP856VaEGhvsd653g0ZCaNt+KiwCy2ofr/RO2GSma4YUc2BUL+I19GrResB0KZ/MSXknmJJpsmBqmPSC29AWBCMirALFOQyKDJACmpCS46KGqP/gaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727102; c=relaxed/simple;
	bh=QU31hIANM2iKsUCoSFU71RTnMz2RvL9BIjntvMtSLGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UbUHtLOY1khBY/o7ZfFcn0W9mf8O5s4EOAxR+joVle77YTxhQPXaU09krxPZdWz7BlZD3VGyqRtBepJ1LeZ1mJzBMXNA0Y2MRPqj9dKXQR+N6beJE7+HjEU0F/ddrS6JXsXrNh304yY3ImE4s/0HOq7ja77Xmjs3RGxjKDGvJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8UqmhFv; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8UqmhFv"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-385bd47d64fso2271141fa.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 04:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770727099; x=1771331899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3D31YqYK8CuEtFXmlILPkuZg/ugm6z1QAeaPoW6EMo=;
        b=r8UqmhFvwutFls7L8q4VYmfFHmCbxMK0eeXh15QSflrwrd0aeHVX4r8uMkgsdObnGt
         oDPhpdJwEA/EjSXKD/uAzLWK8X856DYD4tm8WKvhrRyVB1OfXY4zbke6IhRvNEjbndNW
         jwFKCgPZVgjqugF8zQYNA+XMcklTR7OJdOpbAPqLmhoc4mSbIxtrmLRRcw970UHsA8bo
         3hIhudmwSg4IdLyErievLcpUiWE0qnjH76/aReEhHNKpQjZP1IAka0Evm+fwsVrJQZkj
         y97mTxZ8e2QpXQbbaiA58zgzgCE5n3jl+KVbEFN1avAOnNwx7ndo2x0mFM5upC77YNDc
         xpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727099; x=1771331899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3D31YqYK8CuEtFXmlILPkuZg/ugm6z1QAeaPoW6EMo=;
        b=aqcEqWrImn2kTPIEF3r/Q22GRHlMai1pmRQ4GTQGIuhIrSg9JQRJmll12rZYmZrUIj
         gyu3z4FbJe7qAnaRYginnQCQA/FLM/BJH+MdZ3KMScfnSe/OOSb5NnsbfRXZi5a+IkhZ
         200HOQCvUbI3125ij2GbsfoVEbW6KwDyLwVf6fijrOH6GULQa3kE3tcNtfCy9P8IS8GG
         +7AKnlBpdsJbgl7dgkrdypw2GY7TAr/wZnrW1WM8D919sXa7M7Kq8qXM7le4IjiJW0lj
         tBPq2+vop59UtN4bmwuvZPB69NBQHHLwiQiRQEqguoKH4U5dXJDGjqJzPu+bkYelyAhj
         RTuA==
X-Forwarded-Encrypted: i=1; AJvYcCVMPHyifvkkDCTZyvRm5R2Wgg5k+qn5SY8tXvwixtDmCBe3KZ2t23asUmnWzNPcP7psygVHj4+/MBOjgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkdGVSyrfTEy1lLRNv1hhhDGMk2qDAOHfjf+FiBK8gO8EIoe4d
	yPIf66nSTUdvc802C7etZPGxHvFAcxw+yx/4Jqyz4o0TTQkJy/EWr17jLdrtVavN4lc=
X-Gm-Gg: AZuq6aJsGgY+ro1Gcfzu8sxJ+7eNGm7RhIZ0k+jDE/iEJadNoU5i7LlN5LzgN8JoBg6
	BouCbi0MbKDqgv2m3SOTFlrBPI9JlrGHvhifpdJA5/Tjl1i+tNAiuvnqTnmBvUWNGL8r8afdshD
	qlDceqDPdaapp+XcbivSqAwnBWbpn/yDcB+LdEf7O/2dffnHPBsaBrBEpoV2T5Oe9QPkqLf/fXS
	sBIASW17/KI8EsQJMXh8I+tfSUIC1S5BJJ6tvUNFotdXeqWstwsX5q/vWfdtEAGgcQbDuXVnTNA
	zJUFGYfHp6Cn/7lsH8TSalabVFEHgofCyDemvvGtJjcOv9J1bkCQsq/LWST9XWKcwoAYTxPclJa
	yqzxYleaVI+auwsIb10WZPJfPQ9CgA3sW09iehmA0jjAqBIEY6KnMRGGaeZnWaOPrvPuLE9VyBz
	yZsoILo04GBVaUHYpx+H0akIZvLDPvgSN5xwhZfwijjsZAfI4TmyYUMOf2bxYptyBn/UzQeTFxT
	4FBPA==
X-Received: by 2002:a05:651c:f06:b0:386:ec29:372f with SMTP id 38308e7fff4ca-386effdb4cemr3801691fa.2.1770727099335;
        Tue, 10 Feb 2026 04:38:19 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b62363e9sm33183741fa.1.2026.02.10.04.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 04:38:18 -0800 (PST)
Message-ID: <51da29cc-7881-4d45-9233-f7b1c4f6e14f@linaro.org>
Date: Tue, 10 Feb 2026 14:38:15 +0200
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260210020207.10246-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/10/26 04:02, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
> property"). Remove the clock-lanes property.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Remove this unauthrized tag from me.

I asked to remove CAMSS 'clock-lanes' property from .dtsi file, and this
displayed change very is different one.

> Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org

Remove this given irrelevant link also.

> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

-- 
Best wishes,
Vladimir
