Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC30441020
	for <phone-devel@vger.kernel.org>; Tue, 12 May 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569536; cv=none; b=jwZNLx1DXzdaI8uQ0C9KiG87bl9+HlSk+akuYi5jZkCN7HYnK+/tD2koKMrxfY7xUZgXNwboCTRHKboAVitP2QHtYIHBjzrohIghUAWt9u8ZDCVxWjou0yQyAYH7MdMRCzb8iXsArRe3aq3Gh14tU5tpRSTdeot/42iKIN9opGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569536; c=relaxed/simple;
	bh=S1y/611h5F1yDCLY2MwHHiifJrIn907EP4/nio92UgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnA4drI0Vajz93XFxUqW2NmB27rxKupprcTS1xHtxuMJuzhdv3IeYW3Cmel7qqkafjNPftuXLHl5WcvCwoYPbu/LSIXjjUSSDI/PiycF/EMyJlIE1zRNhlHCQP7dPvsb0uZ203zZE0UkM4z2dLJqVKVDGYR3K044uolZmiiL6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK0C75Yv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK0C75Yv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so127337366b.0
        for <phone-devel@vger.kernel.org>; Tue, 12 May 2026 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569530; x=1779174330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+au2wZMjR4hSPfSatgV6boyFWtlvztIAKTjtpXaCIFs=;
        b=BK0C75YvBPrANr+ri1CVo6P8WvyLhqIh/Y8/a0IL6DEoVektjOYyfz7oy7+8++me+/
         wbTTyApThqtCx2Cmgo/qca4BBMIWVbILm9OTbHkQtnoV5zKbe1c2mSpbAQhNLJSb3+UZ
         t48MvJb/QbnP0pTt0MVfCq2bYMDsOtOwcwZpWENRVtAhCpyDKp0qviirwqWltOh/c9Ld
         F7wyLcNcyThyVFqc8QiUQJjWShddmJLDMbdi3e2ZIp+GREcuT5WXkHoCjXqULz1zr4Qy
         VziaOY5j8TvaMu/nAQtf/9+T2DYkrsgIJEYDk/jNo/4MwEgT9Tcbn6EORGPS/N6UNYpY
         4pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569530; x=1779174330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+au2wZMjR4hSPfSatgV6boyFWtlvztIAKTjtpXaCIFs=;
        b=jI0nlaHxbmYRm2sMbLvd5iTk1IAPVetYid/+BGeat0MRzmbio82fenJpKeNDITvC0B
         kogDCuTn3m92nk6feXD0OfJvdXCFUzkCAtnGqcVAUGQPOFB4omVbntcvkVkYf0b5mZfA
         1vTGwfEGRgwNrGiw+y/ixL4JbO9o/KGOexZLcxwzdR9mG7y4W3sZUYHOnS77syPxz5g8
         g0AQe2sSzJGQpgHKc0/wim5cCx+E/zn6ZfsFmJXAjgFbtHTG6cdT9OhhmWcvjGEqtBS6
         5d0VzTtSRl+IghMsag96rGcvaQo13fbN4hSitGyT0t9mUrjB6CsdoCev7EV13vp4oQ3y
         IXCA==
X-Forwarded-Encrypted: i=1; AFNElJ8hNVxhyh4Iw50J37KXJnsuI2ERxH1ryS/V5tlum2RozxntemROuy/CbE+dAI0SpWUO6O0J2BGvCElLsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jKGcX6xcQVkkU07bCmv86aU5zDV0r/YJtCDeKS54Gxq0XLKP
	q7ijwwqkP70jh/utq/bP3c9p8HjdwBuD40SnzBpqpiCy4RUgyexnkwz5
X-Gm-Gg: Acq92OHpaMSQDX4Eu4plKb3ScC8WVvAdDJkgIBAzBANWjVBCJ+HendDtQQhF2h+4W1z
	GziUXTbaVOsy/JDdbBg6YXcviD6i4QkvhuLRJsdpQS9VBgQ0DvNt2l1hqTcaBJoL4Aeg2yEFozV
	uKvyIdzzVxHxx83djX2OjTZzfuGsx+vHhFnHgTT4525bAdQ9t+czmv+GwdpiwIpKxmPCvgKA8iq
	1LMd0dOgQY1Ahx0pVVJf/cPFISjQAq/d7QToX6BVMvJO0FOYyhsC+8RZKvYY8i4ZczE9pmmL0Rq
	CfQ7E01DiEg4Bu/GkUasGTwGVFk4Wj1NF4vTfITEmmeK2aBuyoAhAQ6E9qxTqqS+l38ezkdZb0J
	QvYjn+5/iie6OEFkpEunbssBRfPKZtV3UNc7RBFhI8NSUas1AeTD/X4MxyhJuKjjWegqoICeEH4
	V5gvAPc35rLajbk1hYc7lI9uucX4AkA+mi8jiCrShZbX3ath8uiryKH6AasEkORSTVb3Zj
X-Received: by 2002:a17:907:e113:b0:bd2:27c4:f453 with SMTP id a640c23a62f3a-bd227c4f500mr115768566b.9.1778569529638;
        Tue, 12 May 2026 00:05:29 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:4e2:a099:cad9:2ecd:93de? ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e2c317sm4646281a12.31.2026.05.12.00.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:05:29 -0700 (PDT)
Message-ID: <c99d1b63-b304-4440-9bd5-b119dd0042e5@gmail.com>
Date: Tue, 12 May 2026 10:05:26 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] media: qcom: venus: Add msm8939 resource struct
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
 <0TaxINYCitQd2DsGsbhRviwmrQkaaVMaE9vABS3gSsSPNfrgS3JPTIo_kvTzyEhGOAZuMVq-k-5T8mqDM7dnIw==@protonmail.internalid>
 <20260506-msm8939-venus-rfc-v4-3-994f5eb22acb@gmail.com>
 <108401cb-040a-441c-b463-b69df195378e@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <108401cb-040a-441c-b463-b69df195378e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/6/26 2:33 AM, Bryan O'Donoghue wrote:
> On 05/05/2026 22:44, Erikas Bitovtas wrote:
>> +    .vcodec_clks = { "core0", "core1" },
>> +    .vcodec_clks_num = 2,
> 
> This smells a bit dodgy to me.
> 
> You already have
> 
> struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> 
> so why add vcodec_clks and put core0 and core1 into a new array.
> vcodec0_clks and vcodec1_clks seem like a very natural place for core0
> and core1 clocks to live ?
> 
Sashiko found some power management issues in my code, so I'm coming
back to this.
The idea is to call vcodec_clks_get only once for inline cores, thus
avoiding duplicate clock assignment. Attaching to vcodec{0,1}_clks
instead would mean we're adding the same clocks twice. I dropped it in
later revisions, but now I want to re-introduce this, then add them in
core_get_v1 instead of {vdec,venc}_get_v1.> ---
> bod

