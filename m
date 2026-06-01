Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937CC346FCA
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303709; cv=none; b=uUclWQZfEdVWLAEXdaYDm8JdSCXQ86jPyqLSUjtDfF10e+rstHQVLRY8thFXKlbvZ6GKOuR80hTXZ9yHeSpYB0YbO8u8QWLlVnRipIIPvYnDElAeGFjVkjBKubjqqJUGHptASQgk/fD1saJqw/kzLK0yypGEA+ADsCjEx+FWYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303709; c=relaxed/simple;
	bh=fk629VZBGTRm9OfLwrzcQ1hhc5VKHeUR7OD/kkF1Kgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwlyaxdHDl2brF2Vy5DkNgQ1OV271AnwqZEfQSNZ69ms31YTWySkIeoHNtJzxaT0qIIRQfRjHjUm2ounglswpjEKySx7uw0w+q4PSr4M0rNnVqQ+PbtAcJqakQbbH87CY47VJunGdkWCwkUavS6bVwjzsjTiLpv4UqGHi75sOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR5oT5Ik; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR5oT5Ik"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2418941f8f.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303706; x=1780908506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6R97isaU/cFcZ2I9WM2rO8XYaMDHSz/qiNm9k/zmx4=;
        b=pR5oT5IkeJQ4SZNBGG4/EXkm2HmFeONoBn2YSWyyVn3gTy/vfKU7B8bGUv7Wbpq6ts
         PYSFMY0EkGQK8UwXUOk7OWeSSgfP8aBLhFsBpZxDOQMappRG60cGDZE0aysqda65T6UR
         WPhlwTrDG5Qq4j6TmGH8o8xEJliTdM8YYSFOA5qLsOQ5iRJm9MWyWCIP3yM2RbaQ4i5J
         Rdv7kwUjEZEcYl58vN5v0pfP4Wbo4b4lRHZ//NzWdTZkQ25+La7zKWTUpWeafHGAPFPY
         uvbDFZG7601ba+VVAGx/U/l6bQb+/mP5IjACDF/Q2lt2i0GeYYRRH40Ksv1TBGTzIIn2
         SBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303706; x=1780908506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6R97isaU/cFcZ2I9WM2rO8XYaMDHSz/qiNm9k/zmx4=;
        b=eOLTXuSgVPDo/vh7dkNEN6WuuVtFwe+97+xGtdhC9dlwGrPHbGw0JYzYTpVf16TPH6
         P7Ecz8Cvn0ZxiM/1/fGAVHNfkfSieT0didz7Hopk0QPpg+Ykz30Yxu8kPZIuK4zp+NGR
         1TzrK5f7Re2W7R3MmRtLFxLEcT53X+C+Le8kLojUjioZLiOpbLn2TehocytYdo9qqNxT
         uLHpt7egPpofmaKr6auZ+Go/LjKuXoZ4U/ekgras84hISrjSmdn4fooBhuWwHWw2zAaA
         aDY/4KV06NgX78f5UndDhaN9CYTCXcv1gfT1I7aXatwZzR4XZkbhslTcw8gQewCH4tBj
         4BHA==
X-Forwarded-Encrypted: i=1; AFNElJ/FQNn+yXCq3wExypdwj+Ib/12Sb5lUyembsrTCPq1q7Hb+6e+L1j1OqhpVDK6bCmONFUC9xCu8DXMTfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFKZ6BTI5+uKws7pkQoquVeQcKjFey70911OK+MHP5V5l8WZV
	FWZZcEhZNsyDh/67PnnGHragGL4WDYVVh2pPACpSfhCp/9QY9goeZkll
X-Gm-Gg: Acq92OGUGsCuVJhE6mhLvPNn2iBYstq9JBld4Vzfn4OCXzDjO/YTFze5roBnA+uGRE0
	KyEndJX6bgzzNBl1DiQO/eGLc2LSwpzR5BlVXS4uVdDgEfNvynV0TVkNHyYpB/jLVsx33kqCEag
	//+TX2OI9exmRTs4njbPHBRoTDJUu5Un67ifJhoVvsIVhfLHQLCqofCfugbKjzxUMrpVdf6QYfc
	CTDpG9C9e5W+IQ0pFJfckxaXQpYQpnEEgihT1h8Tey1iydkfIAACktJ2/qHrZePwdVNcnj7w8/X
	UaEVNS9ootKfNGrEr5TXr4BUnfgbnEcmpPo4jSiJI5GP0AfT4KOMfKURi5Ply2WmI0W7zLLXdCg
	ThQVi9gNaicACGNK80zofA731/tUXRiKDFzBZsnJimSKKNyH9N5ALis21/1arEeJsTpq7VGuuAq
	2zNnrcG0Ezwi24gz3GkJomYSZZ/LIY9nZt7mwIblW1y25ccBKi5T8cdZaxd11ecrGp6jqvfFhD3
	2uP8T32yA==
X-Received: by 2002:a5d:49c2:0:b0:455:7d77:1d25 with SMTP id ffacd0b85a97d-45ef6b75cf8mr13497273f8f.27.1780303705968;
        Mon, 01 Jun 2026 01:48:25 -0700 (PDT)
Received: from ?IPV6:2a00:f502:260:28a1:17cc:dada:92e7:2b6a? ([2a00:f502:260:28a1:17cc:dada:92e7:2b6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0374sm21522883f8f.2.2026.06.01.01.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:48:25 -0700 (PDT)
Message-ID: <22f344ff-acc4-47f8-935b-d1c3be7073ee@gmail.com>
Date: Mon, 1 Jun 2026 11:48:23 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
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
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <4JzpVyRt008YHZIv34VGG-Z_etL_fh9cE8AL30d-uekLUAxGmZNV9os6xkESzPAyzDHFHA9XXyPgWxzBlEfnhQ==@protonmail.internalid>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
 <82f7a200-ab07-4ff4-b84e-305351f78460@kernel.org>
 <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <4ab6aa28-6b0b-436f-95d3-23b54d73a992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/1/26 11:29 AM, Taniya Das wrote:
> 
> 
> On 5/26/2026 4:20 AM, Bryan O'Donoghue wrote:
>> On 25/05/2026 10:56, Erikas Bitovtas wrote:
>>> +    for (; i < res->vcodec_pmdomains_num; i++) {
>>> +        pd_dev = core->pmdomains->pd_devs[i];
>>> +        ret = pm_runtime_resume_and_get(pd_dev);
>>> +        if (ret)
>>> +            goto err;
>>> +
>>> +        ret = dev_pm_genpd_set_hwmode(pd_dev, true);
>>> +        if (ret && ret != -EOPNOTSUPP) {
>>> +            pm_runtime_put_sync(pd_dev);
>>> +            goto err;
>>> +        }
>>> +    }
>>
>> In Iris we do
>>
>> - enable_power_domains
>> - enable_clocks
>> - set hwmode
>>
> 
> This sequence will always ensure clock can be polled as the GDSC is
> still in SW mode.
> 
> 
>> Instead of
>>
>> - enable_power_domains
>> - set hwmode
>> - enable clocks
>>
> 
> This sequence will require the clock to have SKIP or DELAY as the GDSC
> is moved to HW mode and it is not guaranteed to match the SW expectation.
> 
> 
Thank you for the explanation. I fixed the sequence in v9 - clocks are
now enabled before switching to HW mode, not after.
