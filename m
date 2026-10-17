Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D62FFDFC
	for <phone-devel@vger.kernel.org>; Sat, 17 Oct 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243748; cv=none; b=ol2B9uuGXqXEsXRDwo4t9FHPIXhBLRuWPgiOFPQVCobPMxVBbgTkhkBJsezNwOI94LNA+xkG2XegqijG4gzvhjsc3GkKKE/vTsgpeADpgd2PgbTdOJ2DTWJMYDI7inJJAF6JO0XjNq2BJJN73O5mDqkbKgiSutCOcqrQKWvFcOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243748; c=relaxed/simple;
	bh=MlOIkzfTSdzbzhKZope6zdJW1Tz0EBjzJbGpxaanTYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJxl90QL6QGB2moR74f44ROEYKnwEnUgfhaUN7fbmbgciszNYdpumR6Gs1YVF90y4ccIaIO4RPoHqaQkmJhP1VLPtuH+yvitmSwCrMLhLcI5D7ey0m0aRnp33OQAu9SMaXcDMThqfJiCr1sntjEAZiFeatRiI771JFA2EeNqEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clZW414U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clZW414U"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso484331f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 17 Oct 2026 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792243745; x=1792848545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5K6Tgc0KOXuZjCEEfd87yj6b3Ngd/fmCUzUiRYVE9w=;
        b=clZW414UUl7h40jP67q//PxrHJBSoLXux1wD0nM2w5ZS59YrsjPau85lNpMapQDCTZ
         B8WudYBkhKEmr6S1fvjeX3sgdnMI+q2e+cvqYNz6C646KM3RwJ/jqUAjjko+O6KDd+Id
         DMb34B1wrwvS8KatX5jTrApC+wNLRfbJrJhu6ZBza9SwyW23q2+iSqgRD3lua5MyyTWj
         4fgfaj2iIiDm2+c5Ljn4C/JceDLTx6zfy85hi0FSasXf8AHuxSKEXoBqKMHgu4OfUs4B
         gvq7GYejX5MpUycIKpgvfnjuf99lr++8oRjyu0jTErWxOupaVXxBqy23dfeVcUvrnE21
         c2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792243745; x=1792848545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5K6Tgc0KOXuZjCEEfd87yj6b3Ngd/fmCUzUiRYVE9w=;
        b=vvRr1WWI4DM6ErzBnzPDug9w3y0mq4XprzKBCOoHBdxsjnlxWwvBiGD4TyKbsHnzV2
         7VBj/SUjNATgz1EPgR2HxVEotYyrWs0nZmvsB0TR0LH3rD0zoPFRaVX2j0fffeGKn1pT
         nL1Cx2qQf4lPTowEAzwzzDR/gm+6lUJnVNxIALEIs/HLE+NbV3vXOphH9jp5qEVLT1Bt
         YFH6DUmoT5/CawShb1WnjlRPmCGu8FsfHv4ZBa9nNRsY1ywYF7i4Cqn/oHQqsb/B59Qy
         jB8fRIfe06t8LH4hzUfemj034sPqb1WN9W8sLRtJ4YIb7GnCOqaPqqvWCzUltOEClqJG
         KJPg==
X-Forwarded-Encrypted: i=1; AKwUvBwAbAllfCF9z9dd/HMCznN6VQ1y7fN0BDhv80kz8/OCXT/bIKZI53N7ovPQ8cz/ZxiUFv8CK20l3uop2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKn4T6l9HLQexVVCsp2PUXiFokbZfUMKJVXpRmH4UyaGTGPxXuB
	AygZ3YF3xWv8klZfZTSfndM8dnZLPYvGGnd6ky0IJO3iEf1pJtCEQYnM
X-Gm-Gg: AYBFou1Ng+n1tK8iRIaF0XM+lbgcQ3lXcjnxdBo4pXncpz3s5WzuK3gRmkFr+V+FcWu
	P5nJqeCFGxLXdEBHfvUa7EduIdc9l68YJEie9YzNeL81VtGp+P6iood+btxAQf57eb/R8JfIB0H
	fesFnrx9QKsEQsNOZCaVuLy6YRwS8z1UfMavS6sck9o8vdXiY/4k4CXLSmK+1rwJYLXnlmoY1Fi
	WgibB1gZ9Nkzz1mDcZw87n1un9eHUbyHjHrl/V0iDIwuf3cp5bmDBjRX0XBsGs5s2bii8Qc7abr
	qafGIRXRVKM3qQZdXryGGZNzandTu/wRm0QgZB2sdeZ5/NALzDv8+q1QsSYFX4VIjopTybEIEzY
	GDzRcQJ23oZlBipGjFcv6lCHDO0nCl06JuHc6QUfud81HGtwE8in3XZf1FXK9PRedVa0Zrikcf6
	M7vpda5rnzHpIztsl20lmF+kOe9MQ8bH8afdYXCqRQD7CGkkMNGMtE7Sq8s3vcGrkKmlypE/szS
	+I=
X-Received: by 2002:adf:e199:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48e07bb98d9mr5122636f8f.25.1792243744983;
        Sat, 17 Oct 2026 06:29:04 -0700 (PDT)
Received: from [192.168.0.114] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm11998520f8f.38.2026.10.17.06.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 06:29:04 -0700 (PDT)
Message-ID: <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Date: Sat, 17 Oct 2026 16:29:03 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 13:56, Konrad Dybcio wrote:
> On 10/13/26 3:58 PM, Erikas Bitovtas wrote:
>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>> in 2021. Add initial device tree for SM7125 Samsung platform with
>> +&soc {
>> +	i2c_17: i2c-17 {
> 
> This is not a MMIO device, so it doesn't belong under /soc
> 
Will move it to / in v5.
> Have you tried using the bus through the normal QUP driver path?
> 
No, I haven't. GPI DMA support for this platform is not yet upstream.
>> +		compatible = "i2c-gpio";
>> +		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>> +		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> 
> style nit: (foo | bar) instead of (foor|bar), please
> 
Will fix that in v5.
>> +&usb_1 {
>> +	qcom,select-utmi-as-pipe-clk;
> 
> Is there no superspeed / DP altmode?
>
I could not find anything that confirms super-speed or DP altmode on
these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".
> Konrad

